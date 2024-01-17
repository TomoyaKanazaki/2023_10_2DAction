//==========================================
//
//  �^�C�g���}�l�[�W��(titlemanager.h)
//  Author : Tomoya Kanazaki
//
//==========================================
#ifndef _TITLEMANAGER_H_
#define _TITLEMANAGER_H_
#include "scene.h"

//==========================================
//  �O���錾
//==========================================
class CLight;
class CTitle;
class CDoll;

//==========================================
//  �^�C�g���}�l�[�W���N���X��`
//==========================================
class CTitleManager : public CScene
{
public:
	CTitleManager(); //�R���X�g���N�^
	~CTitleManager(); //�f�X�g���N�^

	//�����o�֐�
	HRESULT Init(void) override;
	void Uninit(void) override;
	void Update(void) override;
	void Draw(void) override;

private:

	//�����o�ϐ�
	int m_nCntScene;

	//�ÓI�����o�ϐ�
	static CLight *m_pLight;
	static CTitle *m_pTitle;
	static CDoll *m_pDoll;

};

#endif