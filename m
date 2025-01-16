Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775591DE894
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 19:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737055833; cv=none; b=JvDyygg/x5xPxQ1QkSJrbctT3Qp65eFObm9cm79ge3JeRP9wQ0pmph8mvSxQZ1WnujA5g8eEWLwa3xhLj45oNnmeA7KgjscblQYZx6sFJbQBpQ1s3ra+e0Uvlasp4dpa/bMubiogHpX6aRAuth7+fqUk9Zi/W6GUX3o/H7z/zF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737055833; c=relaxed/simple;
	bh=13CDRRhB+orYCn3fnQMxqu2Airoml+argS6DpZ72wKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ur7X/qHSCy7BjzLwXTn+iYuAR3f/K6Luqs/bcuO1b18iSv6DcvRwaObl4BvxTFaMp38cLE8r5wrzC+Bf8MNd06iQ2+flYtZ+EVZgJ7WY3+UQWIQNhSMTlNYf/B0btfEf/gWP8jqCQrVruV9kqEa7n+Vm4H7tyTEV37n4HD4Vmfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=RHDy/ORa; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="RHDy/ORa"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e54d268bc3dso2630666276.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 11:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737055830; x=1737660630; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K9yGTD2yu84mlddSkREi20uhDyFHI2hi1pRd4d7s9yk=;
        b=RHDy/ORaj1CXuZCfGOSpCPSIey64z+IoFq1U+yorLtghDnRuT5X5f7LhHjdwlasxcC
         F2ArSKaWjbRpFYd92Pom03N4URbHRieXOj0RBTV1FrnbgJjwxtQ1MpRUBVp/vOqmGGgg
         DnWRVoa0bSciO5J9xLHcQtkQ/RtmymDiVCGnkWL4xjToHL02uX7UFs+JYPp8zvDgslrF
         eXhdyGImmSEP42Ko/kJFXwCCehrY/z6KWyEyoRB8dtxOsCJ0l4W5uPOMo8LbX3Vhqm0g
         TdCvEGwYbU/jD/wYR97azKGEii6NTlyx+MG1x5pxv6UOxFHObOawsDNArWXOylKByTM/
         VTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737055830; x=1737660630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9yGTD2yu84mlddSkREi20uhDyFHI2hi1pRd4d7s9yk=;
        b=KxmAEXm3KvDn782MprBazPzXPWXV3tg7cKvKcb2MPJj7rhMTOSt3nsSoWTMaLagOeb
         Q8EdEPlm28VIDkuJQkxbE9eUCD/b/9zKSMDVxhQFyqza0FMiymQURgklEcZRAZusd4do
         NUclPyNVqQHvZbxC672aiN5TrUypFGeTECSOzWgHHIQBWqpQ0csbUwuSG3HSeVh6mX51
         Hhh7S4aq+dLYB2QQBs9Ipt/mEHl1yHRoJ20FyAMZyxNpEt3/TMEZUpQO/EYaV3C5s52G
         ccdAni7rF3wgm/ZhcT3iPf3vVs9sevjLLxRr5yxOYUKtJYGtGVUYpZUp51RZbtcDxHrN
         fULg==
X-Forwarded-Encrypted: i=1; AJvYcCWjKXI8eIZXEXkm2VSB6S/+oiirBFK1dA0W4t/Vd97icqzd62Ge1QkyBFXMhU06nUSGhdStxTVrnmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/mQurNiyjwR4e0p0TI5QdNKuHhrYWnMnJ14g9nmq5iaIsLMr
	RAtYfGzc324lMsXKL1Ko4pmYriPR05RCcxaWmAisirLzMQenHNLKhpX1aC6ZncGj8idzkWbmLsQ
	3bbfJDiUI+6RVC1VlV/CFfN/NbChABL0edvGf4w==
X-Gm-Gg: ASbGncsLE8wxXCDyaWQ/DT3dDeSvNVOiZaUehXfpf9pQwA/fxsq+rH1DNwi3bkj4/zg
	Nynnz20SwT676Qh++IOPSIxtYEjKfpaKy3z9tpO7jHxfj8C+PWW3r3FyrpPrwfahgu87T9w==
X-Google-Smtp-Source: AGHT+IFXG849W4uNWpc4bFNrizPOkptByt52u9hfJ+BJR1wUhWUYNlnui+HfcnnpuS0n6WGsOedCv9P+RnA/p78YhBw=
X-Received: by 2002:a05:690c:113:b0:6ee:4ce9:b33e with SMTP id
 00721157ae682-6f5312252eamr304823777b3.12.1737055830258; Thu, 16 Jan 2025
 11:30:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <974a3030-0531-4c4d-9769-af752ae4898d@gmx.net>
In-Reply-To: <974a3030-0531-4c4d-9769-af752ae4898d@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 19:30:12 +0000
X-Gm-Features: AbW1kvb0Im_xVBsOKkzTFauIDT67Sx1H5TzizuoNDn6oj7mq0-uOqt38-I9PFmk
Message-ID: <CAPY8ntAP2EhXsVDRgK9723feWrS5M9z5=vgN4SjuAmAF3wQNGw@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk: bcm: rpi: Add additional clocks for 2712.
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stefan

On Thu, 16 Jan 2025 at 19:11, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Dave,
>
> Am 16.01.25 um 17:24 schrieb Dave Stevenson:
> > These patches were Acked by Stephen as patches 30-34 of
> > https://lore.kernel.org/all/20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com/
> > with v2 at
> > https://lore.kernel.org/all/20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com/
> >
> > I'm a newbie on kernel processes and where the patches should be merged.
> >
> > I'd asked Stephen on the v1 thread as to what needed to happen to get
> > them merged, and he asked me to resend the clk patches for the next merge
> > window.
> > I must confess to it having slipped my mind, but resending them now to
> > hopefully be merged in time.
> from my understanding, not all of these patches are specific to BCM2712
> (Raspberry Pi 5).
>
> Could you please clarify (no need to send a new version)?

You're right that they aren't all specific to 2712.

The patches were all part of the series adding 2712 DRM support, and I
didn't check the details of exactly what was changed in each when
writing this cover letter. Sorry.

  Dave

> Best regards
> >
> > Thanks.
> >    Dave
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > Dom Cobley (3):
> >        clk: bcm: rpi: Add ISP to exported clocks
> >        clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
> >        clk: bcm: rpi: Enable minimize for all firmware clocks
> >
> > Maxime Ripard (2):
> >        clk: bcm: rpi: Create helper to retrieve private data
> >        clk: bcm: rpi: Add disp clock
> >
> >   drivers/clk/bcm/clk-raspberrypi.c          | 33 ++++++++++++++++++++++--------
> >   include/soc/bcm2835/raspberrypi-firmware.h |  1 +
> >   2 files changed, 25 insertions(+), 9 deletions(-)
> > ---
> > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > change-id: 20250115-bcm2712-clk-updates-98a47f32116d
> >
> > Best regards,
>
