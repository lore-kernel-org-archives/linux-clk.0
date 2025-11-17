Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BC524A04A
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366644; cv=none; b=CB9LUTZA7CE7peJ2vkxao9XlGd6bjl+Q+3tD2NPLo8t8Ux6Mj+U5Bm+8S99t7z7MUpLBtvb2sTIszGorgNVNjl0HfysUn81g7+FaewW3lU8qiloArO3E9kXn+HNXti/Ujh+fgGpg/bBdOZZb/UgFOzVuOgLm++oITzXWhUhJiHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366644; c=relaxed/simple;
	bh=NiQ6dPXUR3qBUFxjUddLD3A/Av0l/KfYX7OGQVhntio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDeRPZR3697b5IDlZIh/RZJdV/S39YeZuYgMhzcazIXs3O9v5bjyo+dgj+wHczN/Px8dqhKCQuRc/YBGOQCSCZiHG0WRGYcpiGSbHdGmmYtPtcL8I2cbq0I5hzplgwTgxsLVff/hKCuMGfbEA+YOuNvA86lBpFliCiHd0xDWGEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQKAAHSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cX5xPCPt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQKAAHSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cX5xPCPt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4p6we3192127
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 08:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R4Xx1nzkjZROYXLFjuIT5emSJnRfpay3eo4Xkn+Cu2g=; b=GQKAAHSRbq0vJdJw
	JDrmGZ472bqGv44U321hpBqE/Rmh0Zb9kjAZbuaaTbWQ8E59GhUwfDQmvAbNSIp/
	SDiUcS/gwXU5T1aDlEfZlz3h+uLlUbBt/NnVxbaBNR3kEX/7W4CSkqmP2JlLfu7v
	9BNJFQVkg+7IVmVzoHshmQ7Sr6nFSEl7BW+90GkJ3tq3TcE4PJ5yh2k0cT7DmlqF
	KjJI8bTPd+v4dn4Yk5M3O4QY+tsq5bF8zG8T66y+Q5h2AHStEtuICFTD7SqSnEBu
	c0sGGmJjHGDlcgjeDyQm4cDs6INavfgtEsAYd/jYdDskBtvKzOEfKOyw8xrBMXKs
	xcRjPQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejkmbux0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 08:04:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so5713116b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 00:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763366639; x=1763971439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4Xx1nzkjZROYXLFjuIT5emSJnRfpay3eo4Xkn+Cu2g=;
        b=cX5xPCPtlxKYKWYFkO8/kvw1fNafvkZSQEv6w/6NinBLvM6XLUya8jSX2CpBM/6te/
         KhM59JSP5Fwqu1DwufxvfztrxxHxztac7H1RrqpfQXihGrm6rOE+RIzJjwtqrCFyznDX
         oNkPgZ/rsQ3QQ8QKD+1NlgiZPldiQzsUeg8hc4c/t93rUAYp2PhjNXB8/cb3HL5EZ+r5
         wk7UQncL/k9/B0ItvQAesBKB8pM2+4nmPZVPp4aXJ4bwi6yH8GbF4GE2SD+ZIxng1Msh
         9swdg7sHiOQT61toppnppGC4aVRDRddFjUeBguAQm4ap9SnYrzU3zseT7YxAUuoaW/c8
         ncdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763366639; x=1763971439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4Xx1nzkjZROYXLFjuIT5emSJnRfpay3eo4Xkn+Cu2g=;
        b=B32Oe/t/i89pq2wjd+4G/xgTSyVibHmVOejleVYFAKEg/MQVtAL3kQBmiUKgyqmBUs
         RF6qvjwbY2fkjqxgQWz7sGUH7FNN/bw/uYJMaab232f76JmPENHZCKwDnN70hUb6j51d
         Wu3p/VNsgkHgoi/FZRPynTirf4xKmcURwmLrSB1Vu+QJ+OU58AACsfLqP3eVyvI56Jn0
         8WQccrV/vSewuTreeoMmHaHLXWk/Lt9gdkt2g9II9E6RBhxdwFRZBQeH2AWLRigEZKAZ
         WB1a6YLIxQSPw9Rw9+6kZefdIRyaMNyMCFINBC/gwRlz2bP3LVbeAVf/xdgbPtBH7ggj
         Lr0w==
X-Forwarded-Encrypted: i=1; AJvYcCWeqaNxUp5xqMTnAlHl3KKITXmjVselBuUegdcsiEylqIc6scJFajVusI3XUcwqYMQ8jNwgnkw/zoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHop/3qHfsqAGtDGl1dwERA4ecpNQkseMlH27pKePckEUE7d3A
	DwznpVtMRgkP8KVXGje4J1JNena1aDvuIFnAEjwoHJWFTLiknOW8gzBqhQ9kd8WH2bYYhy0jJLt
	aFPt261+4XQilCPWIBQEEs/gEMUH313Q2+/O+jBEoskSis0LnZvv+qPV6SA/WK98GRj3xoWQ=
X-Gm-Gg: ASbGncsurE7ncqcm7Io6Ia8RePxQ3SItdwpjbPS5SPzUicdAWAbW9tu74UUB9rOmveq
	ablGAS2rgs3rBmm/ToZ9zfG7VDD2iIsBdFPvv5l7v6VGnan3ZbRSeS6iXQzSvjR8tyPAJLWbl0p
	/RbfjGVJ+o8PAWZ8ndOKn58qh9g4spyFErWbr0pRgmWFJu94YxB/LsThhG/QFPLntd3MQmio49v
	32mU6JCY2o4+YQJQXWoeNrq+4pRvi3xf3eaXYDLH17GABV/IKLb2IDE5xXrUYNrJKOlbU6TA5Sg
	W88nfteizHd/i7IyYBUFjHyb+S0cBwl/3QiaGecVLQuNhZivMH0/Hb0IX/+wUKs9WBPrdipvsIq
	U3vU8Ndid8e922dSkeoamfMy8lEg=
X-Received: by 2002:a05:6a00:240b:b0:7aa:2cc6:8c38 with SMTP id d2e1a72fcca58-7ba39bb9fa9mr12484336b3a.2.1763366639401;
        Mon, 17 Nov 2025 00:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHfEYVM6V2fJECHHCpONILizZ2XAv+5Uz3vTC8/xLSB/OAdtttpHrKxTvm7nwtJjUXecWrJA==
X-Received: by 2002:a05:6a00:240b:b0:7aa:2cc6:8c38 with SMTP id d2e1a72fcca58-7ba39bb9fa9mr12484298b3a.2.1763366638940;
        Mon, 17 Nov 2025 00:03:58 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d332asm12374136b3a.25.2025.11.17.00.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:03:58 -0800 (PST)
Message-ID: <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:33:53 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8940
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lanik <daniilt971@gmail.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QpblcuDY-Yq1ifr9pg3dGqczw4Iu_OcW
X-Authority-Analysis: v=2.4 cv=N6ok1m9B c=1 sm=1 tr=0 ts=691ad6f0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=djyRjNaPrsuUQGfLFkwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA2NyBTYWx0ZWRfX7eSslG8OQC51
 C6wMgwl23egeDcdObuFqmd/T8gSnuIc/EgizaAJCaLZ3TeJdQYv2mwECADNlvEnqwuxqXkZOcZk
 EOBWfwrIy84Hmjah9thFeCDcBSYlSRg75UP6zR4aKodtOhv+UY7NIXtvEPf82y7o2euAQZOcmaj
 HZq9SVYTOSOB9y6ZflKGpF+MNGAMAcn7Q3u3JNI1OsWJ0xEiphRS60KeBxGQtC+/EnAZQafh1AJ
 YzxLB+QiAsjIEQ7cti5LWc4B/DprN3pT/vs1RojEABeSsf+i1zkXQtXISPlNmTKv73Y0duT7Vxo
 0T7GROW4N+2sGYHVSekty1XToiB6kIDJ4OnvZShZAmK9cTntgg/AxUzs+XKn4YVXeBPDdcGP6lj
 UR+jIyLhAzcivNvN2pqBcbTdV4v7nw==
X-Proofpoint-GUID: QpblcuDY-Yq1ifr9pg3dGqczw4Iu_OcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170067



On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>  
> +static struct clk_branch gcc_ipa_tbu_clk = {
> +	.halt_reg = 0x120a0,
> +	.halt_check = BRANCH_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x4500c,
> +		.enable_mask = BIT(16),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_ipa_tbu_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +

Is the TBU clock used on 8940 by a SMMU driver?

>  static struct gdsc venus_gdsc = {
>  	.gdscr = 0x4c018,
>  	.cxcs = (unsigned int []){ 0x4c024, 0x4c01c },
> @@ -3764,6 +3798,189 @@ static struct clk_regmap *gcc_msm8937_clocks[] = {
>  	[GCC_VFE_TBU_CLK] = &gcc_vfe_tbu_clk.clkr,
>  };

-- 
Thanks,
Taniya Das

