//==========================================
//
//  �v���C���[�N���X(player.cpp)
//  Author : Tomoya Kanazaki
//
//==========================================
#include <windows.h>
#include "player.h"
#include "manager.h"
#include "input.h"
#include "renderer.h"
#include "sound.h"
#include "debugproc.h"
#include "camera.h"
#include "model.h"
#include "motion.h"
#include "layer.h"
#include "gamemanager.h"
#include "camera.h"
#include "gametime.h"
#include "arrow.h"
#include "marker.h"
#include "slice.h"
#include "tutorial_wall.h"

//==========================================
//  �萔��`
//==========================================
namespace
{
	const float HIT_LENGTH = 25.0f; // �G�Ƃ̐ڐG�Ɏg������̑傫��
	const float MOVE_TIME = 0.5f; // �_�b�V����Ԃňړ�����܂ł̎���
}

//==========================================
//  �R���X�g���N�^
//==========================================
CPlayer::CPlayer(int nPriority) : CObject_Char(nPriority),
m_nLevel(1),
m_nCntMove(0),
m_fMoveTimer(0.0f)
{
	m_CenterPos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_vecStick = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_fDashAngle = 0.0f;
	m_bRand = true;
	m_bDash = false;
	m_oldposModel = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_pArrow = nullptr;
	m_State = NEUTRAL;
	m_oldState = NEUTRAL;
}

//==========================================
//  �f�X�g���N�^
//==========================================
CPlayer::~CPlayer()
{

}

//==========================================
//  ����������
//==========================================
HRESULT CPlayer::Init(void)
{
	//�^�C�v�̐ݒ�
	SetType(TYPE_PLAYER);

	//�K�w�\�����𐶐�
	m_pLayer = CLayer::Set(CLayer::PLAYER_LAYER);

	HRESULT hr = CObject_Char::Init();

	//���[�V�������Ƀ��f����n��
	m_pMotion->SetModel(m_ppModel, m_pLayer->nNumModel, CMotion::PLAYER_WAIT);

	//���S���W��ݒ�
	m_CenterPos = D3DXVECTOR3(m_ppModel[3]->GetMtx()._41, m_ppModel[3]->GetMtx()._42, m_ppModel[3]->GetMtx()._43);

	return hr;
}

//==========================================
//  �I������
//==========================================
void CPlayer::Uninit(void)
{
	CObject_Char::Uninit();
}

//==========================================
//  �X�V����
//==========================================
void CPlayer::Update(void)
{
	//�o�ߎ��Ԃ��擾����
	m_fDeltaTime = CManager::GetInstance()->GetGameTime()->GetDeltaTimeFloat();

	//�Q�[����Ԃ̎擾
	if (CGameManager::GetState() == CGameManager::STATE_CONCENTRATE)
	{
		m_fDeltaTime *= 0.0f;
	}

	//�_�b�V���̏���
	Dash();

	if (CGameManager::GetState() != CGameManager::STATE_CONCENTRATE && CGameManager::GetState() != CGameManager::STATE_DASH)
	{
		//�W�����v!
		Jump();

		//�ړ��̏���
		Move();
	}

	//��]�̏���
	Rotate();

	//�ړ�����
	Limit();

	//�d��
	Gravity();

	//���[�V����
	Motion();

	//�E��
	Death();

	//�O����W�ɕۑ�
	m_oldPos = m_pos;
	m_oldposModel = D3DXVECTOR3(m_ppModel[3]->GetMtx()._41, m_ppModel[3]->GetMtx()._42, m_ppModel[3]->GetMtx()._43);

	//���S���W��ݒ�
	m_CenterPos = D3DXVECTOR3(m_ppModel[3]->GetMtx()._41, m_ppModel[3]->GetMtx()._42, m_ppModel[3]->GetMtx()._43);

	//�f�o�b�O�\��
	DebugProc::Print("�ړ��^�C�}�[ : %f\n", m_fMoveTimer);
	DebugProc::Print("�_�b�V���t���O : %d\n", m_nCntMove);

	CObject_Char::Update();

#ifdef _DEBUG
	if (CManager::GetInstance()->GetKeyboard()->GetTrigger(DIK_Q))
	{
		m_State = NEUTRAL;
	}
	if (CManager::GetInstance()->GetKeyboard()->GetTrigger(DIK_1))
	{
		m_State = DEATH;
	}
#endif
}

//==========================================
//  �`�揈��
//==========================================
void CPlayer::Draw(void)
{
	CObject_Char::Draw();
}

//==========================================
//  ���x���A�b�v
//==========================================
void CPlayer::AddLevel(int nAdd)
{
	// ����̏ꍇ�֐��𔲂���
	if (m_nLevel == MAX_LEVEL) { return; }

	// ���x�������Z
	m_nLevel += nAdd;

	// ����l�̐ݒ�
	if (m_nLevel > MAX_LEVEL)
	{
		m_nLevel = MAX_LEVEL;
	}
}

//==========================================
//  �ړ���̐ݒ�
//==========================================
void CPlayer::SetMovePos(const D3DXVECTOR3 posMove)
{
	// ���݂̃��x���Ɠ����܂ł����ۑ����Ȃ�
	if (m_nLevel <= m_nCntMove) { return; }

	// �ړ����ۑ�
	m_posMove[m_nCntMove] = posMove;

	// �_�b�V�������t���O
	m_bDash = true;

	// �ۑ����ύX
	++m_nCntMove;
}

//==========================================
//  �I�u�W�F�N�g��������
//==========================================
CPlayer *CPlayer::Create(const D3DXVECTOR3 pos, const D3DXVECTOR3 size, const D3DXVECTOR3 rot)
{
	//�C���X�^���X����
	CPlayer *pPlayer = NULL;

	//NULL�`�F�b�N
	if (pPlayer == NULL)
	{
		//���������m��
		pPlayer = new CPlayer;
	}

	//�e����̕ۑ�
	pPlayer->m_pos = pos;
	pPlayer->m_size = size;
	pPlayer->m_rot = rot;

	//������
	if (pPlayer != NULL)
	{
		pPlayer->Init();
	}

	//�|�C���^��Ԃ�
	return pPlayer;
}

//==========================================
//  ���[�V�����̍X�V
//==========================================
void CPlayer::Motion(void)
{
	//��Ԃ��؂�ւ�����u�ԂɃ��[�V������؂�ւ���
	if (CGameManager::GetState() == CGameManager::STATE_CONCENTRATE && CGameManager::GetOldState() == CGameManager::STATE_NORMAL)
	{
		m_State = IAI;
	}
	if (CGameManager::GetState() == CGameManager::STATE_NORMAL && CGameManager::GetOldState() != CGameManager::STATE_NORMAL)
	{
		m_State = NEUTRAL;
	}

	//��ԍX�V
	if (m_State == DEATH || CGameManager::GetState() == CGameManager::STATE_CONCENTRATE)
	{
		//�X�V���Ȃ�
	}
	else if (!m_bRand) //���n���ĂȂ����
	{
		if (m_move.y > 0.0f)
		{
			m_State = JUMP;
		}
		else
		{
			m_State = FALL;
		}
	}
	else if (m_move.x != 0.0f) //�ړ����Ă�����
	{
		m_State = WALK;
	}
	else //��L�̂ǂ�ł��Ȃ����
	{
		m_State = NEUTRAL;
	}

	if (CGameManager::GetState() == CGameManager::STATE_DASH)
	{
		m_State = IAI;
	}

	//���[�V�������X�V
	if (m_State != m_oldState)
	{
		switch (m_State)
		{
		case IAI:
			m_pMotion->Set(CMotion::PLAYER_IAI);
			break;
		case JUMP:
			m_pMotion->Set(CMotion::PLAYER_JUMP);
			break;
		case FALL:
			m_pMotion->Set(CMotion::PLAYER_FALL);
			break;
		case WALK:
			m_pMotion->Set(CMotion::PLAYER_WALK);
			break;
		case NEUTRAL:
			m_pMotion->Set(CMotion::PLAYER_WAIT);
			break;
		case DEATH:
			m_pMotion->Set(CMotion::PLAYER_DEATH);
		}
	}

	//���݂̏�Ԃ�ۑ�
	m_oldState = m_State;
}

//==========================================
//  �ړ�����
//==========================================
void CPlayer::Limit(void)
{
	// �`���[�g���A����Ԃ̐���
	if (CGameManager::GetTutorialWall() != nullptr)
	{
		if (m_pos.x > CGameManager::GetTutorialWall()->GetPos().x)
		{
			m_pos.x = CGameManager::GetTutorialWall()->GetPos().x;
		}
	}

	//X���W�̐���
	if (CGameManager::GetState() != CGameManager::STATE_START && CGameManager::GetState() != CGameManager::STATE_END)
	{
		if (m_pos.x < -2250.0f)
		{
			m_pos.x = -2250.0f;
		}
		if (m_pos.x > 2250.0f)
		{
			m_pos.x = 2250.0f;
		}
	}

	//Y���W�̐���
	if (m_pos.y < 0.0f)
	{
		m_pos.y = 0.0f;
	}
	if (m_pos.y > 600.0f)
	{
		m_pos.y = 600.0f;
	}
	if (m_pos.y <= 0.0f)
	{
		m_bRand = true;
	}
}

//==========================================
//  �ړ��̏���
//==========================================
void CPlayer::Move(void)
{
	//���[�J���ϐ��錾
	D3DXVECTOR3 move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);

	if (m_State != DEATH)
	{
		//�p�b�h�ړ��ʂ��擾
		move = CManager::GetInstance()->GetJoyPad()->GetStickL(0.1f);

		//�L�[�{�[�h�ړ��ʂ̎擾
		if (move.x == 0.0f)
		{
			move = CManager::GetInstance()->GetKeyboard()->GetWASD();
		}
	}

	//�������s
	if (CGameManager::GetState() == CGameManager::STATE_START || CGameManager::GetState() == CGameManager::STATE_END)
	{
		move.x = 1.0f;
		move.y = 0.0f;
	}

	//�ړ��ʂ̓K�p
	m_move.x = move.x * PLAYER_SPEED;

	//�����ɂ��ړ��̒�~
	m_move.x += (0.0f - m_move.x) * 0.1f;

	//�ړ��ʂ�K�p
	m_pos += m_move * m_fDeltaTime;
}

//==========================================
//  ��]����
//==========================================
void CPlayer::Rotate(void)
{
	//�ړ����ĂȂ����͉�]���Ȃ�
	if (m_move.x == 0.0f)
	{
		return;
	}

	//���[�J���ϐ��錾
	float fRotMove = m_rot.y; //���݂̊p�x
	float fRotDest = 0.0f; //�ڕW�̊p�x
	float fRotDiff = 0.0f; //�ڕW�ƌ��݂̊p�x�̍�

	//�E�ɐi�ގ��͉E������
	if (m_move.x > 0.0f)
	{
		fRotDest = -D3DX_PI * 0.5f;
	}

	//���ɐi�ނƂ��͍�������
	if (m_move.x < 0.0f)
	{
		fRotDest = D3DX_PI * 0.5f;
	}

	//�ړ��␳
	fRotDiff = fRotDest - fRotMove;	//�ڕW�܂ł̈ړ������̍���

	//�p�x�̕␳
	if (fRotDiff > D3DX_PI)
	{
		fRotDiff += (-D3DX_PI * 2);
	}
	else if (fRotDiff <= -D3DX_PI)
	{
		fRotDiff += (D3DX_PI * 2);
	}

	//�����]��
	m_rot.y += fRotDiff * 0.2f;

	//�p�x�̕␳
	if (m_rot.y > D3DX_PI)
	{
		m_rot.y += (-D3DX_PI * 2);
	}
	else if (m_rot.y < -D3DX_PI)
	{
		m_rot.y += (D3DX_PI * 2);
	}
}

//==========================================
//  �W�����v�̏���
//==========================================
void CPlayer::Jump(void)
{
	if (m_State == DEATH)
	{
		return;
	}
	if (CGameManager::GetState() == CGameManager::STATE_START || CGameManager::GetState() == CGameManager::STATE_END)
	{
		return;
	}

	//���n�t���O���I�t�̎�
	if (!m_bRand)
	{
		return;
	}

	//�W�����v!
	if (CManager::GetInstance()->GetKeyboard()->GetTrigger(DIK_SPACE) || CManager::GetInstance()->GetJoyPad()->GetTrigger(CJoyPad::BUTTON_LB))
	{
		m_move.y = JUMP_MOVE;
		m_bRand = false;
	}
}

//==========================================
//  �d�͂̏���
//==========================================
void CPlayer::Gravity(void)
{
	//�d�̖͂�������
	if (m_pos.y <= 0.0f)
	{
		m_move.y = 0.0f;
		return;
	}
	else if (m_move.y <= -JUMP_MOVE)
	{
		m_move.y = -JUMP_MOVE;
		return;
	}

	//�W����Ԃ̎�
	if (CGameManager::GetState() == CGameManager::STATE_CONCENTRATE && CGameManager::GetState() == CGameManager::STATE_DASH)
	{
		m_move.y = 0.0f;
		return;
	}

	//�ړ��ʂ̌���
	m_move.y -= GRAVITY;
}

//==========================================
//  �_�b�V���̏���
//==========================================
void CPlayer::Dash(void)
{
	// ��ԑJ�ڂŃJ�E���^�[�����Z�b�g
	if (CGameManager::GetState() == CGameManager::STATE_DASH && CGameManager::GetOldState() == CGameManager::STATE_CONCENTRATE)
	{
		// �^�C�}�[�̃��Z�b�g
		m_fMoveTimer = 0.0f;
		m_nCntMove = 0;
	}

	// �_�b�V����ԂłȂ���Δ�����
	if (CGameManager::GetState() != CGameManager::STATE_DASH) { return; }

	// �_�b�V���t���O�̔���
	if (!m_bDash)
	{
		return;
	}

	// �^�C�}�[�����Z
	m_fMoveTimer += CManager::GetInstance()->GetGameTime()->GetDeltaTimeFloat();

	// �ݒ��񂪂Ȃ��Ȃ�����I������
	if ((m_posMove[m_nCntMove] == D3DXVECTOR3(0.0f, 0.0f, 1.0f) || m_nLevel == m_nCntMove) && m_fMoveTimer >= MOVE_TIME)
	{
		m_nCntMove = 0;
		m_bDash = false;

		// �ړ�������Z�b�g
		for (int i = 0; i < MAX_LEVEL; ++i)
		{
			m_posMove[i] = D3DXVECTOR3(0.0f, 0.0f, 1.0f);
		}

		return;
	}

	// �^�C�}�[����莞�Ԍo�߂��Ă�����
	if (m_fMoveTimer >= MOVE_TIME)
	{
		// ���̈ړ���ɍ��W��ύX
		m_pos = m_posMove[m_nCntMove];

		// �ړ���񐔂����Z
		++m_nCntMove;

		// �^�C�}�[�����Z�b�g
		m_fMoveTimer = 0.0f;
	}
}

//==========================================
//  �E��
//==========================================
void CPlayer::Death(void)
{
	//�ʏ��Ԃł������ȂȂ�
	if (CGameManager::GetState() == CGameManager::STATE_CONCENTRATE)
	{
		return;
	}
	if (CGameManager::GetState() == CGameManager::STATE_DASH)
	{
		return;
	}
	if (CGameManager::GetState() == CGameManager::STATE_START)
	{
		return;
	}
	if (CGameManager::GetState() == CGameManager::STATE_END)
	{
		return;
	}

	//�����蔻��̐���
	for (int nCntPriority = 0; nCntPriority < PRIORITY_NUM; nCntPriority++)
	{
		//�擪�̃A�h���X���擾
		CObject* pObj = CObject::GetTop(nCntPriority);

		while (pObj != NULL)
		{
			//���̃A�h���X��ۑ�
			CObject* pNext = pObj->GetNext();

			if (pObj->GetType() == CObject::TYPE_ENEMY || pObj->GetType() == CObject::TYPE_BOSS) //�G�̏ꍇ
			{
				//�Ώۂ̍��W���擾����
				D3DXVECTOR3 pos = pObj->GetPos();

				//�x�N�g���̎Z�o
				D3DXVECTOR3 vec = m_CenterPos - pos;

				//�x�N�g���̑傫�����r����
				if (HIT_LENGTH * HIT_LENGTH >= (vec.x * vec.x + vec.y * vec.y))
				{
					CManager::GetInstance()->GetSound()->Play(CSound::SOUND_LABEL_DEATH);
					m_State = DEATH;
				}
			}

			//���̃A�h���X�ɂ��炷
			pObj = pNext;
		}
	}
}