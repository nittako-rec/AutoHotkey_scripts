#Requires AutoHotkey v2.0

/*
無変換、変換キーの空打ちでIMEのオン・オフを切り替えるスクリプト

- 無変換：英数に切り替え
    - 日本語入力中(IMEがオン)の時は無反応にする
- 変換：かなに切り替え

*/

#Include IMEv2.ahk  ; IME制御用のスクリプトをインクルード

; 無変換キー(vk1D)を押したときIMEをオフ（英数入力）
vk1D::  ; 押されたとき
{
    ; まずIMEがオン（日本語入力モード）かどうかを確認
    if (IME_GET()) {
        ; IMEがオンで、さらに入力中なら無反応にする
        if (IME_GetConverting() >= 1) {
            return  ; 変換中は無反応
        }
    }
    IME_SET(0)  ; IMEをオフ
}

; 変換キー(vk1C)を押したときIMEをオン（かな入力）
vk1C::  ; 押されたとき
{
    IME_SET(1)  ; IMEをオン
}


