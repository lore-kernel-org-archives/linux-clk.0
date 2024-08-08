Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4DC184526
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723112887; cv=none; b=nJ6RHqkhbS8H2xShgDc3R7zbHggdcN+/wG68dQzO5VSc1BfSwKvZn5P2XziC8MuySsbR9aUFKYf0GSYspcCzdJGi4XETHQ8GJVG8/N1Z58mUSioZBy0P8+NWv+ESPMAuyOa0v6XLv/YPJuNUtiGVkZq2xb0C11NsXL4Tsn+Ju/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723112887; c=relaxed/simple;
	bh=RjKRijCG2ufoLvhnl64EG+OgM1h0OplxHuh1Hk2SVQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btcKxg+yn0y6WTw29EYlA+GnUHLXSPzEwSF+hraKthE3bdsXehrD9Dz8UuKrpUvkZgCpfWOK7jitR6y929JK/22HEPZc8LHtH2sV+N5KgTk6jAduKkyoLiz2frQTNtktm7GKm3ojwg9di7xLIYYgi3ha2mcsRbORgiMgPAMxCjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2Jvz5Ldy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2Jvz5Ldy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3686b285969so432414f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112882; x=1723717682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZND/cy3Z516ACCTnpV9ofYo6+loCngOYmYnistIhps=;
        b=2Jvz5Ldy4QvL8rMY3UJ3Wk/jjwZ9CDwhFZZrMI73AzTfS8XjnBO9GgnUyBrZNA+r37
         mnOJoW4Vw0mEpfdUmVJ6v9sK8RvVWZIgJhCMrfLsYn1+Lc5MjCNApG19Fa9UkJB7Ld9d
         l6a4BV5966nSgiMTfVyoqICxYhQJfnRGvOo1cUYXmed0wsusKgzYJOhkF33YCicowZsB
         owHezrz11MM3FRqT4TG9x3DbxpZketh21xqy5EiVWTddCXNRlpi00Y0aa2KDkrrm7Jnb
         rCUMQSTKz9QOBUInCC9OuVG3qFXeH5q7edKzTXUBmdfgFxoqg8HFltAF1yco4af/7/Db
         3gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112882; x=1723717682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZND/cy3Z516ACCTnpV9ofYo6+loCngOYmYnistIhps=;
        b=tfzhCs6XyRhr8DywnGcGaIx/t3JP2/TKDA7JsH8uI2SXCK0Cb6+U5z6YGNRYNxK7go
         VE5C68Gdhz7wzfaa4Fkdnak4zZegaJbCCM3KWeC+TJR51n3SDo4LwU1WUL1ebWE4kBIw
         z4HVScEE0Odn4yVXrWJP0858XAXQBvP4mjXy8mGd1BIKQZdBVd/u8N+C9Jq15l8wATYx
         IZcQIuMZkLjY5jlTSkQBZoQFTBuQTRx5AD6bPD/E2Nm/n75zGNiQcjqi7R3ft+ehBVb0
         6Bg0BBqQI9LLTAO/iPXJk5MKs+NSmdm3GgdFOV0I8BX6zAAj5mfymWiqLe8+4LPlL7XK
         nReA==
X-Forwarded-Encrypted: i=1; AJvYcCWc1v+Tv9S8wJ4iUUoIK6NeHvCf7VZt9sGRA3iNtAlOgTHom4xmAyBHolwpLXyK7CwX+awTxP4b1cu94p6FdNIyIu/7dtYrzsXh
X-Gm-Message-State: AOJu0YzUi0RLCfj8qMDHBLqeUei835w+UNcqcK4qbLTpVPbuwvpE6UbD
	bnW7llzmqWT/ngbsM2LfIwHM6/uC4RZyn99E1QhGHLh15S07B7JG+HMoi1pfhUQ=
X-Google-Smtp-Source: AGHT+IFYU2RQPPg/KjZXn7ZtFuIvQu6nUFhl4ghGOJZsi+bsUJSY3bvLQMS3+wd7ad+9LDIv7FuIKA==
X-Received: by 2002:a5d:550f:0:b0:367:4383:d9b4 with SMTP id ffacd0b85a97d-36d2757674emr1085501f8f.56.1723112881342;
        Thu, 08 Aug 2024 03:28:01 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/9] reset: amlogic: move audio reset drivers out of CCF
Date: Thu,  8 Aug 2024 12:27:30 +0200
Message-ID: <20240808102742.4095904-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

This patchset follows the discussion about having reset driver in the
clock tree [1]. Ideally those should reside in the reset part of tree.

Also the code of the amlogic reset driver is very similar between the 2
trees and could use the same driver code.

This patcheset alignes the reset drivers present in the reset and clock
then adds support for the reset driver of audio clock controller found in
the g12 and sm1 SoC family to the reset tree, using the auxiliary bus.

The infrastructure put in place is meant to be generic enough so we may
eventually also move the reset drivers in the meson8b and aoclk clock
controllers.

This was tested on sm1 vim3l and gxl aml-s905x-cc.

Changes since v2 [4]:
 * Fix undefined read access of the reset register
 * Fix Kconfig symbol description

Changes since v1 [3]:
 * Fixes formatting errors reported by Stephen.
 * Changed parameters type to unsigned
 * Fix usage of ops passed as parameters, previously ignored.
 * Return 0 instead of an error if reset support is absent
   to properly decouple from the clock and have a weak
   dependency
 * Split the platform and auxiliary modules in 2 distinct modules
   to fix the COMPILE_TEST error reported by ktest robot.

Change since RFC [2]:
 * Move the aux registration helper out of clock too.

[1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
[2] https://lore.kernel.org/linux-clk/20240516150842.705844-1-jbrunet@baylibre.com
[3] https://lore.kernel.org/linux-clk/20240710162526.2341399-1-jbrunet@baylibre.com
[4] https://lore.kernel.org/linux-clk/20240718095755.3511992-1-jbrunet@baylibre.com

Jerome Brunet (9):
  reset: amlogic: convert driver to regmap
  reset: amlogic: use generic data matching function
  reset: amlogic: make parameters unsigned
  reset: amlogic: add driver parameters
  reset: amlogic: use reset number instead of register count
  reset: amlogic: add reset status support
  reset: amlogic: move drivers to a dedicated directory
  reset: amlogic: split the device core and platform probe
  reset: amlogic: add auxiliary reset driver support

 drivers/reset/Kconfig                         |  15 +-
 drivers/reset/Makefile                        |   3 +-
 drivers/reset/amlogic/Kconfig                 |  27 ++++
 drivers/reset/amlogic/Makefile                |   4 +
 .../{ => amlogic}/reset-meson-audio-arb.c     |   0
 drivers/reset/amlogic/reset-meson-aux.c       | 136 ++++++++++++++++
 drivers/reset/amlogic/reset-meson-core.c      | 139 ++++++++++++++++
 drivers/reset/amlogic/reset-meson-pltf.c      |  95 +++++++++++
 drivers/reset/amlogic/reset-meson.h           |  28 ++++
 drivers/reset/reset-meson.c                   | 153 ------------------
 include/soc/amlogic/meson-auxiliary-reset.h   |  23 +++
 11 files changed, 454 insertions(+), 169 deletions(-)
 create mode 100644 drivers/reset/amlogic/Kconfig
 create mode 100644 drivers/reset/amlogic/Makefile
 rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
 create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
 create mode 100644 drivers/reset/amlogic/reset-meson-core.c
 create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
 create mode 100644 drivers/reset/amlogic/reset-meson.h
 delete mode 100644 drivers/reset/reset-meson.c
 create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h

-- 
2.43.0

