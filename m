Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AEE1F3B87
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230417; cv=none; b=DMFCp0jPce+9CZOp/rTrh/MXxm5A8PoliEJNTWVPo/G71Dy+6VXSKeJwi/f3QkcMsK5g14+soLuok5NbS5rK6tzW/1Zi7OI5xRBQQ2M34Sq0bI7hlwYrcIQiux4/xzIrFtlPtgnS/2h7N1rVOIL+wFCcG1PpvEneBCwAcPYrXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230417; c=relaxed/simple;
	bh=75MQjJBAxr5y5jIsOd2DHhXFNZlk3zoenuPM48yKilI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bq56TMzUH3aCFxfnv3ZptZTWvhABPyIBR5ldwkgyVEtyVf2n5KUSAlzwabfjvO0kqzvrsaLw4xfTcbVVXCaBa+mLJa+jZiDr94y47fpqHMEQE1/5GM/ZcbRSkQBh6VCS7LKiQQRYnejRiHZGq5oGCwCbBBq+8X9DSDtpxO8Sxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnZtIzO4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnZtIzO4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f39438187so871876b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 07:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768230414; x=1768835214; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HP6AkMvuLhfF7BdOoI9QTFT1HBmcbloV9tH4WSSJF80=;
        b=OnZtIzO4kGV2h899ADR0q8KyLPcBMXJot72RWGn6yRyRwRmpW/bcGjHlUvfeoqU71o
         QQnojS4gL7dYJZeShxPnQhDdMteungeiKCI9Wz2Uao/ZMPkf4c22eHNp3lHwbfMOm78t
         dRxblA/rTeYzsK6JJw2DfyY1uioMZO8EeCEy5Z8fLRU6xWFjYEH0X3nApD1h4F5/rU5J
         z34Ibz7ok8FM8GIoV3IK7Jw+sLNNO+dz1eVAs98qYPH6RUx2RZ0gNMNQsvXmHo2DBA0+
         UVPaG4/udrG22ZuLc6XJgsYwDbcRWiBAffNbzS7cjl9meh/9l4gO/X4fkwm/jovYxeTv
         BzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230414; x=1768835214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HP6AkMvuLhfF7BdOoI9QTFT1HBmcbloV9tH4WSSJF80=;
        b=Fufj+mSUmh/OHG+xowZt5A3OfDSgrpbZBTxBImomAGrCt3aimfgitikupmm+b2dO25
         2QnvLZDTzdLLkcns7M8XZclBzSFlfucrXdEOcNGIUK/TJwMbPSiHMEs8RdnBJj60WZGr
         vzdSckstlcruNnVgE4qifu3SV5rPqsQnHWJfglSyZ/+PJ3VgrcQBzhpy1+AxS3ScnSJi
         sPXoiZs2KoOUw7NkAWAb/xN6d3BT9b732O7FkgJxcUJHtOkJvUPUcCvPi131eRv3yLnn
         AD3Wi/ixdTbEHCrb9FPTYzRFu2nuvZtr/ue7YaTfyyH+BJAQ6bCn99XmJKLtDhZHmXc6
         IQtA==
X-Forwarded-Encrypted: i=1; AJvYcCXt7j14Zg32zXxQ4D8ZsKDtaoG9WUKMkGOQ+S2z9ixk+F73Ji2/82xcLARe3CN2njhkBfjLLvmca3c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy29ZGSDbrV9yKvrrtSj7/2mncFp83SbqNOFP1y/mCwgI73RQOr
	RflFULhs0T2bBk3x40URb85ClTR3Y+xNFI26xflbErhFjTq6hpLPuTvC2o9RKBrQfuM=
X-Gm-Gg: AY/fxX5skXxGZzPTomvXgagBAr/GNBvgKVX4XP76nIYhP6FX/ilTHx/QoAoZDur9h+V
	IgitzP2KRQCVtxN9P6GkjGClla9i+l8wtHY89r5wgiS30iCOfGhHpyhsUt+NlQNqoXppm2CESVA
	Ca0qQvQHZxWkwOpAZkzpxSh1EF3BEzsNkaEmvfrBZUtbxG9tk6D+hUxV46tVPyqu8ge6bn50YeL
	5VIWkZce6eJIi0f8G5JijD4sU1zJGFOT7n8gCcIGjjDOSEn+bpajamXCFtBr6f5tmuffhhNJ+Ny
	BObZaxg12/7QrT13HLRofAwaoBYyQLfFItjr5Hm0+Odoe5mFln3RTmNQDpYCvfjbsLWr+sCFP5f
	WvmYDOFy77CuHg4SVG6xxsMBIlGk30AnK+L8LyORIiR4dmDe9ua0C3KNER64+PTtnhvZ3QbOql9
	/wKidWcLyonPnKHo5s
X-Google-Smtp-Source: AGHT+IEPMgDPCYjsxat+foxE0Th9ljcBX6K2Ppfj2CK2lZL+CCALz+VFGZbGbJZ0pdZjm8CcOhAGug==
X-Received: by 2002:a05:6a00:90a6:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-81b7f7e226fmr16141102b3a.34.1768230413899;
        Mon, 12 Jan 2026 07:06:53 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6c8199f4sm6182089b3a.68.2026.01.12.07.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 07:06:53 -0800 (PST)
Message-ID: <7097507636282e4613d324ff5acb74eb747d519b.camel@linaro.org>
Subject: Re: [PATCH v2 4/5] clk: samsung: gs101: add support for Display
 Process Unit (DPU) clocks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 15:07:20 +0000
In-Reply-To: <20260112-dpu-clocks-v2-4-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-4-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> cmu_dpu is the clock management unit used for the Display Process Unit
> block. It generates clocks for image scaler, compressor etc.
>=20
> Add support for the muxes, dividers and gates in cmu_dpu.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v2:
> =C2=A0- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
> =C2=A0- Fix dout_dpu_busp parent (Peter)
> ---
> =C2=A0drivers/clk/samsung/clk-gs101.c | 283 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 283 insertions(+)
>=20
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index 8551289b46eb88ec61dd1914d0fe782ae6794000..b38c6c8749aae42319d2004ff=
5ffbc9a19320cac 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -25,6 +25,7 @@
> =C2=A0#define CLKS_NR_MISC	(CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
> =C2=A0#define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> =C2=A0#define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> +#define CLKS_NR_DPU	(CLK_GOUT_DPU_SYSREG_DPU_PCLK + 1)

Between APM and HSI0 to keep alphabetic ordering :-)

> =C2=A0
> =C2=A0#define GS101_GATE_DBG_OFFSET 0x4000
> =C2=A0#define GS101_DRCG_EN_OFFSET=C2=A0 0x104
> @@ -4426,6 +4427,285 @@ static const struct samsung_cmu_info peric1_cmu_i=
nfo __initconst =3D {
> =C2=A0	.drcg_offset		=3D GS101_DRCG_EN_OFFSET,
> =C2=A0};
> =C2=A0
> +/* ---- CMU_DPU --------------------------------------------------------=
----- */

I'll do a full review later, but this new block should also be between
existing CMU_APM and CMU_HSI0 blocks to keep alphabetic ordering.


Cheers,
Andre'
