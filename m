Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42512130499
	for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252594; cv=none; b=Al7B8jcrL3Sja+E2JFDeO08kl9FQC4D7l7MTSjBi0s3ycv2AIcCer7IfaVtoE5s1mvDIVXosrJuc1TL2XaCFgtotDyc5cMKqQlfhMImklZwjJqHsS8Gd5zoZAm9rgaFgP0v1GAo0E/GDicWGpJWzenwXdkQtwcVgmypK1BJvnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252594; c=relaxed/simple;
	bh=EtnlEj5BPoth2an6W4ESD/bR67NE6LAL5OBhxnyYCVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PrUKQFyD4lnciiKa4P1bHAltQ0FfXvL/bXvkTC+sm9WRhBck2BX5naLGqMcrfAicPUSBAe1D4fAUWnQDUy0PkKUQli1FFvc176JKf5n/x9t1/8UovRd0GhmMqoVzH2CrnpBy4rFTws3xB9G4xCZW9alZqM/9A6rUqclsD+VICdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tvo7Haqo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tvo7Haqo"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cc4e718ecso241546f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 01:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252590; x=1727857390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wzg7D4oKky5+3kPOwN3vVZTGu28S/XV+QD50k2fkJd8=;
        b=Tvo7HaqoWGSPEvpESRMgHqtYTZmDgSkZWCr8fqP+C9WyxLqrsm2aJBEknouCIYEHvu
         14a8GY7/Dsx3m/fAYiwVivfQF2IWV6QTRGIq2Tj0W+vvOmcCuC/cY39ECHCj83IqYQG4
         aohAZVCTkBEiPWmy9MUu4E5yiFnBQMW3fHIKG9mNeTUdRvbPF/C4k9q/miGwJegRjB12
         b1kochmWhMU5KD8Eh0L+ijrfEg6MIWakDo6mptk24Gs3WXf37B8KJVfJStCj2V6OkMTz
         en4yWe8kl/C3DyY/fHys/0y/mbcf0EV1zsaSZiw+SUcIcpLjAGEXNWZtRnaHOwyHisoS
         k4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252590; x=1727857390;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wzg7D4oKky5+3kPOwN3vVZTGu28S/XV+QD50k2fkJd8=;
        b=RuFiv+KwRiM/Uu100oM18siDeVsusWwo2XHkceD/PQffhkB7c1nMgf+S14FJsQoibm
         6Ds/tCPVmPO6V3QpXG8Jw/pItqkhBwwB7a9Bt5iIdcAEu54WPd5zJylH7wGTj5FtpaC2
         /rqdrA+6kGveVUVTfX9XF8I2swbGHxx0Ww/Sts3wMvcqdiyNW5M5mPQF6bUQW3xLn7rX
         q57cdAyAYxRzlz3wKZjExKyutK0rbFE2J2wzPZAdTFofP3XoM89QUBxAL3ix8SkP0MRG
         EZ9AZNFsCkvTIQdYtYbQpjgrT62OaoA+RkQGpjFYBH2OQ66BDnYfoUYcrDauaNuoSQ9K
         kO0g==
X-Forwarded-Encrypted: i=1; AJvYcCXLwBZ7jlrhFtyE8vs6MhcuZnQ9XE+MQJBjOCVyZdVeUjfPHNBv/qWlBDTnl4Gcxqc8O/a7j8xpYuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1QbnJ7N3kVBgRrSj4Nu1jzo6ohODlVB8G3fnWpsS/91ghtkG
	KcnhYCsOY1MBMHOj8O/kfpPEsMpkl8F19jMkJpeyOWZ/S3SRz6eubPenxVvtoWw=
X-Google-Smtp-Source: AGHT+IGETHE/X4esE42miSDoeNFaK9g9vbG+kkIWo8WUvpwJ3K+Mdg5qaJEHKAV4EV3TkiFYuWA+mw==
X-Received: by 2002:adf:fa90:0:b0:374:bf1b:1c20 with SMTP id ffacd0b85a97d-37cc24760dcmr1190372f8f.23.1727252590318;
        Wed, 25 Sep 2024 01:23:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddfc9sm10949145e9.5.2024.09.25.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:23:09 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:23:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ryan Walklin <ryan@testtoast.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v4 18/26] drm: sun4i: de3: Implement AFBC support
Message-ID: <cfb1d4c6-9414-4880-9edb-31e5af9f951b@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240921095153.213568-19-ryan@testtoast.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Walklin/drm-sun4i-de2-de3-Change-CSC-argument/20240921-175532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20240921095153.213568-19-ryan%40testtoast.com
patch subject: [PATCH v4 18/26] drm: sun4i: de3: Implement AFBC support
config: microblaze-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230531.ZMb79p9h-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409230531.ZMb79p9h-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/sun4i/sun50i_afbc.c:236 sun50i_afbc_atomic_update() warn: right shifting more than type allows 16 vs 16

vim +236 drivers/gpu/drm/sun4i/sun50i_afbc.c

757b2767d5472c Jernej Skrabec 2024-09-21  230  
757b2767d5472c Jernej Skrabec 2024-09-21  231  	regmap_write(regs, SUN50I_FBD_OVL_BG_COLOR(base),
757b2767d5472c Jernej Skrabec 2024-09-21  232  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
757b2767d5472c Jernej Skrabec 2024-09-21  233  	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR0(base), def_color0);
757b2767d5472c Jernej Skrabec 2024-09-21  234  	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR1(base), def_color1);
757b2767d5472c Jernej Skrabec 2024-09-21  235  
757b2767d5472c Jernej Skrabec 2024-09-21 @236  	val = SUN50I_FBD_CTL_GLB_ALPHA(state->alpha >> 16);
                                                                               ^^^^^^^^^^^^^^^^^^
This shifts it to zero

757b2767d5472c Jernej Skrabec 2024-09-21  237  	val |= SUN50I_FBD_CTL_CLK_GATE;
757b2767d5472c Jernej Skrabec 2024-09-21  238  	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
757b2767d5472c Jernej Skrabec 2024-09-21  239  		SUN50I_FBD_CTL_ALPHA_MODE_PIXEL :
757b2767d5472c Jernej Skrabec 2024-09-21  240  		SUN50I_FBD_CTL_ALPHA_MODE_COMBINED;
757b2767d5472c Jernej Skrabec 2024-09-21  241  	val |= SUN50I_FBD_CTL_FBD_EN;
757b2767d5472c Jernej Skrabec 2024-09-21  242  	regmap_write(regs, SUN50I_FBD_CTL(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21  243  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

