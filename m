Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC603570C8
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552769; cv=none; b=KGQYoYMOtRuyhEDrmRmRl+wMKZK/+K7Aw1RJTlxeP9faMFG88W4GZqxiZezzfWkDn3ueASh6abTONGXhznrprnD98CpHJaoCw8DEb5Cuwu8d9ZQrGJFFW3qwi+t9INsR9g9F1j9kuVNXpMqlTswz0eSU68q1Wy0alImUtQ4En1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552769; c=relaxed/simple;
	bh=tuSMukXJSbPnemxeOAyoCOFeYGwA9TAC3Ka4b2eHMPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2o9plUNfp35UUJfmdp6cOJfw9GDaCudrXB/gpVB8b8MtbfBiTyQcwf+lPKAD0b68Y8n2dCyQbEhpSN9D1neHP/tx4BZWLf1BVpT9yOT66brkNYTbnKoU+xg/KiNhU8DAlDc3E/KkDzS8hBCo058O5jeaNDoO1qOYolsUNxEkmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+sMq+QE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+sMq+QE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso2761725e9.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 14:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769552766; x=1770157566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3V2tn2mHvRqtIreRC+Gc5m2OsCJCgqMxstJvF4HcVy0=;
        b=Y+sMq+QECAoGne7Gc9l7bd7b8Leh+mph7ybArv5MztU858+L5JghkA8oGB50FIuExV
         yQBQg5/7fiXvuxqVNOeUg5vtAleZtqnhxCqcPziBdGpVECTafLg3c3K1uPyzO082vQDh
         1di/47yj6yAwelrOxXoJy05VbxuBP/niCB0lePqaHM48ZGuGgn2yVufBtfXSc9N6XeoC
         +XLCapGp4Q8V/r2apIrU1xOO1my35JgBPTvj+49qzvjUq0s2s21Y8pbcweQO5IlbNRCr
         8cn73FQqglbC0KCsSg/ExhrOSem8Na4b2SfUl3dkHakDLuWtUjjACcZsLTROnpp4dpHM
         eqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769552766; x=1770157566;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3V2tn2mHvRqtIreRC+Gc5m2OsCJCgqMxstJvF4HcVy0=;
        b=oPTbLHNQGzn1Pu4PgiI/bgCxT5vGp5Xe4+nWkW7V1YV5SmNXmoJR0HwFo7P6wVB5Ja
         U/yy3i/cp27R0REf/ekUrDSaFaFMeKTL8MNaNlj3I2sf7hiOWxGB1pkoemAP2+oTZ8BC
         CgPpWUsmynoaTfxMvxpQ3GQXQhHBCsHAnKeinhagg2CKFxyFuFpH8phJWSItgIs23x4Q
         YdRVhFi1TKDmQX5wMpvCPYuHl5GVPVbpQZdAhnRjg1fQQksXP5T0KNJw5ALUgFDh7tx1
         tRS8+iagtAl/52NyEewaHEQTMseJ8KA81uFuoEmHERPEe6f9GpfTqHVb2+n71gcYQHOx
         Bpog==
X-Forwarded-Encrypted: i=1; AJvYcCWjARP5YUcyru42Ml3R+I0givwYtx3JNXF5u3oJEgLkO4CW/oWuQ2sBwQfGbiVuC+W1JSMh2zFkkCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YziBh4u6e0QAaAp7Ckc+7+hLTT1L6MFn69P1nppz3ro55bduJNQ
	x4mmHcsfWstVjd06j1C9bb9sUzFsrdpyWtAwgVqdddxboyjmpvSC11Q7WLl+IzdUj44=
X-Gm-Gg: AZuq6aJ2TleqOKJGzdiwraWZ/ekaq4bdadKCyVpX/9fzf0erNutYEBS31czn/BBQP35
	vu5GQokFxBAXJFRDfesugM2pXISrK6jb4OBNa+coITOSC2T4dh/msmev6NfCv2i4G4X01KQ2TXh
	lwgCO+Tfe5y/9++ZsyEt8e+MP3tpcP9Qw1rDcjYsdA30k0XEo22V5RrLkczhtIfJ1ojOtcwkuqX
	HUJ64IcNYse195JJqL+YJ98LIlCLQ9qWmk0xIkYpt9C20+jOVfedxOVFxQ62YG5o8zz8v42VrBW
	nw3j9t/79fMjT6dtlGLbMvGRhgMBFdHFd9+fpzGmQcENInpmHkQTAQXnv1ry6ix9K//iHzUvlwY
	fTlIjufvcmBLF7Y8Q6s2Mpa5mOx7dsy3W/XM8zOJtPQQiMoHU4l7nlUwys7yvicDWnVEzYcLaiD
	ZlmMPurmiWZWaGsofvBm1FpdfXPrY7ttq7EV2XDNqqyJM5871vk4yt
X-Received: by 2002:a05:600c:1c13:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-48069c26ad2mr51439765e9.10.1769552765787;
        Tue, 27 Jan 2026 14:26:05 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdeafffsm19705125e9.7.2026.01.27.14.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 14:26:05 -0800 (PST)
Message-ID: <e43a2b67-4f58-4a8c-b153-d9e2ba303b83@linaro.org>
Date: Tue, 27 Jan 2026 22:26:03 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/01/2026 19:26, Jagadeesh Kona wrote:
> Add support for camera QDSS debug clocks on X1E80100 platform.
> 

A little more detail here please :)

> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/camcc-x1e80100.c | 64 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
> index cbcc1c9fcb341e51272f5595f574f9cb7ef2b52e..7e3fc7aee854eee841176a1330f97dc91af91670 100644
> --- a/drivers/clk/qcom/camcc-x1e80100.c
> +++ b/drivers/clk/qcom/camcc-x1e80100.c
> @@ -1052,6 +1052,31 @@ static struct clk_rcg2 cam_cc_mclk7_clk_src = {
>   	},
>   };
>   
> +static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(60000000, P_CAM_CC_PLL8_OUT_EVEN, 8, 0, 0),
> +	F(75000000, P_CAM_CC_PLL0_OUT_EVEN, 8, 0, 0),
> +	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
> +	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
> +	.cmd_rcgr = 0x13938,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_qdss_debug_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
>   static const struct freq_tbl ftbl_cam_cc_sfe_0_clk_src[] = {
>   	F(345600000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
>   	F(432000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
> @@ -2182,6 +2207,42 @@ static struct clk_branch cam_cc_mclk7_clk = {
>   	},
>   };
>   
> +static struct clk_branch cam_cc_qdss_debug_clk = {
> +	.halt_reg = 0x13a64,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13a64,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_qdss_debug_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_qdss_debug_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_qdss_debug_xo_clk = {
> +	.halt_reg = 0x13a68,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13a68,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_qdss_debug_xo_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>   static struct clk_branch cam_cc_sfe_0_clk = {
>   	.halt_reg = 0x133c0,
>   	.halt_check = BRANCH_HALT,
> @@ -2398,6 +2459,9 @@ static struct clk_regmap *cam_cc_x1e80100_clocks[] = {
>   	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
>   	[CAM_CC_PLL8] = &cam_cc_pll8.clkr,
>   	[CAM_CC_PLL8_OUT_EVEN] = &cam_cc_pll8_out_even.clkr,
> +	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
> +	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
> +	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
>   	[CAM_CC_SFE_0_CLK] = &cam_cc_sfe_0_clk.clkr,
>   	[CAM_CC_SFE_0_CLK_SRC] = &cam_cc_sfe_0_clk_src.clkr,
>   	[CAM_CC_SFE_0_FAST_AHB_CLK] = &cam_cc_sfe_0_fast_ahb_clk.clkr,
> 

Once the commit log is fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
