Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B949308F0F
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295162; cv=none; b=e0JYPgUs/UF79QiKiDpSbVgvgwV8qMGrsVkmXwYHdVJAaNsX4YyfkUOGSaeawDPw05c+o6fi7jl15GLz0JzCN9O/Dnj6eHmI+hRZATam8FHh9Fl/MYuAY7VpnY0RCrZwwEaAwLQFQHXbxQsZqhshBVUdpFvOWv+p8VB5HBYLl/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295162; c=relaxed/simple;
	bh=uopKghKQJQC+vDU7zK18VSdaclR1gXuEayi1yBzX8Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzr7qoBk6wLcu0vqD26FyLZtBl47Rx647+EO/4dpHb8O/w+9xnhi3T+/5IlaeVqxFPuX/GjtS2eedD+sOyg1A4TC32vXU0UQU6ssEULu9t5/+VvHtPxjl8FVg4RlfnETT2dHIOjQlOFDHAio7H5l2Mv9pDEnxn0WEecNbXSXAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZqMlZqg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZqMlZqg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FPJj021505
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 08:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mP156TZe01h9/msLZKaMsMU3teKXdisSYTct+iW2lOg=; b=LZqMlZqgyZDjhJTD
	5xG5l6Eubl9O4gA0EBsxv37EcBa6ly+orSWj/pIRgF6N6WLc786JImiQ1a9vA66I
	2MRQT4GDMsKyI9yA+pJMVYE7O90Uo4GoTbbnNDOSOKxxdTsqy608SAiHOB4fgVa8
	mO7J799Fb+uIBu5h9hJ9EMIq7t4QRYcDeKsmTjsXmC88X04IG3Pjujw1FLoIbsUa
	32m9VQDfk1xgm1XNW4qNP1odHhQjIZqCwBZgPmv51u0KYMu+uvp6iwsm4XYN/1EK
	hS3UYoiBqUK1X40P35wUJLLoCmiL8/1goP4Y/XYWM5XrfqPxcuKGxD6Fe8TlN3lP
	1y+fzQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8bbqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 08:39:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87bb67409e1so3359356d6.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 01:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295157; x=1761899957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mP156TZe01h9/msLZKaMsMU3teKXdisSYTct+iW2lOg=;
        b=LNn5XKmvsTRe0gFcU4eRf/8sQjT6v2Bo9IlU344sxqHFShxQh6CNhjFBemaBq5Qro7
         gn+ngSefuo5D4vhtLfbKBVYo5Jvf0+ZqpjX2yLnJue5xxBBKrLePMwyoDcBAGLTxe+MR
         PDOvBaaPtG4q6suQTL1WUySbC88Po+Voh3FLvSOD1LG9f2AgNUtkW/kLDc8z27Y55XVn
         zMGYDgjbkued4LN+V/DbDd91vQNo6TDR1S332KY7px31rxBEmPb0Ip5hpnYCmCbleQHe
         9StLTLyfLlPLgmAdO9+VhkjHj0dCnIAkHLVlKI7XqMkeSWBlnyJcM444xWhLE2UJvcMv
         vlqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj1HG/4nnmJs8m+0FFqsZspg4IYv5XIpMj9dazQLIAuDBFAgQouzgk+GXQFkTfgI5zxlM4twNnGxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzvHvTP2EAVC7H1GzzX311MBS5NqO4mZ6jCn0f5KCuGcisvq/B
	1ZAiaWxj9zC/ZqhuXm5vg56SVfYC1GH84JkWAF9OPgZQ4/5lcjX7UJl1LRe3FZGsgL0tUgkrGLW
	6y9QgwopDYx9YSkNBK2+J+S4kwQloXC9ViBNBoEqG54j55lEov2wnIuhNfCaqIRI=
X-Gm-Gg: ASbGnct8SOAfD8c5S7jiwsi/0lHlNP09dachmwvwdWVxvaZR2P2SUnSt8TV01fUQQHN
	ICAMyiab5rtFyh9V5XPo/ELd/86XS/4+d/CzvL5Di6z3zDUn40CkKDm8BoEiaBFgf7LGyQq5kQo
	m38dzZWRQcjjShMPr23Hj8tRdTgdO3ViUxGrbY3LgzgKQuyqcpL7tNvKnWYXqBGnxla6Efyfvdz
	ReMkHIYnL23tuOXM+1xy0c8sU+ZDcGTeS+a+d6YN2P5yNCd8ExESj9L6MN7mXgY8ArmF7p2kvum
	ZHlDXtrJto+IFOy0NP9J9a4/h/cZfV7ip6YO38hlq0gAMP69QylVWDtFeAkkGKrjmHFGasE/f/L
	/DeCU4+Z/J6UqeroJ4VbSlTGrkJyU+c5w7WXvknQV7irGBGi0oTpwTCcN
X-Received: by 2002:a05:6214:f05:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-87c206aa6f8mr219047676d6.8.1761295156986;
        Fri, 24 Oct 2025 01:39:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOrOr8mjjpJmal/kAMyGTYRQL+8CiGnozYYDyOe6Y1EwTvskD2SQQMA7irtDBZeKIs5gIx/A==
X-Received: by 2002:a05:6214:f05:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-87c206aa6f8mr219047526d6.8.1761295156545;
        Fri, 24 Oct 2025 01:39:16 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb3848sm4107106a12.1.2025.10.24.01.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:39:16 -0700 (PDT)
Message-ID: <fbab492a-e279-4ab1-91ad-2b4000f7229a@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:39:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-1-6286bbda3c8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-sm8750-videocc-v2-v3-1-6286bbda3c8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXxfuRMdMoFJQT
 ze0AzMCLfA2tim12ivi6ogQFYJfrGdH4IIpxqMPB6a/QYfy6a49C3oSBF0K9oP8MEZnmGXT4WBT
 O89jp/Tk/ObWd9sRNyzvcisyI/tdfQK5qD10d1ZIbPLx5movYzocBx2iqQ+sVLzBEJbOnZGUIyb
 p3xX2+MsImFUQDdx8Dk2BlCKkE0r4Hwp154sn8TVf1l5vXY0bfSMUg+YDdIPD0EJxLo74GKsuNu
 Zd++5UMs9w9BDQEekmrfP1PYMaSxrJ5syC9d2cN49SMJAR3WeZP9NQykdJ1Ay/OdgUeqvkl5Dql
 Sw5rlNWXUhLW4TlFI5n/bXoa+/1Q13yAHnT4B4XdWNxoO+RaH4606owx83RDIbHxU65/QPbKv00
 XcupJ/xvwx7USOZBUCg/l0tEW74zPQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fb3b35 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Uv4cyzw5Fqc3vRoc6LAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 2Rcp7eIbu4oIpazT1Ffs-et02hS2uDai
X-Proofpoint-ORIG-GUID: 2Rcp7eIbu4oIpazT1Ffs-et02hS2uDai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On 10/24/25 6:24 AM, Taniya Das wrote:
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
>  drivers/clk/qcom/clk-branch.c | 10 ++++++----
>  drivers/clk/qcom/clk-branch.h |  4 ++++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
> index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..4094ffc53d0c91dfa9e4263134c3a996100ad078 100644
> --- a/drivers/clk/qcom/clk-branch.c
> +++ b/drivers/clk/qcom/clk-branch.c
> @@ -141,9 +141,10 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>  	struct clk_branch branch = mem_br->branch;
>  	u32 val;
>  	int ret;
> +	bool en_val = (mem_br->mem_enable_invert ? false : true);

" = !mem_br->mem_enable_invert"
>  
> -	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> -			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
> +	regmap_assign_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> +						mem_br->mem_enable_mask, en_val);
>  
>  	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
>  				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
> @@ -158,9 +159,10 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>  static void clk_branch2_mem_disable(struct clk_hw *hw)
>  {
>  	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
> +	bool en_val = (mem_br->mem_enable_invert ? true : false);

This value is a boolean already, you can inline it below

Konrad
