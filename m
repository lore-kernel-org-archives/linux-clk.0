Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430FC387375
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 10:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559186; cv=none; b=H3Oo4kwIaEX9w+yYCscF/A+SS7AxLUH6qFvvInZnxqKXjXCV1+Qs3NBzt+nxulS45r/NhcxaLi5Cq0euZ3Vv+Q2dXhjOHV4VFsfx+qtn4oLpA8BP1mTLhuZnFIcLt3aasYS3GKOSf3WV7M96MiYjwS/4gieNspFHH1pE7VUBMUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559186; c=relaxed/simple;
	bh=xcB2xmkHlMV1N9Ao/n8GQdA51Ud5IsVdlavbUHT6B/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfrjdOCbk5rZwkZyNR6p0WalZeU4ontO07BIZ8tCQsd9xcZgUYeTBGkt2dRCrSvIZ7NlcTisvtHz+OWHwNNmg5Ck/PzFxEC2jsMg6gC3qs0hChVGyndN4FUpC25q1JW37HyleUk/EPMTEIDB566mHd2srLv2ngygoK5mcM2YEyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhtOCiXX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVX10z5s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhtOCiXX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVX10z5s"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376q71O3536836
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 10:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmuLekzjMrMpqQXJTjI32akyJdq3IiX4apD1nSOmmhA=; b=IhtOCiXXuRFV3BTh
	/E5Ljcgmqk4s9Sq5Ia3ktD+2S9Gok1QZwgbrw9ws2qXZfFTRvHugLhibHJHrl+GJ
	U/fI0CNXvDGk2dep5SoSXjYzjCQW1TboC/Ei441BdGPzTSxqe0Z7UhazeDt02Z45
	9dbHQiikKBfgLio+xzfTtksHqIHqq5u9vZYt1amfuezygxzg7tR/xX9l1zvUtAlT
	NSr9vMUCwo0uEvvoubVlDIf4qULgcmJrsxE8hs4ulQeCj23xuZ26fquZrklDhhU/
	fo0q7anWi/3jGm+/1NWR8yqE+LpGIiz+fucgY8zTWSwjZ98GPb54vuqY8E8GneCB
	gEsbfg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2cke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 10:53:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89f59c9bd28so15381026d6.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 03:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559183; x=1776163983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmuLekzjMrMpqQXJTjI32akyJdq3IiX4apD1nSOmmhA=;
        b=cVX10z5sZscDidq5oSJhTwhzgDwR33FyCer62m6jA5jt8F/TsOjYUrc8isE6pZwPpu
         322uqp1GTtjiy33Ok2A//VeBGFqsYjwPkn8PGERY+WrjfRJ0DfISs+n30ACxqyu4R7wz
         hkjMuYzgjtNBI+1IgRp5/GokNjVUELncM7F5VGqVy2/lDlSck/ZVxrHf/yAEpeiVFNFq
         EjPezUGTooaY1Cad/kTP8MXgCZC7plwM2CIugQJJfxW2Vz9n3+5/f7upH16wDIDfNmtT
         /291ZNDL7hsEgJODfz8SmEGzy161qEsdOGw8wUv7INLOyplmivpufObydyID2WSvLyRJ
         t7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559183; x=1776163983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmuLekzjMrMpqQXJTjI32akyJdq3IiX4apD1nSOmmhA=;
        b=B+SePO309io/7phzifiBeIHpGRwF3Tm05XMehjdJIFXkjHfggHVs7C72NOTwUJeMBx
         uNRVsQPrYSfC4LwFkqrQn0D6c3f0mpELQ3YWKfeGBiihhI8SB2+fB8KhjVuuwjpSLlsk
         IU5Iyli7pf7Jwe73xFyNyZ5NEgXe1CoJOWGypGmuJZCVMngW60lRz9JI1rjdyQFOPLJE
         JEgC8YhsH8HJo44epaQEjjNFvCjkm2IyJa7pQVgYkTpRWGraj6MqkNx1J3SbVcGoaGDi
         zAJCHJafJJXVinjwkF1JGH6PHllrjevppMtRkHdEpPNsKbXYXkRJUWLg0d2BjrNECatu
         9u8w==
X-Forwarded-Encrypted: i=1; AJvYcCUs21oY8Q0TNafelqLYoD8BwNjtbtBkx6PsDUZw3cTssvfBPE5KMAPuu9Ok2AU5ddSre04CG8ZRNqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhnDgM53YhPgOWFt/T9xfaLO2qyv5pN8tu3PHA1rfJGcfiHDMn
	wHgOoeaD8ULfZrlV7pmdX4ffr/LOWXI/RupZuZCJRf8WPRG+10fbtZ7B/OCObK4922c5Ydh2tJl
	ETWmF84Nwwdk+Ch9H4DdeCYzO7dFGmmp5V6pUKg6hhMUZ19mxLgRClH3XuQDB07o=
X-Gm-Gg: AeBDietGHex3U8vCk03yYZSXI6/p/eMJjpH8gyNw+/mkKUEef2KY/LZjKm472Fw4oL0
	wWkoS/n22EVHaPywy6nBxZXsRx+U97KBw2q1z6RDBjVrFInMNUHt2n//HUU13qfTe1eYXFgDGJk
	n4ltCIwaT+C5Im3dAdR+lXx4pPfa0S2Ce/yCvVvbEULwMhN4cCZPezDGTD/aoX1xAY61TUjhcR6
	IsOf195FjNEQYdAcuLsOqwuOl6vFgLJwpcoPqxxwyb7PskB1t2E/ts3dqgMW4ZSgPBsRgHVVa2Z
	+UZUMYWBbVwLvj/ALl911QXjTQ6+ijQI2MxfXUzR0gGN/qmgVU0LUygLvyyR4AvzbzW/poS1n4b
	7U6nKFyKn+horMX18/b9IuyuPsx6Se+zSLeRZLoKgv8PnGzia7w4/XSdvr62UBeOb2Vs+GhUsv6
	M6tPI=
X-Received: by 2002:a05:6214:d42:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-8a705489deamr191516146d6.8.1775559183456;
        Tue, 07 Apr 2026 03:53:03 -0700 (PDT)
X-Received: by 2002:a05:6214:d42:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-8a705489deamr191515916d6.8.1775559183069;
        Tue, 07 Apr 2026 03:53:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff1c3dsm540062966b.49.2026.04.07.03.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:53:02 -0700 (PDT)
Message-ID: <6550e862-590d-4b34-a12d-da3a6b285c5e@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:52:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: clk-rcg2: use 64-bit arithmetic in
 set_duty_cycle()
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
 <20260406-clk-qcom-gpclk-fixes-v1-2-7a14fe64552d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-2-7a14fe64552d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: h9yYDlV0y0qAKifRwuCKZUk92Fmlj-6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMSBTYWx0ZWRfX2gU4BG/QIw6Z
 9jTj9r2ESx30XBqma1nfAdEYWdSPOgOz/VcsCbLka0CjnNJPFyXKivoG4hg7ib9b9UKVjKy3ud4
 BXhTHsU51YAqALV5376EIcDYBTA6NIB7Cnb9viXnllArDjwNquLlPicMkBAGsckXiSf383mbBp+
 h0uDK+m5HNa1ndLrUkrAMsMQcw+S9aJqaXweUwbf6hpmgLfDwSnA4oaF/HdZHaz8tUaf3kSyXa+
 T4HRgYg23UbPACmpOgsJ0gIxBohL1OGbdaD1kh7MzT+LlhQ8t1ek9VuR8LIKCwAw9kEfIVAbbvH
 nDsJIT4DISQGdIzX+EzkVHhXFHtZGVsABr7KX8OJZTrAJ1QWso5SRNrhTytNjPSXR97T+idHSse
 QdO2Pa1nf/zVVoC/agoQkzsk8MH22Zkt/z3fHySkDBALyeVlQU0T1hYaVxkyuRWFNfm/WWQLY46
 wSxqggMeuPsHjVB5R9g==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4e210 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=YQxt2tlkmv6-1s3Hh8wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: h9yYDlV0y0qAKifRwuCKZUk92Fmlj-6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070101

On 4/6/26 5:54 PM, Xilin Wu wrote:
> The duty cycle calculation in clk_rcg2_set_duty_cycle() computes
> "n * duty->num * 2" using u32 arithmetic. When n is large and
> duty->num is also large, the intermediate result overflows u32.
> 
> For example, requesting 50% duty on a 1 kHz output derived from a
> 19.2 MHz parent gives n=19200, duty->num=500000, duty->den=1000000:
> 
>   19200 * 500000 * 2 = 19,200,000,000 > U32_MAX (4,294,967,295)
> 
> The truncated result produces a completely wrong duty cycle (5.26%
> instead of the requested 50%).
> 
> Use DIV_ROUND_CLOSEST_ULL() with an explicit (u64) cast to prevent
> the overflow.
> 
> Fixes: 7f891faf596e ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

I hate that we're still hitting this class of bugs in 2026

>  drivers/clk/qcom/clk-rcg2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 82ee7ca1703a..0e8f0473897e 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -783,7 +783,7 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>  	n = (~(notn_m) + m) & mask;
>  
>  	/* Calculate 2d value */
> -	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
> +	d = DIV_ROUND_CLOSEST_ULL((u64)n * duty->num * 2, duty->den);

This may look scary given we feed it back into a u32 again, but given the
CCF has a check that ensures 0 < duty <= 100% and I think n is generally
< 16b wide, this should indeed never overflow

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
