Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132A630BF5C
	for <linux-clk@vger.kernel.org>; Thu,  4 Dec 2025 07:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834322; cv=none; b=V1GPhMitfdi9fccvPPoRHMGYwmk91OoOWsZYu8IEkekeaRR+UG6SQ5BJKYsbychSy0/iZcuucNwgco2660GOXp95+A0Nx0BtUOJGlN1Y4pkItWA4kIZtkYec4aK4NpSGHkMVE6bGN6AjqTJEsgEO/1VZ3GrKzlQOJZhGf8J126U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834322; c=relaxed/simple;
	bh=XWsAF8ZAERLP2yQk0oR+rse5QkkK6RS52tsseraCdU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWCyxFPsKROxV4vDyax6H+MJwiIlkkq8BbhtCbh5+W8lULkc1DnYkQty9O/16kGltcnl02Td2Zk6yk3WEbRevkNgePoPxVKYALII6ID8goyFtWDMDaUebgUVBvM4+0dgcVUJcMKoEwJ7QPPMmxF2I1FR8+G9qEsvKn6gtRZqhas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO6eD34+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDvabBeO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UO6eD34+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDvabBeO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4692BI4174321
	for <linux-clk@vger.kernel.org>; Thu, 4 Dec 2025 07:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kr5elW7ymjMXQDbI1Tzf3iWqTiPBjQmw4pZETnYjvpM=; b=UO6eD34+jA3ZeUm/
	FHFVeSRreCV5QgUAByzBkQnrtyX6UOtMFZjinMsPW7mNbNUqsJkSZ0+44JHAG5Cb
	1wGr1tR7BKYcR6T4ie8IWw09LVTu19x4J7OE6wBg0XCkH5Qzkisp2mS9kn+0ii6i
	R2aDoCy6xJmGk7QOGCuoc6uw1tBSSMJp5xEQOem1fvGexSfzY406tN7+lHmq8bd9
	EOTkS8Pw7hMCAxD7GIf/Hluxfzr89T07QGafLYCTCH3bMN9YJ3MxFZw6BwTRn6fR
	1Kzql+5UXfYRSxkThUHm6x3MDwxnhzdsGiTXJOLSNn0RHgmtUwWgj2XWlQ/v7RyB
	TThUmA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0bb9k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Dec 2025 07:45:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b90740249dso1050179b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 23:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764834317; x=1765439117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kr5elW7ymjMXQDbI1Tzf3iWqTiPBjQmw4pZETnYjvpM=;
        b=bDvabBeOemeHp8tUHPeNFQHrY7v3WBdCIoSQHREnveJZUuj6sLp9nts5eQbgNFk0Fo
         3altExMPBEyXLuDmbdEOg5BC+EOatlLHCXnO0E/ZD0IqZQfo98C+QN4R4IjhQIt1wfPJ
         +yl9mZRe3LeBWx9/JAzMpfHHlVnUNaF8eMbHkI+vUOji8NexAlPvGrqaUxEHvyye+WfW
         9MZ4E+czSSfI3nSrflkQMNDrrrxdyJy/GUSK+dYLOb4oP/agpMKCjXfbrqHCqzYEzlMN
         5cuPL280SOXCPPLQYv2BnE+RXx3nsFLq1Yu33eHqiksl7Yk6miGfuqbNQYGf1uAuj2db
         J49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834317; x=1765439117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kr5elW7ymjMXQDbI1Tzf3iWqTiPBjQmw4pZETnYjvpM=;
        b=CtORDFIQRt5pwTCCGoEnUosSvd0BAQ4GeZcSGHzKZGEQeHLSs9ZaylQ+e+PNUfpChU
         LrY/k2msBA6lICGIJqxF9x3Le4zT9D7RP9L6oKIi4ePuRRRGDyjaje+Ofrtqc7X+5rxs
         dG5HtvQ9y44eEQlsX+5vXP033/306b0ZG9uixIk3sEWQNh0e0ytpf7waKqV8O1PMRZvz
         3WNewCz61lBITx4KInTz+RamBTemeYOxXTjNdgktDt32xoWlqksp47iEkvi/N6eeZDbP
         TOvEYCemYh7qkNyOLS3A2LU8ae1Pi0ocR1O1L7FJihEfR5hEYoryNwai+hmqmkZhy0CS
         49Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVqPYN/VqXiqBoupKd8+kBhDrSfr/Y69UisfTPNiAX2hxR2n1wUk8p3dejhTabnvC7VsaJKYMrmBVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YztHsM2KNUuYG9jAt/Td/BlbQuhCxQtD5Ac0TXw8kBDM54E2vYG
	02+qarmKS88c7ju0CQ5243wk6aNODoC6HbjWQ0ZiZvDJ3pmORadZKmd36UVqi0NKH7KoVmwn5qa
	XnqjGWevMy1LJGhSY/LOQAIb/3Z+Vv1AUZGMfnRPDH+nOCROWRY1fqrYB9y3WjYDNr5aszCJYYo
	K1
X-Gm-Gg: ASbGncs1g6iDBXpC7FFH4YDOn1b/ZdGj2pfSA5YYyYueivqAN6c/TCafJbF9ZRBqSw6
	q3WS/ICrvKugSMUzEdTMuP+VkDGXLlqj3gZwtECRaLr5VBzBZ0Z2a304YtzPBI7GiTkrqZoXXpF
	EWCtRfdYATQl4jsrLdCCbGesAGzycgmV5clD/8b+E8S1t9thCqXkxHEJRViEvqoYyeyLLO2KQmN
	h9h1AzRtEe+6v/5Sw+ImmoX0j2bxVrvLhFuAkpvd5WUNfAdhvL+aosvlc3qLE5Nvp+xBwALCId6
	Ly34F3UFKGfLj/YUu7EZvy1Y9BGykJFB7M7jLtDqLDy0S/AIuCn5ocgGne3jqDluDhoLdRCZSjW
	E0QY36lHnaFwE2Udt8jSbkVrf4Eo9nJ625iLxcjY4JejwBjNHGBB6aNzwwjCMCir6jkdjXmOfgX
	A=
X-Received: by 2002:a05:6a00:218f:b0:7aa:ac12:2c33 with SMTP id d2e1a72fcca58-7e00b91d60dmr5855968b3a.1.1764834317140;
        Wed, 03 Dec 2025 23:45:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGenH/ZiZlS4VGqnyi53g1czMIWQNw20l2xkUt1FdNSD3FPuucPqr3WetXtDqjVe6p6VKxkA==
X-Received: by 2002:a05:6a00:218f:b0:7aa:ac12:2c33 with SMTP id d2e1a72fcca58-7e00b91d60dmr5855933b3a.1.1764834316631;
        Wed, 03 Dec 2025 23:45:16 -0800 (PST)
Received: from [10.133.33.164] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a0a008e2sm1225681b3a.28.2025.12.03.23.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 23:45:16 -0800 (PST)
Message-ID: <5a982965-4964-4f50-87b6-e3b8a1182876@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 15:44:50 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
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
 <20251128-qcom_ipq5332_cmnpll-v1-1-55127ba85613@oss.qualcomm.com>
 <2d83f0d3-4798-4183-9e3d-9972db706cdb@oss.qualcomm.com>
 <ed2aaebf-f0ed-4eb6-b880-9c39d4f0533c@oss.qualcomm.com>
 <1d9b953b-5af0-4a81-9182-f1cd47e772f1@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <1d9b953b-5af0-4a81-9182-f1cd47e772f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69313c0e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MGsDpFW7tt7mzu13zmcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Nx3COcj5rSRg3PQAgCfoVyEdQNH4fLR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2MSBTYWx0ZWRfX/Y2E88I1ARx1
 XTKOgAZEytSAy2zYhCP4UYKErQf5xccbnzrGmt26aXDYnx6MXj84MR82CiYaMlA/Jd9EGsox6ZW
 Fsc8FFzeFEIoQU5a3y5sw3tXV/roZraNopqmGWYXRFXfubKzytmyY6FkN05nQXLmZivKYn9Idxf
 4AVg0PkbIUh455njDzooUxwAEm1xRRiwQIbXBkIr7kfrSdd7b0tb+GueRHlBsuQDXyhVZrBkhoS
 3lUniT1eVUJbSoJRSPjN5IsuwCyE+7CZYsAhcY+rdLs2WsRLyzfzc5sKvN3Kgw7xiXHL6c0avom
 H+XkNbiZBA6+EA/GxcyhxpTJdCgYjB4udE1DPrauIfasSJTlCsUhx8lMAtvTLxGdWuq8ajGC5UT
 iHqSZn9dXjDhdrUYe47mWeP+bxzT7A==
X-Proofpoint-GUID: Nx3COcj5rSRg3PQAgCfoVyEdQNH4fLR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040061



On 12/1/2025 9:42 PM, Konrad Dybcio wrote:
> On 11/28/25 3:29 PM, Jie Luo wrote:
>>
>>
>> On 11/28/2025 7:38 PM, Konrad Dybcio wrote:
>>> On 11/28/25 9:40 AM, Luo Jie wrote:
>>>> The clk_cmn_pll_recalc_rate() function must account for the reference clock
>>>> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
>>>> with a reference divider other than 1 calculate incorrect CMN PLL rates.
>>>> For example, on IPQ5332 where the reference divider is 2, the computed rate
>>>> becomes twice the actual output.
>>>>
>>>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>>>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>>>> rate = (parent_rate / ref_div) * 2 * factor.
>>>>
>>>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>>>> IPQ5424, IPQ5018) that use ref_div = 1.
>>>
>>> I'm not sure how to interpret this. Is the value fixed on these platforms
>>> you mentioned, and always shows up as 0?
>>>
>>> Konrad
>>
>> On these platforms the hardware ref_div register comes up with a value
>> of 1 by default. It is, however, still a programmable field and not
>> strictly fixed to 1.
>>
>> The ref_div == 0 check in this patch is only meant as a safety net to
>> avoid a divide‑by‑zero in the rate calculation.
> 
> I think some sort of a warning/bugsplat would be good to have here,
> however I see that clk-rcg2.c : clk_gfx3d_determine_rate() apparently
> also silently fixes up a div0..
> 
> Konrad

I agree it would be better to at least flag this as an invalid
configuration. I can update the code to emit a warning (e.g. WARN_ON
(!ref_div) while still clamping ref_div to a sane value to avoid
crashing in production. That way we preserve the safety net but also
get some visibility if this ever happens.
