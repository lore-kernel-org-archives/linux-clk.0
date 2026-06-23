Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA12609EE
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229830; cv=none; b=qzSPe/4MljzRaUoQOEC61whGr9tjz4OdtSuV9cl2uNVdWKYRdxbf226dSiHzHEgCC5Bgl62N0m1JKXu4OKDBJ7dFYoA622esjxC+NsNlES3li+3eK+Dw7PL8UmhR6YfdE8J1YuLOjHCcUeZ8PidjLae+3F/ZQHtte4q9hXEFVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229830; c=relaxed/simple;
	bh=q7Jc1YY3GrhcgpyOUs/OqzKf0RPP3KjpisQthhPq/3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaIGQ0JQsSfyluqdXeALqaecD1btxCzSmWlPjhyT75cSl6wE2jtAw7bJt7+FwXJ/R+Bd/HJrADoIYYjuHfNa3oxLMSt6EXGc+V8NAjT7pqWa6r01PqT8SOL82hLAOdGcA4LnkkKYnInP6gk6ZOrHy0lahA4Ix7adPLFEacZBJ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OD3Wuu9R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtjLiWUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OD3Wuu9R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtjLiWUc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBY9MQ1156310
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 15:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=; b=OD3Wuu9RehYOeWG5
	bVAJExNQBqYVK7WKimu8zDrs5acO+dqSR484E7mTf83B8QfCuu++cnDHuiQb137h
	slxiyjceb0ZgqgSIJQ78vIBLFEpaRHEirTsX/jJONZeLMprlV1U3MfgpuEkHG9KC
	0RJMz8uYKLADBxv2DRtBC9y44X002FiqsSEWe/kaAyUJLVyH9N0ayIl2WbAf+UXO
	7OtcvSiU70021CbFo+IAp+kcj6pLAG15QSBPTJ0/Xu/eeBSFGsGy8ght9iGJhKFa
	6WrpZS81aFmwFl1jqRmxjuoQ7uVLL8T8A8Ohj2otvR9pSDCMUk7aguiw3RBBoKAg
	Tpx0Ow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28sdev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 15:50:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8dc31c51e92so182366d6.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782229823; x=1782834623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=;
        b=PtjLiWUcap99AMdj0FklGyHJy8koBU6m1ulHOVxQOB1dxlcPU0F3xAttejIiTu3ttr
         xujSaxB9Jv21Xlxpdm/AzHPC3YcZXIqZgMzvUo82VTteEsAFlZeVL2G8GB9E8VKkBVlt
         pUnHgr7Inm/GY0FiQLqus7bYYliPc0T4Yzx1hIWQj9qL0D4IJRiuwuezf+ocZH4WBLaz
         FIgwbYz+Toc1xeWZEey5Xvv1uD7qORJE5xein4Mk5JRMwAjBCGoqjxUzEAnquNuYNm8P
         bmi/8guy9TlW0Ge005M+2iSmzJL3oYvyGoPk/BCWxAkuXQyloTi9TIfU4UXbkWjPs24X
         AD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229823; x=1782834623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=;
        b=mYyEs5NdiwnPTL2YDd1/OVUTw0JLhrHEuZtXP3hSIA7lJQa3gGT7AU4UNR9l6AHsRG
         jLGu1WT/ol9rcyFr8Ayr68Yqfu09Ag6IW4iFl+RKJw9AX65qMfHBTUhzlj3NYx+DdkYD
         3ATsMFWIYKok0Q3rAVVju4yzRky+BfE5SmrIrK8WuWqvmIqbmjiB4/o0OOEoyh/E9FRq
         FFRYPXSsKY0bK1jMBXD4499CcvIQ6zseGBica6rcivOhtrYLmNwGCy9pyW1zQ2P3MELU
         ALu2WnXwnjl1f5k4RyRbauOuGtPqx+AVA5Ag1q/NYoeajoJjTbIdfsq/WP1NZAvB0GJc
         nI+w==
X-Forwarded-Encrypted: i=1; AFNElJ8W5eeYXj05g3baok3113H20IRCaoqb5Uy8Ruy4U7hNqvZfvBBFqGOwGWJv+ggqztFpT/S9yJjEj6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHC7sjjJ5phXfbGaKQ2yfVAJMQACmUV1BdClxSHt+HTTXjafSJ
	7Ni0rsj8RGkZ4dRYlky07N2uyBTpvrUxQb5SrXb4YtJFYR16sr4lEbwwxvXuWdy+QO/uOBZXUI3
	gT1j2OxQMkqSyjxrtj5EWDdTzYkcCR9LB2zJRLwVIxt5GBjdARv037Q1OOSxgTL8=
X-Gm-Gg: AfdE7cnrZWwBtL080Rfdmq6xagrq5eoFGNXpxohxnoLqO36EFqFeOiz3Zk58T9ugN4U
	iZjLR2cfL0TPkjhdA/1j/EOuU8+zJQnzad9m+yXFGhedFz/Suz3yElxaAu+iWnJCJuXq2BQM+tK
	rqNFdB8ASKAU3aDo/JDm/Fn/E+qqiZjCZjSogkUSI6MmoZ5LoeqO7r5HqdmogKBMcMCwiwe4Jrf
	YrA8ENZFs89N8Yi3yuUz6zd7TTrqS3AGYeP5qJHizZfBKrMi35GU6mCzlDU85EHIS8LAb3MHuY/
	jUI7nRYt/f3s3OFcotjSvswKGLCBxSTd1Ib6SFuL+FKHlvZvQJ2kDCYAXXjfvgmyNzmCSIjra0l
	4EW+SanbkwlNbb2+J5z7Hv5j8+bfXBgq5dss=
X-Received: by 2002:ac8:7e8a:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51a4f4d4c47mr51048261cf.6.1782229822747;
        Tue, 23 Jun 2026 08:50:22 -0700 (PDT)
X-Received: by 2002:ac8:7e8a:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51a4f4d4c47mr51047741cf.6.1782229822025;
        Tue, 23 Jun 2026 08:50:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697ee52f216sm32857a12.3.2026.06.23.08.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 08:50:21 -0700 (PDT)
Message-ID: <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:50:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfX/KmAh9sgqGZk
 T2+GakHGnQUnI077a5/Tp27ishpTxv4AQUWQDp9CT0w7hJfcLYkDwbi8cUZYcVcfC/2J27cyK/X
 r4RQp+iQd+2r+0lxSI+YA5K01QUVQNk=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3aab3f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=1aW_qPit1WSy-zhaZFYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: hKFHn7yfX6M5mPs7Vm92P7_tXGrPhmSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfXwVvAFTR0cDLs
 LCDiFH4rqgRCXFJrAMjP5OmFiwHwpL3d9bItZyNET8r2OyZXSRm1dQyIlhVHJjw7CL0HpMx880q
 V2OJjD2PFylETQRJkh9qpvGZKEmqVUVjsq2ccLprpQEWvSVMFldlxzaoWVvaNcTD6/CB3cN4ZwH
 h5oKRiRB8st2LuJjTC6QGFbqsUvSmJSRoYbdb5jN/fUBd8jepTqHQJZ/nXqXaBrMeHmrbRndHMl
 n4BNiXwECeXzMI4b88IPwjA4UY6cz7zoZ8/3nVtvBWtw35sSZoUjENX3HQVfGcIumFTmEh74eYH
 dfGWpJOMNOySKCQCKlhgrf6+PUDFzSiLNcdyfRgaYjA0CxjWzmDwb64I90FOGerTNXVoISOo8IE
 1pqOkO0vJ0kkjBfPy6wg+diEBrbcfQ==
X-Proofpoint-ORIG-GUID: hKFHn7yfX6M5mPs7Vm92P7_tXGrPhmSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230130

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Both of these changes allow the framebuffer to show upon boot and let
> the mdss driver take over afterwards.
> Before, none of these actions were possible. Only mdss takeover was
> possible, but screen had to be turned off first.
> 
> OLE configuration may have been a misinterpretation... that's not
> something that's done on the downstream driver.
> 
> Changing disp_cc_mdss_mdp_clk_src from clk_rcg2_shared_ops to
> clk_rcg2_shared_no_init_park_ops fixes this warning as well:

[...]

>  drivers/clk/qcom/dispcc-sm8450.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
> index 2e91332dd92a..b99d3eb5e195 100644
> --- a/drivers/clk/qcom/dispcc-sm8450.c
> +++ b/drivers/clk/qcom/dispcc-sm8450.c
> @@ -614,7 +614,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_5,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };
>  
> @@ -1824,8 +1824,8 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
>  		disp_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
>  		disp_cc_pll1.clkr.hw.init = &sm8475_disp_cc_pll1_init;
>  
> -		clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
> -		clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
> +		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
> +		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
>  	} else {
>  		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>  		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);

This can also be fixed by migrating to use qcom_cc_driver_data,
which takes a list of alpha PLLs to be configured, and thenthere's
a switch-statement in clk-alpha-pll.c that always assigns the 
correct function

Konrad
