Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C67A20E31B
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 21:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740173646; cv=none; b=eCOqFBYMDCV/hBdvTLWa8iOR5XDZvBZ+vPGDVxG1OC1iOIa2PZA+gYyV/6en491ba/hnSjnm9d91nhDoVBc9mlR950TR2B19rM0au9cZtzKWqbMnnVJwxeWn183AL7aaTS66VuHO0glIFTVlCAxjBHFkH7ZgdgegH22Trna+3cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740173646; c=relaxed/simple;
	bh=8tmdo/Ter+kdGrzmZv4+c1CC3FGOX+GbLELDtAoZByo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QafAZ1SpZuetQHCQIQXajlY3QrRhOvujsUcZp7DWPYipGsyZ1PV5SFszOboCQJU5FZxqK2N3dQ+hDevyCKlWu+LgVAXksvHymFBaUWAldKlSFV7ZhWTepI+mh5wsCPbR2e76x6/LcmIKGI2Z/QuZM5h5iRM3QJPVkelrFNJ/qjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQ8O886S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQ8O886S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LBsqLK016354
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 21:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ghn6L4mUBwXpawWqt2VB2BLTybot+6+x5e3CZnMiiBY=; b=TQ8O886SD//Mk5a8
	T3Xz0YYim+FzYQpLp1+NISKMF0Eu4sh4jDyBL0kCmmA6GR4jgy07JLlHDE3Ev7gC
	IghEuF+QLWar5EmBYPtCMI9AInB5t14smZKyO4Cl3whg6T3X9MX9EnG901Os6n+Z
	prjV/aWiVASujUuqDddQfNr4w1iqVD1/lLOHkJ7uNW+PQwhFey8rWVbM8m2JXmIo
	/rMzKH4Y0i1JiILKyEA6u+1qGgrdxtzaB0FRC5BcLe1L7bxf1wx2l0E+XfuU6H/X
	tcAMGhARTBBLciIqVi6tQChxXMHpKrDuBIqDzoo0n71h6ecx4mZep05R8PCjA60q
	/WzY+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1b8aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 21:33:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e65862f4e0so4034706d6.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 13:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740173636; x=1740778436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghn6L4mUBwXpawWqt2VB2BLTybot+6+x5e3CZnMiiBY=;
        b=u4DfqrycuAGoCKwGhb1xYB22FpIdneXQ4MbxKB1EDNVTxITPNBHm06ikIfafEWusr2
         S//iDW1lyReR3DiNpnFeOm5Mg6+mX5D0/OLs/3flDGseO32LROESniw4Kx8vVR/hJc9U
         upJVBg7RllwSOXkbcZoQM+/nevHyw36HAJfrPMEG/zjDZy4DtVCXfdDEi55Q+Hp7znJF
         dQ1VmF+Vn/sN1VJQI5akBwW80VqE3Ej+moK9kiNMLf9mCjAbigjZj+X+xaPkIYNHXfoK
         26olRxjiMClmD+Rd6Qu0huukuu5tx2AEZmEpjLYYpg6rTcgwXm5ex8GXLNazw3ahROfa
         wEMw==
X-Forwarded-Encrypted: i=1; AJvYcCVHsf/1aYC3tbMtvTH/NjYS49MXOdxd1jffZUlIx6DZSrNTuOLtv7nVdHWu4hUJVVX+rOTxH2teCso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt35J5DHXDQbaepXTfGynOSBXiEYqa0fwy4F3vP5TGq4K8/Ac6
	cRjJUntq/mtsITlDVCgOe6SCSNt262d4ojvJUm8mV872q2ssw6Y3S4C1umVCTPQNCZQT96ZQekv
	/ca1LteMDgbAN11jae1Ls5m1Mb3BzAC8VS0jnWqNHzu4KH51Je9AuXBd1dDI=
X-Gm-Gg: ASbGncvB/3tm5nR2WzmL94Da69PpZHIbcAgrUh0Iu6AEszdCA1CixrA2iledqy55uzS
	dCbzrT1odhq07MCdqc0BnWwZztnjfAe7LmMVgk+K4se2vlfZ+xGu1qZIjPpvvzL2DUs4DfvUNdY
	oXmxBArnzpdPgnZ+xzZIMiVtMWX2liPYP1ZW3eE59tbwrZcSzTztmy9QZ42+1UBQ2TlIJAuFRIM
	ukUFvkGqbqhczvUX4CDSsHNMeZ3LUVSM1p17Z6Q8vzJAKztkQUBqhPAmm766QdTuAMqZPOk+HWY
	gb4FMG2REzAnBlEbyu8o8mFJ+sXAbxAXaR/QVSMnWGxd3zEz+oxPZyz3rAanhVRGRyMBhQ==
X-Received: by 2002:ac8:5710:0:b0:471:ef27:a30b with SMTP id d75a77b69052e-472229a8a3dmr25460931cf.13.1740173636386;
        Fri, 21 Feb 2025 13:33:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3eGXB/j6IzUtZrEuHEsUKdriBuCF9PZH69iEvZpR1z/0tsNN3yb6D7Tmo01aYFqwMf4Hx6Q==
X-Received: by 2002:ac8:5710:0:b0:471:ef27:a30b with SMTP id d75a77b69052e-472229a8a3dmr25460631cf.13.1740173635901;
        Fri, 21 Feb 2025 13:33:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb96fa4d79sm1069931966b.126.2025.02.21.13.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 13:33:55 -0800 (PST)
Message-ID: <752a6234-cf74-48f5-8836-343011b6eeaa@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 22:33:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, Dang Huynh <danct12@riseup.net>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-8-7d27ed67f708@mainlining.org>
 <7664b71c-ed47-4765-9ac4-5dbe3ec80d3c@oss.qualcomm.com>
 <d4792e6323e2dd5392a0d9633df62174@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4792e6323e2dd5392a0d9633df62174@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lFuEStiK7s0YgmSmpi5JlpJJ82wyqFam
X-Proofpoint-ORIG-GUID: lFuEStiK7s0YgmSmpi5JlpJJ82wyqFam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_08,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=856 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210147

On 12.02.2025 5:20 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-02-12 14:07, Konrad Dybcio wrote:
>> On 11.02.2025 11:37 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> So the computer tells me 8917 and 8937 are *very* similar. Have you
>> tried assessing how making 8937.dtsi an overlay atop 8917.dtsi would
>> work out?
> 
> They are similar but there are many small differences:
> - have two dsi
> - using adreno 505
> - different iommu it uses arm,smmu for gpu and qcom,iommu for applications
> - 8 cores
> - camss will be a different a bit
> - venus will be different a bit
> - have more i2c and spi
> - different mdp version
> 
> Maybe i can find more differences, originally it was based on msm8917.dtsi
> but we have decided to keep it separate, also it have different license from 8917.
> The plan is MSM8940 and SDM439 support will based on msm8937.dtsi in the future.

Alright, makes sense to keep them separate then

Konrad
