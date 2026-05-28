Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225937B007
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973337; cv=none; b=h6R/ohzBVBIh8v+BV2Rq9Zv5Wt1H+TMI+Ukiuyn1lCWKbWN3bKj564X7tIGgIXKn6CeXy/W/SFUbP7BNadhc9coqxMWgb3oQw0shDNU1L6iNmQAKafHe/AyNgqAWZo32f+E8EoP8CF/8ubQgmmfTQuYgTAxZ8btLyPDFRNQgsic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973337; c=relaxed/simple;
	bh=W0QfAz+n49BWFSb2Arc5Cy4M5Uv5LAQxqgQqFj/3k1Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gTT/31a8rStae7qMxsFeRHh7o3+/Tslw/d+D7Ix+2CeeRi+jaHR6NDSqiLHQmTAR1nO68Uj1dReBjqXZKLQkxmlkuH3mjF3qoqRHxaPL6X8yi5jLI1jE50WdIEvcb7/t202snzVHgLsW8hG+c0eHdVEtq6XCkEYWT+2ibooP33E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmxdgFaP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kukee54B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmxdgFaP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kukee54B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vm5R1697973
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkLBgrFATghw43YvF1sCEhlToO5Oy4l+TSxs1/G9Cfc=; b=nmxdgFaP9ycgIT+W
	Vzcx5XQ7QsrfZOMUaQmCJCGhEhcrVUvKGs+gSyiZLIqgsDcFr+5sauDNp1AqyHYg
	m7+BdatKUt5tHUrMScyUrHSLdeeLXY7aMmHY5I8/SFtUBrIDMkTuSWaHetdOHnwu
	FE9/nALG8S41XVLuXRGEr4DIg2BiBd3YxbAw2RqAOuH3PDEfRcrobTGVeUePsWO2
	uhEUXYnjGLSxN8eCbNZrJCRPpGZzo87cLlwDcd/bNr7SOXOLzpi8hI/xkD3zV/pX
	E+sYPA003hqn+IGhuXpnT2aNWg2Gqe6xspy51PRmC6xMHIFH8RDflhcMGsm71nF0
	RYX0Ig==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajtge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 13:02:14 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69d9197c60bso6542797eaf.0
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779973334; x=1780578134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkLBgrFATghw43YvF1sCEhlToO5Oy4l+TSxs1/G9Cfc=;
        b=Kukee54BCEtXj+8vt284IGCmQjJDMcbRLZM6/Gp9g//thiNqNR1U0dzLPfb/Wm+j6H
         uTFNsPPjFSZ8Vm+IQ0aA5gbDKO5lK+zM7mQ4DovHg2fI+EXI5upuiSLqgKedEg8fDqn9
         B8EN4u5HI9bcvJvHXjrxt4Y6KJYP3LH2YIM1rw3Az3lbLL7SRnEWSgX//Ue5fNA24kwm
         1dgSmNHY6E0MjoDT5lNYGrCfYhodVW99AmbNBG3ukbPNB/wrMszMmKaTNvyqdastVCxs
         kUWSbBKtweoGyB3/rEKWabJxuw1KbQoKCXRDmImWdj/epNStQu43OdkgwcXQRSbkCNor
         DV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973334; x=1780578134;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkLBgrFATghw43YvF1sCEhlToO5Oy4l+TSxs1/G9Cfc=;
        b=KqvRCLNz0ZcYGz8gxblgJ8q9NbQ9GNnDUEZmZLPgXnXrjHhEw7eGrkVYL1P2Hp26Bv
         8dmHv9tPiTz5rntvgYbAz/+E5hbxvTI2/DZUx47yLXX9SdeGnMajO6J2+gmS6+hfvn7a
         DDmV+ciuL0VX0ynhpa5ar8ZZo8nGjmTM+W4EdUCxlz2z9CeO7+FFEztqbv0GZ7NLWIwz
         K3MJBeEEkLPef32Afi8pV/v24U61HHPj3e5/27QAqrCxp0KowOLAL20XYAKg72/rixsx
         pY4S/y2Ab+wbkm13SG+veqmj0VRXyKQPa7N7iXf07k/u7nIMjBGCNx+YJ5Qex8lk4ESk
         vQbA==
X-Forwarded-Encrypted: i=1; AFNElJ9/XFzIikLGzinc9mGewm58v/7JgYw0mv8PmdKVHKGineUYJ10YsywTR5kLLttYZZDOGwXpuudM06o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsyDqpE6YhdbbuTKlM58ngwgzUaJiz2FF+QkD2yUG2rKMNhOdG
	wt2rYWTsat1w/zPjpRuhlJDTyqYt4pKgINtE1A0dH4tB10F/XqeoaaLIvA1mQznSC/r3ToPjgqb
	9tvhdqtw0h9QJ/97te8pLhyFGviQsYBeUAXy8etk48XA2Pi4ksyY8y4n2M6FteEY=
X-Gm-Gg: Acq92OFvzX+cqlggmtFrFYQKjUf9VUdbUct/6sp4QNgqR9BpdRaIWQwLyEbDZrdpkLG
	70wnL2a9hElXD3raj2QFgQo6PlMmKEE51l3IO+U4R0VyoZ8srvhhNCb19WhET161p5ylL07XSaz
	mDVVrKWxQ0EMhXAxcga3DN4CXZF9ebvKo2rV4wUUl7Rinh7Rdz87/YzsPoqvlb5iBIGUvwpOBVa
	DHnbnBhvh6zQ7qVFD3mOu5AUNbWYd8HhXuXbk6/zj8K+151moeqPl0VgGOYwxsiD5Uih8HVbeLG
	aGwQTpE61IOetApgKcPe1DYAIZ5qfyJjJnzxX6LOj6BzMFmjUnNuSLOELyN51sd3e/H06oZ7dXM
	HcblkNclHPyk9olNLhKvZRI0JfB7pF7kvgVLlWb1hdj/cz61gIfVIZznmq3js8EwpuwqTN1w0lA
	vhIJoFt1Edx6VkwbkclcDnplVwIiEXicygGmGl5mFYBA0snOPD0AlC69J5R9krkizR57MSWu191
	s9Du/izsl7za/Zi6cM0BfiVqgs=
X-Received: by 2002:a05:6830:660c:b0:7dc:d0cc:91b with SMTP id 46e09a7af769-7e5fefcb86bmr17463614a34.26.1779973333907;
        Thu, 28 May 2026 06:02:13 -0700 (PDT)
X-Received: by 2002:a05:6830:660c:b0:7dc:d0cc:91b with SMTP id 46e09a7af769-7e5fefcb86bmr17463543a34.26.1779973333375;
        Thu, 28 May 2026 06:02:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:8e96:3679:b9c:de47? (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68b9d51a60csm115745a12.11.2026.05.28.06.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 06:02:12 -0700 (PDT)
Message-ID: <4b09bd91-9a08-407a-9b01-216dd4d7aae0@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] clk: Add __clk_disable_unprepare_counts_only() and
 use this in simple[fb|drm]
To: Maxime Ripard <mripard@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Helge Deller <deller@gmx.de>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
 <ahd4XgTo3KZqGS9M@redhat.com>
 <66a76d9f-fe04-4a72-b6fe-42c2922fe9d9@oss.qualcomm.com>
 <20260528-sloth-of-delightful-chaos-1f02dc@houat>
Content-Language: en-US, nl
In-Reply-To: <20260528-sloth-of-delightful-chaos-1f02dc@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x5pH0c-neE_EI4krvrwPtdRu-z2Ok0Q6
X-Proofpoint-GUID: x5pH0c-neE_EI4krvrwPtdRu-z2Ok0Q6
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a183cd6 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=jBUPtkGcZuGRmuA17X4A:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzMiBTYWx0ZWRfX1UXt+5NOpeTH
 P4X9MdZSRK222E35Wp3+7Ko+yG3Pl8RUTtDW6BpaMyMZvdb/luVRrHxQTKsZTZQWjLOclADtFC5
 5zyCwLwrmbCW3O6gAVZxmy2ZA5+g9iUkYVffd3GQPg647V/Bjd+PRHAXvFnDZOXrdXL9g2AM6bb
 SHtCcwKTkJXHZqzSRtUYkei5/+efOTjSPe0Ft4xP09FxW2v3YvwWjg1/GjQCbJteQz9mXyjMb8L
 pcQtKnRyOqzaszdYvrSt/wo2Wam8IsBTWikdtXT3IJbYgoQhFwBD4xjWFtY6AEDZmB7RGBba9UN
 TqMDmkOr1BG1eS3tti1RYjgl+8ZzopJed4yYtqRhAwKKWzcG/qg+m3n4Qc9jT6AyYuKLCKvF+sc
 X+PfTccNfybxgj0PjF7m3qWtK2cpIyPHB6SBa/WE1nhqOksCU5ay1VY1S9hi9PA/IPvJ+yRdxsO
 SWUkK5ZzfGbhJvEK4lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280132

Hi,

On 28-May-26 2:08 PM, Maxime Ripard wrote:
> On Thu, May 28, 2026 at 12:12:10PM +0200, Hans de Goede wrote:
>> Hi Brian,
>>
>> On 28-May-26 1:03 AM, Brian Masney wrote:
>>> Hi Hans,
>>>
>>> On Wed, May 27, 2026 at 11:48:08AM +0200, Hans de Goede wrote:
>>>> 2) One option considered was detaching the simple-framebuffer driver later,
>>>>    after the real display driver has had a chance to claim the clocks. But
>>>>    this won't work in cases where the real display driver picks different
>>>>    parent clocks then the boot firmware did and needs to reparent clocks.
>>>
>>> Why won't that work in the case where different parent clocks are selected?
>>> I'll describe a scenario below.
>>>
>>>>
>>>>    Basically the goal is for things to behave as if the simple-framebuffer
>>>>    driver was not there at all, because that leaves the hw in the state
>>>>    the real display driver expects.
>>>
>>> I think the deferred unbinding could have some potential here where
>>> there is some kind of notification mechanism between simple-framebuffer
>>> and the real drm driver. So:
>>>
>>> - simple-framebuffer driver takes reference(s) to the clk(s).
>>>
>>> - real drm driver eventually loads, takes reference(s) to the necessary
>>>   clk(s).
>>>
>>> - real drm driver sends a notification to simple-framebuffer that it's
>>>   done, and has control.
>>>
>>> - simple-framebuffer can unbind and release its references to the clks.
>>>
>>> No clks will be shutdown prematurely in this scenario.
>>>
>>> If the real drm driver needs a different parent, then presumably things
>>> should be setup correctly, and simple-framebuffer can have the clocks
>>> shut down when it calls clk_disable_unprepare().
>>
>> If the real drm driver needs a different parent, then how does it
>> do the reparenting while the simple-framebuffer driver is holding
>> a reference to the clock ?  In that case the clock might have
>> a protected_count of non 0 (depends on the core-clk flags) and
>> reparenting won't work.
> 
> The only case where it should reparent you listed was that you might
> need to pick up a different resolution. However, that can only be
> enforced by an ioctl or a client.
> 
> simplefb/drm is removed in msm_drm_kms_init. The device is published
> drm_dev_register called right after msm_drm_kms_init, and the clients
> are registered in msm_drm_kms_post_init, called after drm_dev_register.
> 
> There's no way in the current msm architecture to have a modeset happen
> while the simpledrm driver is still active.

Ok, new plan, please let me know what you think about this:

1. Add a new "disable" callback argument to
devm_aperture_acquire_for_platform_device() and store this in
struct aperture_range

2. Add a new aperture_disable_conflicting_devices() which
calls the disable callback for matching devices.

3. Have the simple[fd|drm] drivers implement a disable callback
which unregisters the drm dev and releases any claims on the
aperture mem-region, while keeping clks, regulators, etc.
enabled. And have them check if disable was called on remove()
and if not do the disable() things on remove(0

4. Have msm call aperture_disable_conflicting_devices() where it
now call aperture_remove_conflicting_devices() and call
aperture_remove_conflicting_devices() at the point where it has
claimed any clks it needs.

Does this sound like something which would be acceptable ?

Regards,

Hans


