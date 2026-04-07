Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA9A315D46
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559403; cv=none; b=MKbpCSll3hpnzrkx23w/FJztMII9tjB21eNAYKNXgAVHAPvixIVvP1E/i4vjMgYCWZpdn4bWVHFRG9XAWoINAL98LtQRJ+X7pom2xnH3/PSflWJFFyFoIpZi4zqacGgQt428l0yn+nV4h6y+uE85+6ZKVhAiZCZc+GrcwYohU58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559403; c=relaxed/simple;
	bh=dg+gpxevWWDjuIYQoJp/pp3KYhFr0ZhkNgXtkDmafcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbhokdbQZXJ/lYBF9MzqNlkrif3DoKRLSBnu1wOh+ks830Cj1mFCUY/baRRu/9L2iN4cSKCqNVghY7osQ+70mkPP33imd6FgUG7pc6c+qPjLCPlTwuifGDrtbBjIO3N9GzsqAeR0oi2nSu9eq66bF6Ibi9ROXq8r53xMCKfqs2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFmVb2YC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvAQZoQ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFmVb2YC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvAQZoQ0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Vx6N1403582
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 10:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ko+QfhLFwmwkxoUOJjdvmB7TSp2JRVRFcGoAOsZ7jO4=; b=NFmVb2YC62QCgbj9
	ROi1zp1yHdWUoSXTDEYN2HMyaHFePibhcCfXJiROm1raq6ZH6U8p8qeSf8gGG4hQ
	t3fD7Cgms9AcIbNIvK6bftF8NofE+8SH4yJwiekx3odZ6+OBM/5hzzL7nIJ/loW5
	Gj1loQIgThK6kMsNNuqj1utmaZ/tWRtcV6WeibBiT2L2+BF9hrCvDt5v1bRYyUe7
	e6ULJp3yJ5BYi3L/0QAlh+mAiUx64QeaNeaFzfnfU/yd1M62CBNlrztF8gP113e6
	PmiyektmEl47FHoW08Xz2RpY9GX8GE1n5S5hqc/tTSGNCNDm0/WWcbJoXMFAJFU7
	gyhTrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8acr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 10:56:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d56ae62e86so58041085a.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559399; x=1776164199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ko+QfhLFwmwkxoUOJjdvmB7TSp2JRVRFcGoAOsZ7jO4=;
        b=UvAQZoQ0AMvXzrrKiFNfOKxAEOram9GPuQKsrhiXmPPZTAewqojUXmJ9sEGn1C6TUH
         4Wuurfs4P+lUAa6iFCy++Pwy8GItsEcHxIFtLn5cN0NC2TjuAIDyOQDFU5Vfi6tAi0zg
         Ucdq2oZ9GP7oL6NplWoDT5z2QAEX43n+VgrfxQse/mjmGEePtJQfP+liJwwweyDB/GBB
         PVzCQ0AuDHqDT5Gr++HgLjBrPdO8MRbs0GLcKJiMhELYZ5sKzgzF7dw3esxDQbdMYSJb
         66hzbg/q8BbX6iaECb+kebTSRzGqCzg+ndYtn7NQnjeIMCb+PFIf59OPtQv436nD4kWl
         LDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559399; x=1776164199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko+QfhLFwmwkxoUOJjdvmB7TSp2JRVRFcGoAOsZ7jO4=;
        b=dHI8hAft2KpPb4vWYWMCbp3tG1CvubKI/Rex16UGSxjSwOYRmiNfybht1abtgOD2yZ
         YWErT0A7DaorXNsR44pVAJVPbXEo7F70MN/aVNpC9Nu/RRMTEqKilM9yR0iTBfuiiy+f
         cFDZ0ZWzYtgYxjVgvt2zVOg6DxGhx/LCeTnjTwEIFRG9zeJAHvQdAuP1PDIdGX+adyC1
         hlXra/Le92ZgNT++mexnS6HgNWUcGVdIUUVgf/iVBEpajCh97qFEyydWQEimtTPF59Ea
         EE0gGQf+4JrixO52tA8H1LZiEW5QsIbyiQLA9gLwTfSo6zAFOdBZaSvn8A3ZHYXsJ9Rk
         7IMw==
X-Forwarded-Encrypted: i=1; AJvYcCU/wyzwAQtfxS39B9oAQSON5ltwO2P+J2P3kg2UfVni/G1YyjWRnUIjqoKoe3cYNosot2c9IMV4zsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YziyMmpuDoSBh6WPfnYUfmjVv0ygM/L5AQ99q9d0C3vkuWmad9F
	NoSmSfg1pUOZjzn/hROcOW9cF1C4FT9KTkJEdH5JvlFZHhG2XKI3prpQKTaEzlYr3vjda/WoiVv
	i6WIqpHxUAPD5pIrzYPJngN7tLEfslN924pPEfOgatjasw3O/P67FOF6GN0qZuH0=
X-Gm-Gg: AeBDiev1jXnJ0NfbsUs6NFPmQJDJcI7DxywGgr9qs7OTLnR2+ryQsEkb7lLVWI7AKAh
	gBKa5lH0QVtYzwiWpy2EHjl/S/ql5eYfWQB+zpu6/VzI9BJrE+tg3otodDtV57UHw6VfTy+Fk3u
	XQfAvSP58O537Vxaz0f8N3GadCGAX39sOXcbBqhcVUD3qYWjWn9qU2xH/BaAPC27RDLfHisFiLH
	b0wKW9D9rE+3dD1/sg+iQba+7itNbFMHOG5glKz5XGTU6g1wK5mn5xS8S33SJJp1qCXt3fgxfKU
	pIycoZvzTnhCnMaVGTVCZVtqXmuIuis6JdIItnPuo1f6xhmQFfA8k8b1yKezIVWXKpuCuffjiCt
	oA4wofggrhPefA+5ZwakrhWBbjYIpUzRGs47P3k2oQo/ngFnGmZKwp6rbDsGBxT6iuvaIEgSUfk
	RWpvc=
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1763511385a.5.1775559399133;
        Tue, 07 Apr 2026 03:56:39 -0700 (PDT)
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1763509385a.5.1775559398584;
        Tue, 07 Apr 2026 03:56:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a7800sm4257700a12.18.2026.04.07.03.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:56:37 -0700 (PDT)
Message-ID: <6149513e-2c0f-4f01-a467-b4a213d65609@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:56:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: gdsc: Add custom disable callback for GX
 GDSC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-1-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-1-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ml2gs7bvw1P3xenIs-ccwrmyuuwbYZuo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMiBTYWx0ZWRfX+nvEAcTuc5Jn
 ygLbu7qCslFbEValEvFcEUtoQtxiS0eN60oOK1NJB7OQ7trcdKaBfmlMHX8ZK6NWYNcDNY1f85V
 zSPg0LkK0dPt2Jw0dqfHQGtjbZu8WWdID+HJMCF+nyT1oLF80aHpSYl1XNBymYgswMTZaanzpFT
 G0vpeYVXdGD9dG7eK4iVskhGHzNz5/6OtgpVdaV8/NBAtyO+CYw95fxIYgJUF8ADy4jueEf/UrA
 FAOjN8RvsoZWu7gK1u96djtiiBBBdw9XsFXg9eNImNvjgw9tp8KSPqrcKbtsSadCuZr7hTv0+Ls
 5UJ5614DyFNCKdfCvz9ZDKz1zkzmtptZfUUv7fxc/DIdgCgfoWhrKAtuscmqh2pC9ZMuEGdRXtr
 0zpl6YWeBt8EHZx3NNhcg62KDQhvHdbv4KvvGnkBGIvwv/CkHj3TupUmHV/DTaGuMlGuhl/zF16
 /jTKyDehajzvhrcG1Kg==
X-Proofpoint-GUID: Ml2gs7bvw1P3xenIs-ccwrmyuuwbYZuo
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4e2e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZW6dt3tIyA_XQ_bais0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070102

On 4/7/26 11:30 AM, Taniya Das wrote:
> From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> The GX GDSC is a special power domain that should only be disabled
> by OS during GMU recovery. In all other scenarios, the GMU firmware
> is responsible for handling its disable sequence, and OS must not
> interfere.
> 
> During the resume_noirq() phase of system resume, the GenPD framework
> enables all power domains and later disables them in the complete()
> phase if there are no active votes from OS. This behavior can
> incorrectly disable the GX GDSC while the GMU firmware is still using
> it.
> 
> To prevent this, implement a custom disable callback for GX GDSC that
> relies on GenPD’s synced_poweroff flag. The GMU driver sets this flag
> only during recovery, allowing OS to explicitly disable GX GDSC in
> hardware in that case. In all other situations, the disable callback
> will avoid touching GX GDSC hardware.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gdsc.c | 22 ++++++++++++++++++++++
>  drivers/clk/qcom/gdsc.h |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 95aa071202455421d818171d04f95d15e2b581fa..ab5d741a2e2351bfac06a6814c5a8ba7355bc8bc 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -675,3 +675,25 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
> +
> +/*
> + * GX GDSC is a special power domain. Normally, its disable sequence
> + * is managed by the GMU firmware, and high level OS must not attempt

nit: "and high level OS must not attempt" -> "and the OS must not attempt"


> + * to disable it. The only exception is during GMU recovery, where the
> + * GMU driver can set GenPD’s synced_poweroff flag to allow explicitly
> + * disable GX GDSC in hardware.
> + */
> +int gdsc_gx_disable(struct generic_pm_domain *domain)
> +{
> +	struct gdsc *sc = domain_to_gdsc(domain);
> +
> +	if (domain->synced_poweroff)
> +		return gdsc_disable(domain);

Can we use this version to replace gdsc_gx_do_nothing_enable() too?

Konrad
