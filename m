Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1492F39D7
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757928391; cv=none; b=PNpDzbjfLIS0WjjbvBkrZR5HXmF00SRn9cgjAgoSUi20diz9WTL92Z5FwHzNrDnoYAvYMYkDdCyz4dN8UREcQid/4axjNG1O6RbTKlLWh33W8NGnrhycDgJylPeJpAkxB5FbPLy2O7EAqjh8dQvZjUcLHHxIsA5Li7cYFz+DEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757928391; c=relaxed/simple;
	bh=NwUlZ+d9Soy2KsCDuSl1V0Mnvqrs+f+M97eGO21lPvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pV6wsW32kDjK6IQmkstwwUYZq/VyowHnthA0feDRzeCu+MNkG6t9yuLaunlfZAtoPmG0Ge0cRyi5VZoa1z2FTz2WqvQXb8wV/9niJyHExmQPHBDrOXhwAMJu37YAkChQBXhAT6Q7GkA5pmfIB9NllSad+k2tK4v5esgtKQxNjgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lKxshNvk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lKxshNvk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso42002925e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757928387; x=1758533187; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hs6GWuV18CGeToReruv/f07z6TMgsUaRPyZmMmtsSrc=;
        b=lKxshNvkbxPu1NFlNkMc6lMYHOxKWbCh9kcNbIQyiHSF7r1aTB58kLbOWj9dFAXBJz
         DpUB5u0WgmXLN24UHAaVCx7hrZh8Muy/dFEygo8wnn+PGvBTCy5DlEYcJiYhYsvm/fqa
         pxhv9+VYhQ42gcz/SyFflAuLd39NsYpIATYl2YypVFDIIy653EE3zT1EkRgQPRH15k4T
         iBbfWsRB2HUTHDQ4sBlvju+YNFGLfhdr/W4HtNbs8J6dKWAC7r8KFx2Hz2HiGkaQmqoE
         Ji0Bp1pBj6VXeWVXZF9o4/b5eGywGY5Oq6TjoQUixnieEO33/ryIWpfUhl6BojsMOLdL
         1cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757928387; x=1758533187;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hs6GWuV18CGeToReruv/f07z6TMgsUaRPyZmMmtsSrc=;
        b=X3LSmU7Js418CyqnLVss55pLBIaFSSu3o1N3WeLDyK5VnWdYPIlebvGEuPBUbOsp/F
         VL+3X0UqDu4TpivZj0MG2Xs2eH6L/MsyZBCQ64w91JD+wH4zcRnsuiwhmFYT9PdCX+bE
         xDTpZRQo5cCpotzMi7ca0+GAQltohYdVLkk1A6Wc0YXo3JTX4AzthXJL7BJ3lnY54AnX
         DgkZicL3chJk+Ar6voxPvZshyLtH/OySUDskHg25MbSCuCpLeu4mx2Cb1fR8iP1da837
         TsI+ftSgqGsvkO8ahYdDhms6+fRN2YlGUpLCFl5YWhrahvOrz5crNbnPQh18FUhvP1Ut
         PsIA==
X-Forwarded-Encrypted: i=1; AJvYcCUeeN0AMVNgrbiyfvTBoCsW3xRvhbAfFPhedBIUgW/1afSMKEJdLtN6SGiKVBQevZwUMAKcd7I2P0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxSTSJm+ouDzqYYjoZXOaiCYl98Cbc3Uc3PdNjP+/lUy2EUKKm
	uBWAmrVDv2I12qT3JPmWH+5516D52edt8P4SMdfFoEMMde9f6JxYtrKqvrB5uSouvvk=
X-Gm-Gg: ASbGncvOfFtI32jnsfTEEq1m62O28TNkxLlCUqQnAaPFh13jSa8BbgTJGIE8D9W5h77
	0dW8t9kZyL6i0tAM1Im9nhwVqt5+GPI1cOD5FIehr0D5N9tqH8eDrl92CAy5jFJX8J9ahwk+qmh
	eCKCzaTxzsGzGL/HQcgDv/lTs6/c7vrcTWwRSsYyyYrfWSCMm5/5k2ge05WHMoTYs009KHAFXZD
	vXVspCSLPkmXNIFCAehvjRXPaiodqTkh9Q8DwU3qXl4UtCTFhrXhlCsh4t2a5dtlrRUQTwGhEGX
	yNgtuUeD7UT0PdiA8aJJXXNU7UwLcPg4mgwOoI5cAQxFb1Pl/TyqVppPWgu4HfYCJHA4FDNOmfX
	iwoG+3dEB3LPeMxSiD29Djg==
X-Google-Smtp-Source: AGHT+IFgxxLS2pJg24kRWNPyu3hgcRcX74JPOpS67jGIEm8dm9wZLjy1miiz+i+z7lmiREfwu/WfaA==
X-Received: by 2002:a05:6000:220f:b0:3cd:590c:61e0 with SMTP id ffacd0b85a97d-3e765a03542mr12295242f8f.54.1757928386771;
        Mon, 15 Sep 2025 02:26:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:508e:f12d:6dca:3a75])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e94163c03dsm7324441f8f.63.2025.09.15.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:26:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: amlogic updates for v6.18
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Sep 2025 11:26:25 +0200
Message-ID: <1jecs8hxry.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here are the Amlogic clock updates for v6.18.

This is mostly a clean up of pointless differences between the
controllers which have been accumulated over the years. Hopefully, this
will help with the maintenance and simplify the review of the incoming
new controllers.

Overall, this is just simple stuff but since it touches every Amlogic
controllers, the diff is fairly large.

Please pull
Cheers

Jerome

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.18-1

for you to fetch changes up to 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf:

  clk: amlogic: c3-peripherals: use helper for basic composite clocks (2025-09-04 18:27:12 +0200)

----------------------------------------------------------------
Amlogic clock changes for v6.18

* Factorize clock controller probe functions
* Clean up peripheral clocks definitions
* Clean redundant composite clock definitions

----------------------------------------------------------------
Jerome Brunet (13):
      clk: amlogic: naming consistency alignment
      clk: amlogic: drop meson-clkcee
      clk: amlogic: add probe helper for mmio based controllers
      clk: amlogic: use probe helper in mmio based controllers
      clk: amlogic: aoclk: use clkc-utils syscon probe
      clk: amlogic: move PCLK definition to clkc-utils
      clk: amlogic: drop CLK_SET_RATE_PARENT from peripheral clocks
      clk: amlogic: pclk explicitly use CLK_IGNORE_UNUSED
      clk: amlogic: introduce a common pclk definition
      clk: amlogic: use the common pclk definition
      clk: amlogic: add composite clock helpers
      clk: amlogic: align s4 and c3 pwm clock descriptions
      clk: amlogic: c3-peripherals: use helper for basic composite clocks

 drivers/clk/meson/Kconfig            |   13 +-
 drivers/clk/meson/Makefile           |    1 -
 drivers/clk/meson/a1-peripherals.c   |  995 +++++-----
 drivers/clk/meson/a1-pll.c           |  124 +-
 drivers/clk/meson/axg-aoclk.c        |  153 +-
 drivers/clk/meson/axg.c              |  237 +--
 drivers/clk/meson/c3-peripherals.c   | 2055 ++++++---------------
 drivers/clk/meson/c3-pll.c           |  245 ++-
 drivers/clk/meson/clk-regmap.h       |   20 -
 drivers/clk/meson/g12a-aoclk.c       |  238 +--
 drivers/clk/meson/g12a.c             | 3316 +++++++++++++++++-----------------
 drivers/clk/meson/gxbb-aoclk.c       |  123 +-
 drivers/clk/meson/gxbb.c             |  611 ++++---
 drivers/clk/meson/meson-aoclk.c      |   32 +-
 drivers/clk/meson/meson-aoclk.h      |    2 +-
 drivers/clk/meson/meson-clkc-utils.c |   86 +-
 drivers/clk/meson/meson-clkc-utils.h |   89 +
 drivers/clk/meson/meson-eeclk.c      |   60 -
 drivers/clk/meson/meson-eeclk.h      |   24 -
 drivers/clk/meson/meson8-ddr.c       |   62 +-
 drivers/clk/meson/meson8b.c          |  746 ++++----
 drivers/clk/meson/s4-peripherals.c   | 1160 ++++--------
 drivers/clk/meson/s4-pll.c           |   82 +-
 23 files changed, 4434 insertions(+), 6040 deletions(-)
 delete mode 100644 drivers/clk/meson/meson-eeclk.c
 delete mode 100644 drivers/clk/meson/meson-eeclk.h

