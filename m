Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB472BE053
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774507208; cv=pass; b=tdOpGYbpK+lcTBvuex9mV6IYATCCdhQpCYK23OyqWAx8K0aaTxKrnL9al+bp2c4lX0xrOpwgB7ZU6K6DcHSWZt01nNb0dMUGYb8nNMVTj7Hg4rpAMJ50QOryP34OTW+I6KEvX8viVYHqe+2SSmjkDDahcvvy6NK/29U/0Qjp3rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774507208; c=relaxed/simple;
	bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsouC2rgWZ1m/0ctrgH6y7WZx9tP7xf0C336UYw0+iSeKZHgZYZt6RRNaF1vv0YkVTo6YgQqVMjg8sTFTVQdIxsxz81VXx6zhDZZ+58RzGL5KL29dc/pFV6fZXiMTF2guv88q+X7XpIZtm9lPYSLjio1dqRZXJ9F4bB47/dteb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hhyl1kG9; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hhyl1kG9"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2a5236811so71308e87.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 23:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774507204; cv=none;
        d=google.com; s=arc-20240605;
        b=EyvBLrGIB5FKthnThXYBy8QsNJ5BQrefxyYXTa8X6VHU4si1jjjlURdOhyBF5Ch/JP
         aK9bpMsv6VRgz6bX0BjpFxhen3DjCNhqLapa0/GaFg0rLXJV3c6uPO+i5toZxNRO+Gpf
         iT6h+Cpb5pDQxeloZWtQCoTKW+3OMqD5dxlnWGfmu1uSOzKu3W066dZinSmnusWqnEQ5
         MsfS+/VKno+DESafSJw8n9Sj1KYuHguIC0rf22bPkvGOrXYUncZjGVRoSQwEyPKa+C3z
         TDAr6oQBGMgMT2IaLYhP4vKD/vUxrL6WUG7YuwKXMGLSAWSgKB7s62juoWGQIm8d2LCd
         h9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
        fh=+EX9hJxU41xDfXI8BljlBRQHmjUnoa1/OgtSrqaJEhQ=;
        b=QdMNrMzHLgy1Z+vLoi7rsQg7vpQsRdU4eIGz6lh2GEIJdMIcES+sIeE3QhsEyIfFnD
         e/+wWeAZ92YaeRK1zZOsPA9ZNJbRoBAQCKxJP/mtXvQm38ApZmMPjPdLHjWI+omA7+AX
         3cRRpVvmYr5PBmriHnZNVGqrzFtMvMWp55qRQLaqn3wDRSHYhL5IhiSlCxQ6lH5ubwva
         z9XmznBMNVwj3RGv1+Fi9cBcKhCjkGqqYTMQSlYL+yrXR9pWYKiFdiwoxooxuGUwX4Jx
         OUxeet9eyn8REfChzOkKnH5JXoCsws5rwE6aQt8CuV+fH6vdF+H5qkC7U3Dua+B899To
         EAKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774507204; x=1775112004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
        b=Hhyl1kG9P08/0vlob6+n6qMnGl0nzv+J2ewU+l74oye/7m8Ea/UXFTfAUhslHWTCgm
         K7e5VOnN4TduXXYlUU90sFISmg6ud0jDuXHzxSi+ikxsJmk+Wek5QsjHD45xgrY2LETh
         FStRIjMyzK9NqWc0jxdUN30C8OW3QgkjFsRjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774507204; x=1775112004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
        b=ZU0H/fECEWe2zvpAESqUbtJK6nsibhpuOXBbAUIeSouRRXbYYpXr0gkYihsWtvDeIG
         7If27zHfcYR1k62uOnJU0F8Ez6MPOC4hevrVUb2LB8+04bf107cULjqKS0fmZoJtIA83
         +s9PkmGD3HUwe4FWvfyLwsj9Zvg/mwCBKzmjbsi5ildunBBlOk93Oc9juUvem2hm0KbR
         5g2qlTnzGmW55NhYQ6+7BD7mQH/rBp0sevmN5fN7vWdGYTGsRxLZxVrCdxa9YcafmvkA
         TyzSIrUmMyOZZ6olR8FZ47YTVrHgEYODqK1kC5fK1/uqUgNk+MWZEcgMhI7mtVA4kWoQ
         O+0g==
X-Forwarded-Encrypted: i=1; AJvYcCXuwVVeNgIB/mOdob8v3P920utGcnxT+xGutXy3SR53yc9djBB3T5W0mvq9UHaUtFWDqAibYS9WlZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJtuwXXGl6r+mPeObGBKHUKI5hcnhJfkPfQ+uvopcHlJXCGA0
	4v3Xyw9HEw58vvxmR3KKDYBjpJpSIOBtz1v8MOlRI5WFyomhck5DxS22KwO4MPO586pcSFS+gNq
	mpwT/GNvbOstopCnnjrx1uGuVVSbyBRBmqPCizTmn
X-Gm-Gg: ATEYQzzvvpVNSAJe88bWOYBptCaiA0RU+QTMEIbYEbR2XFrqUQJyy19RAz5kjUAF3Bs
	Hf+sI31lXVVUGs31ONSHSagX9brlumYdOzQYBw8sBbVg7Gi0ob/RIDKfyLBdSu4y+RurbS55mjd
	MYhVro2EmAqif+h6Shg1RTSPm+fBL7bW2Zfh2k2GVSh5X1EEoSPE5FBseOKrbZ0NiaRQdSbLlbo
	8BEr/Zm09Y+yoi7EB5iSMExZHhyJMQpnE9aGC28mySp4JaEfA23Y513vCZyN6XfDeZO6jIZW9FC
	VZGS77OXjE2YG2Rm5c1zgV5VkWR58cMTyCa7sQ==
X-Received: by 2002:a05:6512:34c8:b0:5a2:a0b0:3c with SMTP id
 2adb3069b0e04-5a2a0b00282mr505750e87.25.1774507204124; Wed, 25 Mar 2026
 23:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774499536.git.daniel@makrotopia.org> <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
In-Reply-To: <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 14:39:53 +0800
X-Gm-Features: AQROBzBXCYK8fdBiG_gwq6eMeNBtFL35RVNDIyD5eRFrYc-fSnDonaWmeSR1w1c
Message-ID: <CAGXv+5Fv1g75+8kFtMEvMeSW2+2tYnqcS=P4ssZfT8p9ORwXPA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: mediatek: mt7988: use MUX_CLR_SET for
 gate-less muxes
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 1:11=E2=80=AFPM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> All 19 muxes in the infra_muxes[] array are pure mux selectors without
> a clock gate or update register, yet they were defined using
> MUX_GATE_CLR_SET_UPD with gate_shift =3D -1.
>
> This macro assigns mtk_mux_gate_clr_set_upd_ops, whose
> enable/disable/is_enabled callbacks perform BIT(gate_shift). Since
> gate_shift is stored as u8, the -1 truncates to 255, causing a
> shift-out-of-bounds at runtime:
>
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:102:4
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:122:16
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>
> Switch these definitions to MUX_CLR_SET, which uses
> mtk_mux_clr_set_upd_ops (no gate callbacks) and does not require
> callers to pass sentinel values for unused update register fields.
> The actual clock gating for these peripherals is handled by the
> separate GATE_INFRA* definitions further down.
>
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
