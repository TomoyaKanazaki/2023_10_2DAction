//==========================================
//
//  �ʏ�̓G�N���X(enemy_normal.h)
//  Author : Tomoya Kanazaki
//
//==========================================
#ifndef _ENEMY_NORMAL_H_
#define _ENEMY_NORMAL_H_
#include "enemy.h"

//==========================================
//  �N���X��`
//==========================================
class CEnemy_Normal : public CEnemy
{
public:

	//�����o�֐�
	CEnemy_Normal();
	~CEnemy_Normal();

	HRESULT Init(void) override;
	void Uninit(void) override;
	void Update(void) override;
	void Draw(void) override;

private:

	//�����o�ϐ�
	float m_fMove;
	float m_fSpeed;

	//�ÓI�����o�ϐ�
	static const float m_fScope; //�ړ��͈�

};

#endif