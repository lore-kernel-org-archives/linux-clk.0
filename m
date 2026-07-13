Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB7C26F29C
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939667; cv=none; b=HN4wH7dufYOFLESLITULh3BJe76aBMTCzFNmisTlgTXGAJJw302EARz+HUMozxr8XjyNH5unazQ1nksWYL83x83XBrNK4G8nO2xPu8VbOEIu8C4xKPreakEYtmpgGlbFKG26w6GFlFrb+zSt0+OM5b9CfQ40+7Fc4Fwf2/CedkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939667; c=relaxed/simple;
	bh=LHA0MGvnSeQbYiIUyIqWKF5b83gNqvEEHY2/ulyJYNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONKDR5vdBKeU8+f2AIJ1Xy1hCZrVZKb0V0HUzUAT0wMM5A5Nj/JIecLrem6dVfm8REDwa8m+9iHmU/WT8c6/alckYblDfq/JtgDgIpYhntKZfv3VwXxuNeQL82DYsruO7LaomMRPxJNmnRTkstXV2JQm+b1Ld8Nj96EvfqsGwO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQSPAAlU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ik3xfyT8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQSPAAlU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ik3xfyT8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Kqiw775830
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 10:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6btB6dJhej2QcvzsGuKaIjQa+hcAkLMlewhHm8fby6w=; b=CQSPAAlUwDcax4AX
	4X5goqz74n0+lqKdO0aJV2PV4kgMvjLCQs1oI6Pn1ELDOLI+dcPpwV/cc2+MSu96
	Vf9kdLun+mPD3MNTRpGkwdyPGRdT84CUB9nEKA1T2nMyB513L/2qMEAdXCp6j2/j
	muzS3BSB52nixpkG3LyzwLHt35nqVdrFaSVO8ICETxsrX+yd5QGUMAZLX7cSdz5F
	Httdnc50HVpPNtTawX4Rg03nA2y2ExZQH8qUWS2DiXE+3AYfy60hPXcuKBngn1L3
	fMufrT4kcgJubjFidN9NT7ZK0WvziTaHwJ6myEV2HxT2UjmR6srKBq17fmLwgQ/w
	Mu8htQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00s85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 10:47:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e68cbeb53so51884885a.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 03:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939664; x=1784544464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6btB6dJhej2QcvzsGuKaIjQa+hcAkLMlewhHm8fby6w=;
        b=Ik3xfyT8cPGLGzo3oiGRl/ngqfeKl4rRMmlyOkRyEvNB0s3JKzeyRl+E/2wdiZrhBx
         LrPJDNryft8UIheagL0RJo0Mjrqbyxn3pHF850Zoxm+oR6mCqqvAlm8KlUxCI2MjM3R6
         14TspS3Q26FJIENrNsCqSSmMl0aRVr7s271Ndjge8v8IamgvqJ4w8v0NzXrtyDcV3C8E
         lnfrP5MDpTXUbxHpDjOF2mLZOighXOmMWvcGpM41vOBSswEoiTU0yOhRKH178WwWDuD9
         5JD4zid25AcVslJYJTvI2di0dc60Ymk9bosX8bq0PKc0tx9lws8sGr3NwPH9cdSPIwiC
         aXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939664; x=1784544464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6btB6dJhej2QcvzsGuKaIjQa+hcAkLMlewhHm8fby6w=;
        b=kbKQDBeU8MbeR+npn5eh3p95q2eO8QAh1EIbhZG0N+45JpMN1OQL0KHzvfmipBT0zI
         7e2El1vY0auEHo8JrNFtehjzjv6TjN6mZxt10pOtH8KDy5LN9UroRxjx0XjzkWF6e8Y7
         p4P385I9X/73Coq63c5f94Tbc8VYV7hHfT+Ju2pKayciPP0XHh4EYjG7l7zeuRc1GHpJ
         vaY19dwfp1XWjujZ84hjC9ZrtRjKYAL0GjOosqYd0vXW1dc/4TiWlHfFMgV6uqbHvA0H
         HuhZZSuSuqodFwgbsHVB+4sI8nWsMrPZWWB6FRDowD0gGt1TxSq8OlPf5jN95RvWYire
         JjGQ==
X-Forwarded-Encrypted: i=1; AHgh+RopY5v+ORj8Z4NuQogQBzq9T9pDAMw90mThd7gjSzxEqI9ZoR2doA3TIXEbFxmCdknQv35Hb7871x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YytAy4PDN65ZfIcuz1h6O0s70gbCKs5IkTJSVTI+Qw1dombCvyY
	DvzjEFHh0HI5HbXqJPiCwRArj/dzr04iPEzFoqc5/v1z0G1pW36rnpajcKs9T/Tbh3QjW669S5q
	c/YQ2HgDLkQ1vCD9tvnni81xKrDFkBxOgh3zN8XnLaFLpXO4ZPXT1spiG2B7m47g=
X-Gm-Gg: AfdE7ckdG8GmkegY881D1Gy91OomY7fpN7SKk5zXDX5Er4ydrQvrIWZSyPOAi8ARDJ/
	Za7ZX/RWClQ/SN3srk8O90fx9lZ1FUFV7jiMZpDEvhQk7iJNpjH1JHRe90qjf2J0b3n86RBqcBI
	v6bI1YOIOnXcsf8dV/O2j2p5YUpTpXKoMJFSRZuwyRA2O1xvDC14H8HJw5YMjwdhHIq98kVUudn
	+r/xf0C5LiM7DdmlXcmtARKscKfR6jOdrtwQdE9utxBkGbgVEF9JDvjpEMqCjj+Vm/QqZ/K80p6
	6dYKXC1k6uMVpFqXqmtq+pfgfeeJz6qqSSenshglVxYAT1GDUFjJsfVyxT1zyiq33mMzp3IZ2dA
	AKcleq6AwaUpPnCm+bEs9uKyj6a1Nuk/25A8=
X-Received: by 2002:ac8:7f83:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51cbf312bdemr65574921cf.11.1783939664126;
        Mon, 13 Jul 2026 03:47:44 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51cbf312bdemr65574871cf.11.1783939663765;
        Mon, 13 Jul 2026 03:47:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm762938366b.42.2026.07.13.03.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:47:42 -0700 (PDT)
Message-ID: <dcea3653-1428-49ee-9287-a1b27da2003b@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:47:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-sm8450: Migrate to
 qcom_cc_driver_data
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
 <20260711-sm8450-qol-dispcc-v2-2-fc1a07ac5601@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-2-fc1a07ac5601@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfX4AZ3RaVmWU6L
 Svw19RlinW9LHT85GYR/Cn4n2gF40ZjNq08kR1/OQM6GD6qTcntRwRPnr/e70wxzd/M+r379mJH
 +mZco8cIRuH35lk2l04UoSbV7EsFMvI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfX510M04qU6id+
 HA+OcB1MaQQONibc/20zxRynG4p5pFvjTbGoA6xDrB9rMJ3sH5RuUoh2YDfXO/168gdtWyhxtJh
 JFW9WiTzJME7Rj9O85psXh+EwaSRJ+7Hb8+wxVpLD0/tB9HnPxSDpulWO7As9Xgr/yIcRaXjm2K
 YLDZ8lgoirxDbw7NjOw+8CjB42lw/wOuX+jePXQN4bYLPMVYwabjj0gU/mGbiNsbjgcREXCkRRG
 WsPDEV3lzxp2BzrAOJcFn8luvbCgOBJXipe88gGXSOg2etRPoHkqXFdzJ7NVCR58XPSl/cbEava
 uaD1VLXgoUgbkmarXeeVZwgyFVBuxZdC1/O4/iJshFAhbRNV54WRyksEAI+MKzS0Fo83yMiHY0N
 0CGvqCx79zoIROxIenfs9hHk/c3M4FggXN+cFqNNRGCH+pesddChK13xMqXgMUPMKpRE1CCBHl/
 p5nLqdWyhYt5gT2lMvQ==
X-Proofpoint-ORIG-GUID: BnYBYXu_WmnU7bKulXC7caJPe5UcfsJP
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54c250 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Nrxj5gcjSbdtpE-AfN8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BnYBYXu_WmnU7bKulXC7caJPe5UcfsJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130112

On 7/12/26 5:10 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Migrate to qcom_cc_driver_data, which is used by other clock controller
> drivers.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

[...]

>  	/* Enable clock gating for MDP clocks */
>  	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

This would ideally become regmap_set_bits(..., BIT(4)) in desc->clk_regs_configure

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
