Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1CE3DCDBB
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176913; cv=none; b=Q3AGf0zAyS4C7rkNtmstbSc9K8rhpteTOQZZPK/d9EskWceYu30Ph4S7GAIwo83wQe+Auu1mFahBhlAhXZNOjWNjlzTIxEp7m+3lgWi8x+CsCGMEZqX9BN8knSjy1PJAamXTjeVw9Aos07ESvUqNCTUSvVvgTrbCiKQd35kcyEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176913; c=relaxed/simple;
	bh=S9LGzVX1aV8DIfzInqythzN3CdNAxnj5Oi0uk/Mrr4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3iESD5a3tR6LlRFpXx/qMxwXNXfzRIAVEPrEudsLcp0eds6Q9LXeqqm/cU4Iu8u3sbHdXSz91kI4BTQsbdRI6A0XkCk135+3PMvXgka9fjfnZ/NejvLKXnL9DddCcbvbcMnX62GPRPV3nCbNUTp3ul2GQbJiFpZbcSFs9WguBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1kk1sNQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7iz5PSV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1kk1sNQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I7iz5PSV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBBoXK2633313
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4h/bSO/ywHvkpULu8zqbn2UT6WifoipO/Bcqnz4RFQ=; b=P1kk1sNQ1Kjd16G/
	EsTz/FryVDczRexmWIYsCZFvDTV8xzXxKuijCUvH/c2tM0OwAem2iofOu2LbT6Xl
	m89a5ASsLX+bH9LMO03wejmc/NkqCX4cV14bCownHt/xnKcSUz1QhBG2q/EaAiWs
	bZOu5+k6g4pRycBJobjO4Z0tbvsWiwH4YeC7tvBqWZAy+RrSLn70zu3BMqBQhU1a
	AEmm4jJQDG3NC5vpprDtNLRtRR1HppC02uRRhDNfZ7QEJCgzHaFp0F+niI/HNjVw
	E//1EsAIzE1/ABDKO2lZobp3Q8CmvNPBSrR1BRJPprRe+50D9u4VbUITs+9qXSFR
	ug+l3Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86cb2tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:28:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60598e3f83fso319666137.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776176910; x=1776781710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4h/bSO/ywHvkpULu8zqbn2UT6WifoipO/Bcqnz4RFQ=;
        b=I7iz5PSVbwMBbC0lZbZQnyqv1cibo7bAIOD9pdpqFZqdGgx6szM04UfMjtwW/JKBfH
         sGOgs0HmhvJy5HVMfjyuy82VtRKbcMt1Y+SaYxvCTW8SygIcLODjLoH0D0iUZXTUGgTA
         Nba/51Ccmu9W7XizWvnRDn4vyMSjdfSRnlQJCFzunRLxUKUQ+MeJc+dG0NngpwfMxArU
         cYhSks/b0Av3Clk62AkfY4UJlooNYVf2QwVkcIataKp5TUtwF+/obP+p3/FXh9FfwEIr
         IrzFTSTXwr5osevAbRdykhIAc5/Ay7pJPrMqHH+pJLFVLgALVh2wr3TZrBkhU1OMbdQg
         TUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176910; x=1776781710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4h/bSO/ywHvkpULu8zqbn2UT6WifoipO/Bcqnz4RFQ=;
        b=E0fJcsl6H8sI5JUJxMOdQUSEZ3VABw77wYjpQyLh6cSEGO7JkaN7PVWvaOSPdRcnJo
         sADfT4bmqm3rizf2E+slf95xT8GyWiYj5P/dqsd/ZKFw9AetEsvLvivLoNePQzc9wg3X
         Czn92tU5ot2+6rZrWWnWtb94N04MwSLBbPAu3cGVp7LiPhIVWnunrGElZEFHiEqzuLnt
         Yt9NIqzk6JlZ8nZq/rDt7din9hVeKFKdCMkzSxTnfyaPnw/5+2i2oabpd2fEth+VQK0J
         Rp85hk3NUfO5YdA3p8X4g6eR+JRuZjVYZpghxpg/0ZEKZ9TCtCxrlevb22CY5e34c7YX
         czmg==
X-Forwarded-Encrypted: i=1; AFNElJ+eg+5YOkaRCJQpA/xjVAL0icuRerei5osWIm3LfZRyHjMX6sqy7lQvVWGj4uxwvbMgMqN8K4orM4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgqTvxkJKkaXFeH9p+JxT2BM9zxbJ/192D9Afx8cDdjZGHJHpU
	MUOElf+vp2IUjyYGWxMqzrPamROXgjqopwMrprBHCCXu6/OKYIy7bNgoFDrLK/uSwiE2VoxAc76
	ugGunXRQzlDykfc4xzjV36a3piKJW6Qnd8vvyJl9qn98NkgXw06oPM3qSz1XqAB3CTCsL5BQ=
X-Gm-Gg: AeBDiev+5ysPRf7hAu2FLz5OLApiAvTEQ/s11+ZuvHf4i0xDPKZdvdIF/W2LpxRX4qR
	q1Kpvoece6ipDcYnfge3+7pXoz4uL9cP1FzpmeplHjVjv+UyPlCrYc5SnaRWo9o+VGvl7gE+76A
	3gKAsW5iaOeBgZ571v3EYrx30dIHymVwdmP/xZJ01UoPeI2PXBT9mba7x3Qu7o7MGKgcwr6pM+n
	a8tXGwuNShPtd9Koxxr3XCM7N78mehUjJzsa48EdFlp9wHvFuBbeBBTuW/KTHzvWiJpX8bXFSNg
	NnpUTQ+wmYiIHa6vlwaOwXxnYGTxKLvAkZVJaz7zdBRM04F6L1eovZKm8YTfM0DsjRR1UuXb0Lo
	+xf8aQAddKmEP+SvxJMn+C/D90l40jp2WE4JWA91fq8gXJOQbD9iLaCtM+t3aOQWAC6sKHdxcD/
	iTqS86TNKCmNKSug==
X-Received: by 2002:a05:6102:31b4:b0:606:2f5:7b49 with SMTP id ada2fe7eead31-60a0169097fmr2647068137.7.1776176910081;
        Tue, 14 Apr 2026 07:28:30 -0700 (PDT)
X-Received: by 2002:a05:6102:31b4:b0:606:2f5:7b49 with SMTP id ada2fe7eead31-60a0169097fmr2647051137.7.1776176909545;
        Tue, 14 Apr 2026 07:28:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd76b8sm409854766b.20.2026.04.14.07.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:28:28 -0700 (PDT)
Message-ID: <eebff16b-2671-4c7f-9930-dc4b3fa903e1@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:28:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
 <8f5ffecc-007e-4a8a-9c5e-9994e7841659@oss.qualcomm.com>
 <df708bd9-466a-4526-ba74-548896b45e74@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <df708bd9-466a-4526-ba74-548896b45e74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WpAWm5W4yYTJ5iH_Kd0BPPCfupk7OzZ6
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de4f0f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NcxxfY7wZcMA6x9h_jEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzNiBTYWx0ZWRfX4VN+dMZE/y+A
 Z8Kd9WhaJJPyYrrFA663oBowEkK2USc0df8oI1INXtmOYfxar4vLwB1VBjr7isrkc7DZqOWAH9r
 aF3+B5WnuUKl6GsOUZrd+eyVJpUHiBFpxv6Jz/j2XUP5JgBAMyr9MZm4emK8WwYdwXP7lnFReWw
 mE2taLVtsCg1JTuDQPJ7DMuZ9wG7/xU/v/NaKjJYuKXra6heQxmErL3I0OJe1fM1VOyv4YOqd/m
 Dp23kncHjnS/yam6ET28MW2BEMjfLU4OW+v0zEJglifOx2hQZCHnqXPpJptUcyktbXCMdlkLDd5
 88mCdPSgvwupQbzIPXPvp7Hpa2ygy9tDXnIayRYWpeX42JqXNdeJeuUqDFwUApTczGwBegkbAca
 is387gSAMmE3YNSPCgzansis/wkYGUbvh93eUQVQdCYIred4GwPIRejE8aSzoswRRI/4wNXKYUe
 /sIEemi/Qf/VAQJlsNQ==
X-Proofpoint-GUID: WpAWm5W4yYTJ5iH_Kd0BPPCfupk7OzZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140136

On 4/7/26 9:16 PM, Akhil P Oommen wrote:
> On 4/7/2026 4:31 PM, Konrad Dybcio wrote:
>> On 4/7/26 11:30 AM, Taniya Das wrote:
>>> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>
>>> In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
>>> which is under the GX power domain. Due to the way the support for this
>>> block is implemented in its driver, pm_runtime votes result in a vote on
>>> GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
>>> architecture which require GMU to be the sole voter of these collapsible
>>> rails on behalf of GPU, except during the GPU/GMU recovery.
>>>
>>> To align with this architectural requirement and to realize the power
>>> benefits of the IFPC feature, remove the GXPD votes during gmu resume
>>> and suspend. And during the recovery sequence, enable/disable the GXPD
>>> along with the 'synced_poweroff' genpd hint to force collapse this GDSC.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> Can we simply make this change unconditional on the gen, so as not to
>> maintain 2 separate code paths that try to achieve mostly the same thing?
> 
> We can skip the gdsc vote on A8x because the 'gdsc disable' callback is
> dummy when the synced_poweroff hint is not set. Otherwise, gdsc may get
> disabled during system resume while GMU assumes the ownership. Taniya
> touched upon this point in the cover letter:
> 
> """
> when GX GDSC is managed through the generic GenPD runtime PM
> framework, it can be unintentionally disabled by the OS during system
> resume (resume_noirq/complete phases) or runtime PM suspend paths.
> """

Right, but if we made the GDSC.disable() a dummy on all platforms this
could be done.

On a second thought though, this won't work for gmu_wrapper, so we'd
need two paths either way.

Konrad
