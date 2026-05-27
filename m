Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE13E3D9F
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875299; cv=none; b=RqlhEaR9oTccg3q9+GNxu+OBNKxpNQ0FCNa+oh8/h6so/1FwJV3PxtGaPmFOCEHxypoTE4HklJXMP7i5w/BobrICjsm5qmrSsyECI6dqQPUVs+RBP9Tb5Wx7aPXnMezJMszUGYkhKR6L4cxC9iY2HEHEqd5fnHXQtbsJGKWDyjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875299; c=relaxed/simple;
	bh=0uH/xr5JWvJOg23KjOOBa2YW1X+opwIdUFmjbtnuZwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9LGPzXiJ5jNTTNdjnKRL0OAsZHDshFHBdtAO48FdYySHhF8kYFlnguW8YMFF9uIeE8Ctp5CC4olVZ7x+wYBtSOO1WPM8qVEvHayXUKVPLr6lA0JH+DtBBasbkExC8K/Lu2ctmS46j9J8z/i3qdo/KyMiTBuBKLtunhgeGMgwVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxnPKlDi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWOwKg0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxnPKlDi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWOwKg0g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mQGt871119
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 09:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Mpd19R1YYwvJuLrssRZztJKV5/zI9q/ICp3
	JoLjL8r8=; b=bxnPKlDiCAXTMnU4ohjuc7VF6sPA+3B3hERxI11IjBNNWXhpLdD
	8zfO88q3Y1dSNVz5uf3AaOUr3SItWbQfDVa1fu4P4SZgm7hqPLaA65ba3jfE4c+m
	WRnGdWcS9a6c07DRItBzLEVaEa1P5qHrJOsooIDB7W9P2c6ecoXauPSbDAxJu4LO
	IOtmXEwiLV/ibMh0hUnlpfR2XwuQvGY23kTEnfUkxhRMgT+IEP4BJb2ZqubQg+RA
	f2dsyaYzVqKJvLqT0ZSehkUVqsWsp1Z6SKUk2db7HVqywiTfz6UlMm/UZpCS2fur
	3uZNyWEHNWeC3NqSKZrcwP/767eo+8pJvDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eduru8n9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 09:48:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516cdd89225so117104381cf.0
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 02:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875296; x=1780480096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mpd19R1YYwvJuLrssRZztJKV5/zI9q/ICp3JoLjL8r8=;
        b=UWOwKg0g2vWm6m/dTqrD3yg9wUrNuFvyWUfOZ+RGsqpB8KeyGeREkkh3PLmEhq2FvA
         dEoMfFwVVx6jGMPMnuXbWdX9Uq47qLuHsdR1iKtGBjJ9yTAJah291OfLzUofE+L2Aqaw
         ogOVFfvMlikNGQdMw8Iq/ypHSqOpmIAVJCBWuUhA0Wn5K7vEFI/10fSDPl9e/yOulmtr
         MstgBlrjWB2KsBqaGBUXBEY5EalE3HVvb/Yart5aaNLJNpB5Tc+gZsKXRhF2qiVxnawe
         3P+1QD9hY+im7JEBV/oEcFxLk7qnY4t3l6dWX4w7xVSsjwX6XpElBrq7XuuV9/06h+jN
         f37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875296; x=1780480096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mpd19R1YYwvJuLrssRZztJKV5/zI9q/ICp3JoLjL8r8=;
        b=BR1jT5Xj3v4V0zujQlt8H0yYeZatsjbdPlh4vdXW1wRBcJXBOoDGpkP1R2ZYW7/OS4
         qT6Vbmu73mszxpfHiLNr+njU4s8Yt1w8yVOQ0opIRO/dznq6eSJi8vlyH+x1HxQf2/1+
         6zRK4ScQgEKQ7Qr79P4HWswweAUj6mZGkAsE9K0L3Npgsbnm9sAACTPVq9RfvrkcDASV
         WVjqenkkbGeGIFPTl3cUHy8xZciTRpIEu8Pf456Z6w8L9AjH0RIawo1vb5pOlB/WnPKL
         xdjAuxH6biz8zwD7DiEtId6ILWxknk+4y3XFF8/H2hn21ED6AwCzXISfrLuFwDR/04WJ
         BO2w==
X-Forwarded-Encrypted: i=1; AFNElJ/PgueKhw9DZwZ7+B8gQh+5SlS21uf42ekHrRSGBirFMoGJeTVOV9HRz+QlBJozRW1u3HnrO0SsIMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZo18bZV3y0vZzQiaugAUnNNUILDTQlKS9PQw+4yu+Rpdvkfha
	qu7mNA4eRtjBv0ETrCV+e7Y9rxQtMAmRiaus0LSVGrn0uaPnZQeY0/uc9tzvStwzzw5oi+D0dUS
	AqzkCyRHH/J8kIHXZEe1KdqEnCYg/oZTZEvtXpSpRwl+uh0LZscMtygvGcYmCDHc=
X-Gm-Gg: Acq92OHMWY1U5OMaR9s/aJt80sRaS1VZlZjznRuZ3gVLHI/x8wf817MjD/5Ms2l7pCL
	UrifscNtx143UcXc6oNvj8t9HnftxnhZ8UkQfHmgnE0FpwjiLyqKuXUTNiTL8dPCoZ+JcV6LVSP
	5ZGpwxXqhsOSdYBUOBHx1ow9Fry3Iaw4diQPVcXZp0ie5ab3dDsW+gHYGrxT4tN5c1nyt5CVU7J
	5P81sI+tj7LdtOjI1d8INl+C8WYVuk1Ul3jTMyIud1J65pe8xh9tFUlXtTK3MovTUvLW+hNyYWS
	rHvuz+YQFAV+KODnLAWTgRwajxijMzvrikklNuYLkGeQ/MCGPrzP/OvaRV2SxEX30exOx0dO0HV
	02qugTokKIbfDo4nx0+fVVR6m97s7JFFlwiQJYk5sqiAKptFJIw48pPz0s2wroe7qrPsioodZxF
	oCubzjDqDO7YKDSAi/AYEBgS8a28veqjmYNqrmDEJGXKSij5Y=
X-Received: by 2002:a05:622a:2508:b0:516:ddc3:6248 with SMTP id d75a77b69052e-516ddc36855mr289924561cf.29.1779875296067;
        Wed, 27 May 2026 02:48:16 -0700 (PDT)
X-Received: by 2002:a05:622a:2508:b0:516:ddc3:6248 with SMTP id d75a77b69052e-516ddc36855mr289924321cf.29.1779875295585;
        Wed, 27 May 2026 02:48:15 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fb31611sm544001a12.22.2026.05.27.02.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:48:13 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Helge Deller <deller@gmx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/3] clk: Add __clk_disable_unprepare_counts_only() and use this in simple[fb|drm]
Date: Wed, 27 May 2026 11:48:08 +0200
Message-ID: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VY3H+lp9 c=1 sm=1 tr=0 ts=6a16bde0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=vk9NKK56FxHfhQgqp2gA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hKBHkmmuCgHWGWjuFDCeshk_cDGUwN7k
X-Proofpoint-GUID: hKBHkmmuCgHWGWjuFDCeshk_cDGUwN7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NCBTYWx0ZWRfX00t0dERKJg18
 +qDI7bBhOVQr0XroaZB3YqtukGbXgkmv3/te1C2yGEQd5mFRGGJMvZI9/avMLFisZ9xs/KLWYC4
 BKiGB/S/MqHbYQzhEYZsooSm8pv1fmDcqvQUUJpBQM8EP3068YfuZTEebg2+nXkMeIWJbehRG26
 EKdmPpvue1mQJiVFq712XQ+g8sVwvxHZuGWgCMPVG+j0SyMR2paszwjk4njg+AFC4uQufJ51QPC
 nmsT5wF92H/xiJCsGKK5IsypbdRhCAs1u0Kue8kp0O1BFixH9u6RpouWaNqfkYW72rrAuQovY+9
 BQb+97EsZ5Z++Lie4VJGqzlAmc2tfmGr3hbcuS4dj33iuJqHzeTp7yi6Sgp0Fcb1rwRfjkSHQU8
 YpUt6ErEIdDBh2fn/Lir1LG7QFOwDrWoI66gCANUg13jPw1V3XgTY6IpbNjhUoT6bngo5jclzEU
 l3OC4BXpwkXJTqUAh3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270094

Hi Michael, Stephen, et al.,

The device-tree simple-framebuffer device is special in that it does not
describe actual hardware, but it allows firmware (e.g. u-boot) to pass a
firmware initialized framebuffer to the OS to use as display during boot.

To avoid clocks used by the firmware framebuffer getting touched while in
use, the DT node contains a list of clocks which should not be touched
while the simple-framebuffer is in use.

Conceptually this is fine, in practice the *do not touch* is implemented as
a clk_prepare_enable() + clk_disable_unprepare() pair, with the disabling
happening when the simple-framebuffer driver gets replaced by the real
display-engine driver.

The simple-framebuffer concept assumes that the order in which resources
are acquired does not matter since they are already on, so power-sequencing
is not an issue. But clk_disable_unprepare() actually turns the clock off,
messing with the hardware state before the real display driver loads,
without any knowledge of the proper power-off sequence for the display.

The turning off of the clocks outside of a proper power-off sequence causes
the following error when the msm display driver tries to re-enable them:

[    2.980181] disp_cc_mdss_dptx3_pixel0_clk_src: rcg didn't update its configuration.
[    2.980272] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xdc/0x100

Resulting in a non working display.

To fix this, we need a way to properly implement the "do not touch" concept
for clocks. clk_prepare_enable() is fine, the clocks are already on so no
ordering worries and it ensures that the clocks and their parents cannot
get turned off by incrementing their enable, prepare and protect counts.

clk_disable_unprepare() is a problem though since it actually turns the
clocks off. Instead something is needed which only decrements those counts.

This series introduces a new clk-core function called
__clk_disable_unprepare_counts_only() (1) which does just that. Prefixed
with '__' to indicate that normally drivers should not use this.

Michael, Stephen sorry for needing to add a new clk-core function for this,
but I see no other way of solving this (2)(3). The changes are not that
big / not too bad.

I've also considered making __clk_disable_unprepare_counts_only() implement
all the logic itself instead of adding the extra parameter to
clk_core_unprepare() and clk_core_disable() but that leads in duplicating
quite a bit of logic (4) so this seems better.

The other 2 patches just replace the clk_disable_unprepare() calls in
the simple[fb|drm] driver with the new helper.

This series fixes the display not coming up after switching to the msm
driver when a simple-framebuffer node with clocks listed is used.

Regards,

Hans


1) I'm open to changing the name, this is the best I could come up with.

2) One option considered was detaching the simple-framebuffer driver later,
   after the real display driver has had a chance to claim the clocks. But
   this won't work in cases where the real display driver picks different
   parent clocks then the boot firmware did and needs to reparent clocks.

   Basically the goal is for things to behave as if the simple-framebuffer
   driver was not there at all, because that leaves the hw in the state
   the real display driver expects.

3) There is precedence for something like this in other places in the
   kernel, e.g. pm_runtime_put_noidle() and the power_off parameter
   to dev_pm_domain_detach()

4) With the risk of the 2 copies of that logic diverging over time.



Hans de Goede (3):
  clk: Add __clk_disable_unprepare_counts_only() helper
  drm/sysfb: simpledrm: Use __clk_disable_unprepare_counts_only()
  fbdev: simplefb: Use __clk_disable_unprepare_counts_only()

 drivers/clk/clk.c                 | 41 ++++++++++++++++++++++---------
 drivers/gpu/drm/sysfb/simpledrm.c |  4 +--
 drivers/video/fbdev/simplefb.c    |  2 +-
 include/linux/clk.h               | 14 +++++++++++
 4 files changed, 46 insertions(+), 15 deletions(-)

-- 
2.54.0

