Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E901B7083A
	for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732203441; cv=none; b=pPqh2MPglPD1WRTrzUD8b0H0faVj+fwhgI5WxZ2Q+rhXEY4csj8obAPivWbovGpuks4Uw0P1gncoxCw9aRG+PFm/C0mxxK5OvKRzahrRGO/fgTB3d3dGvzoXSlkstJWevb1lZZhfm3J/hYuw92aXY8nduL0TLBZ/OnExmuXCkOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732203441; c=relaxed/simple;
	bh=hyM4vCib5BHN+oOIl3oJQy667UjA0LMFpe257ZTgAkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSAv/BBS7pitilBecPskveQPcanLKO+sBQJtDIM4hW9Ziu6TCyA4RlPNg0H7vEJmc0AdJAvE0fXwU6EVnAtrGg9p8LfdYzV617ri8AW3AwdU6N6r+ECmeKrw71+9i2ucc/qO/TTIXpHKa/eb55JrHbXIj8+WSYOtCJ9hm2L9n2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=EKojV+J3; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EKojV+J3"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6eea47d51aeso9968577b3.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732203439; x=1732808239; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kP6pOE3po/1ziJMcsJhojsNldXrvD7NcZzZfzxDnn2Q=;
        b=EKojV+J3lRwrz20olLhEmlNUV99Kdgrg0D4h5jkJdQItKoZTsk4e0uIankhhrY/dU1
         5kB+dXZgI++9m02pacgV7YouPwsO0sl4lswz7BzMHLRajjM02mFk1Bz4qOSm14B1vfLN
         oFET06wj4rgvIE/dbA7UPyt8gHytoAvVczFIplRN+8wh3dV0OvuZFvbMWtAJJgd+PluL
         1fVYteHairwp58Cu9dY1pc+rkGKPUTwDFw0aDW4t3Q0QgbJpAjDHCswRI7KtccSy9AVR
         go0e9WWetKJn4HmyXB+k2dTTNcjMPg0BZ4W7ESzs+CdqtedE/g35GDJaYFJ6ICk/lEtg
         Gclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732203439; x=1732808239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kP6pOE3po/1ziJMcsJhojsNldXrvD7NcZzZfzxDnn2Q=;
        b=uzmcaJfrvtyFKVp5DiIvj7LFWvkmJamPDWRhB70RGJE4P2kD7zpI+EfUcH72YMdSO2
         539PcjyG/tYRweeFZBOeuW2QEtFUXlNvNwUkUrrEKsjpGs99TR4AlF14tbdoLCffLFeX
         eZFRjey9lP33hGwZXWpsk/gXd5dnUTscjNvOAIjmyVk/mkvZ7tptUia1aoYv5IUiAQA/
         YqPmGJL2CpmLmYtKm3EZICVdcW791fxZOX1HBCsh+xvjCZUgz/tZCOT6MK8Znxm2fJSi
         MNjpaLrce/HlEy8HPq8mqRUkPyX7DRYgA4pHIZyV9EPy+ejBC0H5seg/Ps0qII9B1HYg
         jGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWius4/M46H13A+csPlkanhQ1g3co/TgkzC5wEdDBzqvum5G00uUko+FtDlt3e3t4lOFzoBUhagqAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcOBJh7nGbTf4RRTeXt3CeSEKdWenJggxaKbL0kNqpp1ucLS0H
	Hxf+1ojK97VhmRYWwBbjDawzcwbnddeACDK66PN31njlYoShdV4byrFuN7BEWaqKz9zTwaieEQ2
	sI0jpsfApaB209pZHuI4qX+9WQhldTl3D15SdQeFZrq/95q6h
X-Gm-Gg: ASbGncutyPKNV/VEQ4UVPAxIHUlFdxWuTOv8K+6svo4HxFbspS73mbFOUvtbFWOQOFI
	pMlTWKCGWxvH+PSneV6OWFULdVT0tQwI=
X-Google-Smtp-Source: AGHT+IF8UTnU+5p7nKbdKVjbrthoiYcBYTuLfXNVkQGbQk0KfLyktr9CA5uLVCOTpHwOyzUd5aASTSTl99WTmj5pohI=
X-Received: by 2002:a05:690c:6283:b0:6ee:9cb7:dc24 with SMTP id
 00721157ae682-6eebd2b24cemr74692547b3.38.1732203438928; Thu, 21 Nov 2024
 07:37:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 21 Nov 2024 15:37:00 +0000
Message-ID: <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display hardware
To: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Dom Cobley <popcornmix@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 17:50, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> This series adds the required DRM, clock, and DT changes
> required to support the display hardware on Pi5.
> There are a couple of minor fixes first before the main patches.
>
> Many of the patches were authored by Maxime whilst working
> for us, however there have been a number of fixes squashed
> into his original patches as issues have been found. I also
> reworked the way UBM allocations are done to avoid double
> buffering of the handles as they are quite a limited resource.
>
> There are 2 variants of the IP. Most Pi5's released to date
> have used the C1 step of the SoC, whilst the 2GB Pi5 released
> in August is using the D0 step, as will other boards in future.
>
> Due to various reasons the register map got reworked between
> the steps, so there is extra code to handle the differences.
> Which step is in use is read out of the hardware, so they
> share a compatible string.

A gentle ping on the patches for clk-raspberrypi (patches 29-33) and
Broadcom DT (patches 34-36).

All the DRM and dtbinding ones are reviewed or acked (thank you!).

Thanks
  Dave

> Thanks!
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Dave Stevenson (12):
>       drm/vc4: Limit max_bpc to 8 on Pi0-3
>       drm/vc4: Use of_device_get_match_data to set generation
>       drm/vc4: Fix reading of frame count on GEN5 / Pi4
>       drm/vc4: drv: Add support for 2712 D-step
>       drm/vc4: hvs: Add in support for 2712 D-step.
>       drm/vc4: plane: Add support for 2712 D-step.
>       drm/vc4: hdmi: Support 2712 D-step register map
>       drm/vc4: Enable bg_fill if there are no planes enabled
>       drm/vc4: Drop planes that are completely off-screen or 0 crtc size
>       arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
>       arm64: dts: broadcom: Add display pipeline support to BCM2712
>       arm64: dts: broadcom: Add DT for D-step version of BCM2712
>
> Dom Cobley (3):
>       clk: bcm: rpi: Add ISP to exported clocks
>       clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
>       clk: bcm: rpi: Enable minimize for all firmware clocks
>
> Maxime Ripard (22):
>       dt-bindings: display: Add BCM2712 HDMI bindings
>       dt-bindings: display: Add BCM2712 HVS bindings
>       dt-bindings: display: Add BCM2712 PixelValve bindings
>       dt-bindings: display: Add BCM2712 MOP bindings
>       dt-bindings: display: Add BCM2712 MOPLET bindings
>       dt-bindings: display: Add BCM2712 KMS driver bindings
>       drm/vc4: drv: Support BCM2712
>       drm/vc4: hvs: Add support for BCM2712 HVS
>       drm/vc4: crtc: Add support for BCM2712 PixelValves
>       drm/vc4: hdmi: Add support for BCM2712 HDMI controllers
>       drm/vc4: txp: Introduce structure to deal with revision differences
>       drm/vc4: txp: Rename TXP data structure
>       drm/vc4: txp: Add byte enable toggle bit
>       drm/vc4: txp: Add horizontal and vertical size offset toggle bit
>       drm/vc4: txp: Handle 40-bits DMA Addresses
>       drm/vc4: txp: Move the encoder type in the variant structure
>       drm/vc4: txp: Add a new TXP encoder type
>       drm/vc4: txp: Add support for BCM2712 MOP
>       drm/vc4: txp: Add BCM2712 MOPLET support
>       drm/vc4: Add additional warn_on for incorrect revisions
>       clk: bcm: rpi: Create helper to retrieve private data
>       clk: bcm: rpi: Add disp clock
>
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        |   2 +
>  .../bindings/display/brcm,bcm2835-hvs.yaml         |   5 +-
>  .../bindings/display/brcm,bcm2835-pixelvalve0.yaml |   3 +
>  .../bindings/display/brcm,bcm2835-txp.yaml         |   5 +-
>  .../bindings/display/brcm,bcm2835-vc4.yaml         |   1 +
>  arch/arm64/boot/dts/broadcom/Makefile              |   1 +
>  arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |  37 +
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  42 +
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 188 +++++
>  drivers/clk/bcm/clk-raspberrypi.c                  |  34 +-
>  drivers/gpu/drm/vc4/tests/vc4_mock.c               |   8 +-
>  drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     | 106 +--
>  drivers/gpu/drm/vc4/vc4_crtc.c                     |  96 ++-
>  drivers/gpu/drm/vc4/vc4_drv.c                      |  19 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                      |  54 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     | 112 ++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   4 +
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 | 640 +++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h                | 217 ++++++
>  drivers/gpu/drm/vc4/vc4_hvs.c                      | 737 ++++++++++++++++--
>  drivers/gpu/drm/vc4/vc4_kms.c                      | 102 ++-
>  drivers/gpu/drm/vc4/vc4_plane.c                    | 866 ++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_regs.h                     | 297 +++++++
>  drivers/gpu/drm/vc4/vc4_txp.c                      |  91 ++-
>  include/soc/bcm2835/raspberrypi-firmware.h         |   1 +
>  25 files changed, 3464 insertions(+), 204 deletions(-)
> ---
> base-commit: 91e21479c81dd4e9e22a78d7446f92f6b96a7284
> change-id: 20241002-drm-vc4-2712-support-9ad3236e3caf
>
> Best regards,
> --
> Dave Stevenson <dave.stevenson@raspberrypi.com>
>
