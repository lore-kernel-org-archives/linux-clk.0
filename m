Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A9739150A
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830906; cv=none; b=VWlKUsdu7oF4l30FpWhk1xTpzzILBROmN7UZ/Q5nAsWcWckZS0KRxFOaOaepjEmPpgMvfPFkfrTMCQI9Sz6vfGuNRedEDnhESEFNTbPJrT2R4E8WmLIhP5RXmnG3DHJh6/s5d4z2VyY3/k39GDKiatJ62hmVVxnRL3RPoyR7urU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830906; c=relaxed/simple;
	bh=cF1DROYnjX8skY1YrSMzROf4KbayS8Sh+36OpO6N74M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBdzWE8hQ3+FcK7XsaOlUsfSXeJfKYCyqIj/Mfdc38RJSlyoOpFb65/veHR+pZAsSGSCB8m1dfv36p4+D/n2gr6FdRK63S24/8cQxR6qAl1C4Us8zqjs/0P6L/CDYc/yFwpJU0IIaxF6SkSmGbRCKKQtiAI14+AHO8FkXNPVkgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiABON2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJnpz6JV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiABON2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJnpz6JV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8lvDu3281113
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XK80EzlkLMXAuOZQ++FquWS/RLEA4ilvvwe4PY609zc=; b=IiABON2P0C6eYenj
	otioN3BgR0vJ+e9M6XS7iC0QRAkqCoVOu8vfR5h5hM3ztY5qpfZ0l0Fu10d2QcKJ
	YdfSpdI0ttcFPZqj5EqEWe1SlgsyoyktHTiSGqkZ+HLk3IFN0Pb3r/qLeMXDGurI
	nDNHl1fZz/n5POruk3OMPe40n6zjHhEMcTsAc4moYkTwxv5fOUMWHWKWJQ5VwOvj
	moNHEXce3QcyQU14EbahIbX1maQ3MEtlNtkSeDQw7hnFsWKxJA0LBjgZjL1U/iqu
	RBarclO1kPzU+N46L8OPobZSAExdVZNLuMXa16vrAjphxFFxJR5rd9rb28Db58im
	5j+M4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62v30v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:48:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091eadc373so49084061cf.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830904; x=1774435704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XK80EzlkLMXAuOZQ++FquWS/RLEA4ilvvwe4PY609zc=;
        b=NJnpz6JVyjT6GD1TW9qULcbI1mPlfbcUZCoR3vYftWN3FW6Z8YwW5MOKZHvGICWQSR
         b2PZ0qbylXtt2vXfovDZw8WaJOOvG8aLzqHG9IjThipsS85K5q5HjNqOlpdem0brfaYM
         ngoGWmlnEyMMUvokgN6ZDntw93x4hxGZMhcK3OFceTFi4n2hirkVyDql23AK4R8Ouqlk
         iauLe0AKeq5eEhdFTZKXOWYxiYCr7UrCTvwmXFVIQG0WWWMOk/Ejbi4RdRJ5EXxyj9R8
         0zUuvQ63BdDsSnXkZbhBskhFgFaFLY2XMOsk5Sq+3wmWHoaqzE5MoOeHNs3raH1szEv8
         8/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830904; x=1774435704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XK80EzlkLMXAuOZQ++FquWS/RLEA4ilvvwe4PY609zc=;
        b=oaTgXpo99gNEsDW27c+KiAMCj8u+5Vf1RihfbatMz8oK/q4nC1jp/zdBXXtidaHVw4
         bL6APzIGe0FHiC7+XnXjVKDKHHcTecI0l78zt8GGBd7t1uSJvafVqpIuAlRhwx6EQo2O
         Wn3rU0gdX9/NbFVqHlR8AV+E1cVJtoULUpqV5sFThfj06lTQ7hKcEEVjdNL5wtEdIF3P
         IKe06FMibPlP+gtYjAKuZb8Z+QpLyctJc4oE84ndiVj62gDy4HnSARMwkURn8oiaXBQ5
         5H+1v1kRfHs4AIe9tEv6Hw+7faHjIcw9fMnez59eAbenIDwgXmpXmwECPipmevRwS0g+
         uAXg==
X-Forwarded-Encrypted: i=1; AJvYcCVKGiXb2gCqKWfUhsoHE1JNoLmBayKMGe3jtmzmetDYeIJAmkSZJHNu0wNUiPWJcnSMiQzQEIGex4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqw90Dw3TgAcm0Boxtqoobitaxo9bLVzU5aX4zoaOVpY480lp8
	A4so1++GuZqUjsOeq0tTG9MyygM6idPlwSH7+gstxzQDEVcOjpnZU61FbntfTP6skU6Xv4mfy5L
	Ng0ZenzpaiKc8VuFMlSnX7el39qKIEhJy+kng2qOvnRpgMjr3wJYu1kI2Db7HLYM=
X-Gm-Gg: ATEYQzzac1lJJeYfxVRa5C90YZ0H7Nei4VPljXFq/4onM9V9aFC3FH+rMgvKRPY4lMK
	mpLRAItTxQgJmM5bcn/8NoiC5qhtDE25/EvzBwbvBSE7TgrMATQtEPVifKauXWEY3o1qpsqFAmn
	dyZfXMJiDmS/YdSQv3IiMxjEUGZ6D55ZCUCDecxWa+K066gib0LntJyY+sfwBUoTY60Yd7TgUii
	nX+Q4L2CVA+PgrH48QciB7Qm3VZc/lMK2dnYixrsOCw5f337RprAU1L58DAI3aMDsgdtV2aN9ZQ
	YthxLqxqm5/Qlimt71qs8bHlDLziHcXHenYbI2Q8vkuFDT3WFVhwog+bH9QPAiDZ/wMz5zCrLaL
	nmMaGbIMJyg69J6REOvlQhs3xQK7NkXs2JLlx6sidbnTklDFefeA54isbL4gKtZywtfAnWLNvwi
	WbaOs=
X-Received: by 2002:ac8:7d4c:0:b0:509:24e8:ec48 with SMTP id d75a77b69052e-50b148afafcmr22900201cf.6.1773830902328;
        Wed, 18 Mar 2026 03:48:22 -0700 (PDT)
X-Received: by 2002:ac8:7d4c:0:b0:509:24e8:ec48 with SMTP id d75a77b69052e-50b148afafcmr22899851cf.6.1773830901370;
        Wed, 18 Mar 2026 03:48:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142cb46sm178339866b.21.2026.03.18.03.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:48:20 -0700 (PDT)
Message-ID: <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:48:18 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba82f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vXNxit1Icg9rXcKRa9sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: b8Z09-Z-D17dO4HLmi99aFqTA40E8U6N
X-Proofpoint-GUID: b8Z09-Z-D17dO4HLmi99aFqTA40E8U6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MSBTYWx0ZWRfX33RSQDes1Sga
 k/5TPo9bv/ExaRE9skw2cN6Zt+GV+u4dPhvH8bLqOS7a07WzXRml+eO66+lm9zL6qMSFmXmYjR8
 vU0H6cWYZxYpiwUZsV9y8+wo8f7glfZHx2ygKAwyZIZkcoRmuIpqtMzLxQ8qw1QOrpDVrTNXdUt
 rRjTsXmty63tuiIdy16gUIAjQ7J5CZX0J8AAKwtVUao8jkIDQdMXUwaR+0ia/6m7aOO/70kLa14
 GPJEyiibnEwn3UsVEo4p0h77LjFAFu5o2UnceUUw6rNOhSjrPkK/4meHAr4ximKI/wlpfr+mMnT
 p+DHPVK1SoTWIOdF+NGDkYe2SiXPwUwpMPV8PiC9DLGJpNM1n5XZmznUf/I2wKagoTTi1TlwmKa
 RlZtMk51FC6jAgTYUypxGVa7SP/z1Vcequ0GHlGYpgykF2JKLZ3lFrXDSwE5Iu1813QU7wvcv5j
 FY/QD5b5u8pxdQoG9sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180091

On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
> Add a driver for the display clock controller on Qualcomm Eliza SoC,
> which is copied from SM8750 driver plus changes:
> 
> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
> 2. Eight new HDMI clocks,
> 3. Different PLLs (lucid and pongo).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]


> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024, Linaro Ltd.
> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.

-> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

[...]

> +static struct gdsc *disp_cc_eliza_gdscs[] = {
> +	[MDSS_GDSC] = &mdss_gdsc,
> +	[MDSS_INT2_GDSC] = &mdss_int2_gdsc,
> +};
> +
> +static const struct regmap_config disp_cc_eliza_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */

0x11014 is the last register

[...]

> +	/* Enable clock gating for MDP clocks */
> +	regmap_update_bits(regmap, DISP_CC_MISC_CMD, BIT(4), BIT(4));

regmap_set_bits()


with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
