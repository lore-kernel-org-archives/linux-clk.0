Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442BD3914EC
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832401; cv=none; b=nB8TfjZFUMhyMgejqj99GR/Y+nqy7xsruh61OW9kdQ8IbPyphUAqYb63I1wu6xUbjiFCz1Ulted8eYBq0v2YJ1GyR2ZnfBh6iCZQkAi9MtkUNYE5zi8chm6XK17Ow86DqDgBISYhJ9is/r9gMFjCIdPM4rNaGT98uDqqAMpIRY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832401; c=relaxed/simple;
	bh=vniTYVjk/lzZ9hdPrn6kzokgKnGsY7+iAT5Q9uCWLn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lev1XaeamQC2V4i7Rp2J4N3j5e9oIOSUTPK0TdYTMEjbR6sjBShtWb7Ewg1jyGtdaRQHiRXYengnBXGRi2wguaMSU5pvrZYkZYehemmL0jrc6GZlzqRtV+iMn8+JAAy9FSd5vqHdgReNhxXyXTFoZQphId0ISNko/DLZak5/8Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuRBGbaI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b13FbHIr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuRBGbaI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b13FbHIr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBB9N9320090
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlHGWJ9DXNUnp7Csb9vXzwae0R72YcscErEfyQ5F/AQ=; b=YuRBGbaI0pNl7hzg
	hpLaQ0zcnCpwRWhnid/DmfJfnc9GBB8KoGB+C6XG2fTDfEZXaCdhXK1syKNBxzDL
	8QnMRlKRLiCX7roHxcst7Q76sAzybiWaqWALrrNZaDiEB4Ulnw/qqHK/u7LHE4eJ
	BBKLVP9fkk+dYU4hBwbgrLJ5sSFjRd3SThdCbbNnNtCvwW974ieTS7m0B/Ps99dC
	vtCYXAvQ6qr9R6GpfNAyWAD08qzwUhYM1G1mceYgysZWyEl1ayDhF+l3R+vlGR1M
	tkeA1gzoqClM8TzRR1FGCaNZa98IVsv+BwyXVGzki48SE34tBE8VobkDp/lgZxVd
	GkaxUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyr08f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:13:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso128943341cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832397; x=1774437197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlHGWJ9DXNUnp7Csb9vXzwae0R72YcscErEfyQ5F/AQ=;
        b=b13FbHIrLgBZhfDsj1rMzWHjngoJ10WHIq/NjNJkDBIiHvZmfUrbf5E3Uyd36Od66U
         RqJ4TLxvviXuec60MaZZbzqFXDO+qsrNh5w4T5gC422TxAiPu3a6zyWRKbu/GIMFUsqX
         SElWQ7FafMHER1+FnaRObAWPpIjo+E5360C1ZqsyoRozD1kTyU73uoD9SyNmkz9pj3Ej
         47LMxuDH8xijyemzG6Fds6KYxUUaNNyki/ckP5kdmkwGFHdXVkHvBuOZcyDHc3W6VOIq
         RubnRc9HvC3RD3iB++b7y9U7SewoxijakGl4S1+T+tOvULeP/vC0gkIA/MQURc6R27vm
         o8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832397; x=1774437197;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlHGWJ9DXNUnp7Csb9vXzwae0R72YcscErEfyQ5F/AQ=;
        b=bx1Zziey+3/020fVwR4mJMxPvlMJpkBjH84cIRAQXUk4IdVXx0g7fT2ssgYCxVaAGg
         C+7LvDl5wHPA73NzYoteZgUVA0cWfm8xlokJo4oOJnTDYueKgx7GSXwz8UKzji0ZPpkZ
         vLq5RIqMt4i+8BmfAyibae1n+LrlK+hXkObLApffsEGeqcIm6+BdCgOoblyrRTdHGuGW
         FzDnIjtPKVCwbDGKHcYG4pI8uYJwmE8Jxu6ut4GWjEXtz1U2BNP4+6YicmKRzoClBAqZ
         5cKazNiATXHrRwGmByCPuwi0mF4sYtT9kIA3nzWgNtZFWKQ5x9SXxtROxl01nRMcgIBX
         FEeg==
X-Forwarded-Encrypted: i=1; AJvYcCWSaEIedHWfaYq3ztbYhBbVP3R3o3osAfVs034CY3AIRB9/a6HgaJH5YpRnQ40vLpgfu7Pu5yuwGYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfi6c9xIMBVbQ0ZmG9Lm+TNz12S9iX/mPh+w7qOFFaYSMbauHQ
	xo7cECnElc/sHkO2dGDSCTJYXiOm4AW0cfdGo4wU2m8cPtkuUpGSiWp6hl3i4THXlflwj+VaLri
	GllrUK1trvppx69Li8tb8TUjhUiy3OD5KM66egl8SEFwxHH8vRV+OrojziL81FBo=
X-Gm-Gg: ATEYQzwNCwqS4JZ4xiocE22n58h4Vh6oPjnWiWvfrggFc+BU1MmAIloDFgpuBSN2a96
	NcxinrbzXdrV2r1bMBfmB8fDssahbXtt633ISeyjsg3bmq1tz3EbooLeKSJ0QXsMYERDk/bcDvQ
	WCed9stjZxCw9CM+a6cWiZRu6Iia0rX3o+FY1umDMyyC/MQB1k+sJWuNkPPBJt5Yt/+GSLBS3vi
	Pyd+IrhNj9qHuuVvY5klAuau3ch177qkXIUpVE74Vvlc494I6gRWgsNrj0ExAHm9rOrpSYLZVPa
	5AMop6FZ5dp+vtT93sdczRp5nIkbZL02xzYT2ZclyudUP3IgtrfNobnwic2Us5nfp0i/0c1y7qK
	4fUkua45qPz+isiE+rKbsL7SzVGKmGmUbmbKeAPMwBMkLlLMN
X-Received: by 2002:a05:622a:1991:b0:509:1924:3f6f with SMTP id d75a77b69052e-50b148fa5f0mr30838081cf.63.1773832397642;
        Wed, 18 Mar 2026 04:13:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1991:b0:509:1924:3f6f with SMTP id d75a77b69052e-50b148fa5f0mr30837961cf.63.1773832397238;
        Wed, 18 Mar 2026 04:13:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bbcd78sm16655685e9.26.2026.03.18.04.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:13:16 -0700 (PDT)
Message-ID: <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:13:14 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: If9eQagKjatWqisq6hnHITaaNMDmI1Ga
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69ba88ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TBfkzzlTsJg2ki747AwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NSBTYWx0ZWRfX81L+5vPoTmeR
 17zYMG0zXdTkJ7xtI7rLrNrgewCOZ2+8blxH7u91RT72j/+XnR15gBtosYY7luHZuGVtK9dz9yk
 bcmnFPluDWbYBJqY8fo8d8DRby5CLsHxJEUbQny5WCYlNp3UPdSUC8WFlZ63AkrVASRHn7hUWxG
 1JnxSklnIV/o/H3b+YJc9SVTCrIzuwM2pxxT+7Ku1fjfxU2IDBq5upHkKG2T3NRARD0Sv7aumvZ
 vOeNBXwWuftXoBudkb6HColceXKvN80EP4jARQW1qnrJpbL+fq81oa/MxacfJ6ZAGpRz9svgzA7
 pCfKzUz1oWvlqc74/Mxx4vc2G4tmf6OtMI4etAwR6+Ip+gwGtQMIdwvi1toalGNvnJizUYxG8D5
 9fxInSNQrRcBt8oGgR+6YVy19R2E2BQaVooowgWie2Y4bvwWPhKsPVGa8ge+xuG+RhaUNu00OMG
 BL/T/C+U/+4GSLPAnTg==
X-Proofpoint-ORIG-GUID: If9eQagKjatWqisq6hnHITaaNMDmI1Ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180095

On 18/03/2026 11:48, Konrad Dybcio wrote:
> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
>> which is copied from SM8750 driver plus changes:
>>
>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
>> 2. Eight new HDMI clocks,
>> 3. Different PLLs (lucid and pongo).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023-2024, Linaro Ltd.
>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

That's the copyright I found in the downstream code I used in few places
here (with modifications) and I am not touching them. I also don't care
about these and I am surprised this keeps popping in community review...

This was in original v1 and you did not object there.

Best regards,
Krzysztof
