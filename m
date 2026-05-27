Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38873F39E5
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884516; cv=none; b=dikCSbjHns8BVk0NHbX0FOHcXgoaLzP88D6Mn2lHaI5uNL1/0Rbcf+HkVDODrbvLeGpwjydQ/OMN9mbKFDm2NqGmitaxWqmVxNf/4ieRFlHf+m3WatZR2qdfiR+mOGZUKg9v2AqL2g9NmxlWg3CvLUGcWn4Zed5m7XhYy6bVcic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884516; c=relaxed/simple;
	bh=ZznVMDQlzSQ4rRLbnffHN7wn7dxpj/DwDKL+aZ0wIiY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Gdd5MBHyw05pcvi4YXt3n03TejhMt+crNP32IFxgmJNyXXeSo/yy9yMNHZwXh9NyraoWb/HdPPu4UYuHvG9D0KzZ5fwMVyl8zQy2xqs4YixYPFaY+NHcHLkLbFfrtBQ0CePvVMBfY1OvmAc+YmgnkyNd8HLbdrkg2EEUbq7NKxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biGTOd8l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SukBtkPA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biGTOd8l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SukBtkPA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RARtA01574960
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 12:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoI6qesmj2SY+3aJfTjx7veZsHstbofPXkqKjrx/keI=; b=biGTOd8lQ0BCRYuj
	bXZT3DWA5ljzML+mVvIaDspGGxGdYYc02S1y9qjl6+yvbMCieK3F29esOHyM4Jsi
	EG91GemfQmtSAxFTI7TTwpg3o8Wt6OB0z3AxQdhHvhW53zCFwI4zsFKa9QS5tedZ
	KXYqASZAyVLI8+zMJCLwx9WzQEfegQW81hIuEXwjYoAQPtXWWZz5LGIResfPZBEY
	GGJuxftkU7156XgZEGBbjDrL+oIAOPpo5UGgWIlu7CdT1+55IAjJX+U9BNPn8cx+
	QBCF9QVCeZE/Juuq3rDAFdBCAcRa5sHjn7XvBkqdMk1uHoiTjVIeF2vSSNpEV/FW
	C7ih7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxvpgc38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 12:21:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d4b3f3a1so118653031cf.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779884513; x=1780489313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EoI6qesmj2SY+3aJfTjx7veZsHstbofPXkqKjrx/keI=;
        b=SukBtkPA4oC1jNMku1fXG2Co6NbAA8vf5X4g5iYCfDWHU7VgjK9fR4Z0pejPjJE++w
         LbWiqf82NeazUpzxNdRaisMuTOO6dhvElvl0Gi76uokZn3GL0MVIIa/XPR4dr1dlHfDt
         vkvA+ZZWNfOsi22nUkt4fDQ3gA4PlZ7dpbDcVy+hkAnenBVMCGSlUhjWoFKoJZwod5xR
         KReapC+LB1dLPdEFJP1FgR7YQp2KGpfm3uL3xMw+NGKDxsigw4AV0x/uQr/TysSFeYwf
         t78XKlpb4UOQNFasH9tCQvoY93oapkcJ7YcJ50inFRzpS0W+We15rreKNfFP2AliUc9q
         ScHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884513; x=1780489313;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EoI6qesmj2SY+3aJfTjx7veZsHstbofPXkqKjrx/keI=;
        b=I9kIRA6FTzZObYbwkpOLPfjGvCGYiuPwS+9vvYLKK5msXNrGaV5GcGNkEW2ajNk3Rz
         hZoSw2Thd2owb6yy9mtjKCxkwIYR8XCH9daP3rFJuklI6KMY55wo8aY7+zl5R0GBLgsJ
         9GTZQ7NniZTjSlhlvaCMeBBRlQcn7k8RyheCFILaagUk0K+IoOAESDUw4d62VAoUEN5S
         Tq0/1RdlfMKLvzL6fuypRLX49ZE/143yv+SWxX3uJBefObO7C9CjXpBR38aWQ17kVbGW
         7P5bdtfGKtZES+eUTx72W8nenKhv/CqLfUAWXafCLVkaBg9pbPCq44zSRvjlTvSo0CVy
         3D5w==
X-Forwarded-Encrypted: i=1; AFNElJ9M1PHwq/IYF93UMEWnrrwkRSQl54gNSvNnU1H/IPw40ClFeix0Ai76llXffSU+5XcZi+juIjspaoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7p9OIn2UMapXHH3JSTUoQoN9BTggHe2EPuQErsz+T/QYQOuDq
	B28v819fMjvAjYA39CVqRlXV6Dy0RvDP1lcqoyyH/EQmwhoa5d8KK0wKudeQnQsHI7hop2r9KWw
	qdXadB5ljwsKJ4wRFdRfCGtESDwEKLJ5h/SVub6QhqOrmus9rBJZJ5Onro+J2vLQ=
X-Gm-Gg: Acq92OFFRlvAcF6UtQUtAETH+FR15NS2ugh7uKDlJ1OWAqsx+6Pa7nKO9jvyyjGlvzw
	+hb94NLu6wMqiMgPIcuA+391RyRqziiRda1uE23Q+4XzXP93rHMOOtaqy2+IMIaz6HLd+snliEG
	Uy9193J8UKE+q94ihuercb0RMRP05jt5b/3i9SBppz6xKuBwJ0dC6vM9uemkC0rMPnAz7FcV48j
	sLOpMCcoZaiuOK8YGUk81R1KSz1U9CLKemIEaJ5I1w8djisVxb2xQ/awk6ff0Em89pO2g++6/yB
	mAUvy/9YvSg3YAEPSfHM8euF9nwShi7uuS6erF4f9WSfNAo9i2FhSEnRgspJVqPypCvDeEIGrwY
	l2IJfjys/w5yRysiGsuDPoGfIhlDpbK6bW6ZS6Znnf8QB+Uq5ljZ8GH1PGxrQhDvvozVXAWHm6Y
	FKP3GD9ormXe76IPh9fBG/8PCxzeCZbufjaO8ujYM7/XhQMDKk/3PtfY0tGJlGSsgi9iN7fSCO+
	EvLLyokvP3J2/9/Pdz6ljq2iNU=
X-Received: by 2002:a05:622a:5915:b0:50b:4337:179a with SMTP id d75a77b69052e-516d42ec329mr301524671cf.3.1779884513016;
        Wed, 27 May 2026 05:21:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5915:b0:50b:4337:179a with SMTP id d75a77b69052e-516d42ec329mr301524121cf.3.1779884512438;
        Wed, 27 May 2026 05:21:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3051337sm616016166b.19.2026.05.27.05.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 05:21:51 -0700 (PDT)
Message-ID: <496facc4-60bc-4646-b426-30e7ac545d9f@oss.qualcomm.com>
Date: Wed, 27 May 2026 14:21:50 +0200
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
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Helge Deller <deller@gmx.de>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
 <20260527-flawless-chowchow-of-fruition-edbe8a@houat>
Content-Language: en-US, nl
In-Reply-To: <20260527-flawless-chowchow-of-fruition-edbe8a@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEyMCBTYWx0ZWRfXw2WSgvz2pocm
 mV1U8fI6wQ6iqwSjkfZe9PjQAaO5L4ub2slj9+VufJfL3sOQkozqPPZoB81+T5LgRZ83k5vCJI3
 eWv4smnbgQQIwHBSHicBL/BjsnUJDNEZZtGrlOhZ0e/cYDD4/VrG4/cHKZk1PJ47KwU6MKNDxdL
 3k593oIptsFzVA9krThkhnTqddXVP2qgfYROldEYexDjMO9JJz6XHFMH3EfxU2wXnFfAARNFRHh
 WaCCGflEAu0x5v73h1Z8KPHECw3feeJbfjc5+HKaYNdHyknYFfqrv36nDTN+sbP/7OX9rDNdw1o
 re7uf03reMfgMMxhlzjH84o41ksgO+Gvb8ITfTfYwlsdMQWYvD01onZRZTl0+hv3wsi9sQj7srJ
 av+I2aSCW6pqAQphr/tmeulKMOGoH58dhvdDRoy4O9deLK4hw2jsgu+CzzaFVyHwVYOnTTSyzBN
 pGTBfIZlVD8GLHmlVYg==
X-Proofpoint-GUID: zwqhyPJnDpMgVNgXQPdYtvoKmeh-Spzf
X-Proofpoint-ORIG-GUID: zwqhyPJnDpMgVNgXQPdYtvoKmeh-Spzf
X-Authority-Analysis: v=2.4 cv=VqoTxe2n c=1 sm=1 tr=0 ts=6a16e1e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=WkAwBIMq4Wj_tXgkhSkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270120

Hi,

On 27-May-26 14:04, Maxime Ripard wrote:
> Hi Hans,
> 
> On Wed, May 27, 2026 at 11:48:08AM +0200, Hans de Goede wrote:
>> Hi Michael, Stephen, et al.,
>>
>> The device-tree simple-framebuffer device is special in that it does not
>> describe actual hardware, but it allows firmware (e.g. u-boot) to pass a
>> firmware initialized framebuffer to the OS to use as display during boot.
>>
>> To avoid clocks used by the firmware framebuffer getting touched while in
>> use, the DT node contains a list of clocks which should not be touched
>> while the simple-framebuffer is in use.
>>
>> Conceptually this is fine, in practice the *do not touch* is implemented as
>> a clk_prepare_enable() + clk_disable_unprepare() pair, with the disabling
>> happening when the simple-framebuffer driver gets replaced by the real
>> display-engine driver.
> 
> Which is also pretty fragile because it doesn't lock the rate either.

That depends on how the clks are configured / setup by the clk driver
if the CLK_SET_RATE_GATE is set in clk_core.flags then protect_count
will get incremented and from then on the rate will be locked.

We could even have the simpledrm / simplefb code call 
clk_rate_exclusive_get() to lock the rate.

So there are multiple ways to lock the rate if necessary but so far
in the real world there has been no need for this AFAICT.

So IMHO this is something to worry about if / when we hit this
actually happening in a real world scenario.

>> The simple-framebuffer concept assumes that the order in which resources
>> are acquired does not matter since they are already on, so power-sequencing
>> is not an issue. But clk_disable_unprepare() actually turns the clock off,
>> messing with the hardware state before the real display driver loads,
>> without any knowledge of the proper power-off sequence for the display.
>>
>> The turning off of the clocks outside of a proper power-off sequence causes
>> the following error when the msm display driver tries to re-enable them:
>>
>> [    2.980181] disp_cc_mdss_dptx3_pixel0_clk_src: rcg didn't update its configuration.
>> [    2.980272] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xdc/0x100
>>
>> Resulting in a non working display.
>>
>> To fix this, we need a way to properly implement the "do not touch" concept
>> for clocks.
> 
> I'm not sure it's something we can enforce, really. The firmware can
> modify clocks behind our back.

Generally speaking there is a contract with the firmware that either
the clock is firmware controlled and the OS can maybe make firmware calls
to request changes; or the OS is in control. Both trying to control
the same clk at the same time is a bug and IMHO unrelated to the issue
at hand which is about clks which are under OS control only.

> Other clocks might change this one as a
> side-effect of a rate change or reparenting, etc. It's just not
> something we can commit to.

See above, this is exactly what the protect_count in the clk-core
is for.

> 
>> clk_prepare_enable() is fine, the clocks are already on so no
>> ordering worries and it ensures that the clocks and their parents cannot
>> get turned off by incrementing their enable, prepare and protect counts.
>>
>> clk_disable_unprepare() is a problem though since it actually turns the
>> clocks off. Instead something is needed which only decrements those counts.
>>
>> This series introduces a new clk-core function called
>> __clk_disable_unprepare_counts_only() (1) which does just that. Prefixed
>> with '__' to indicate that normally drivers should not use this.
>>
>> Michael, Stephen sorry for needing to add a new clk-core function for this,
>> but I see no other way of solving this (2)(3). The changes are not that
>> big / not too bad.
>>
>> I've also considered making __clk_disable_unprepare_counts_only() implement
>> all the logic itself instead of adding the extra parameter to
>> clk_core_unprepare() and clk_core_disable() but that leads in duplicating
>> quite a bit of logic (4) so this seems better.
>>
>> The other 2 patches just replace the clk_disable_unprepare() calls in
>> the simple[fb|drm] driver with the new helper.
>>
>> This series fixes the display not coming up after switching to the msm
>> driver when a simple-framebuffer node with clocks listed is used.
>>
>> 1) I'm open to changing the name, this is the best I could come up with.
>>
>> 2) One option considered was detaching the simple-framebuffer driver later,
>>    after the real display driver has had a chance to claim the clocks. But
>>    this won't work in cases where the real display driver picks different
>>    parent clocks then the boot firmware did and needs to reparent clocks.
>>
>>    Basically the goal is for things to behave as if the simple-framebuffer
>>    driver was not there at all, because that leaves the hw in the state
>>    the real display driver expects.
> 
> So I know it's not really what you had in mind, but if you are only
> concerned about the transition from the bootloader to the DRM driver,
> then I think supporting the following work would help:
> 
> https://lore.kernel.org/r/20260423-drm-state-readout-v2-0-8549f87cb978@kernel.org
> 
> With that series, we can build the initial KMS state from the hardware
> state, which means that if you were to change the resolution at boot, it
> would be executed just like any mode change in KMS.

Hmm, so your suggestion would be to have the initial KMS driver probe()
only do a read back without touching anything. Then claim clks matching
the read back config and then only release the simple* driver and thus
the clocks after this?

That is certainly an interesting proposal but IMHO almost orthogonal
to this one (1). Even if it may fix the issue in the end, it seems
that that work is still quite a way from going upstream and even then
initially it only potentially fixes this for the TIDSS driver since
that solution needs a lot of per driver work.

Where as my proposed fix here is much simpler and fixes the issue
for all drivers in one go.

So I would still like to move forward with the fix proposed here.

Regards,

Hans


1) As you write yourself:

> This should help mitigate your initial problem, even though it's a
> widely different solution.

