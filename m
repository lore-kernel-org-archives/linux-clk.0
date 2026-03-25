Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB0C257435
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426143; cv=pass; b=HCJwuaDSvumBOybrZWlrg9Q+MlYeWEqHv3owNoWue8ifX+KTVogbcXtP1d6mWd36vHBhLpxX9e/IJAoelD8lXt2AFscMB+sbVguX724tF3iDe1p6IIB+abb/6N1O8kypdqSGHh3RaofE6FgUdtRviqwe+2GWtCyAdLzmCI3jjM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426143; c=relaxed/simple;
	bh=zB4lNaKYpQ2RZphP1kN53sQ22q6B+2T4menfF8kikEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMkdcXCYQ1NvASsSVxf3x22SYfh9NPyEGGnt8fE+O+DW4FIBZ3ysnc1akt24Wwmxgv2dLK8wSCSKvPQVKeGSwBjNYi/s9eWg2DcndhoSmfTNgZWBOOcSTNOy9yMxa787e1Lh1p08jYxVH9Fr1zqu2KrCRTtQebE1DOV7dZDAFvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XatOiTM+; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XatOiTM+"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a27eb8311bso4654458e87.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 01:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774426139; cv=none;
        d=google.com; s=arc-20240605;
        b=hITCPTlC8qm8pLSmvXCX3iy63dVrERNe5w1rHEc5yvFNV9SZgSqOQmheJOeDGtslwC
         oaoN0/T7dEol9lxTxM3aNIz0xc74VEiqwNKs4rQusU6s2IRkiqdSQ3IDwNzx4yHYkql0
         2MPflaYoBf7viygx1INmJM9Uu/dN4ERhZ/ycEI+IYmuvKfjH1C3B+KUGOLVWanfB/y1v
         CdEbWHNkZDF7b+kksg6gh5Wjg8jI9Bvp3Vr9D78IuYPjjY/9y8MWBgcuTL1q+kpbYn7H
         31UvxOlqNHS4yj2/kS6CpuEVYw0yL7vlinQWOY13gh2KI3vRBH2u+vIKNwUW4yxEuM+4
         pl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=;
        fh=mcHOwyMOnrnE2QNIFEDJ7CelBmKNjkBZpcVCcwhvx04=;
        b=ctHNi1zSU8io47lI68hCnZJeiSbGDMUYpf8+f/Ktf+ebZsQROw04NuUV0O0b0gxuuI
         lrxDQ1xDMYX2hMtF6IS5La0GaF0vedAoMVNUOo9zNQ2zpH0qSwyZvM3/YFigwi3cIFf5
         S8+HgtDVHMX9/wNAeE1wjlj9JuanM6/EkP6sFfORyPhRgxR4uhJREU2q3BddnIrsTgKY
         c3kcVLmO5xR8pJfT04XlLI6BF+8jDfzdFGVQvDYXh1Ehfe0gJDrw7zjDW5VeF+y1CKFX
         o4WGjttE+MmsBmDVfw6SCcCmPB3FiDtMncZPrKpWUtLBbKer+8YNo3y8WXd0bDfRzckx
         YVEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774426139; x=1775030939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=;
        b=XatOiTM+zP4FCzdlvRTFgXX1QQV6DFUKf3are/qS0kueMARdfmtmlYQQUI30FBx1xL
         6stmF13+g/cxZlbjORLQsgOg32ta8VwDNkZoQu1CvfXUgvnlQyv3dm1kWDGknMiACXJ5
         F090bk698qw3YVDb8gz66Gdg25+zVlYbhVeA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774426139; x=1775030939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=;
        b=ZrDeTWlCW7vurcVYs5Z6pSdsyLPGQW3PXwM94n3MqoMC1/FA/irhgG8LfpkAnm5IXm
         rrRs/5PZHoq3VK/zufX46+BdBxR7icndTOIrgoTL9ivIF1eX5EFawQwRDQpiw0xsewGS
         zcYQx78JdkEppadcpLyHQvPsslRJU4dEyIBY0VpeJ6juShcCchpBCBuFaFBlTcSWepDx
         jElrdT0HaZgCG+FqQJYli9y+ueDVSMtmosTwhEEmUcLqyw3pWvzy2rdBS6+e69d7E9EP
         RpBVii922IArQ4Hc95DXEP8EX1kocFTkjp8td4yOAJMXcK4CzezTV1NVsqH7tKNWBEUq
         4Yng==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6ts9wAlQ55+JhCO0cNxEowuik2+tKiBGkg6Ky/7DJ+Sxz4WnCVsqiUzMP12Fmhupx9TECWz062E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNWl8nZ+cD9X8QZvIUBNyky0uQSYoO/FEXc3t8oRWzMkLZQ2uv
	Qy9ZG3vOQ7Z6ftirqhkrTbPJjng2mJshd9Cc2vxR3+yeaQxHT83bTYE/OnTV4WNtNTBTxvMRDZV
	Wunp90Pm5vy8PB8TV43Y1F8uT5Tnj+TlSVC8mW1Aw
X-Gm-Gg: ATEYQzzZXWypx0VxKHyZ9JeMsHzWDALPsmDqYuxrZGj7L7f+qvh1bO6OGssnowRHsH/
	Er0K1AXNUNWbRhZxScP6twjwUaNo/NctQgRjque6ZzapDzlBmNrXUR76DWPI5UvSp1fEGmS+u9m
	AnfLImhrl7LNUc4JOoo8bjEKxFu4l+sVTxH8oe1kZQdHHBwHHG9LRfN530f6YSWHiMWWKmUwYA3
	AQi8DZkLD4m+mj1OFXGQaTeEw2ySnhZm+o4n//bn2bPmewNYGaMFr8GglbggzcPVD73V6whWZwM
	fhwsrAbXQSwNr/V7S5Cc7vRXUX+sh1F+SFT6
X-Received: by 2002:a05:6512:2206:b0:5a2:7ddd:ec16 with SMTP id
 2adb3069b0e04-5a29b99baa7mr981433e87.40.1774426138566; Wed, 25 Mar 2026
 01:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325071951.544031-1-wenst@chromium.org> <93c1d325461cc0ffad890d64870de680506338c4.camel@icenowy.me>
In-Reply-To: <93c1d325461cc0ffad890d64870de680506338c4.camel@icenowy.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 16:08:47 +0800
X-Gm-Features: AQROBzAcEDSwfaWS447vAKoAeNwXBwZATTBP1wT6QXTz02f-QcFivNXEvPY79i4
Message-ID: <CAGXv+5FL2rs35V4F0bwq-a4ccvFaWKcr1cuKxT6sfTj9h+d6iA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] powervr: MT8173 GPU support
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 4:04=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 15:19 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi everyone,
> >
> > This is v2 of my MT8173 PowerVR GPU support series.
> >
> > Changes since v1:
> > - Adapted to changed DT bindings
> > - Dropped driver change
> > - Use same power domain for "a" and "b" GPU power domains
> >
> > This update was requested by Icenowy.
> >
> >
> > This series enables the PowerVR GPU found in the MT8173 SoC, found in
> > some Chromebooks.
> >
> > This version is different from the initial powervr driver submission
> > [1]
> > in that it splits out the GPU glue layer support out of the powervr
> > driver and into a separate clock and power domain driver. The glue
> > code
> > is otherwise the same, and also the same as found in the ChromeOS
> > kernels, with some extra comments and macro names added where
> > possible.
> >
> > Patch 1 adds a binding for the glue layer, called mfgtop. The glue
> > layer
> > contains clock and power controls for the GPU.
> >
> > Patch 2 adds a driver for the glue layer.
> >
> > Patch 3 adds an entry for the MT8173 GPU and 6XT series to the
> > PowerVR
> > binding.
> >
> > Patch 4 adds an entry for the PowerVR 6XT series GPU to the driver.
> >
> > Patch 5 corrects the clock for the GPU (called MFG) power domain.
> >
> > Patch 6 adds device nodes for the GPU and glue layer to the MT8173
> > dtsi
> > file.
> >
> > Patch 2 and 6 depend on patch 1 to build. I suppose some common
> > immutable tree would be needed from the MediaTek maintainers.
> >
> > The kernel driver successfully probes the hardware and loads the
> > "rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies
> > [2].
> > Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt with
> > the powervr vulkan driver enabled. `vulkaninfo` gives some
> > information
> > about the GPU (attached at the end), but running the `triangle`
> > example
> > from the Sascha Willems demos [3] with -DUSE_D2D_WSI=3DON as
> > recommended [4]
> > failed with:
> >
> >     Can't find a display and a display mode!
>
> I think when using D2D the demos want width and height to be explicitly
> specified, otherwise it seems to hardcode 1280x720.
>
> If you're using an elm, could you try to add `-w 1920 -h 1080` or for
> hana `-w 1366 -h 768` ?

I only did the basic `vulkaninfo` test this time around. To do anything
interesting probably requires the Mesa 26.1 release.

    PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 \
        vkmark --winsys kms -D b81f54f8568deb0fb70a6a1ed845b65d

just reports "Error: Device specified by uuid is not available"

This is with Mesa 26.0.2 packages from Debian testing. At least now
have the powervr vulkan driver enabled by default, so I don't have
to rebuild the packages again.


ChenYu

> Thanks
> Icenowy
>
> >
> > Same program worked correctly on a BeaglePlay and displayed a color
> > gradient triangle. Not sure what went wrong here.
> >
> > Anyway, please have a look and test.
> >
> >
> > Thanks
> > ChenYu
> >
> > [1]
> > https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walker@=
imgtec.com/
> > [2]
> > https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powerv=
r
> > [3] https://github.com/SaschaWillems/Vulkan
> > [4]
> > https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@=
imgtec.com/
> >
> > Chen-Yu Tsai (5):
> >   dt-bindings: clock: mediatek: Add mt8173 mfgtop
> >   clk: mediatek: Add mt8173-mfgtop driver
> >   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
> >   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
> >   arm64: dts: mediatek: mt8173: Add GPU device nodes
> >
> >  .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
> >  .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
> >  drivers/clk/mediatek/Kconfig                  |   9 +
> >  drivers/clk/mediatek/Makefile                 |   1 +
> >  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 243
> > ++++++++++++++++++
> >  include/dt-bindings/clock/mt8173-clk.h        |   7 +
> >  7 files changed, 363 insertions(+), 1 deletion(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
> >  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
