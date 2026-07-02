Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55703412264
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979848; cv=none; b=QhVNG6LDq1y42ut2Ml7l5fqtWSE0HtIdtcskJ6MpzREUls4qKHxM9+ybZ56twBXRYPk2E5N1PQShSWVzUZNzDrNYbOva0xiFawHvPylmK7WZbZIlum/o9+utWPUVulPD2rdZB3gl0baqh8/S9ioxZ5gpAnOMdu7LrJqT7bJGTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979848; c=relaxed/simple;
	bh=RpYgXqcHniaYUqWf8mxFhxB+KJLte7VM9Vj154mX5v4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jR6WKiIYx+iRL0kBHIk2f/PN0PIkFgzJUY0qCJw3oax3K0qXIUAsc19WbxTGPnsZvf3U9u4RW8/27H34D/hzXCVrB12PUw86VDrcUlTNxIQ+IY6TnbOcos6jFXDy9G2g+/EAuGenx1WWuKdKHliJQg+AEX6ZmtpgV1xVTElrMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OVRZlBRn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OVRZlBRn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b77b150aso12481445e9.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979844; x=1783584644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TStkowbQyn476cbj7sHzFF6Id3PxboxS4zTbnsp7ckA=;
        b=OVRZlBRnalvMLBxHFuaf+SCp3WvQ4bKRb3Ti4shK785BbgngtJx2KMvAtHQA2STDcB
         DUBmuWf/VOm/EQj8LfYvaIPFq1RA/hTbKl5s/12cEZAQkXhYbl4bhk3ZyGeb9VqdjQdc
         4O/Ss6+fRLGSCf6p+jceU0n7Ax/uXV/Y76T7q6YGnnSir26qy22QoduD8jyjqgMcNV6W
         hxuvkm5YhFceJdY51MuEyz3RtZoG+wp3ZNvAyApjogz7YLNGsgK599g0HARj07RrZMPM
         b6ZB4Rk1N/09bwgbOZOwooCTjsC2sb/XOc8uWJKnMnh5N0mnEHOck4uHYv8OoNiUgLpb
         RQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979844; x=1783584644;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TStkowbQyn476cbj7sHzFF6Id3PxboxS4zTbnsp7ckA=;
        b=GwxeCgHBzB7G5kkZ3kE4BrTFWz5HEfy/QykHfUHtm9J7dBy2+npxswzW0RnSIIj5SM
         a7iy5ch9f+XAib9KjB7QLzwQhQtxUPtKWgjs0+ozF+nKhk2CoJqnUAQ45IhP99FePshx
         8lUvM/nTT+/1+lWnEDAMLi57VrFvTAsod1+vv5BoMsl3YjbnVZ4lQlp7XU5urwMWRKBz
         7b9HdarbtJtglHqGWERK/oTvx8ArXEF8h0mfYRMBnTkyV+qlqClqTlovvgMp8f7IO0Yk
         SFjM1yKSIXqGPT/KLEhpxmC1WddxHTcsI19asxqRUZvqzQl/5HXWQbvMgGCvVS+qLfcC
         18Og==
X-Forwarded-Encrypted: i=1; AFNElJ+oZyCapckovpEzYJNdXm/2J/+kyuY30ueCOSHOjLtSf2siLWfsxh1gCvGN8qlwjtWhhgzITcuIVAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyas7I9/UXpSvgSuFkKi71S1qBMxoIIH4i/Q3c2xk1Di7f9oovP
	t473pws16XBMfVFX7FTusk6TCmPb50lIQOjTwpjpD9fdF1eKhOEZUv2lf7jsdqU7Ymo=
X-Gm-Gg: AfdE7cnZ76oUDfV/8pP0U+b6QhWO9wHfzV+DQZuS7WrZQT1cWJYodQ028W9nZgifD8l
	VaBwlmTvxzSmLkT9ObEV8ZMSc9cajRttZabvHNyiK8/lL2DU53/nO3/wTx0TRKt0Do1VsLSZCHv
	mEVeuxQ2ZQL8/QhmUO6NoRur4F1jZxZWQ6LhRu1tLHbULV2uhwIGr09kz0NO5Dh3KjUcmolME+A
	zIYJ3eiwZzy5va/LjyA+wbAQkoeMx6epHbHMXeNCI5zfYe7JvhkCraVNPjpvfqMOV+7stq3V3NI
	h42EUTLRj3C6ynEOl37KBFCdanKpJlxMLK+7DY03H2ANBpGdRUw4eTKbtuh7qAlmVe6Qj5Oldtg
	G0fIMRpDUzwRR+QYBcn31HosO6bfOdpAoq1VlTDw8m6B/W7SuaZMeEVecfznTu4pa7lP0sX6GkB
	fvlO1lxMSa0ys=
X-Received: by 2002:a05:600c:6c90:b0:493:bc4a:c6b4 with SMTP id 5b1f17b1804b1-493c3df6da3mr40899765e9.38.1782979843775;
        Thu, 02 Jul 2026 01:10:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db8a4a09sm6872510f8f.13.2026.07.02.01.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/8] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Thu, 02 Jul 2026 10:09:59 +0200
Message-Id: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANccRmoC/0XMQQ6CMBCF4auQWVtDp9CiK+9hWLRlkEmUkpYQC
 eHuFjYu/5eXb4NEkSnBvdgg0sKJw5hDXQrwgx1fJLjLDVhiLRG1sEYpEWcvfC216XpZkSbI9yl
 Sz9+Tera5B05ziOspL3isB6JLjbc/sqAohXEGpUTTVH3zcHZ9s4t09eED7b7vP26UFU6jAAAA
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RpYgXqcHniaYUqWf8mxFhxB+KJLte7VM9Vj154mX5v4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhzxkwEf5Bdzyd27oCSpq4h7tdHUp+tEbg4VR
 Z0jNuLTPyOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc8QAKCRDm/A8cN/La
 hbuHD/kB91kHGeDducer2jqe2ndIa28Z2E/EheBjt2qp2JsoIigd4k5m5R75RIFmdlinKyJ1TiI
 0/EGurhWjxnk+ROvzRKA4X1dyoQKOH64035/X3k2ok+SSTLqtV/hmsHAr28/eBd6RyIcksBX04y
 YMGQSVUt/wJ7zlKSFV4gahC/Q7tCKyXhrVMJjrC/EFBWiERd79iAssZ9VgUWoa/j72y2mN9I5NN
 MmZQcWEe5Bco3mAxuSRa2WlHyepf76qy2D/48D2kGPXWlDrMRkVoyHN0FPIcZYD1DRzFbBfaKpS
 MZSXEL2AryzIqyTsMWYnQm5volxnyscBI93VwkKgyCTqmLNt9oqqII8TcLnzuh53v1MaXb00MuF
 ZL+XBFNGVzQHeeK7Kh8/2oicQJBRTzTPDVR3UJ9GTRtPPRWB94aunseTzQRvYiZdP9s43kNKJjJ
 WBRFSQqkOr3t66a1JA7MEcp7cud4aE0ydX1GyJ+DFIbDc7jZnJRq471IlGThknIkiYVAStm1eSW
 vYLP7PJf8DHwc/gI/3aWvidnfLbTw7HFO8q/vB9zHzzAAO+CEgfmgwbQidd6TJDwXdk6KcGuZNU
 lHs4bLtfnng8szELfr2T7oUUEjtYNij6faySFglDp+Xc9eaFgVZj1QJ5+bMQayIstSANkjs35WC
 EknFlM9LkeN26kQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v3:
- Disallow clock-output-names DT property for h616/r329 chips
- Fix ccu probe helper to properly unregister clocks on error
- Implement .determine_rate for ccu divider RO ops
- Drop unused DCXO_CTRL_REG_EN define
- Link to v2: https://patch.msgid.link/20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (7):
      dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: fix ccu probe clock unregister on error
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
      clk: sunxi-ng: sun6i-rtc: add a733 support

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |  13 +++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 123 +++++++++++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h               |   3 +-
 drivers/clk/sunxi-ng/ccu_common.c                  |  12 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_div.c                     |  42 +++++++
 drivers/clk/sunxi-ng/ccu_div.h                     |   1 +
 drivers/clk/sunxi-ng/ccu_mux.c                     |   3 +-
 drivers/clk/sunxi-ng/ccu_mux.h                     |   4 +
 include/dt-bindings/clock/sun6i-rtc.h              |   4 +
 10 files changed, 163 insertions(+), 43 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome

