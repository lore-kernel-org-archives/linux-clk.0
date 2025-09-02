Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0592FC02F
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814279; cv=none; b=bm4DNDwTshY1rpCImE8x027njQCnBdXBqNsUm15YuAspXAUz8PDyQ6v9Iks2sINM2e3cBk15SwmdW2Y1O2XNs+Q64zbalgAjpBpBFZXehn7HbKaZ+LvCyvlNNqOfbQbj5hMOK/C1wmqp5CW0He1btuDxDWAyTPjJ4W+coPMIK0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814279; c=relaxed/simple;
	bh=TzemwMGClTnkqT7pUTCqqSTRsqocfb+tRl/whEuV/pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1b/kZhWRA2e23n4Ptv7t7/RwXBLxUX1yPZHhuJVeCXb8R5772ZEMVKxY3FpIecFyXGdj05vd+lN5tctjYil3Ku53nfKSw+5dF701vMJZ1TD+XmgQHoSLK77Snu/G02TBgc2S0DNoo81fm8aHvOmroDa7V4Lj12836vchYCT2xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFxpIqZY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFxpIqZY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BIPEe015197
	for <linux-clk@vger.kernel.org>; Tue, 2 Sep 2025 11:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MazPpVuDeJMNCKtDs4XLR9LyNM/u+un8EIv85mq9gjA=; b=aFxpIqZYns8dw0mY
	Bg0vH/Cvn2DW9068Uye4ozH+kmt/vDQYsux3Ao7TlcanvC6hiVVkHeUma97RH1z4
	qJSapKjmZCVUr7HHi29eVqj9olAZC7oG9CsDqkfegL5yO1XWzyobTyUnFSKNkJeg
	gfP1TaxVTCw9E4rvdqrpWY61ug4HoI/HA6y4QKgX8euSWL3uJiNGybny3CCfz2Cq
	2rUVAF1/POrCCoJfifnO3IKv92NMzQVUbkJIXU7g4wZ3X/K7QqtANEYALS/zfQ+w
	tr8sHZ2dh+E/F3OsVvlV0TlQD3z9eKyz8Kyz32h4Ke0ONFyIurf5bqO8NIUYCaoT
	fo6KOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyynu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 11:57:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3037bd983so28914881cf.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 04:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814276; x=1757419076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MazPpVuDeJMNCKtDs4XLR9LyNM/u+un8EIv85mq9gjA=;
        b=TB6ljO3Wq2jD+f/40XzjDpK5EfJcdggXjzvy3qhNj3BVxjKvH63v9/TXCPTdpLAJPS
         0L+O9INabmMyTaFqvMSvs/1YbpYv6rh+ySXnJ8k9OBeobMT+3yXz8rdMqPWqELVC3+Ch
         Yl+2NcY0K9BSlCLFVm8crJm4bqgZp1gc2hH3Uxv2pVln52OELhWMQvYc4pEmThw7TEde
         PIPyKhJjDnhyQuTOsmXw6QnxobJROmECzZ9n0k42GIXy0/ogwVPisNZYyMtknm2v9Lk8
         TK9zykRCuYmwtoyVT0qBJfRpsaci8bgAQpzZt/cjgMaX9+hCu+4xNd7BG0k8vhE/GyTD
         5Uhw==
X-Forwarded-Encrypted: i=1; AJvYcCUDpLBjdDKGBkGyHruc1Q4VsHJy6+wscaBOtf5Ypk9CWpwz5Y8AClAIdUx1WhEybdXf98BIwU9lMEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA+ol1D1MxmmTmYlJSs73RyZMAnPOeSPCSytYvLyECOXIZ2zxM
	Um41KHa/DJ7q9cIBUQh69y45k90lL3krV2X5bJWMad1aJsv8aiz9nB4tHTtFaunZ5pf1ykXy0y/
	1WykRvfW7LZHFfTkH8AKJXgl9gpYJT2bxV6YoZzpgI4OSBAEjBDswUHpwf1LO0KE=
X-Gm-Gg: ASbGnctMPiPe0gWKQMD+1WkxStNIKHerGSKWLatPXU0fGcEbofTlU/wN1X6uUEckdBT
	dZ3PRxEwo1DpUZoG0KuacUrVtf1WdoT4tcurOY4+wDFI7aQoBwPp7AlDq0q/9m2yNIKq6dTvFCv
	ZXehPYknCmDDl/aOc92FNut+RlZqQe3slKIBLZSWAtbbOr+s/r+BCyagb05DtisOFij8fDpfWJZ
	GHYejG1aY3uLJFbzcwj7Vm4n8u9Ar6V9ghYrpC7ksO472L8pn2HJKB5n87c1YeNlXwzzWZCyO5A
	SoNry6jwn7TdQs8RInzcuoT+raRkBFiCUne7vQeRIX0COGxqyNSX2HaPnRnOoOiPjzGyEXWVacf
	XsCtZd+ig5rLlRxS6iIahtA==
X-Received: by 2002:a05:622a:612:b0:4ab:80f9:f992 with SMTP id d75a77b69052e-4b313f9850bmr102404641cf.12.1756814275796;
        Tue, 02 Sep 2025 04:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLJ+ddzSRzqFRRND4j25pKq0rRljPojUEf5sN7VqVHHPTlbG/zvZUEWarcEaPDNy+4ghfnrQ==
X-Received: by 2002:a05:622a:612:b0:4ab:80f9:f992 with SMTP id d75a77b69052e-4b313f9850bmr102404371cf.12.1756814275344;
        Tue, 02 Sep 2025 04:57:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b02d8812161sm813251266b.73.2025.09.02.04.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 04:57:54 -0700 (PDT)
Message-ID: <484eccde-bcab-42f8-bf6f-b370fc777626@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 13:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IKz5SEY4qTdRRPnHySHOoAxBdR4kc_Qr
X-Proofpoint-ORIG-GUID: IKz5SEY4qTdRRPnHySHOoAxBdR4kc_Qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXx0YB1Hl4Ma4H
 iaG8szHWJXkxZ69VHE0kKhHS5YMq3HK75QYrOVtpSGHqQTsW76m187l2oAVVdj6UdhYXVAq/THp
 8UJNaIJ/6/O/UODz7iMbDy3XV/MgznGP1UsVHjvrbeb7/Vf2k2UVtvTYdsIZyVzOJxOJ+AnplK2
 DmTmuHscOU5WQeHaJRYu5E6ZN9/AjUIkD5UEDdp7/prpieZxhmCUN//DP02KDkr6Rk19JkkWoMW
 FPTGZihHYx2uetBV2ep2iZNyVYvYIAX63wdvhZ1VmKygNfPLWQzhu08uoLqEafahhROJeyIL2uL
 qHXGcJHBAU3EAuBgN7f097DCC53acbQsUQ7BEVeyjoYjsJdDQxl+pk/h7efR6sGNLLPUe3+cmdW
 lRgVTI3h
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6dbc4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uv4cyzw5Fqc3vRoc6LAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 8/29/25 12:15 PM, Taniya Das wrote:
> Some clock branches require inverted logic for memory gating, where
> disabling the memory involves setting a bit and enabling it involves
> clearing the same bit. This behavior differs from the standard approach
> memory branch clocks ops where enabling typically sets the bit.
> 
> Introducing the mem_enable_invert to allow conditional handling of
> these sequences of the inverted control logic for memory operations
> required on those memory clock branches.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-branch.c | 14 +++++++++++---
>  drivers/clk/qcom/clk-branch.h |  4 ++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
> index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..90da1c94b4736f65c87aec92303d511c4aa9a173 100644
> --- a/drivers/clk/qcom/clk-branch.c
> +++ b/drivers/clk/qcom/clk-branch.c
> @@ -142,8 +142,12 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>  	u32 val;
>  	int ret;
>  
> -	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> -			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
> +	if (mem_br->mem_enable_invert)
> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> +				  mem_br->mem_enable_mask, 0);
> +	else
> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> +				  mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);

regmap_assign_bits() is your friend

Konrad
