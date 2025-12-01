Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB032FD68F
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597139; cv=none; b=ImN+vgs6GMOP0755SG2BCqPxd9P1rSIYxRNqZNtBWqYqzGs4y+wQVCUOn+slqyF2vcN7HxEIWCUheu7iZdPcob1lZVnSep7TzNb335dKp8IHzlp8aRlQufY7iMxl3vt6utKLgUNuXHL7AbV2t511at7RorHCaxiacpdp3LNYobY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597139; c=relaxed/simple;
	bh=EdBa2yLMarweBQz0sJUl4dwDNu01XZVe4Vj8ey7u1kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djfv0H8cbiWt2vjLx1gd60iLMIvJMrZ1GjdE3Vp9RxeltOrPtWkqzZaylEvd8oYvYt0AoTgBjOVsALdkSMTf48uIwady8j/P0MLZWH1YScej8qz6u2aXb1LfgxG2uoVcMn9y+9VHEnQzVzDjd8PvzorOM7Ea9LdUvWIf1k1F2eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjO7OiZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pvp48CPV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjO7OiZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pvp48CPV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18HbgL2431617
	for <linux-clk@vger.kernel.org>; Mon, 1 Dec 2025 13:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSWsLfGRcOlbhK/JblDVcW8zBtmlwoasmX/RtgoQmXY=; b=jjO7OiZ/j5MNFp1j
	V74DHcTyhZsMbvTLGWpQP2Lfe5jDt34cr+RW0RsXCCoL0XFVnJEDx/bvx3t+Nif0
	DBGiIoHAO7NbVJaREes5NVZzuVykNBVGstf3ZR53bNWP7usSfqSUkcVlaGC+MHKs
	3qUwuXG/kpI/T7wsOiA2apE4fggu0pnuWaEl26IHKF+2c5x3zTfD9R4/Cl6cfuKW
	XMk7Esa0mhJ47qzrkeve0fLEEoWOLLVF07j8lHepgpPiXMXe0yecVb5+L11b+n8l
	omN6b/2aKj2T1kVxMfgNbFQB2BUmksX3+pk8vH2lWr/45UdAcFrPQEtICRhJVmBx
	SmTgCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvt5h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 13:52:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso9881851cf.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764597131; x=1765201931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSWsLfGRcOlbhK/JblDVcW8zBtmlwoasmX/RtgoQmXY=;
        b=Pvp48CPVtqfS017Q9viLwS66/NiZpWiWei3bJ85KDsVCJ4GTVFTZd9SKQ5jEMvlD01
         iq/TUjremKwII9KwSAyaTbpdpvCQEDRpHGrzTNOHgYINzs9Vaen6L1dYAWPWo62S2CZi
         AXSeItbR68X5TjPcIyCtMKrwulZ044F35vXlET6g+/tML/hXbZPb3UTTIp8HeYoLZCo1
         toNSWP1Y1ZfS16/D8AB1qXdR7xHHtR4TyBVUKPMMcMdOSJqxD0dbhaxCrRH0zPGDqywU
         EzwmooMcS16LpLjNAYkVmECUeLr/V58gI4r+uAT/GT8OIwpl4sqiwDtYm/nxt21NndDF
         jYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764597131; x=1765201931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSWsLfGRcOlbhK/JblDVcW8zBtmlwoasmX/RtgoQmXY=;
        b=F/qZpmCPaTChsRyGdIex2tmB0F5Uh3hvZlqTG1ucHh4R5Df/92mmch0n1hk3p9TZJK
         HyI8L2vWEXvfzo5/jZNsQ1gIYcXmSMqD9z7H+o6iHFKAt6fmLKti3s9K5ykyhK3o1ITh
         fhqMRJjiQ2uQhJThcWrv2GJywGNtDY1/R2HXKMcTyZihmrODhwfVVZhM1ObPPbJIx6dF
         aSZ6eRgyd+xMIj/ynzaLlFEgqFXyQVocJWAjxbo6Nzgx3uiOiP6nbJM6grttm9zNSIqJ
         DNs5ncq2K71segmYbyD7Bir1qPMivhbnsngjoIo8bsQSH09/7V/DvAbYspQvHZonQddl
         9ekA==
X-Forwarded-Encrypted: i=1; AJvYcCXW628NdU4hBujRNfbY2wOrk4Hy3xjNPLGDzN+5Elu7EfVxLGtzOcq4EwxlGRKOXxTTdGvSNfruYqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8h6xCfoGoZKn1t/VjoDjw9mzYAoEx17gJ0C4Bq5+AdHQsDv9G
	G0ZPrsCKJgjJO6dBEpaewalIFK0ZH8GR2PnbXg5BhnunXedHsT9VSOeTSCFp3E5mNo12J2JDsZS
	muA1GF7YdEDnoVpVAmLrUCDgvXfaAt6QKUI3yaHkYVCSjVHDZu5333mh0rdgXOJc=
X-Gm-Gg: ASbGncsygYRc4xd5qoHhAeMrS3SxfX+nz7kgZOc+aaxBkIUz0MzGOFqFWlpiVaR7bzc
	1PlLYmOOxOzxErmFa9BuWeAVsI2048RsGc62yE2lgUsq3VYkOcbSS4KCI7MHXO1rgjgsgr90oM0
	LcuMwkgft7n+h58SvxSEecSe6EXqF9u1qQ+8Y621W0YMF9yIMDDG/Htttjc4W7H+yiBoLr+ZaCB
	d31uiR5lVBl3cwI3GosjTNFsdfJZIPHi//q5nCy9RnCysl2I/OvdWrehMlFrqMHw+HaZiRG3FuG
	QNRIVI/6rLLkkYLCs44857u+X8A+63Q68Z7qYqzR4FRWkJ2jE3DoZFfCPgEPMI147R6Et7qPXlr
	Ng7VmI5QqiR/A3Mcx2TXA3SNZvowfOUsoIwGl5DMoW+hchwHd4wmC9Ksk++Hb0A6QF1w=
X-Received: by 2002:a05:622a:1a94:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ee58850870mr387824101cf.3.1764597130614;
        Mon, 01 Dec 2025 05:52:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOcBof54FKlNxQypJiOwkIYUdhopho3zlmK8tqCpIc9TU8cOhP418zn9aWrVu9oDrWj4BKcw==
X-Received: by 2002:a05:622a:1a94:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ee58850870mr387823431cf.3.1764597130126;
        Mon, 01 Dec 2025 05:52:10 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d5dsm12489095a12.12.2025.12.01.05.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:52:08 -0800 (PST)
Message-ID: <6e12f446-7792-44da-9e06-99729c3b066d@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:52:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-3-55127ba85613@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-3-55127ba85613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7YNakr-xbnz224Lv_zs_58mfkFsdygeO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMyBTYWx0ZWRfX7oGXMURvMfPd
 +D77XIZA9O7l389Z9Rqt2H13+Cd0Ly8zlQxIfDyU+rq3Me/sNd+lr618k1/RSQvxnoBgIagvln+
 vOyHkGOD5+75OgVz7hvuTHrKWgITGd7/0fFP7EnJQGhGKqhmDqABlJSUxqbjsEuNr5rjx7s5ioM
 BOEg1MMVrtyx6RWLOlRKmYRRvhYekS6yPwEGDHmMzhW46679SmptmwVXNEu3m0/cfRDuCXYrGQ3
 BBdeX4xlmsvv/wzlBVSNheQRxb0Uas07nEPn+nmfrcYNFuJ2UFrKxGar8H2X/loyKmhQOe3koiM
 WyPFKnJSGSEiTBcWO44u2vSubGiadMzRJ6p7JNsHfXAeJsG1UkennwJwij6uJgsTRgLKG8rSHvW
 bxB5HzcRqfb52UA9eR5C5dkk/b34VA==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692d9d8b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OpNYcKt94wLiKn9aZLwA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 7YNakr-xbnz224Lv_zs_58mfkFsdygeO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010113

On 11/28/25 9:40 AM, Luo Jie wrote:
> The CMN PLL in IPQ5332 SoC produces different output clocks when compared
> to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
> (50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.
> 
> Add IPQ5332-specific clock definitions and of_device_id entry.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

[...]

> +static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
> +	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
> +	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),

I can't really find the source for most of these, but I see that there's both
a 200 and a 300 MHz output to NSS

Konrad
