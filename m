Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B1B33B6FD
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854415; cv=none; b=mTn/DrloHS5VOLa4NQamPha3PQ71vrp5UgucHKwT7hsNeJJ8/6aQ1tbV2IbWBEpzO6DrT2cJGHMXC/gBYvb8WDhOVfurq3evJZVZsaSMqqvSOcSa7jXnuXLoVsHdZqt3Ts5aWz4RV+CsWGW0Bzg1hBkTb0NNKTASTTEoZsC1kWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854415; c=relaxed/simple;
	bh=P1uVQeECI90dm1yQ55GkPN7FyGyFDaBNOI/kCJgKGuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWxKLWifxJOOkvnH8hrIoFUuoe3M8aomWJ9ACuiEq8lyuPVALvYKaGNxpnnnkNwS/AQvGaz8O3dI8GwoYdFcdcv5fUwzHiLVBdA2TosKWazcEB8ixGlL9WAHPLf7F/hrgj6zBQtArnVqgD3CtP8WIXfI0ZYKf9r7ikm9DmdGnEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+sTcTpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ich7A0Gq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+sTcTpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ich7A0Gq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608182rV4049966
	for <linux-clk@vger.kernel.org>; Thu, 8 Jan 2026 06:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8G/Hrb8zL9s9yPP0La8egLxis67xWKxYxj1OFE4LZQ=; b=k+sTcTpQUoUdbvov
	ZfRiEQTRa+GuGMmLZajBjwo8+YyWgqzhsrxJaYWcCQnu4x/S6V8A8XJuHwJN4Y9N
	5pbhSx8QKdVxa4QrwtD3AQfzf+PCLj6kfjyZckl161QUL6U7lqAtj+L9Q788gOdc
	MeHuf9l/LFujXIe53YNsYzC0FpADq3yU2LRamworjMNpJlAYXNw6QmzvPXMHpcfb
	RmKt+o89LjfTJB/Szam85hhLhEJho2rvrKDUr+440+eSV67nJ7/66w+KU2+AH69U
	w9MjegtgQ9v4R9EdODpbn1n0QF4oLE4N9KeoEMj6LSL8RPNRrm6RpvPpgqMdeN4/
	AmhHDA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8gwqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 06:40:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34eb6589ed2so3225884a91.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 22:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767854407; x=1768459207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8G/Hrb8zL9s9yPP0La8egLxis67xWKxYxj1OFE4LZQ=;
        b=ich7A0Gqa9zR2uWDb2zibeCzDifgwRAmuZ1EZ0TNDTPPx5wRQkPGiUb41pJ0D/gZvG
         kK9ysXLAGJhw7bhdyJLPfnJO45uHYWRPVAz0ibOb+UzkIi/GhIeeJY7osBndSGtJhmHZ
         JfOYEL5atuVUgrADy2dM5f9H82JZBXV+xZgMpZwqI+zUA0whKe68hc0ZTsSnkJ2AT0Ci
         cDCuAUmy5nABLxPj5NkJlVJKFi5dVZGl1oqNCRzAGNztbl0HRdX3k4y2kt1dt4TgNOdS
         i/gEXNJfAy302FZX8EFnJ9ZwOw9WDFvpGF6bUyMjSncDMEFptcuNqwgDI9DMp86YTdPl
         ET4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854407; x=1768459207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8G/Hrb8zL9s9yPP0La8egLxis67xWKxYxj1OFE4LZQ=;
        b=C6J2clPiPewb321HkqcIQU4WfXstQ5WIXeJjxu4yW162evEx3X2TSEe2ZNAKrNO4rC
         nGLftkcf57sxeACPtkknS2EHKQ5tNx+fkidcymb71r2ZUxB3ccEFeS5pHE2WpdjVmNdh
         iryPGhlT0YX+vazADSYioALYKW3ZIweD28wQhnlytVLj0qcG77UicmupG7wqrod2Wp6u
         zLDdyBdDm29mMaCr/4FPRwIiIy/RBjFExlg29BDHNKpdRyNrp5TAG2EXzszvhEPpvQR8
         YGhoCSfj1Np3N3H6RN8ZsaiL/GpiywQWhrDEmlFjgoFuJgWkjHmPTRnUCUI7+toPoTuH
         tmrg==
X-Forwarded-Encrypted: i=1; AJvYcCVS3oFFZfMNjDp8NO/rR7w5fZz/sgoBqucpcaeJkrXoNl89H7jSiZnbMeDjlBpTxmSNh4jzP140Ekg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4OG6aBKhegLNCmE0Hl/cWnGkxrZL+LWtLGzb87N+P1TjXytk0
	vslI8E1ynSSiYmpzczQiL6YO4kSaxZgEV/+yFnbW0V32TawEbvOinK6UVFbNcGOS6WhY73g2jvn
	++KYWY+O7Ds7JPdsP/PJv/s/u86yPmFMh+K9vvA5hcvL5uBl/dkXlUsmrCyODVpE=
X-Gm-Gg: AY/fxX7oB+Tzi3Y7rt1lpy/I4jK1jgTeew6Ukl1NTodBkarBqgLpOvnNHTGl0k1ndTp
	MfBaS/fKM0/fhB9ahFZRFi72FP5DN8mfYG6/ubshRtBScZ7mMASEnNPP4iimEJ3SsED3ETVAhKf
	Y9LYWFYhhO24fROKHkVsRHrSP7nMKUIyW8a8uOiy8TOOaSNE6rwNGW8j8GzJdIvDlPT6sn9iEmz
	m46+1V3xYeF8ZrIDzfBg71KKTd4vyQb7ea57pJrk+nOrYEXyorEWyvABQZFlXUnGPMsaUdrf0LU
	OLr49QZYuzDJ/evY7CY6XbkJ8Yprqx/ULa9WuKNZLdbD1KBBIH3RFq1UkQfMdp6Eat/cUZqkGK+
	8PB+CAqR0ouEC0s2z8z81WSewL8+FdS08fmPIFfQwjfZBI1y8lIgn4J5BxkzjtzG/K79rVIbgd+
	w=
X-Received: by 2002:a17:90b:2782:b0:341:8491:472a with SMTP id 98e67ed59e1d1-34f68c3365amr4840202a91.4.1767854407056;
        Wed, 07 Jan 2026 22:40:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMNhrbS8HaUIhafc100nsOf78pOQiiw5ygtlhPyNnx59KZyv6ofAY71Hj0zhVJPtj6wDTxDw==
X-Received: by 2002:a17:90b:2782:b0:341:8491:472a with SMTP id 98e67ed59e1d1-34f68c3365amr4840179a91.4.1767854406574;
        Wed, 07 Jan 2026 22:40:06 -0800 (PST)
Received: from [10.133.33.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa955f7sm6825301a91.8.2026.01.07.22.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 22:40:06 -0800 (PST)
Message-ID: <b132680b-5e85-4239-a42f-f6e79471486b@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 14:39:59 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: cmnpll: Account for reference clock
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
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
 <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
 <0ff8041a-c876-419e-8f18-7656e29549a3@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <0ff8041a-c876-419e-8f18-7656e29549a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f5147 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gXB5q8Ckh0hzcATURawA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: dS4EW4sq7UhH7eZqAtn091IVX7soXj-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MSBTYWx0ZWRfXyOOjJzxksJV9
 mONtVX5Uvq8TeM7AkdNndYDUB8bjoxgtU37gaXnGq20yJfYZeW9w1XTHya3p/qNKKEYv0p/zt/B
 uhmhgL2Chu/CjVNMH6vnWai0G88fn6TrhWuuz3bdsWsbC24tOjUJokNt5knO9HsXg4YEscvamBS
 rJ+3ICSoAGMRTSreZ5PY7dgQ6E0halJStQmUBXC2PRwofqyY978i5Wn16nMdcVEtfsQwEARpFTD
 WTjtYOr8pycXoVaDlQnSnkoDJUb+0yfoIAu9I8TAQop/87Nw4CgGoVVUyLKjQATpizwlF5C/cjt
 pPKYn/EBzyLFjbV5mWYE2vooejr8O2pg0QyPyza5EJFb8aGOdBALzGFEPpDdHQCSv/FejbB54+e
 uXiUpaVKL0aZJPoEQFSV1nQKs/TVFRBqUEU+1yDTicDIyXmLDzIjmoRlnszRq9GUy/QCrFWoZNx
 CwfKeLpoJ0eR8smZZKA==
X-Proofpoint-GUID: dS4EW4sq7UhH7eZqAtn091IVX7soXj-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080041



On 1/7/2026 8:16 PM, Konrad Dybcio wrote:
> On 1/7/26 6:35 AM, Luo Jie wrote:
>> The clk_cmn_pll_recalc_rate() function must account for the reference clock
>> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
>> with a reference divider other than 1 calculate incorrect CMN PLL rates.
>> For example, on IPQ5332 where the reference divider is 2, the computed rate
>> becomes twice the actual output.
>>
>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>> rate = (parent_rate / ref_div) * 2 * factor.
>>
>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>> IPQ5424, IPQ5018) that use ref_div = 1.
>>
>> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index dafbf5732048..369798d1ce42 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
>> @@ -185,7 +185,7 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>>  					     unsigned long parent_rate)
>>  {
>>  	struct clk_cmn_pll *cmn_pll = to_clk_cmn_pll(hw);
>> -	u32 val, factor;
>> +	u32 val, factor, ref_div;
>>  
>>  	/*
>>  	 * The value of CMN_PLL_DIVIDER_CTRL_FACTOR is automatically adjusted
>> @@ -193,8 +193,15 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>>  	 */
>>  	regmap_read(cmn_pll->regmap, CMN_PLL_DIVIDER_CTRL, &val);
>>  	factor = FIELD_GET(CMN_PLL_DIVIDER_CTRL_FACTOR, val);
>> +	if (WARN_ON(factor == 0))
>> +		factor = 1;
> 
> FWIW the docs tell me the value of this field is '192' on IPQ5332..
> 
> Konrad

Although the register description lists the default value as 192, the
actual runtime value is 125 on IPQ5332, as shown in the dump below.

# devmem 0x9B794
0x00006C7D

# cat /sys/kernel/debug/clk/clk_summary | grep cmn_pll -B 2
 xo-clk                              1       1        0        48000000
  0          0     50000      Y   deviceless
no_connection_id
    ref-48mhz-clk                    2       2        0        48000000
  0          0     50000      Y      deviceless
no_connection_id
       cmn_pll                       3       3        0
6000000000  0          0     50000      Y         deviceless
         no_connection_id



