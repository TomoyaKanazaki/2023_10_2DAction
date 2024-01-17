//==========================================
//
//  �G�N���X(enemy.h)
//  Author : Tomoya Kanazaki
//
//==========================================
#ifndef _ENEMY_H_
#define _ENEMY_H_
#include "object3D_Anim.h"

//==========================================
//  �O���錾
//==========================================
class CEffect3D;

//==========================================
//  �N���X��`
//==========================================
class CEnemy : public CObject3D_Anim
{
public:

	//�񋓌^��`
	enum TYPE
	{
		NORMAL = 0, //�ʏ�̓G
		STOP, //��~���Ă���G
		HOMING, //�Ǐ]�̓G
		INVINCIBLE, //������G
		BOSS_MAIN, //�{�X
		MAX,
		NONE
	};

	//�����o�֐�
	CEnemy(int nPriority = 5);
	~CEnemy();

	virtual HRESULT Init(void) override;
	virtual void Uninit(void) override;
	virtual void Update(void) override;
	virtual void Draw(void) override;

	//�ÓI�����o�֐�
	static CEnemy* Create(D3DXVECTOR3 pos, CEnemy::TYPE type);
	static int GetNum(void) { return m_nNum; } // �G�̐��̎擾
	static int GetDeath() { return m_nDeath; } // �G�̌��j���̎擾
	static void ResetDeath() { m_nDeath = 0; } // ���j���̃��Z�b�g

private:

	//�����o�֐�
	void Rotate(void);

	//�����o�ϐ�
	CEnemy::TYPE m_type;
	CEffect3D* m_pEffect;

	//�ÓI�����o�ϐ�
	static int m_nNum;
	static int m_nDeath; // ���j��

};

#endif