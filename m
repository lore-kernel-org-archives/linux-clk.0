Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8771A1758B;
	Mon, 12 May 2025 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065090; cv=none; b=tW/4P74h7RYNNGtEPX7gx9HZmbRzLX66E+RzCGJSc/bDz/W2Cluq7JRtNcz4N9KW0NrprGmmTL7SP3egs7SuecdWiOIacNr+TSzVfEKnpjGcc1p6ObKPoo4GlAXPstLViIQjlyfhZkfeo/g1PSCiw3HrvOJe7ddxXhqt6TSV9CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065090; c=relaxed/simple;
	bh=4ozyet6Am4uOrDkpvVbP07Tzp8wHAIN5Eeov69emIjo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhHhBtd4HgsPExoSJN3/Phj9vF+5aVuQLR+RuPwW+bZo64izFgVKMD4J6SmWEjMPubJEgWp246/B93k2LvlmKQcj9bsxsjSWPZlwXBWwlw+t2JurOglDwLvm5SCTjEDDYCbzLzkeDPn3eqAOUNCh2BY+g6e+0Ncy6AYZT7wQ8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fx8KFETA; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fx8KFETA"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c3b863b8eso3310381a34.2;
        Mon, 12 May 2025 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747065087; x=1747669887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld9Mq7+qdXV9AhMC/9M7vzrYD56VNJUHYiEJWfb0qDk=;
        b=fx8KFETAqOcdZLLYgt0VKtK1GhAlTRebjWF5t8Cx672DymKfXy+U1zaO3rPm2yPHXx
         2na5oioKe8GU1gO/fX2uq6XJKAGg57fbxH19WoRjYDgDLvJ78wThogVMWFEYaq5XW8pO
         BHJt8T04xSBky7z/KlRhXb5T5WVISGDYU/PEA22gTOHXfipahVxqUoejLClPBoPRIy+N
         8V9ue4qQpqUQriYzR8pBa3xQzByrJXPCC0mDvxX24SkJV4AuSkUZG8OExUWAosPVcEfa
         LrGWgl8OjHWJiczj311kEZMxwd7saqHWh63BoXT3SMKg+L8vGEY6EhIS9bt7p+dLSJIp
         9XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065087; x=1747669887;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld9Mq7+qdXV9AhMC/9M7vzrYD56VNJUHYiEJWfb0qDk=;
        b=Sc/8aE8EaJnY95f+4a0CHuNBS1HzMDdStznzeXdNY2je3teiOuoNBnELPondGkGpwP
         EwbonIwKyeo1jbyVWgbcqwDSRA69kvrp9S0DS2WE+LOo3z7q/Q8+dormrIzVqpYUu6c5
         v/SBPUpbrceZrevbbY9ch0Mwtl1xlHUvYoHiFzKVBWcb4Vf1DdE8U3qk2VjDfGYpG6Oy
         QEkfvUrGi538DDsZLGFVmFidJ89snK5eh4n+fLqDTUSm/Y6ef0V39YSnIj1/CNwKZlUb
         WUXvJ06e60R4+GeXcgYMOYM0MbtBX33RqAtMdN0s+1XG2urCavnelT31sTLuGp49dj6u
         +dmw==
X-Forwarded-Encrypted: i=1; AJvYcCVCdqSZlW7xtonR4t7ADWL7MFTcHFraMpDOnKw6E+EPGrfAPio5z6kdDhIKBUR61Ms5AL250rpFxwjM@vger.kernel.org, AJvYcCVHmaLlxnTKVOEwDVJZervdYKU4ztw/QUmV9B3BmGPRgiXl9ne+TSYq/iLtQdx02AYhZN9og4v3qGSm@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBLVsBczR0ncTLup7zje+GT6th+odXw6kpQMvxjUs94WvYh6m
	94YB+SFuD2QOMAdIQn7+MN3aMP4J4ZGUW6JWcWhso2zln7Bw5Kv6
X-Gm-Gg: ASbGncucNnaIy2lWwTrlaBe0SzVkS56Lbc05Lnin0T4TzYUjyPEbMCTD/uWRV7ybP+w
	0yy44NqCfOunlB2CD9SWi+R9+gpA+xX2jYnViXdX25M4brcj6SykYUwliUVYoWall3JvywPP7hb
	EU2q9C05Hk1zxlQOqjfm165PXjvZD1LT85v52OXtG115JJ5Gym78FJRGfScfJFnblDVfvQ34Fa+
	8gpmBIVuiNx3lduEfSMSW/8Foefw4mmRnfX9u6+BWUUGOrjx5G09p2p8mN/RnESMlVu8XF5+PD1
	qvX65HaB35aLQxT/Tr3+C1C6+XbQySZBGWzCINrQ6iPYJZYXRjvYN6b4uMdThz8xtXQTmw==
X-Google-Smtp-Source: AGHT+IE29HCnAnqJs70fjiVznu2cWndCXxPM0MBn2LaCtm8l99A+94DcdAaY4Wmxo+5EpZLx6ztYiA==
X-Received: by 2002:a05:6830:6f44:b0:72a:45bf:18c2 with SMTP id 46e09a7af769-732269c4577mr9487337a34.9.1747065087378;
        Mon, 12 May 2025 08:51:27 -0700 (PDT)
Received: from neuromancer. ([2600:1700:fb0:1bcf:25f1:2610:e3fc:c8ec])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732264dd290sm1579539a34.40.2025.05.12.08.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:51:27 -0700 (PDT)
Message-ID: <682218ff.050a0220.149fee.dd6e@mx.google.com>
X-Google-Original-Message-ID: <aCIY_ca5PEdgItxE@neuromancer.>
Date: Mon, 12 May 2025 10:51:25 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 00/11] drm: sun4i: add Display Engine 3.3 (DE33)
 support
References: <20250511104042.24249-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>

On Sun, May 11, 2025 at 10:31:09PM +1200, Ryan Walklin wrote:
> Hi all,
> 
> v10 of this patch series adding support for the Allwinner DE33 display engine. This version is largely based on the previous v8 patch, with Chris's changes to the mixer bindings in particular from v9 to add names for the new register blocks. As discussed, the H616 LCD support patchset (which are largely device-tree now that the clock/reset binding definitions from v9 have been taken as a subset) will be sent separately with the rest of Chris' updates.
> 
> As noted previously the new YUV support in the DE3/DE33 and RCQ/DMA shadowing in the DE33 requires more work and discussion, so that support was removed from v8 and this patch supports RGB output only.
> 
> Regards,
> 
> Ryan

Thank you Ryan, I will just defer to you moving forward to ensure no
further confusion on this series and will help out wherever I can.

-Chris

> 
> Jernej Skrabec (7):
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add mixer configuration for the H616
> 
> Ryan Walklin (4):
>   dt-bindings: allwinner: add H616 DE33 bus binding
>   dt-bindings: allwinner: add H616 DE33 clock binding
>   dt-bindings: allwinner: add H616 DE33 mixer binding
>   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
> 
>  .../bus/allwinner,sun50i-a64-de2.yaml         |   4 +-
>  .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       |  34 +++-
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 +++
>  drivers/gpu/drm/sun4i/sun8i_csc.c             |   4 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c           | 168 ++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h           |  30 +++-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  27 ++-
>  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  14 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       |   6 +-
>  11 files changed, 252 insertions(+), 63 deletions(-)
> 
> -- 
> 2.49.0
> 
