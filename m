Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C481917E3;
	Mon, 30 Sep 2024 13:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703050; cv=none; b=RyqDp05lZZVCXFqE1s8xh4QN0kpvWVWwQrSVv3ihjO3IKu9H/g431uIIrD+tbBfQBYp3wm6vVVEBdTpRJ0O1kHQ9FsXdKFCBF2fN1I8hq7zsBOv8q8F9RZNYwAzOHuHSmhpvy2gDvqq3XEVYgl/YFP5+V0jGB/XqxuesKcoy7nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703050; c=relaxed/simple;
	bh=ePkwtQT6/4Cq2HZ8KpvTAjNnR21nQSsuIYyy7vgW8wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1jp4dL2iimobOcdZL9f+0gbCONGz94of6Kyneiq62ln4oZD88lF9CAHtfBsCeh4LP8HIh1NjXNKXXf4UZCB+nD7D0S30SYXRNtQONV+APoX+qRodjQTyk5jqUtFAQmx7kbKWepEbnh7faLxzBz1LOrwrPCVPY8gZheM/ckk3dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vk7X/BbD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vk7X/BbD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cba8340beso31964025e9.1;
        Mon, 30 Sep 2024 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727703047; x=1728307847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=669SAUt6DB/YCk3+uBSXggdMgGuLS/T1kAFZBFKZNj8=;
        b=Vk7X/BbD9zo7bKO/aeikZpvJjEbhmxNucZJmkLKwtKW2taextXDvR6F3wft5kJHqa3
         VAh8OdE4Pr/2w2S57TTJ6qAy8LuLblnL3KkozPxTDMYA1EVgCA69MIfJcumNnVL1/ZyR
         xxzy+HfeAN8SX94mZkhrUquzQef2kP5Ko7o80+SnJdzKkabe6G1WbAPU2+yMM3QXCW7o
         GWU4too5lE0vxTFz0MQUoK+OYH1W+WPEFDkAuIX0r9hgjjb677LUrLxpf5ijWy+TGhHp
         bLSZfUQcBHxxD1wbP/OU0/6WhCyp0fk0seb/ni6apz53E72YzkRFxLHBjZd/+e/Cljp/
         HlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727703047; x=1728307847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=669SAUt6DB/YCk3+uBSXggdMgGuLS/T1kAFZBFKZNj8=;
        b=WlAAg3IFxx3ZZ4EkwJfQKTiC5Hbc9++3KqzTYpr7FDtkPFSPqKtPUCaTcGzB2ckyjU
         lqtD1AbUPv3bCjMj4B5Z5UP1YxbnE4hHg6The9BLoG5cTQMcHRogHsVqV5EZSRbUb+Qz
         tCLDdhdVa111jWhJ4RH8grkd6fX16t9nrtGVZpfaARWbLdHTBIV4HirdGQhbe2OPhtaD
         YU4RWn19JBw8ZctT/wvBYtEp+cPghdoBn06RPr2ANEewidKWquAxsW0hipZDQ1mWL3jO
         2bWRVVORPGyo20dQiXFpWpMOiJsCJQRQEwv3DYpyqXXAwQWz5D/tWpSnKtpXIGbC3Mws
         Z72g==
X-Forwarded-Encrypted: i=1; AJvYcCUohpUZ1JT8wXJVXFA88/vJx4hSy7C9mCkD0aGh75sshL4cIkUbs4A6GOGwmh2HJYrTh8lV3sNhU3w/@vger.kernel.org, AJvYcCVAKocmX7IX5FzGtCIgGBLM849ppEWsooc/hcQfjd3OzT4xGZBm1oew7F+JQUo/GpsmnHOl7R4tHJyi@vger.kernel.org
X-Gm-Message-State: AOJu0YyKAbRM+pUqmHERVVG+1Gy6pB+ntI7SLw9eO85FxOdHLM15iFyn
	BT7XTYf57JgL9fNarckV+5jFVhN5ozA4thKujEen6Az03qfpYrLe
X-Google-Smtp-Source: AGHT+IHSdoSrQ33WNXKQCM8ehHkXvjRefqgXFeUtTjgkzoAV7LF0GKY27Qv3wWHnT4PCxE+zIKfwAg==
X-Received: by 2002:adf:ce0e:0:b0:374:bd00:d1e with SMTP id ffacd0b85a97d-37ccdb09c87mr10339424f8f.3.1727703046620;
        Mon, 30 Sep 2024 06:30:46 -0700 (PDT)
Received: from [192.168.1.18] (102.242-182-91.adsl-dyn.isp.belgacom.be. [91.182.242.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575d459sm9004827f8f.113.2024.09.30.06.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 06:30:46 -0700 (PDT)
Message-ID: <cfc66e71-4af8-43c8-8b86-0bf5208b5c42@gmail.com>
Date: Mon, 30 Sep 2024 15:30:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/26] drm: sun4i: add Display Engine 3.3 (DE33)
 support
To: Ryan Walklin <ryan@testtoast.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240929091107.838023-1-ryan@testtoast.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20240929091107.838023-1-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

tested on 6.12-rc1 with RG35XX-H

Tested-by: Philippe Simons <simons.philippe@gmail.com>

On 29/09/2024 11:04, Ryan Walklin wrote:
> Hi,
>
> V5 of this patch series adding support for the Allwinner DE33 display engine variant. V5 is rebased on torvalds/master as of today with the 6.12 drm-next patches included, with no code changes required. V3 and V4 were in turn rebased on top of the layer init and modesetting changes merged for 6.11. No functional changes from V4, fixes and reviews from previous V1-4 added, and relevant issues found by checkpatch.pl corrected.
>
> Original blurb below:
>
> There is existing mainline support for the DE2 and DE3 AllWinner display pipeline IP blocks, used in the A64 and H6 among others, however the H700 (as well as the H616/H618 and the T507 automotive SoC) have a newer version of the Display Engine (v3.3/DE33) which adds additional high-resolution support as well as YUV colour formats and AFBC compression support.
>
> This patch set adds DE33 support, following up from the previous RFC [1], with significant rework to break down the previous relatively complex set into more logical steps, detailed below.
>
> 1. Refactor the existing DE2/DE3 code in readiness to support YUV colour formats in the DE3 engine (patches 1-4).
> 2. Add YUV420 colour format support in the DE3 driver (patches 5-12).
> 3. Replace the is_de3 mixer flag with an enum to support multiple DE versions (patch 13).
> 4. Refactor the mixer, vi_scaler and some register code to merge common init code and more easily support multiple DE versions (patches 14-17).
> 5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned. (patch 18).
> 6. Add DT bindings for the DE33 engine. (patches 19-21).
> 7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scaler, fmt and csc module support (patches 22-26).
>
> Further patchsets are planned to support HDMI and the LCD timing controller present in these SoCs.
>
> Regards,
>
> Ryan
>
> Jernej Skrabec (22):
>    drm: sun4i: de2/de3: Change CSC argument
>    drm: sun4i: de2/de3: Merge CSC functions into one
>    drm: sun4i: de2/de3: call csc setup also for UI layer
>    drm: sun4i: de2: Initialize layer fields earlier
>    drm: sun4i: de3: Add YUV formatter module
>    drm: sun4i: de3: add format enumeration function to engine
>    drm: sun4i: de3: add formatter flag to mixer config
>    drm: sun4i: de3: add YUV support to the DE3 mixer
>    drm: sun4i: de3: pass engine reference to ccsc setup function
>    drm: sun4i: de3: add YUV support to the color space correction module
>    drm: sun4i: de3: add YUV support to the TCON
>    drm: sun4i: support YUV formats in VI scaler
>    drm: sun4i: de2/de3: add mixer version enum
>    drm: sun4i: de2/de3: refactor mixer initialisation
>    drm: sun4i: vi_scaler refactor vi_scaler enablement
>    drm: sun4i: de2/de3: add generic blender register reference function
>    drm: sun4i: de2/de3: use generic register reference function for layer
>      configuration
>    drm: sun4i: de3: Implement AFBC support
>    drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>    drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>    drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
>    drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support
>
> Ryan Walklin (4):
>    dt-bindings: allwinner: add H616 DE33 bus binding
>    dt-bindings: allwinner: add H616 DE33 clock binding
>    dt-bindings: allwinner: add H616 DE33 mixer binding
>    clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
>
>   .../bus/allwinner,sun50i-a64-de2.yaml         |   4 +-
>   .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
>   .../allwinner,sun8i-a83t-de2-mixer.yaml       |   1 +
>   drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
>   drivers/gpu/drm/sun4i/Makefile                |   3 +-
>   drivers/gpu/drm/sun4i/sun4i_tcon.c            |  26 +-
>   drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
>   drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
>   drivers/gpu/drm/sun4i/sun50i_fmt.c            |  99 +++++
>   drivers/gpu/drm/sun4i/sun50i_fmt.h            |  33 ++
>   drivers/gpu/drm/sun4i/sun8i_csc.c             | 341 +++++++++++++++---
>   drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
>   drivers/gpu/drm/sun4i/sun8i_mixer.c           | 226 +++++++++---
>   drivers/gpu/drm/sun4i/sun8i_mixer.h           |  31 +-
>   drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  41 ++-
>   drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
>   drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 133 +++++--
>   drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
>   drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
>   drivers/gpu/drm/sun4i/sunxi_engine.h          |  34 ++
>   20 files changed, 1269 insertions(+), 205 deletions(-)
>   create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
>   create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
>   create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
>   create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h
>
