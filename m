Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2021329CB48
	for <linux-clk@vger.kernel.org>; Wed,  3 Dec 2025 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771004; cv=none; b=DhCjb8lcrGO9w16hx61Fc+T5zDp1AMlbGeUO/KHvYTCQvQqD6O0r/zPlV+OIeR8VxjPy8graRf9L0WX+bvI6NsjKZ0uODORejewH0e6ufNPlB8XUPceF0VcWzS97MdN7y/91mlaINOhMOph73jXzWtFKgF5AmKgrUR1KmSH3gPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771004; c=relaxed/simple;
	bh=BMbSzlwiMKFhtWTZ/z8248c2+ZTJI/FC1fbKdfJY86I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+jUpc+AyTqL7+0KvCM6n1XSWJkXcMjPKetvlnFO5sHIVZIfpVwNxtFxZHtHTkfTVZuVFmccRpNZVkgwL+IUu/Z3liXpwi2KiF3a+CQpAbylzsaqZUwh/NZTQDWpwWPkHa3veMEgeR8mo24VfpkQPdCo4iC9y/gIOSvyj1SA68E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gnam7OQ2; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gnam7OQ2"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59426dc96f2so569472e87.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764771000; x=1765375800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlE4w0TT3D3/y+5QAYjJUU63j0m4KIAcH19JgK8nOY8=;
        b=Gnam7OQ2rkZ2no+O3p5r/L/Qpnr7Ij0wNP39ee8DIuT39u6zcZigVWxxXcTBlgUFsr
         BytimjGQbNcoG5R0OavaCysnd1DUPUlNkjUyYJQUG1fqxND2uskx3maAqwhMWtbJ6xd7
         vcTG9Pm/s1AMG5GuJp44GTzta43d9DOGphJpqVqanW2JjYYsH2xdT502RqGLWOrBReTz
         iSu7Tuob85i0ymCdFl5ZXNSUCbiT9Bz7eM4wPMCPQJBJuk5B+echLgJlIrAi3GjnZ85e
         wgPTtV7w3HtmFj7oBSJVPjJsNQ0pG/1uf4LV9MiGFmZ3OcGBy10j1oxhULL53q+zBRYq
         gU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764771000; x=1765375800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlE4w0TT3D3/y+5QAYjJUU63j0m4KIAcH19JgK8nOY8=;
        b=ZiFTQQPp9ufwhjusHE6lYsU3DPPNHk9Bn0oyw9DYudLoC94nUUWNoDvd/Y61/9OH/R
         PlVojX8nAzt8bmmIxZyWNmSJkD7ymQCXMTZ6jNBy7n24AcOlV4rMJCUXh5jPoQNdjrQL
         InVF399S8ThHdaDaPxjsqzaPmP8345+QcpvGWTwquosmgEbL/qQGCpsDCVvlFinc2NE6
         0OR8rJ0+rOktiWS+0nUy7RYrtQJyiWyNuK9pgzbO4ANO80+30V+5flljTlvi9otg1PW6
         bFK+XNnNQoUY8tmVCRvzAC2rElncoZNbrUMxZGEyTOeBeOa+zoMB0Tkm7DYCergIJzMg
         pC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlNmdu/l7RWTu63XSCFVAv3rXBBa62fySIEgVeUHeWb/BVrL637aVMcf6fDFVVNHL+LFg29YupXF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzixLkM//nnDtDxq5yz5SxVYsDCwGo/BEQ8lGUqUcvvmIf4QUKm
	LYUBitfpyOIu0PqiU+USGiBx+d9MylCwDFuQnJPjvZXHvmAU8WZJleurNpsDTpPeNgM=
X-Gm-Gg: ASbGnctrVc/C5Ms2dgFyI1ZT92jpExU5nhe8KBTjt5O9RdUhsF+Qc9PaZGTSQKwsFig
	SliLk3pZPSwzYpuCHAWhZrEglqLy2MfKcm46wOL3T7djzmSUoeslsWBJeYY+R/M0gQYUtpOB01R
	EVeNuHQXlQ1YeEChDf16wij1SIYvVLrXC/aT8nHIKtoPYjAVUqVWKgrgqEBjD+Qu9Ka5HDJOLcl
	QEL+F+GcR7pQnSjkjmwSmlguegktBuCa2SBmTbf0+2dfFmnf81+AXge5mENNOVurFB9NS2FuP28
	46evZHPlrNyMGnBuuyzRy9mSLix99Dpgzw6qQt8Iu0gQlk/+G6Bdtn8G678jYPg18q5HeRIzmcs
	ne6CUvaNTh+WDy7tVsUHlqfUDjAjHAjxGcTWHorKkJ6DAEhcSUGsk02mMwMGSlaJK6D0LUitPL+
	QJclJKRT56EVE2yhu7K0AZ78Ol2YjIZVps6vSZfYoyjKw4vZgrs3MWyZEM3VQILGubWXQ67gmgB
	Zme
X-Google-Smtp-Source: AGHT+IE/1g55u7Pjo0hsbfs22DU9N430W8TGHsu9DROS2CQlieKXqdQ1amIEvDBBVY1Jc8SO9ZLe7A==
X-Received: by 2002:a05:6512:3b29:b0:595:8313:3bc8 with SMTP id 2adb3069b0e04-597d4afa757mr357765e87.1.1764771000047;
        Wed, 03 Dec 2025 06:10:00 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596c0eb7112sm5453432e87.16.2025.12.03.06.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 06:09:59 -0800 (PST)
Message-ID: <7e22e126-cb08-4bc2-bad6-a895a4e35a8d@linaro.org>
Date: Wed, 3 Dec 2025 16:09:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: Add camera clock controller
 for SM8750 SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-2-b3f7ef6723f1@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251202-sm8750_camcc-v1-2-b3f7ef6723f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Taniya.

On 12/2/25 12:26, Taniya Das wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm SM8750 platform. The camera clock controller is split between
> camcc and cambist. The cambist controls the mclks of the camera clock
> controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-camcc.yaml          |   5 +
>   .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |  30 ++++
>   include/dt-bindings/clock/qcom,sm8750-camcc.h      | 151 +++++++++++++++++++++
>   3 files changed, 186 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1..8e3baba5270b384eb03a68b4e47785e6c91ec6f7 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -9,6 +9,7 @@ title: Qualcomm Camera Clock & Reset Controller on SM8450
>   maintainers:
>     - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>     - Jagadeesh Kona <quic_jkona@quicinc.com>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>   
>   description: |
>     Qualcomm camera clock control module provides the clocks, resets and power
> @@ -18,6 +19,8 @@ description: |
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> +    include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
> +    include/dt-bindings/clock/qcom,sm8750-camcc.h
>   
>   properties:
>     compatible:
> @@ -26,6 +29,8 @@ properties:
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
>         - qcom,sm8650-camcc
> +      - qcom,sm8750-cambistmclkcc

Due to the very distinct nature of this new clock controller, I suppose
it does not inherit most of the properties of other CAMCC clocks, and
therefore it should be described in a separate dt binding documentation file.

Looking at the list of macro definitions from a new header file, a noticeable
remark is that this new clock controller is neither a reset controller nor
a power domain controller.

> +      - qcom,sm8750-camcc
>   
>     clocks:
>       items:
> diff --git a/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h b/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..51615bee307fd9e7f81f7e5c1662535093dd8b55
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_SM8750_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_SM8750_H
> +
> +/* CAM_BIST_MCLK_CC clocks */
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK				0
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				1
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK				2
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				3
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK				4
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				5
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK				6
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				7
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK				8
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				9
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK				10
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				11
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK				12
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				13
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK				14
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				15
> +#define CAM_BIST_MCLK_CC_PLL0					16
> +#define CAM_BIST_MCLK_CC_SLEEP_CLK				17
> +#define CAM_BIST_MCLK_CC_SLEEP_CLK_SRC				18
> +
> +#endif
> diff --git a/include/dt-bindings/clock/qcom,sm8750-camcc.h b/include/dt-bindings/clock/qcom,sm8750-camcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..dae788247afe896ef812bef716897c6cf80df2bb
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8750-camcc.h
> @@ -0,0 +1,151 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8750_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8750_H
> +
> +/* CAM_CC clocks */
> +#define CAM_CC_CAM_TOP_AHB_CLK					0
> +#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
> +#define CAM_CC_CAMNOC_DCD_XO_CLK				2
> +#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
> +#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
> +#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
> +#define CAM_CC_CAMNOC_NRT_OFE_ANCHOR_CLK			6
> +#define CAM_CC_CAMNOC_NRT_OFE_HDR_CLK				7
> +#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				8
> +#define CAM_CC_CAMNOC_RT_AXI_CLK				9
> +#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
> +#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
> +#define CAM_CC_CAMNOC_RT_TFE_0_BAYER_CLK			12
> +#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				13
> +#define CAM_CC_CAMNOC_RT_TFE_1_BAYER_CLK			14
> +#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				15
> +#define CAM_CC_CAMNOC_RT_TFE_2_BAYER_CLK			16
> +#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				17
> +#define CAM_CC_CAMNOC_XO_CLK					18
> +#define CAM_CC_CCI_0_CLK					19
> +#define CAM_CC_CCI_0_CLK_SRC					20
> +#define CAM_CC_CCI_1_CLK					21
> +#define CAM_CC_CCI_1_CLK_SRC					22
> +#define CAM_CC_CCI_2_CLK					23
> +#define CAM_CC_CCI_2_CLK_SRC					24
> +#define CAM_CC_CORE_AHB_CLK					25
> +#define CAM_CC_CPHY_RX_CLK_SRC					26
> +#define CAM_CC_CRE_AHB_CLK					27
> +#define CAM_CC_CRE_CLK						28
> +#define CAM_CC_CRE_CLK_SRC					29
> +#define CAM_CC_CSI0PHYTIMER_CLK					30
> +#define CAM_CC_CSI0PHYTIMER_CLK_SRC				31
> +#define CAM_CC_CSI1PHYTIMER_CLK					32
> +#define CAM_CC_CSI1PHYTIMER_CLK_SRC				33
> +#define CAM_CC_CSI2PHYTIMER_CLK					34
> +#define CAM_CC_CSI2PHYTIMER_CLK_SRC				35
> +#define CAM_CC_CSI3PHYTIMER_CLK					36
> +#define CAM_CC_CSI3PHYTIMER_CLK_SRC				37
> +#define CAM_CC_CSI4PHYTIMER_CLK					38
> +#define CAM_CC_CSI4PHYTIMER_CLK_SRC				39
> +#define CAM_CC_CSI5PHYTIMER_CLK					40
> +#define CAM_CC_CSI5PHYTIMER_CLK_SRC				41
> +#define CAM_CC_CSID_CLK						42
> +#define CAM_CC_CSID_CLK_SRC					43
> +#define CAM_CC_CSID_CSIPHY_RX_CLK				44
> +#define CAM_CC_CSIPHY0_CLK					45
> +#define CAM_CC_CSIPHY1_CLK					46
> +#define CAM_CC_CSIPHY2_CLK					47
> +#define CAM_CC_CSIPHY3_CLK					48
> +#define CAM_CC_CSIPHY4_CLK					49
> +#define CAM_CC_CSIPHY5_CLK					50
> +#define CAM_CC_DRV_AHB_CLK					51
> +#define CAM_CC_DRV_XO_CLK					52
> +#define CAM_CC_FAST_AHB_CLK_SRC					53
> +#define CAM_CC_GDSC_CLK						54
> +#define CAM_CC_ICP_0_AHB_CLK					55
> +#define CAM_CC_ICP_0_CLK					56
> +#define CAM_CC_ICP_0_CLK_SRC					57
> +#define CAM_CC_ICP_1_AHB_CLK					58
> +#define CAM_CC_ICP_1_CLK					59
> +#define CAM_CC_ICP_1_CLK_SRC					60
> +#define CAM_CC_IFE_LITE_AHB_CLK					61
> +#define CAM_CC_IFE_LITE_CLK					62
> +#define CAM_CC_IFE_LITE_CLK_SRC					63
> +#define CAM_CC_IFE_LITE_CPHY_RX_CLK				64
> +#define CAM_CC_IFE_LITE_CSID_CLK				65
> +#define CAM_CC_IFE_LITE_CSID_CLK_SRC				66
> +#define CAM_CC_IPE_NPS_AHB_CLK					67
> +#define CAM_CC_IPE_NPS_CLK					68
> +#define CAM_CC_IPE_NPS_CLK_SRC					69
> +#define CAM_CC_IPE_NPS_FAST_AHB_CLK				70
> +#define CAM_CC_IPE_PPS_CLK					71
> +#define CAM_CC_IPE_PPS_FAST_AHB_CLK				72
> +#define CAM_CC_JPEG_0_CLK					73
> +#define CAM_CC_JPEG_1_CLK					74
> +#define CAM_CC_JPEG_CLK_SRC					75
> +#define CAM_CC_OFE_AHB_CLK					76
> +#define CAM_CC_OFE_ANCHOR_CLK					77
> +#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				78
> +#define CAM_CC_OFE_CLK_SRC					79
> +#define CAM_CC_OFE_HDR_CLK					80
> +#define CAM_CC_OFE_HDR_FAST_AHB_CLK				81
> +#define CAM_CC_OFE_MAIN_CLK					82
> +#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				83
> +#define CAM_CC_PLL0						84
> +#define CAM_CC_PLL0_OUT_EVEN					85
> +#define CAM_CC_PLL0_OUT_ODD					86
> +#define CAM_CC_PLL1						87
> +#define CAM_CC_PLL1_OUT_EVEN					88
> +#define CAM_CC_PLL2						89
> +#define CAM_CC_PLL2_OUT_EVEN					90
> +#define CAM_CC_PLL3						91
> +#define CAM_CC_PLL3_OUT_EVEN					92
> +#define CAM_CC_PLL4						93
> +#define CAM_CC_PLL4_OUT_EVEN					94
> +#define CAM_CC_PLL5						95
> +#define CAM_CC_PLL5_OUT_EVEN					96
> +#define CAM_CC_PLL6						97
> +#define CAM_CC_PLL6_OUT_EVEN					98
> +#define CAM_CC_PLL6_OUT_ODD					99
> +#define CAM_CC_QDSS_DEBUG_CLK					100
> +#define CAM_CC_QDSS_DEBUG_CLK_SRC				101
> +#define CAM_CC_QDSS_DEBUG_XO_CLK				102
> +#define CAM_CC_SLEEP_CLK					103
> +#define CAM_CC_SLEEP_CLK_SRC					104
> +#define CAM_CC_SLOW_AHB_CLK_SRC					105
> +#define CAM_CC_TFE_0_BAYER_CLK					106
> +#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				107
> +#define CAM_CC_TFE_0_CLK_SRC					108
> +#define CAM_CC_TFE_0_MAIN_CLK					109
> +#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				110
> +#define CAM_CC_TFE_1_BAYER_CLK					111
> +#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				112
> +#define CAM_CC_TFE_1_CLK_SRC					113
> +#define CAM_CC_TFE_1_MAIN_CLK					114
> +#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				115
> +#define CAM_CC_TFE_2_BAYER_CLK					116
> +#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				117
> +#define CAM_CC_TFE_2_CLK_SRC					118
> +#define CAM_CC_TFE_2_MAIN_CLK					119
> +#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				120
> +#define CAM_CC_XO_CLK_SRC					121
> +
> +/* CAM_CC power domains */
> +#define CAM_CC_TITAN_TOP_GDSC					0
> +#define CAM_CC_IPE_0_GDSC					1
> +#define CAM_CC_OFE_GDSC						2
> +#define CAM_CC_TFE_0_GDSC					3
> +#define CAM_CC_TFE_1_GDSC					4
> +#define CAM_CC_TFE_2_GDSC					5
> +
> +/* CAM_CC resets */
> +#define CAM_CC_DRV_BCR						0
> +#define CAM_CC_ICP_BCR						1
> +#define CAM_CC_IPE_0_BCR					2
> +#define CAM_CC_OFE_BCR						3
> +#define CAM_CC_QDSS_DEBUG_BCR					4
> +#define CAM_CC_TFE_0_BCR					5
> +#define CAM_CC_TFE_1_BCR					6
> +#define CAM_CC_TFE_2_BCR					7
> +
> +#endif
> 

-- 
Best wishes,
Vladimir
