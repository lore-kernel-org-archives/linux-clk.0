Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC9F382281
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353224; cv=none; b=BLmJIL+ch9gy24U+9hPkNAT+/kyJI4a1TM0yTudTQKiQk/OC2Qj34PqVZ8grz8bnaVcW1ggtb4wW3HwPHMUfZOTrS8J1JFTfa791yKCGRPYIrWVsFpYqlpyOFsaPBX8o86wZjsJAtXmpdGP08QsMgxyGcLW/QzYG76ovtu1UWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353224; c=relaxed/simple;
	bh=xA4oLUwYAJfz0ySyu4MhuVl6/+1Zb1gL0iL0dGi6qZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eLMjtln70pwFXpxYffSytx44iVskPepA1LrYY3Nt/2BLx9u7BLUZg5bxuU1J6XvpeQNuBXKUAjK9OvzRcnJjjyt7OqUFUeYQK/TDH7e6Hn9jb7kWwFEcHDXKwxkE7GWmoq9G3xOYmC1Yah7fFgu3q90SvelMzvuU80a53fiYtbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFoatCIM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFoatCIM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso39518475e9.1
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353220; x=1778958020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJOgLdtwku62ymp2K2MnoFiWaCIU8dOodRBTGK0ZfaI=;
        b=IFoatCIMLwKRXYU6Vu4f95i7zZP05wYpFd8fIyeqn2cbtZqsQ05VgOjXK0JExzqREz
         vv6luRifXFvPFuWW/Kh5mOYHMRqARWDuo4CbZaCTNdf4xfREEWOg/6ZovdQ87jzaoY4G
         CnkQkzg53fcuyDhinHLEJLxVi/YJaQM7wGTqFCzM04FqqmYWHnAI9Nu2j0ufvn+AcRAI
         ApUo9ZzjjVaD7dKEvsOl2H7Oz9DPrPjnFEaIAbNHoCXC+AVb99JFG5y+ERusGdkLPGJO
         qghgR6k7tn5Nk6+VLIMAoow6NVexZRYwBSuqOIALCF29h9leuBRkphKYS1sAt7KlPx/0
         7gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353220; x=1778958020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJOgLdtwku62ymp2K2MnoFiWaCIU8dOodRBTGK0ZfaI=;
        b=R4Zqar66QRuIN3UIk0k2hlwcbkhW+S0LWEUk2MCOX7uXx0vE2fwNZuRfw5QRqrh5+/
         npn4QKfJ17zUSu94D3o9kxyr7FqjlT58xZ0W9n82buNll4ibfKr5w2HhoePpSwf159kS
         8FFdfWMSk7kLckZesAM9MFIqJx0PgIBNWflDnFNGkfmUMSuKl3SEQlsFBqGFPLThI5jj
         HJg+kMm2f/7sRmtHG/yALYQLoTEyqgcrna6jk7ou+gw8kJR70zqkxmoxJzV1IoZmMIHQ
         SyrUsajvU3Rpt/7ZSH4SOH/e5zQpEZvID7p9lUMFiaVI2VtfOWOS51XSkf3KiosjcsKY
         024w==
X-Forwarded-Encrypted: i=1; AFNElJ+GEHBaVW1TtbMwAASlJm81ZviiHPeElM0ZgNL8nZFcJoeGWvfDh103ZJfKZcJAEGOk3YVuyNbwYJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEuRUSVBRYe0K1ldNxyuYymVLaGeoEeL+0DF8eL0Hht2a1dC56
	yQli75LQAA+V/9CxX8bVHJcGuA6A4ipUdmdehDzp4pR+5SJReLnNLQ/a
X-Gm-Gg: Acq92OEneAqthBwJmhIPYv9jADFAlLHiQr4XXC+brBLMeupqVzr8CM5xqlJJInmYGtz
	GjsymZ6Di3OdiD6zDhuqPac5R4mtdELg7D623C0L0zeSwoA8ipGCfcOrue8DAx2E1VTmE0sC7vG
	+a+9LL7plU44cKoamhUpE0k0FGzXiur+28LnMA3WtafObqo/83vHDtjkveVEhctRveEdTIyACjv
	Do6rsqMPGK2S9EtT+dFJrIBpEBywZ2UYLCd7ke+1hoL33kN2a+VyXdrleD1FHzpy9YUodgdj7WF
	OLG6/djz+k6utByncvXyeAUzqT/YMCPM8gcOxqko210b63FGF4A9BazN/HpsV3gkxD6XeeMb1HS
	0qqzppga/Up8h892uGOrTjg/iHDunlf57Y9FK8OuQQgLJ64e2hvpYZgHqMcACFxLvxJ2QEIfCr3
	nl1Bc0PnngJRq9gv6EiD5RnN4D1QaCGW4yASvs7tGp/zgjbkikcWyodN7Dly+rKGsAWc0=
X-Received: by 2002:a05:600c:3b20:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48e5dfcd4a9mr171071145e9.3.1778353220094;
        Sat, 09 May 2026 12:00:20 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:19 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 0/8] drm/sun4i: update DE33 support
Date: Sat,  9 May 2026 21:00:07 +0200
Message-ID: <20260509190015.79086-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is second series out of tree which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Fortunately, no user of
H616 DE33 binding was introduced, so we have a chance to update bindings
and introduce proper DE33 support. Issue with existing binding is that it
considers planes as resource which is hardwired to each mixer as it was
done on older Display Engine generations (DE3 and lower). That is not the
case anymore. This series introduces new driver for planes management,
which allows doing proper plane assignments.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (8):
  clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
  clk: sunxi-ng: de2: Export register regmap for DE33
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add planes driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: switch DE33 to new bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  87 +++++++-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 201 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  41 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 +++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 131 ++++++------
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  40 +++-
 11 files changed, 567 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

-- 
2.54.0

