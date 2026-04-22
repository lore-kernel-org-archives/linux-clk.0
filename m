Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B71C3CF664
	for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 18:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776882487; cv=none; b=VeGWxEBpDY/d/ZoLMX6j6j4R4e7k6vbPTUu7YPep05BpogPt6RXwq16CzT7f75eb8WfKrVfx8t4CCBNphlMXvlhnSGze2rASYVlDG/qfDTcLd1cAE72PBbPOcWzfdGvlLLaZwq5om2OHhuxwLB8v+QQGSpPA44Gf4A7ryxBFGcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776882487; c=relaxed/simple;
	bh=0VK6F2cnjKrumKWrTRfiBMBK9q18ZTISjl84hK2lzU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rngdibOFV02KBQM+16pkTbzZeRdRCBheYScFqhZRP9t/xATeBYWy6ast4lfAEBjT8fa7lQaLCpgYALAzOr0tm8b5LoLMD96tjPty7TPHIjIUkpSvUSL1Fmy3OESr8JlzhdqR4p8GbAKBrJJH43mnxd7mi0xi+wT8A8PeQUbpy58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpYX72sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VovqLkiv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpYX72sy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VovqLkiv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFdA8c664097
	for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 18:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FyFAwdzAgGw4hVRYizUayfah
	BbjNHuiU8cvL2S1mW4E=; b=IpYX72syyuXFUCcPxk3NqwptQCa8WDBXT8Kuu4c5
	s6O+P49+gqC/OZf9EG1aKPvxOIIip3Dz1Mc8TdP+ALFPBCT/dh2JDgqihrCGGmin
	zj9FDJP5AUm05UA9i5PeilEmHRmSUbwqm60/GJxdR54kfXCglrg6pwCnyIs14qFL
	gDJDXAR79Ok6D1DzCoj5K8fgLToZtwl/blcCiGBI29ivvY4Wg+xPer9Y+R0p2fNd
	w2nKaMaFU/aItVjw61eeSLNL3rrkVTDerl/mBWHN08w80uqDey3YmdVG2FYQW1/l
	65PNUpcq5bfhW7mAHAh8TteVrMyTUjUp2fihT5ycBl8IPQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgt1p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 18:28:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9546466000cso2181447241.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776882484; x=1777487284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FyFAwdzAgGw4hVRYizUayfahBbjNHuiU8cvL2S1mW4E=;
        b=VovqLkive1lqZFXLtlL8TGaR2WMj4LO9yyb1dYsWBMPX6NFgwVzRsqjyEm98Par/QG
         Wq7lkXpKCA4F0iW0Pu7kgInMdpf1q6tKqiGy1BKCU/K2YM1CeKjCaMeWsxWvxcFkMCv3
         rFf7bdGBmuJd4tNBuo3dAGPDEfKjCDNMbCf6gtRldKhUTwGfqBbHZG3u9t891DOOy7+X
         oE9vyuOwCUqJG6rNA0MDTZKR3uwwR17Q1umHQLzAeUyPI944WFUKkVgSivJpxifFR8Fy
         mKoJ5zVnQAOJRcNdiHAlq89TlblVDQLs+GYiU5QqZS5dUOMvhOWJRhgJe1IbpjbjxhnH
         ErbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882484; x=1777487284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyFAwdzAgGw4hVRYizUayfahBbjNHuiU8cvL2S1mW4E=;
        b=Rl2n8W0ED1edREhNmaPs2ZYWNMG1pa8iasMxa5DNQr5FNZgyhu3ZBVEuC7387IKjvG
         Fu7x5WQhA4r0ZoKEJu3Z/wcSOZJUU+VoxTGR2pdB4gbJtBPWiuxf/X3A1MIZZb4Atwjg
         ERZORHMKdHSy5uh0OHHP34dSimD5fB4pRoFyL87CbngIe4lzYcIT2OnbSGN8XAM06Lwx
         UKFpeyIV8PycHkb21vdWMOJsuY4z75eTkbCr4d6+JJIpG6GgV34rQT0Tg6zq8Y5bFvwW
         Hew0oh6IkipFpnSAizv8nRpLYiPDRGz82DBrSnD0YCwLwmrIzY50R6i8qUJvCWRw0noQ
         KcfA==
X-Forwarded-Encrypted: i=1; AFNElJ/F5mHdy4eaamrFf/dKlyez5Vbpctih32gBVr2Z9pLGWa5OSrfTzPhNwt2QqiqsgSiN8CfAnc1mFws=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTfN+JfdzbSNcJm5CGT/sjJWcwXx8vvg4Q1yenujPQe4JV13pf
	wWsN1F2o0yruDYYkdha0eu2yrF5wFEQD4AVIY6PgHrVmiIyYkeNFtWYWrtlnGHS5phLfWDmi+0A
	9Q3pDTbU3ka2nIv/ooPQO8olEhRCSorGpB5pTHncCCvRU+5j2OMnoo+KUewtpE/A=
X-Gm-Gg: AeBDietNrOJmNv/4EB7SwfsvJLsNc12Do6UbjLT1T8JuDdsGLntEQ/Kx/gdsopGnOJN
	yIE2hqC2XoPXGeFbFl30Q3pFSLxpmIDaAxUtq0h+ZLYczxcCAlyiCDnJUmwnyU8Nd4NtshwZgKR
	GBjwWH9YmtCip1TvAwXYn5ggpgBZRvyN3FehkczNJ3HRClodVoYqT41OarceeoF2xTxYSyl+MF6
	MKiM7uuowLuZx5gPUwFJvXdeAYelHc+amlZCNoPmX91RFtku9GFkqLGjuQ6PWJTEF4MH8KtDn64
	bkAiyEDO3CmO3DsXunQ/y8/1FSMgNYGAfNe28U3r0Xj/0MaK7Hm4JWtsFec9JaRI0UqtS4BOyfC
	FMInCaPiT3IUKIqvBf0uhXLa0NU1M9eMgq4XZ2a0YX30XPiQBod+7d0VoO70NkT2mlm0XP1RxWA
	5wNy5WWtE8HebVGHAvUAmf/1UUWWB3vV/33O19AP7S3u0EcA==
X-Received: by 2002:a05:6102:5987:b0:613:95c8:d941 with SMTP id ada2fe7eead31-616f4f6f185mr11415931137.10.1776882483799;
        Wed, 22 Apr 2026 11:28:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5987:b0:613:95c8:d941 with SMTP id ada2fe7eead31-616f4f6f185mr11415921137.10.1776882483347;
        Wed, 22 Apr 2026 11:28:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm4688227e87.36.2026.04.22.11.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:28:02 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:28:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
Message-ID: <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YkD7YsbeSBa_C38pa-oODn3BzsAsJP8y
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e91334 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Z207rsgFrGoaJHP3IqQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: YkD7YsbeSBa_C38pa-oODn3BzsAsJP8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3OCBTYWx0ZWRfX+DMzWiqRHwsT
 OY3L5sXwulivfZNR+FOq/1r1BzVuBHJoMTOKErRjmOB4LKEcSx9ceDAjcpu0O2SF90wdW5q+2f4
 F7s2o3oBCWR51tf7hLbIONFlWJTwmiIVfC8sagn7hFueKYKufCDKgMcf/cNuwFpEzpuXEADLA11
 jVh6XIZDNntw67DVArq5tVP8zTRn+cHLBVMWZauhyVfbWTNDHkoIVQYbQLdiAklI/ryQAyccG70
 NaIhCWJwJ3QqYMR0gHQr6pyHEGtQxb7grC74djmu6AHGce4+rE1X8c4ttbws/CK9U2WGfwcPPWI
 LJwerDLN+HzKkV29a8lsu35gXIgDUW1q7+KLyC9J9kzv6hJwVSvXgjHE7MN1SFRx8tLTTFF1bXu
 TTg+Zrd9JVvK54MBTutVNNO2xajnZZmaP0Olwuh9FmK7GNk04XaAlEwHN51/c3T4A+53DXh2UNT
 Kv9Kyh+AHus2dCsyByA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220178

On Mon, Apr 20, 2026 at 09:59:00PM +0530, Jagadeesh Kona wrote:
> Some PLLs are already configured as part of CRM(CESTA Resource
> manager) initialization. Add support to skip PLL reconfiguration
> for such PLLs that are already configured.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  				 const struct alpha_pll_config *config)
>  {
> -	u32 lval = config->l;
> +	u32 lval = config->l, regval;
>  
>  	/*
>  	 * If the bootloader left the PLL enabled it's likely that there are
> @@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>  		return;
>  	}
>  
> +	/* Return early if PLL is already configured */
> +	regmap_read(regmap, PLL_L_VAL(pll), &regval);
> +	regval &= LUCID_EVO_PLL_L_VAL_MASK;
> +	if (regval)
> +		return;
> +

Why is it being applied only to Lucid EVO PLLs?

>  	if (config->cal_l)
>  		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
>  	else
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
