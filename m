Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6FC26F2A0
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315277; cv=none; b=Mba8vkKox4DLQo8030N4Rl96rI7Eh31JVnYKE42VX+QyMPgTa5j/s2wgQGbposxcr2nh2u90P204mVGWKbcxW4T3CZVy14Z53YMa/0vDfW1OZ6ckfjoQ95zud2Rg6nfEXD+d/vz9TiL1Qd+bPZK6GQhPD8QG+y/aQhuT6zVr9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315277; c=relaxed/simple;
	bh=y2JTVO/J3TdTZAkcTfI9SiMwIDc+v6SkWlt+/vPBE5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXrG75mByQPlnYtM0t8KwdCqAPxGg7dcwd2rp04K+9PgChQ58oW/IaI4bEMemsuZmejkGcZpCgVwz2tFun4/+X1/XaFGmZWw4MzMXfUI6PiFoaNHHglXcpGp40ao6GNESXpH279WDfT748nzYIWjdzQsS4GFasUwBKfI8XHRruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVP5FOqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHUREo+m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVP5FOqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHUREo+m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDINLw3735120
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81eSaaCysi2DaaK9DLEMeeuVHb0KB/kJPfkjhFnrq+k=; b=mVP5FOqJDeipflDd
	uq1rXsF2PIJXd0Jey7aAwN5ILBXxFpADZ2ZtKXkkrc3wHjs0eco+eodqM7+vQEET
	HOciJTFjRUm/yJxkm3v7vEnmh0/hlrcOdIGGMmmmSe7p8Ya2VZ9m0E6KKlwhOSSu
	U/hFHVuClPBfvtGWZFwTgJOg4hmaFBfG9wL5wpzuVe4pi+B1nScZyJjPOvevlYWH
	CWLnlNLMBa6INaeGJ/QHyLh8ZK3491ocwPorK+wG+K9PWx8sVTU4xyCD3wdCqkpQ
	9hHlVRAMnp+pqy5GrnU4ENzt0Lx2VzdjleBdoXDib86+Nsq3EBmOkofUvKXXTVaE
	lUxzZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng879kch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:41:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fb4c55f0so154887385a.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768315274; x=1768920074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81eSaaCysi2DaaK9DLEMeeuVHb0KB/kJPfkjhFnrq+k=;
        b=XHUREo+mXx+iHZd58PXfkO7rqTerSz6IohmzsuPby5iqqK/YKfWZ5wvuddqWYjI2xv
         taoQEH9+nV8JPBvR4p8uf3NEoMcECivywsffOPRYZsHYbuP7JLEWWQyy6c0W85ant3W6
         u183mGiTSpTHg92/q9Q0y+GC5dRalA4RwHl2x8lcgl0wLdZhmqGJQ6geU7ygxVAs1hKe
         ccJvK8Cxqb27FwXc/ocVo9N2W5ChkHsaN7Davt3/Od9OUnnlPucvAN1iUNorvhO6TVq1
         /qPGf6MQna60kxK2yiudz4zzlAHVdCWTp2Exyt5Em9j12XoEfpadnCttPjJNzZ6bUeBN
         dQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315274; x=1768920074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81eSaaCysi2DaaK9DLEMeeuVHb0KB/kJPfkjhFnrq+k=;
        b=KWwP3pcLVaSwTJxUksY/PADT1V3A79SiMYxjeXy/TMDQi4QMPCwQ/TcT/mUVTg2o4F
         f8cWJ4Dc0HO/VY2Z7ldrWpUiA7pilrdjEDRSZ5pnU/13H5GHsXiPvnboORvy9EvZK2fQ
         orxQVzP2zNNysxFjG7t1fwp0hHQejf5JEWBWjz3FLLMUPyjoQfEI/+Bfy6obkKOn+t+y
         CmdHbP1N8X/6jk8sdd8oxj5Te8xrWqHTrWRU1jE75gm22MJC77HhScNXZnQlTrNv/xPZ
         UGCCY69qZCrDGRHu55twSdam2cc7ecCs6Te6qh7C8IWL7DsyLy0iiy8B+LB3clJ1jKeo
         XyCg==
X-Forwarded-Encrypted: i=1; AJvYcCV9clz1pJq0zTFKdghpPqRh62+mvxP0Dc6KLLiKG7zHbBELRveEmYFH8hx14sjiPlrdOqX/VsIykt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKTneyL2GDNsrbprlS3tE8XWqzz7elipVQdDsyFhl6Oywoh3Pn
	QHFEqrSU+eOiHMzYtKuMnm3qU0ZkHEndq5ZW89CPNXRpKBuLe+icl4aE6+shqdeEq04J12g7UQP
	rnLxASztE7Z2PSKFzrQWpfxjpdTAOqGnnS1mhK7Nqg/8IqN4WfJhqGEPVfv0S6ig=
X-Gm-Gg: AY/fxX5HViCQVSIerNVB8S5NiV5LAoprqE1UIlho339Z0S1mLrMZyfsPNjVIrO5llmj
	amu4C/FAXm6xxWog8XUlr5nhtjIUx79axRT9qDyQC30/6eP/kr+nRqpjEQZOMBIkNTy1Mz3SiW7
	0rNa4zqZLpSfcq68fiMtet3nBD8ymCl+IRO7GaCI0Rg+fPfc4sb+OjFv3qmgXPgxv//7JUXT1ye
	r/uHb6w5hXfS22Adf9QKUE65FS4ys2Kl2HB+FYEhdz4rP4/f2Cb+WZaXQIoq/p4sHziqmlJ3Fjl
	H+1708CGKmmvuPfMEQtT9VMsrttU2fODecH6qZ+hNVKuZXu1UO/yobnOVsOdj2hUSoOnOKxVFIE
	z5kC7owArP6HpwwH5zIRhqfQHUWDLpOG4aREME6xsq/btVRqAkbelwzbsXjRRpztXhmA=
X-Received: by 2002:a05:620a:d8d:b0:8a4:5856:e106 with SMTP id af79cd13be357-8c3893699c7mr2422883985a.2.1768315274333;
        Tue, 13 Jan 2026 06:41:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCnFYKDNE5a9Kpl60oqCa1uTX5LiTT50+97M2YvRyxXccubUD1Whh87DmmU9I77dB4do2D5A==
X-Received: by 2002:a05:620a:d8d:b0:8a4:5856:e106 with SMTP id af79cd13be357-8c3893699c7mr2422878585a.2.1768315273798;
        Tue, 13 Jan 2026 06:41:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871188ec63sm735453166b.1.2026.01.13.06.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:41:13 -0800 (PST)
Message-ID: <8379850d-6c81-4cc6-8092-c925d8e90436@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:41:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: dispcc-sm7150: Fix
 dispcc_mdss_pclk0_clk_src
To: David Heidelberg <david@ixit.cz>, Jens Reidel <adrian@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <david@mainlining.org>,
        Petr Hodina <phodina@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, linux@mainlining.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
 <20250919-sm7150-dispcc-fixes-v1-3-308ad47c5fce@mainlining.org>
 <bbcbb227-7dd4-45dd-93a9-023ac445f4c0@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bbcbb227-7dd4-45dd-93a9-023ac445f4c0@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNCBTYWx0ZWRfXywOape6EDw/x
 ZxkPLt5KSuDQGOzaE+gFXZ9CAKWMO7gQ/UZuR7ztwD+eLs+EvV75SkvV0vxIOGif2+MCidfO1q6
 6i6LNqSnXm+t5y8+dkOxDFOC7PGilVpaNEz9Nj7J5Y3a1XjuOgvr7enMOq2U77Wg5V2RJYXaACz
 LASFuZYoWLkaHfUTDk/SKYEtT0PH6zxS+cB5lpdlRQrbOdAEdF/VD0bxZJUsRaGN2dJu5ZOLq6e
 A5JLDSZ0MEAlsG1wyRHT61fD6VDObGrTCxxr8eOt69I36PQppiHOqmhdo3PAIof1MC8Zd4S79Ts
 UF1qTh0t8ZLkvo5jK0hi1jgNK6vUdCPBn8cas7LriEzecG4O99eWDqZyMD1z5Rq5roUwXRqAY05
 lHy7ecyEMdljpJmPngGLlTlw41TK2pep9laQMQ+c8GFld/29n3WcqbYpsFdnywUPb+CtU+P+3BE
 NLunTDp/cQGJbusVfew==
X-Proofpoint-ORIG-GUID: uqiH6bW8iFBjLpd6miXIGnsAkIhbr2P0
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=6966598b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=pwkY4puPBzAG2pqfMuoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: uqiH6bW8iFBjLpd6miXIGnsAkIhbr2P0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130124

On 1/7/26 12:50 PM, David Heidelberg wrote:
> On 19/09/2025 14:34, Jens Reidel wrote:
>> Set CLK_OPS_PARENT_ENABLE to ensure the parent gets prepared and enabled
>> when switching to it, fixing an "rcg didn't update its configuration"
>> warning.
>>
>> Signed-off-by: Jens Reidel <adrian@mainlining.org>
>> ---
>>   drivers/clk/qcom/dispcc-sm7150.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
>> index 0a7f6ec7a2a737c6f6f0484c71dd80f3dbf758b6..811d380a8e9f9bd8a8f1aecba567ebffdb893f5d 100644
>> --- a/drivers/clk/qcom/dispcc-sm7150.c
>> +++ b/drivers/clk/qcom/dispcc-sm7150.c
>> @@ -357,7 +357,7 @@ static struct clk_rcg2 dispcc_mdss_pclk0_clk_src = {
>>           .name = "dispcc_mdss_pclk0_clk_src",
>>           .parent_data = dispcc_parent_data_4,
>>           .num_parents = ARRAY_SIZE(dispcc_parent_data_4),
>> -        .flags = CLK_SET_RATE_PARENT,
>> +        .flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>>           .ops = &clk_pixel_ops,
>>       },
>>   };
>>
> 
> Hello Jens,
> 
> do you know if in the addition to dispcc_mdss_pclk0_clk_src pclk1_clk_src may need  this flag too?

Yes

Konrad
