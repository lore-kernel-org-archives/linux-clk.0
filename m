Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34E0153817
	for <linux-clk@vger.kernel.org>; Fri,  3 May 2024 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744937; cv=none; b=anwogbtqmt+6tVfZX5xMNPa2qi+gjaALfBs0rlo3WsnKJpTzMjjlenXAsfMSTJo6cg9M8j2wFfYoey3fBnHoUCqJDgBQADX5X119J8PIgmygoxiw+brl6a98uMxj+bWOfsUj9R5MwLnCae/ml025LOjM66qxWApfuKthZhECzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744937; c=relaxed/simple;
	bh=jRaxwTVoZEj22rMd4MgntiOHCOzMr5YJDhMw6qy40c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kTQ8J9+KYf4qd074Sfl4WfseP9iCCvj05Gd8xLYRACKBAVqqDeYJfnLpgklOh3Ir1+mi7KQe1zVEczsb9w0SpojR09x0W4eDTtorBt46Vl1q5GjryyldUhPNYA9vAiHpIMRCCm9EA5njtF8nLhcrcq13p5qM5NnFYb+wLALh6Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HEOz5VL7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HEOz5VL7"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso112993321fa.1
        for <linux-clk@vger.kernel.org>; Fri, 03 May 2024 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714744933; x=1715349733; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oqRCNlsdsLpb0Sbcbb6gN7OMlpokYzOYOtEiEYuehRo=;
        b=HEOz5VL7ia0DERkinaWHnhuzPeggOSQ04JpyEDN4+bcrj0gZ16CU+bF9cRUxDJgrSZ
         dWZLo9Gz+EDGKLouJYfaLUomuqoCHaVubpnQUjrO5VuIAKAifpvn30wPHddbjiuFJyZr
         SSZwsMHtJKLbROFKTa4UXA4L6XXYp7D/+qkbIsr5v2392bNgOyvdP6vZvenKDIEvEH22
         pfIglyyHpj8U+TneIuAJ6sUPV7V/zF0RokeX1fxopG3alvctaXDL5qY7/AhZvt86D9ka
         NCe3r3lc2M2itUsq7eYBw79Qq4rhPBHzHcSRV52d2xTXWgWM6uwhYcdb7bmZtUabsIky
         G+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744933; x=1715349733;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oqRCNlsdsLpb0Sbcbb6gN7OMlpokYzOYOtEiEYuehRo=;
        b=vCR27fdEq8yqwcwt2w/byCK58QfYVbFsbxNnPagRJN94XapKgjEch4oeEeRLzkHnfS
         FQxVsHjGL9pB0PIw5QxJdx1Bp3GDl4hSr7bJ4uqQbj3D89jazUqVDlyAHIv2LA6a7+U1
         t3w9kyqKEV9moWMO7Tyv/pz+dPqI/3idr4flCrLvnT6bNrhBhKTvPulLUke3GcnQFswf
         N0qFo0hq9N7GHqhaB4cFKBTpzqXU+vuFoEYxkfWoTFrv+O1rscPEqOMq8aMbPkb9iecL
         y57l1NcRaQsGLN7RR22ZG+Urg31tvWfBHWEwyVIkE99TJRC0+ihOdjiXjx5AK3QKqo+F
         FbUQ==
X-Gm-Message-State: AOJu0YyQqWpGKAQlhaPkXYptf51FoFQm/dzih0ic+WKqWfCWzs+WtwyG
	FmJQASoOcIfn9nAaf4l9c/Ri5qsROkGVBMROg8iYsiaCe7ZhUqH3HxAYFbzpckQ+cSyEZ21+9DP
	p
X-Google-Smtp-Source: AGHT+IG0VqrwvYqiGaLjQVVumDwJ8cqlqDhTmCNKVgjkIapt0H5riqjgYhUI/y0j59rcn6dCS71omg==
X-Received: by 2002:a2e:8ed0:0:b0:2e1:c97b:6f1f with SMTP id e16-20020a2e8ed0000000b002e1c97b6f1fmr1527088ljl.51.1714744932904;
        Fri, 03 May 2024 07:02:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b85:e590:355b:9957])
        by smtp.gmail.com with ESMTPSA id b17-20020a05600c4e1100b0041be3383a2fsm9499252wmq.19.2024.05.03.07.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:02:12 -0700 (PDT)
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>
Subject: [GIT PULL] clk: meson: amlogic updates for v6.10
Date: Fri, 03 May 2024 15:57:49 +0200
Message-ID: <1j8r0r3sf0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here is the Amlogic clock update for v6.10.
There is one new driver for the DSI display pipeline and the rest is
just house keeping.

Please pull.
Cheers

Jerome.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.10-1

for you to fetch changes up to 11981485e27c7e5a630ee844a2eae1f1835ba807:

  clk: meson: s4: fix module autoloading (2024-05-03 14:27:32 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.10:

* s4/a1: add regmap maximum register for proper debugfs dump
* s4: add MODULE_DEVICE_TABLE() on pll and periph controllers
* pll driver: print clock name on lock error to help debug
* vclk: finish dsi clock path support
* license: fix occurence "GPL v2" as reported by checkpatch

----------------------------------------------------------------
Dmitry Rokosov (5):
      clk: meson: a1: peripherals: determine maximum register in regmap config
      clk: meson: a1: pll: determine maximum register in regmap config
      clk: meson: s4: peripherals: determine maximum register in regmap config
      clk: meson: s4: pll: determine maximum register in regmap config
      clk: meson: pll: print out pll name when unable to lock it

Krzysztof Kozlowski (1):
      clk: meson: s4: fix module autoloading

Neil Armstrong (3):
      clk: meson: add vclk driver
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      clk: meson: fix module license to GPL only

 drivers/clk/meson/Kconfig          |   5 ++
 drivers/clk/meson/Makefile         |   1 +
 drivers/clk/meson/a1-peripherals.c |   1 +
 drivers/clk/meson/a1-pll.c         |   1 +
 drivers/clk/meson/axg-aoclk.c      |   2 +-
 drivers/clk/meson/axg-audio.c      |   2 +-
 drivers/clk/meson/axg.c            |   2 +-
 drivers/clk/meson/clk-cpu-dyndiv.c |   2 +-
 drivers/clk/meson/clk-dualdiv.c    |   2 +-
 drivers/clk/meson/clk-mpll.c       |   2 +-
 drivers/clk/meson/clk-phase.c      |   2 +-
 drivers/clk/meson/clk-pll.c        |   6 +-
 drivers/clk/meson/clk-regmap.c     |   2 +-
 drivers/clk/meson/g12a-aoclk.c     |   2 +-
 drivers/clk/meson/g12a.c           |  78 ++++++++++++++------
 drivers/clk/meson/gxbb-aoclk.c     |   2 +-
 drivers/clk/meson/gxbb.c           |   2 +-
 drivers/clk/meson/meson-aoclk.c    |   2 +-
 drivers/clk/meson/meson-eeclk.c    |   2 +-
 drivers/clk/meson/s4-peripherals.c |   2 +
 drivers/clk/meson/s4-pll.c         |   2 +
 drivers/clk/meson/sclk-div.c       |   2 +-
 drivers/clk/meson/vclk.c           | 141 +++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/vclk.h           |  51 ++++++++++++++
 drivers/clk/meson/vid-pll-div.c    |   2 +-
 25 files changed, 279 insertions(+), 39 deletions(-)
 create mode 100644 drivers/clk/meson/vclk.c
 create mode 100644 drivers/clk/meson/vclk.h

