Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703522D8385
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286773; cv=none; b=pzPww+sy++QxkgBT0EiyYJ4zLt7RuHQjmiUPSqjBFwOxEsNa4u+E4twlzTiaBe9Bjw0yuH0IC1YEsgrZAMWZ0ptcfmuIUprnlLrLvrNxmYDt7eqpmnBo6wglJxeomljGYqg3an+lPIkFbvLeT3Od6oS0cXJdToGRFk5atZLd3ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286773; c=relaxed/simple;
	bh=jJ9YG2tB1GQah48jOchhDBoZwkGDBycXPbvfGVlIL4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OjvsKm6EuPvem3XKyd3fuIGgpIY9I1YdM2ULJ2oTQ7Eza7kBWSZhMNlUU9jHwcBBHzwE2NFf4LnVqTrGNqgXbRdpg2KP78lvjVQ91UAvBAk2MEDEKqYLwJqMwKdkpTgcDHAwltTpnMW5X8tgYWYjHho86k6XA1Z0DDZgHLtKz3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERDeY80/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmuSb19y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERDeY80/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmuSb19y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tqDp1972112
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 07:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBY28EHIgWlqZkL2cdIhQQofqRyA4PuEZ3MPh7m5b74=; b=ERDeY80/dGKOTaIa
	HxwnKaAN4KUN10EXybqJOY7kI/hV9NNdJoNHOzxE2fNnPz4HnmVLTKyVGbwmviUa
	iJfg+cPJFLAt1t8k4tQIbcixBRmmB4bHEVKWxoGS6HAbZv163Zax6OYqYOmwJ2+K
	HBXwUXgdEjJlbzl+SdO6qdPWGQfO/dKyd5TADUzApG1A8cUhDm6Kh7LNQZ03M8lF
	NgdOcmceiclG4ejYeBtADRzyENFKosq7VubuCjMyNCzdVoVlVLoPUgme3TjA0ZQt
	+xwehtNajWTMwj8r7zIE4aK+ZtgcuSOgBrIU6HReK8bZfDNJ/P4uy6yJHSaurawv
	AJuc2w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00ev9yrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 07:39:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dc4536d42cso2425146d6.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 00:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782286770; x=1782891570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBY28EHIgWlqZkL2cdIhQQofqRyA4PuEZ3MPh7m5b74=;
        b=RmuSb19ygR/lDH2EyG4OMUHuqCtxcD0W/abrpybHpZ7TL5ivVays2Fq8rWLmd4u7jB
         I6ar6gHW5+nq6tASrO1wQTKxDAhlFAUo+brbMkGsYNHzeFvxMxSVE8eNOxEOXANqVpyd
         QeW/ypFuF9oXs8dWRz7zjMQw+LyC6J6ZL/mDOKpKdCGXNXUHGlYsFJy+MyyVHJA/6SOR
         JdkaSsc0+PWuZlVvk+kk2o/9sLZfmhjNn9Wv7zsdC/QW+JirOgm1iF4FQBw7Fdk1/i+E
         mvzL97GYMfQ7UnlWv3wRJZ8Pls0KggCQIFptXQYzivWmrs8dmot5cLZ6PZZD/LRHEKRI
         rDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286770; x=1782891570;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBY28EHIgWlqZkL2cdIhQQofqRyA4PuEZ3MPh7m5b74=;
        b=CMTVyl475zQd7ngAvB3jiZ7r/e+OopPXbT9ISnp/6Hp95F91qPC8gLapbbdMh9DAvQ
         SBAewX7I77uFN4iNKYmP4hgUxBtoQyp89b8RjXSD/izbdUSKwEjAqn+TToJYu+MIRO6D
         kA1JSlvonCtAhvEl4CbHGvFcwivlhJORG9p5OKS6XD7GEu8X9Ng4UIR9hF25np1DRC5I
         eqs/ykD2jvWiPTg3Kr7ILapy4YhMzkYbH56ItyqEZ2fgY2V8iETna4JMrZu8DX6OPNqC
         3+MyIFreJQN3+zxVkwLGdclKYtDnQ8leRIFShVyfiDNw5dvBW0aV+F6zuNtE8Ya3mzeG
         9tEA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZZDBwz2vO/p7uiW7mnPYfuM3TgXxw9pfeu+P5zxVAb74FMmI/Py/ASj5zmcE3M2t8uFTABB+oJRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3VhJhPnu2ZhWXQS9Udo1mEKwylXJ0TVRE49ddq1R9EG5lx31Q
	3dq+pXSDemwy2ZiRoM/+4GhIo4M+wx1+oxaMP10JRwi2caH/pejf60nA39IGITJq4j5v647gOzX
	XcnZeAh/gQfFR0MoK6geD82CNvwaX5crfRc+AWXQ3VCT/NHglJ56SXozOKeHN4jE=
X-Gm-Gg: AfdE7clk314KUt9neGs2XaTPANmHB4R7RG7XBbTn9olciGa0cnUQT0BILoOLhjW6P9c
	8hl0NRjhIGJvofwaI0jmUD7CmBiKJHTgRCXrUNqPqkuJ3LQqM8BrzcdDL12kZ//gkQAksd/yv2f
	ewLsLB0tHI5r36bl2OdCvjV/DCMrHV9TI2LutQLR/qZMN/ASiaHeHb+UAGA8MlWOi1KEOgk/RwI
	7LFC1mgRi61/AkPGc8PFsPkWiOY6UNfX6JFstZx4BE/Pteg1SpBjWgI/Vzabb8LMMBxcHjdFTOe
	UeICD/YCaOLTaHn+rf/1JWlYAZhUuCd2oLX5aq3FZA+RL2WQ8gNd36mSOVo4p8nXeRdSJ7awDUZ
	XsItq/RUTwbaGJfPYNB/Fun1/RLm05SghZu4=
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1904888285a.0.1782286769876;
        Wed, 24 Jun 2026 00:39:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1904885685a.0.1782286769459;
        Wed, 24 Jun 2026 00:39:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99bd0bsm617009366b.23.2026.06.24.00.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:39:28 -0700 (PDT)
Message-ID: <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:39:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MiBTYWx0ZWRfX1pq4PLAkkng5
 rUgV+IUH7d3Y3CM5HPaKFCSJFFnTLbnYBkD7ZRjotKXA9dZhti/V58Ky/Wv1hL0qJFC1oM768n5
 VQgqLPjjKzSZGwIFM1C+xbcjkw7lX7s=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3b89b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zM5_-Fq6ha1Ldok9JJkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MiBTYWx0ZWRfX4agZgPvkJnTS
 IiYr3XSHzfueS/6sQ97VW/CdG09AWTsBe8/w3TGsZug477N+zMgxzIK5JGlihScgkh2c+SucK86
 8bEqaohcfT5+yEG3vMeBDgZpajdDj/8jDF7GQ4I7LdZptwCuvjeYoANQ71ODLlaHdwvduhfsJFJ
 CMEe88moBkQkESu4rD4CdUCpNWbtX4PTPreSv4lj7PeptoIRF+XpQw3MGaI1jSkvrohmXtBuxVc
 iRbNfz7ibsIFPdxjPv1HWn+bAk0+jBhby2Qt77XG1AW1lLIMVV9vHb5qd3/VLIG6MW9XafyyE/W
 vomUu41nGB5mWrKEvEJafzZW//eeCiqnXqOXP5tga68fBxvNV+Yh9dyNr5lcS936INTE9qgWUAo
 zTsjWH//2QDOFXjpY5g0ZMxHsG3G5Q==
X-Proofpoint-ORIG-GUID: 19Y5IU1t3rI6MDzz0oD0vB8nnuji-YQt
X-Proofpoint-GUID: 19Y5IU1t3rI6MDzz0oD0vB8nnuji-YQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240062

On 6/24/26 3:57 AM, Antony Kurniawan Soemardi wrote:
> On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
>> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>>> The HFPLL enable helper waits for the lock bit but ignores the
>>> regmap_read_poll_timeout() result. The polling condition is also
>>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>>> as the locked state.
>>>
>>> Wait for the lock bit to become set, return timeout errors from the
>>> helper, and propagate those errors through clk_hfpll_enable() and
>>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>>
>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>> ---
>>
>> This looks good on the surface..
>>
>> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
>>
>> Konrad
> 
> Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
> Krait era, is that correct?

Seems that way - cpu, L2, and GPU, maybe others

> I could try this over the weekend on top of Rudraksha Gupta's cpufreq
> patch for msm8960 [1]. We don't have a gpu patch for msm8960 on LKML
> yet...

That's fine

> (also my name doesn't have an "h" :D )

My mistake!

Konrad

> 
> [1] https://lore.kernel.org/all/20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com/
> 
