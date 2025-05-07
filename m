Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00AD288C10
	for <linux-clk@vger.kernel.org>; Wed,  7 May 2025 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627121; cv=none; b=VB17s8z0D6FTrzvSSuS6mtk2OygEmqxi+3rdLsRadQj/Q6kLQZd5yGR6tLBKJcD95MxqZExZpLZ2OGd5d6BXc73r80/fjDavo3coJK9Cl5HiE+yXZRtYnC2B1WIthYM6gj0Z8VaOPGh0FeQftiItFzysjzp6EF/iUzDd0ZuNpRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627121; c=relaxed/simple;
	bh=WyCz/ArAVmQO+g1cZbQC9HYihMwNLT5tXWBdJxpyI3o=;
	h=From:Date:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcH2+lizE5Hz2STn/vAKgWnJpxSNd0iU34pIJL4Y30A14hEa0H5e74YMxWVeir2BJw0YE3NLqa5QL0nhWjiA+0KmMiHk7/rFIqXHlo9VdDwmC3ooSu3NnVSC7i3zQTQ/AJxXYeUQ+dkgz+oRK/JmD3E1am5/XTu+ObTdTs7zwvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RW72+a1q; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RW72+a1q"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so11300531a12.1
        for <linux-clk@vger.kernel.org>; Wed, 07 May 2025 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746627117; x=1747231917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp53MoIMHo7AsEpO8Qe4lYIdt8fxx6H0xofmt5rFOgc=;
        b=RW72+a1qzFrEk8+0g5TjeMhM3Seef2Ya9K9OUP1ZZ0+9GQUAM6+XEp3Lry/LNcW1la
         tL2hdZ5FcbCJlJ6OIdHxsXbVs3RcJI5IKfLczh+qAEOfivvlCl5iFIAJTU0t6vxp8Oz6
         /ywZV3oxlC/LPAQP3cSkJkdrEy/qIeW/ESNhnfNnxv71sHdR3cNZ5cIFwLZ9bXuBMGLZ
         5LwjGDLUIbwQSrnfprunfLqdRiDCWUil/m74yw+WGTHD0GUa4Ht0qIsPB/NUL9BFMIH+
         cFIW/+KXbYJoK4LU98SrKGAsJsuMI70r3ps2K7y4LHIwyqTXX0OWEQiB1v6WRgEHo6c1
         mdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627117; x=1747231917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp53MoIMHo7AsEpO8Qe4lYIdt8fxx6H0xofmt5rFOgc=;
        b=vDWvyEwMf8rRuIE59W6ZkyO5WVxgzzUdmCrmYDlzogTp4ES/pyFhsYamq3rF0sb+ee
         hccrcvP3JUbRVjfzx/JeIAP2cwSRp8WGvh6qlFrsoL5m/KNTbdYeXNgztOICwwOT91jr
         wM6J+zvc5pie5i6cFNc+JhVIQ8aqYiC5q/O0SM8tqu7yXgQbw2naALGheP/CD6m64dHw
         Ycg9vGM+7Ns4ID+GWk91JuGtOs2vsQQK/bOlWEiJEzdhNykQTK3WvdtG3fecR8FTouxW
         o7PyWQDl2U6YM7dtPCFs+JNqSxB3ZcF6Yc1yx8SafsbDdLDcAcdlYNvRtrfonSKF6Vh4
         qeLw==
X-Forwarded-Encrypted: i=1; AJvYcCVfLx2jHLj0XeC45bKebEbCaOi0hjiUNeyJm1dHO26kXTJqAcHmL6t+3esT9/hn+CODnH+uFQq47fo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjzlsjAWZCGDaVQ7kdjmIdb8kfL9+9N9a5n5fl1axqVHVIQWPG
	sXCUzg/QBtrTzja+/78BBNVe4359cFXMI8NP9STE/UazmAWUb7R40hz/QbDSH7U=
X-Gm-Gg: ASbGncsaetb7cL1DA3MaVJANd6z0eQII0Q0J6fofUccc2mi9/lTYuLE8F4gS8Zah+7o
	r8vQ/q8O4hg0VGB8lGyUGuLB5YFHs3ECv34tHWbL1/1fpVkdp9vBq7UVv4OEGNLaVZBuewi5dhH
	6kssEu5OBpVco9OnL4N8f8Vxe96YvtQne9pCGqlUExJHWcZWlXjhzxMfehq4xbO+72f2kvjGhsd
	gTT5Yx6Pm8QhxTRhhoaUA4J1kkUI5zYgUGuNiYwK27hRRT6hfObsJSrx/j7JyccsM1KvKKUgKPt
	h19VrUSQmiWvbKpdLUp03p2BNfiCZ0gFiQ7dIQJrQftctyon0ubLO32ogkIbFmTuwEvCwtlrvDM
	KdwucpA==
X-Google-Smtp-Source: AGHT+IEAIOFFJLOZCm96czkAy45BL7wcAh0Bc4vKalFIoRDdZw1taF3C6vTBolVNjObPDoUwRAM9aw==
X-Received: by 2002:a05:6402:5c9:b0:5e7:8501:8c86 with SMTP id 4fb4d7f45d1cf-5fbe9f46ef0mr2916040a12.22.1746627117121;
        Wed, 07 May 2025 07:11:57 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fbf761f95esm806596a12.63.2025.05.07.07.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:11:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 7 May 2025 16:13:24 +0200
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
Message-ID: <aBtqhCc-huQ8GzyK@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>

Hi Florian

On 09:32 Wed 07 May     , Florian Fainelli wrote:
> 
> 
> On 5/6/2025 10:49 PM, Andrea della Porta wrote:
> > Hi Florian,
> > 
> > On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
> > > The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> > > Add clk_rp1_xosc node to provide that.
> > > 
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > 
> > A gentle reminder for patches 8 through 12 of this series, which I guess
> > would ideally be taken by you. Since the merge window is approaching, do
> > you think it's feasible to iterate a second pull request to Arnd with my
> > patches too?
> > 
> > With respect to your devicetree/next branch, my patches have the following
> > conflicts:
> > 
> > PATCH 9:
> > - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts: &pcie1 and &pcie2
> >    reference at the end, my patch was rebased on linux-next which has them
> >    while your devicetree branch has not. This is trivial to fix too.
> > 
> > PATCH 9 and 10:
> > - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line recently
> >    added by Stefan's latest patch for RPi2. The fix is trivial.
> > 
> > PATCH 11 and 12:
> > - arch/arm64/configs/defconfig: just a couple of fuzz lines.
> > 
> > Please let me know if I should resend those patches adjusted for your tree.
> 
> Yes please resend them today or tomorrow so I can send them the following
> day. Thanks

Sorry, what's the best wasy to provide the updated patch 8 to 12 to you? 

1) Resend the entire patchset (V10) with relevant patches updated
2) Send only updated patches 8 through 12 (maybe as an entirely new patchset with
   only those specific patches)
3) Asking you to pull teh relevant commit from my own git repo

Many thanks,
Andrea


> -- 
> Florian
> 
