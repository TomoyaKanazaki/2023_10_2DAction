//==========================================
//
//  �I�u�W�F�N�g3D�N���X(object3D.h)
//  Author : Tomoya Kanazaki
//
//==========================================
#ifndef _OBJECT3D_H_
#define _OBJECT3D_H_
#include "object.h"

//==========================================
//  �I�u�W�F�N�g3D�N���X��`
//==========================================
class CObject3D : public CObject
{
public:
	CObject3D(int nPriority = 5); //�R���X�g���N�^
	~CObject3D(); //�f�X�g���N�^

	//�����o�֐�
	virtual HRESULT Init(void) override;
	virtual void Uninit(void) override;
	virtual void Update(void) override;
	virtual void Draw(void) override;
	void BindTexture(const LPDIRECT3DTEXTURE9 pTexture) { m_pTexture = pTexture; }
	void SetTex(D3DXVECTOR2 min, D3DXVECTOR2 max);
	D3DXCOLOR GetCol(void) { return m_col; }
	void SetCol(const D3DXCOLOR col);
	void SetAlpha(const float fAlpha);
	void SwitchBillboard(bool BillBoard = false) { m_bBillboard = BillBoard; }
	float GetHeight(const D3DXVECTOR3 TargetPos);

protected:

	//�����o�ϐ�
	LPDIRECT3DTEXTURE9 m_pTexture;

	//�����o�֐�
	LPDIRECT3DVERTEXBUFFER9 GetVtx(void) { return m_pVtxBuff; }
	bool Collision(CObject::TYPE type);
	bool Collision(CObject::TYPE type, D3DXVECTOR3 *pCrossPoint);

private:

	//�����o�ϐ�
	LPDIRECT3DVERTEXBUFFER9 m_pVtxBuff;
	D3DXMATRIX m_mtxWorld;
	D3DXCOLOR m_col;
	float m_fLength;
	float m_fAngle;
	bool m_bBillboard;

	//�ÓI�����o�ϐ��錾
	const static D3DXVECTOR3 mc_sizeExplosion; //�G���m�̓����蔻��͈̔�

};

#endif