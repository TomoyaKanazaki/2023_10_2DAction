//==========================================
//
//  �I�u�W�F�N�g�N���X(object.cpp)
//  Author : Tomoya Kanazaki
//
//==========================================
#include "object.h"
#include "renderer.h"
#include "manager.h"
#include "camera.h"
#include "debugproc.h"
#include "scenemanager.h"

//==========================================
//  �ÓI�����o�ϐ��錾
//==========================================
CObject *CObject::m_apTop[PRIORITY_NUM] = {};
CObject *CObject::m_apCur[PRIORITY_NUM] = {};
int CObject::m_nNumObject = 0;

//==========================================
//  �R���X�g���N�^
//==========================================
CObject::CObject(int nPriority)
{
	//�擪�I�u�W�F�N�g�̔���
	if (m_apTop[nPriority] == NULL)
	{
		m_apTop[nPriority] = this;
		m_apCur[nPriority] = this;
		this->m_pNext = NULL;
		this->m_pPrev = NULL;
	}
	else //�擪�łȂ��ꍇ�A�Ō���I�u�W�F�N�g�̎��ɐݒ肷��
	{
		this->m_pPrev = m_apCur[nPriority];
		m_apCur[nPriority] = this;
		this->m_pPrev->m_pNext = this;
		this->m_pNext = NULL;
	}

	m_pos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_rot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_oldPos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_oldRot = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_size = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	m_nPriority = nPriority;
	m_fDeltaTime = 0.0f;
	m_type = TYPE_NONE;
	m_ObjState = NORMAL;
	m_nNumObject++;
	m_bDeath = false;
	m_bMap = false;
}

//==========================================
//  �f�X�g���N�^
//==========================================
CObject::~CObject()
{
	//�I�u�W�F�N�g�ʒu�̔���
	if (this == m_apTop[m_nPriority]) //�擪�̏ꍇ
	{
		//���g�̎��̃I�u�W�F�N�g��擪�ɂ���
		m_apTop[m_nPriority] = this->m_pNext;

		//NULL�`�F�b�N
		if (m_apTop[m_nPriority] != NULL)
		{
			//�擪�I�u�W�F�N�g�̑O��NULL
			m_apTop[m_nPriority]->m_pPrev = NULL;
		}
	}
	else if (this == m_apCur[m_nPriority]) //�Ō���̏ꍇ
	{
		//���g�̑O�̃I�u�W�F�N�g���Ō���ɂ���
		m_apCur[m_nPriority] = this->m_pPrev;

		//�Ō���I�u�W�F�N�g�̎���NULL
		m_apCur[m_nPriority]->m_pNext = NULL;
	}
	else
	{
		//���g�̎��̃I�u�W�F�N�g�̑O�̃I�u�W�F�N�g�����g�̑O�̃I�u�W�F�N�g�ɐݒ肷��
		this->m_pNext->m_pPrev = this->m_pPrev;

		//���g�̑O�̃I�u�W�F�N�g�̎��̃I�u�W�F�N�g�����g�̎��̃I�u�W�F�N�g�ɐݒ肷��
		this->m_pPrev->m_pNext = this->m_pNext;
	}
	m_nNumObject--;
}

//==========================================
//  �S�I�u�W�F�N�g�̔j��
//==========================================
void CObject::ReleaseAll(void)
{
	//�e�I�u�W�F�N�g�̃t���O�𗧂Ă�
	for (int nCntPriority = 0; nCntPriority < PRIORITY_NUM; nCntPriority++)
	{
		//�擪�I�u�W�F�N�g���擾
		CObject *pObj = m_apTop[nCntPriority];

		//NULL�ɂȂ�܂ő�����
		while (pObj != NULL)
		{
			//���̃A�h���X��ۑ�
			CObject *pNext = pObj->GetNext();

			//���݂̃I�u�W�F�N�g���I��
			pObj->Uninit();

			//�A�h���X�����̃A�h���X�ɂ��炷
			pObj = pNext;
		}
	}

	//���S�t���O�̊m�F
	for (int nCntPriority = 0; nCntPriority < PRIORITY_NUM; nCntPriority++)
	{
		//�擪�I�u�W�F�N�g���擾
		CObject *pObj = m_apTop[nCntPriority];

		//NULL�ɂȂ�܂ő�����
		while (pObj != NULL)
		{
			//���̃A�h���X��ۑ�
			CObject *pNext = pObj->GetNext();

			//���݂̃I�u�W�F�N�g���I��
			if (pObj->m_bDeath)
			{
				delete pObj;
				pObj = NULL;
			}

			//�A�h���X�����̃A�h���X�ɂ��炷
			pObj = pNext;
		}
	}
}

//==========================================
//  �S�I�u�W�F�N�g�̍X�V
//==========================================
void CObject::UpdateAll(void)
{
	//�e�I�u�W�F�N�g�̍X�V
	for (int nCntPriority = 0; nCntPriority < PRIORITY_NUM; nCntPriority++)
	{
		//�擪�I�u�W�F�N�g���擾
		CObject *pObj = m_apTop[nCntPriority];

		//NULL�ɂȂ�܂ő�����
		while (pObj != NULL)
		{
			//���̃A�h���X��ۑ�
			CObject *pNext = pObj->GetNext();

			//���݂̃I�u�W�F�N�g���X�V
			if (!pObj->m_bDeath)
			{
				pObj->Update();
			}

			//�A�h���X�����̃A�h���X�ɂ��炷
			pObj = pNext;
		}
	}

	//���S�t���O�̊m�F
	for (int nCntPriority = 0; nCntPriority < PRIORITY_NUM; nCntPriority++)
	{
		//�擪�I�u�W�F�N�g���擾
		CObject *pObj = m_apTop[nCntPriority];

		//NULL�ɂȂ�܂ő�����
		while (pObj != NULL)
		{
			//���̃A�h���X��ۑ�
			CObject *pNext = pObj->GetNext();

			//���݂̃I�u�W�F�N�g���I��
			if (pObj->m_bDeath)
			{
				delete pObj;
				pObj = NULL;
			}

			//�A�h���X�����̃A�h���X�ɂ��炷
			pObj = pNext;
		}
	}

	DebugProc::Print("�I�u�W�F�N�g�� : %d\n", m_nNumObject);
}

//==========================================
//  �S�I�u�W�F�N�g�̕`��
//==========================================
void CObject::DrawAll(void)
{
	//�`��D�揇��
	for (int nCntPriority = 0; nCntPriority < PRIORITY_NUM; nCntPriority++)
	{
		//�擪�I�u�W�F�N�g���擾
		CObject *pObj = m_apTop[nCntPriority];

		//NULL�ɂȂ�܂ő�����
		while (pObj != NULL)
		{
			//���̃A�h���X��ۑ�
			CObject *pNext = pObj->GetNext();

			//���݂̃I�u�W�F�N�g��`��
			pObj->Draw();

			//�A�h���X�����̃A�h���X�ɂ��炷
			pObj = pNext;
		}
	}
}

//==========================================
//  �X�N���[���ɓ����Ă��邩�ۂ�
//==========================================
bool CObject::OnScreen(void)
{
	//��������t���O
	bool bIn = false;

	//�r���[�|�[�g�̐ݒ�
	D3DVIEWPORT9 vp = { 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0.0f, 1.0f };

	//�v�Z�p�ϐ��錾
	D3DXMATRIX mtxView = CManager::GetInstance()->GetSceneManager()->GetCamera()->CreateViewMatrix(); //�r���[�}�g���b�N�X
	D3DXMATRIX mtxWorld; //���[���h�}�g���b�N�X

	//���[���h�}�g���b�N�X�̏�����
	D3DXMatrixIdentity(&mtxWorld);

	//�X�N���[�����W���Z�o
	D3DXVECTOR3 screenPos;
	D3DXMATRIX mtxProjection = CManager::GetInstance()->GetSceneManager()->GetCamera()->GetMtxPro();
	D3DXVec3Project
	(
		&screenPos,
		&m_pos,
		&vp,
		&mtxProjection,
		&mtxView,
		&mtxWorld
	);

	if (screenPos.x >= 0.0f && screenPos.x <= FLOAT_SCREEN_WIDTH)
	{
		if (screenPos.y >= 0.0f && screenPos.y <= FLOAT_SCREEN_HEIGHT)
		{
			bIn = true;
		}
	}

	//�l��Ԃ�
	return bIn;
}

//==========================================
//  �P�̂̔j��
//==========================================
void CObject::Release(void)
{
	//���S�t���O�𗧂Ă�
	m_bDeath = true;
}