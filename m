Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954C2E6CDF
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788212; cv=none; b=N/Is3P1bCvETggbbXrod1NN9+VQlFgtQjt8oRgLGA3FI9e59DzKIGPdU5ujXJOZRuQI/8bGxMewgn2Rd7S97UERYymPvuN4HnI9m1lt0Tiebw8frX2MRKbJh0jRFEZ/jrtnByByK9JL92Rmdo9GIPmUdhQBHs+DqC41zJNUEDKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788212; c=relaxed/simple;
	bh=NjGfYThFux0yY5RSyrwt2i1Ek9JVno/OrKe540SAtak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoB4paT2ThR2fa+Lg3o3KrHDEdeveFG3so5AEuhI2HwkIf+ybVdnbMu6vIoLX0Wk9s6taDllgN6Wl0hYVv600zpEC/iOCmoZ5hahSJAl/S62wHc/UZUAjKmiPkBTDG0p0T4y4BVDURh9DAH7nZEJxttXqdOjFg3gEEl/rw6EYpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3J7M3bp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcUnomYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3J7M3bp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcUnomYV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60791Z7N1979627
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 12:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d55j32hYpW4S+x8R8th4vTayuLxbVkuWG4hN8s1Dfnc=; b=h3J7M3bpOCEvKjJ5
	hwjNb274pY01CAOLPg8h63hhH76T28kFq22c/sYwHaX7Ub2MdTpFWgrSeo7EEy+h
	pneR5DQjWm0a+k50A0w/84IvFi4qvbMTz7wYGvaI7L7Y8MxLV+oO/Cn4xtgtazRc
	F96V3/U+nJqO4gsHMudnhvbG/Yla3MT0xU4yPEEai7zE4NfMsWSd5aFGqPrCQbN1
	3G6UTCaSOWbuAHv+aTki5V9cqwsOMj4Oec8WabXmPIQ4vCpf6HhRZhnBUvAfJtuV
	JYa2pZ1f9AhRZYZLs4gF62U7qXzbZdmsJgs5tqhdApb/O4s10PVsa8GoRovXQiBC
	FJrQBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavj0ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 12:16:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f357ab5757so6526201cf.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 04:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767788210; x=1768393010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d55j32hYpW4S+x8R8th4vTayuLxbVkuWG4hN8s1Dfnc=;
        b=XcUnomYVJP2/neV3PwGde3mUPOP17d3a/RbblG1hf32HOLoqrvBq2X8ww28g8BHLsY
         VyYJ/VyNc+yxdUB+jxpwd1qn5yYBZDmug0HXXdvb6OaQlq8OEWiJfwtoC/Wj2dvsUZDN
         JynnD/Kab7TUBLd3zC39QuyQvteHyiG5HzPQ9eJUWs+9lltT9Nj6lqgavbwEqxpYeV3F
         iw9pCFo26hR83WKKpo/iLUITcOH4pnbd3t0czyvuGQ13zLSbcqIiU7i0htLR0BiOmzC6
         7m5LxIOONnYItvAXs7BUelI01ppVety19uyieLwXGzKCOjh60h6m8we25puaDrPaHhSs
         +gWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788210; x=1768393010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d55j32hYpW4S+x8R8th4vTayuLxbVkuWG4hN8s1Dfnc=;
        b=ajVySVxJCz4oPXuF5d0rR/c8B28zvgc9jT0lvf7tQJ8QIcZ/o7uU873g+9aFWMZ8TS
         DHroG0F407ZXnFK/BGbSRttD/H6Gy4i6jBDyaYyv+AwJcoXKCAI52CbsjlZcSjGcOpmH
         9xKMB45Kk2YzEPM7HMo5mHi8CSqc2hGmpvgReUEkPBjy6I651SCjd4BlWtUsxPWOBOj8
         zZkNV9f6/9jdlFcdxitFHxHpW4J1xOrUUNcP3KA8fb1nc0uBikR3QN447dd1rNM1rosC
         xPwlRSgpMZWeMqa/WIkQdbyQlIjQ4rs7MtOsxc2fogFmqOWRwY/jnwRdoNwFzmv5MCUd
         i9rA==
X-Forwarded-Encrypted: i=1; AJvYcCXXjIPf2JXnDr2zfDPAvnUT1U/Z6N7piLNTvxPiuxDjfWULYp4vk5hNHwswzfOg/uGDYCBATITn9JM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX3qbCdAfcQbejFELBpykhJ1jOVD/gMnpQ7TWy75gptq/W3IRM
	t5TkStNXeZsAgVM/IRQ23/lA/oYS0aVF7u15vjLS/kPFyWu1aCTCpGX76S9KpECgNsYyIbBpUXt
	wySENgNEyrnzaYFYSaYNC3tydapuIed4UIvOGQmFrVlE4WY3ht0wTW94FJ992GIY=
X-Gm-Gg: AY/fxX7LrhSUzxrxM6anZn+hnOd61p7oTVwcaLYNOksO37LFUXkeX2EIoxOit9Kob2X
	w0iYBe7ypTvbj+ZXN0DtYDarDdfmbgB3I3Uz6JHVOuhVMSqHbN4X+oG87iRAj8JAYVcZ1m8CS7k
	8lWvShitL8W9BOgPaviBKM0laXnZ9viW4TYOQT4JDdHuInpTGQKR0k+leJ+xcwDiioT/TNVUhDH
	YZ3yzAkT5tKBsqVM58lMQi/B8niZXOnM4/oWcPf0gtqzyXJ9KFKwaxPPgiA3Lfq7Qj2tTvuOdrV
	s6B6dRowDvBJhhKa01+RTWJrYbwcOjqMed1wCnN5R/n2DtkK5puVa4qSMINoSjIuxt4P8H1qR2L
	O5yZIW4EdjpR3fBQbncsKi5M5EU7XeppuLg91Hph+8gXBncmNsrsXFyrqX9z7lJksp0A=
X-Received: by 2002:a05:622a:1347:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4ffb49a02a0mr21372291cf.7.1767788209644;
        Wed, 07 Jan 2026 04:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUS4ix100WivikbOS3qGiN8osG7zEalwH/GRaCRfETPDly8syMlLkh+ICwAI7jDOvlay399w==
X-Received: by 2002:a05:622a:1347:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4ffb49a02a0mr21371921cf.7.1767788209114;
        Wed, 07 Jan 2026 04:16:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511551sm486275966b.53.2026.01.07.04.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:16:48 -0800 (PST)
Message-ID: <0ff8041a-c876-419e-8f18-7656e29549a3@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:16:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
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
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
 <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NSBTYWx0ZWRfX+Donl6kiAqz8
 zkOBU7XRghxQ+0bhiTTvzB/326yjYfwUxqtJDpGdmIS4D8ggdpsjZncto5HZrj5MOcymj3+CWe+
 ftBaIzuL13jN3fntPqPFknNwPBm7RqmU2cWcprU5J48tcPS21+n8u9AJUTdLXx/g2yEz3LglGUi
 1YDhuiQ8Rd4oB4/8RN9T328VbI3zqVAvKF8JBFCLQzEkTQ2S50teADY14rYYbpKaV5t2Gp7b+N+
 JPgRT4wZ65//JoCcGWVq2B0GvDQkDcqb5rfpXzkne6dpW0e8WusblnpUupWFKT3kfeu3SbIsDPU
 jzvhvQm6JzuqIQZO/XH0XiORLJbf7T6qXXpCyMrhM2KfWs29cK5OMEwIc6HQiG7zFz/GmG62p57
 Pe2CUOXAxJAvAfxmC+FLEEDolMuMfVgdKOjYoXoX6BiEy5edbUrEzESCky8G23wiZJhTyShl+tL
 NOCcdBeSCIaxuWCMf1w==
X-Proofpoint-ORIG-GUID: Gxqj7Xe6Gc8KgHt6WAGy5qt_He2IVlri
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e4eb2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QfgEeMFAfvcTqVishicA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Gxqj7Xe6Gc8KgHt6WAGy5qt_He2IVlri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070095

On 1/7/26 6:35 AM, Luo Jie wrote:
> The clk_cmn_pll_recalc_rate() function must account for the reference clock
> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
> with a reference divider other than 1 calculate incorrect CMN PLL rates.
> For example, on IPQ5332 where the reference divider is 2, the computed rate
> becomes twice the actual output.
> 
> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
> rate = (parent_rate / ref_div) * 2 * factor.
> 
> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
> IPQ5424, IPQ5018) that use ref_div = 1.
> 
> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
> index dafbf5732048..369798d1ce42 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -185,7 +185,7 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>  					     unsigned long parent_rate)
>  {
>  	struct clk_cmn_pll *cmn_pll = to_clk_cmn_pll(hw);
> -	u32 val, factor;
> +	u32 val, factor, ref_div;
>  
>  	/*
>  	 * The value of CMN_PLL_DIVIDER_CTRL_FACTOR is automatically adjusted
> @@ -193,8 +193,15 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>  	 */
>  	regmap_read(cmn_pll->regmap, CMN_PLL_DIVIDER_CTRL, &val);
>  	factor = FIELD_GET(CMN_PLL_DIVIDER_CTRL_FACTOR, val);
> +	if (WARN_ON(factor == 0))
> +		factor = 1;

FWIW the docs tell me the value of this field is '192' on IPQ5332..

Konrad
