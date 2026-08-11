Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDC4343899
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456013; cv=none; b=j1K/Orz7LFL2GjiR3G3U2OyyvmwerqWuAw/5ISYIjwjYoO1HKnrJRFsFFwqHap0RM29P5g8Qfoz4enCZv+/3GGjj5MH6OSFEvZfphHZs9e8qJHb4mEPsVyeXj+yoXC/+aDRexoRdcQ9SB/fMmbWCpuUaG7AvGNlFpZMZskwIrXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456013; c=relaxed/simple;
	bh=A+TdaNxIQHsJi7yDyXvIVvCIP0DOzQ6ctle93iVJLqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVqnFDi07ohbrbfhtybXTBn1tfinJqta5pWX+6wEmNjI1wygFUiQO6O/Isb8e1Bdll0wi5ybKrubumXUvoUFnSOzZM+N77s4bXzkBcPY2qc8iIyHqPihMB1dSF//rUZPA0CKCqN9aL5fM8ZK4zxzm3aygJN1lm1+RRCIiOI04g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fnmPpmrU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkVGOhP5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fnmPpmrU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkVGOhP5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX2fd3719136
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 13:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tlBc6x2PUN2od58qPPCwYh1DXqez5MyGjErfK9LqzSk=; b=fnmPpmrUXFVDkgrO
	aXrRwykTwtKjon/SPyRP5rGFVaSzSz7eoSNoNEVKGKy2IBp1iN/YytZErnH/9xa4
	cZlBybASx2DMRtYkvPmFLs7jkE/9PzjSu3vBfQNwVa05BI7Qkk9vfplzCncXlxr2
	Xw+5XFkDi54/xYeFQYRc1TFWdAwd0ZnqdHl2ztvsxn6o55HSAG73bzrWUDUUqJhE
	mV+/T9bLTPu1QThVu3WNcMy5MCUwqTJuCJ/xEsoTumLOMrYFF4+N/st46j9y99Tw
	zFpspr7IYkBIINWJVaN/mZSUtU5c5Gbf1tmP7aTVlsbd2Vvg7PtXjiLAdPypkQPy
	wSMvvQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwesgxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 13:46:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so16927905ad.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 06:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786456001; x=1787060801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlBc6x2PUN2od58qPPCwYh1DXqez5MyGjErfK9LqzSk=;
        b=DkVGOhP5yY4bVZ0t2qySVdmrJHNkm8oI2F2US68SiTX3wEdYpYB2Kv1cvy3LNJevzW
         NUhoZ+NCr83tyJ5Zlr7j1aEJXLFEVVxgm2NLzA3EGrPYWfAXUmqLa6vs4Qdh85rhaKLu
         G728xtI4toJGNagULj3C2BiM1rLdjNFEBRv3/I6J/QYzJQ/hcmjGtcMp1j0aAQep0/2Q
         vi7nCtmj5AYtzy5UQyAH6AVycRBcJZjRikmvkpa7iEmcO+olYFEmpN315BosbWzY6hKd
         X5436BH4cDQSS3U855CpK6N4VjhFgOyRuEbdEuunmbBMN5gbWD3wbbHr+8wW0cR/gDH/
         NENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786456001; x=1787060801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlBc6x2PUN2od58qPPCwYh1DXqez5MyGjErfK9LqzSk=;
        b=fyJ7XOaFXzQvVAz8kZ9PM0LV3ZWXPGrafDEnF45llOuB4IzRXB1OH4PTLKNfpIIevd
         n7IPuhzCZ1+t2/YK8STdUYDYY/qCOS/aURIGTmsHuGfK/MqEsMUfsYwuuBKockPptgtA
         vLH6o6GfiKvnEAAAwLChOue3LcipaCglSvh4xMapnkt70Et6fqyAXLY4z1y1bhwp+ztP
         b2qH7u99MVpgACoys+GXuHQpneIqJ7VYyN/p5T/NBqduG1P9rG4GIQBvo2oh3j7nx12q
         KSAPWnjQPvccKI5MxJsHCRZWWlu705LXf5Bjtv9mRlVxHUAiWpYklfxyXVHGGIE9A6LL
         FpnA==
X-Forwarded-Encrypted: i=1; AHgh+RqqloXKZHrYNve4eHGIWR9L0SxUfM49O85A2d3y63yO69cEJSrDyd9BNpKkC5pckX6mY0hwm3l0rcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUv3SnvAUcxuhiUf+zV8pH47RYXFFQIN4KxefKvLWsInCpiCq
	OUb0DbVl/LrVEHs+Jaw01PFRMMN9QddfjjY20aNWh1Rz7TV1/0aqDojd173pecnrcweeR9fZG/R
	xa52WSdBuRSYCfWl0NM4pG7ixdqBrLLsKGS+bwxSil3Vd4Ncoanx16daR8HN/Pdo=
X-Gm-Gg: AR+sD11eph9BvH/qZnEZm2bgh0pz1YEYH83SeojN9oVrrWE3IEgO8PCDp5ruW5tSMkT
	kfDJrq5JhYDwwdoqGaEoExU979D4bdYg4mEEApLddSRHLMRtcEtECzbkwnTRUcslxCGTRoz/VeZ
	wEbLwn4XT7qTF4GNea63j7yxxFqfr4D5VlEMKnr9SzKDYKbqMTNlq5CHj6ItketJvSKLuAkkZL5
	wVrHjLwikkB9pnAZMbhjx/DkUshVDoyEIv1Hz+8p1sXcsMQJK9AvneRDmxZlqaZw84Dhh/2AaAB
	2C2U0I1dW6DSAaP0DePJEGl/PTmqKIOyD0JQs63aeODTuYFmVsqJpdSmxMQhiKLX48wEcaGrN0W
	4xcopuNMph8DMIO/Q+WFhzKE0oBsj6whaZLKwMZNf8X1+GN1rmEN3UUPtn31YAD5f
X-Received: by 2002:a17:903:38c4:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d32d7ed3camr3566155ad.6.1786456000849;
        Tue, 11 Aug 2026 06:46:40 -0700 (PDT)
X-Received: by 2002:a17:903:38c4:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d32d7ed3camr3565535ad.6.1786456000422;
        Tue, 11 Aug 2026 06:46:40 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160cf975sm8661755ad.48.2026.08.11.06.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 06:46:39 -0700 (PDT)
Message-ID: <c31d0784-d6cf-445c-a5a0-48abda4e8d4a@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:46:32 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] clk: divider: Introduce
 CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag
To: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
 <anoHx6sbVKn0GVlk@redhat.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <anoHx6sbVKn0GVlk@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BDqy9a3wIetPNacG7Qb2c8nXyeUcAVpi
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b27c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GdO5tOYlwfJohlWCAMYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: BDqy9a3wIetPNacG7Qb2c8nXyeUcAVpi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNSBTYWx0ZWRfX6fJAYsO79YMy
 yVBPiWXXcnpMiPBIoGqFj3snbdBB1gmCoKVitHpEEeYn2Kxcrt61o9wAANOtnSxYAawIahKXj9H
 KYGEvdAbcuUgPKInNw9dPZy1XOHDtpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNSBTYWx0ZWRfX/NDjM/necQnO
 DIL3Rc8gSXr4rggxypGuorkY2+01U1asF5/fRGGo7EEPy86QHl0ozSpvev5eoBe1KamdYpnKnPH
 iRfjNl9MGaY1NPJOMd+5J/9AD4Iw3aDSVev7OHwUjmugXXG6vFn9QD0scCCsEGMLpqYY4vJl9TL
 iBZo8sy9iKQOCWlno8pwKLfK2YPQjaaEBbKpFPY8L0hJ1QVCCuAaoKySLfQ9uf64bzLJ7F3yqPb
 emtg895kLCYz58A+PWynVSby/2xBydsJxJVl5hZDz7Ke+YFPyt9nT74vyZtv87qF5p/YOVWyskx
 xY+LMBALXO9i2Gw9E3AFH42NkDtwzChSjqvzYWeobDtYZTMVNc9OBDtkWtt8kKfsy2sNvDchX1r
 MgELGC3ob1qXeQwKOvDWx75IqSN/ko3+H4OikS6v27n6J9sOGizr9mG03+TdOKqA2rET421sEJO
 gARX9Tqm4AYhs2O3+cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110115



On 8/11/2026 1:17 AM, Brian Masney wrote:
> Hi Luo,
> 
> On Thu, Aug 06, 2026 at 11:53:07PM -0700, Luo Jie wrote:
>> Some hardware dividers derive an even divisor directly from the raw
>> register value, i.e. divisor = 2 * val, with no +1 offset. This differs
>> from CLK_DIVIDER_EVEN_INTEGERS, which is one-based (divisor = 2 *
>> (val + 1)).
>>
>> Add CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET for this variant, updating
>> _get_maxdiv()/_get_div()/_get_val() accordingly. _is_valid_div() is
>> extended to also reject odd divisors, since _get_val()'s `div >> 1`
>> would otherwise silently decode them to the wrong even value (e.g. 3
>> -> 1 -> 2).
>>
>> To avoid regressing rate requests that previously computed an odd
>> divisor (which used to succeed with a silently wrong rate), round to
>> the nearest even divisor in _div_round_up(), _div_round_closest(), and
>> _next_div(), mirroring how CLK_DIVIDER_POWER_OF_TWO already rounds to
>> the nearest power of two.
>>
>> Also guard divider_ro_determine_rate() against a zero divisor, which
>> can occur from an unprogrammed/reset register, the same way
>> divider_recalc_rate() already does: WARN unless CLK_DIVIDER_ALLOW_ZERO
>> is set, and return -EINVAL.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> One of the other patches in your series says:
> 
>     The NSS (network subsystem) clock is derived from the CMN PLL output
>     divided by 2 and then further divided by a configurable 6-bit divider.
> 
> Can you register a fixed-factor-clock parent with /2, then use
> CLK_DIVIDER_ONE_BASED? That should yield the same results and it may
> more accurately represent the hardware as well.
> 
> Brian
> 

Thanks for the suggestion. I will model this by registering a fixed-
factor clock with a /2 factor and using CLK_DIVIDER_ONE_BASED for the
subsequent 6-bit divider. This will preserve the current frequency
calculation while making the clock topology more accurately reflect the
hardware implementation.


