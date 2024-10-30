Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3251DA31F
	for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286101; cv=none; b=KRl7ixqOs8tNWCR7J8CApycML8YpOa6jMc9CAcXjcz31rL6c8U3LgnENq+3xmp78F1+vu9CpTCHADJDQHlQhBouFgzzkokr8KgdIov2snSkaefwossMIbOtxEq43M2TmWTwfdPCXQXsr+Z0faBtpGUmcoFfFKI8d/7KoegmbgjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286101; c=relaxed/simple;
	bh=s01ujFHtOOQQMc2gCp+NXpyamnKMQ2FJNiklpd+Oy5o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V2ffsy23XC+ltOC/6HckJIwf0TQ0pZKRKCku5Hmyx+7IPfyu9npSj1ifA2Jh0uQkvWTxyMhuby2g22GgPZ4xoZiI3kLc5o7sVFdek8zeRtM1pFCiYtJwXWAVXIqSzzJYvy0Bb3NKU203xzM7WmiUvTQmMUXJ0YJTGYJP3M+lZtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bW9shC0z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bW9shC0z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso60698725e9.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 04:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286097; x=1730890897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4baBbCVw8LJX8VUsNI0iSX+HaRxJY9Q26lFxilz6/c=;
        b=bW9shC0zz3HHagaaLUtj06SVlFgQg8ta1bDx2+cIeialT0q3RhUZkVy0RqSbNOYVZw
         3MfkCIPU81o1xx1Cj8CYGOAv4iedeiSDcO2rnoPzAMXoIjjxZ6Vz5WrTAxVgZ/l9lXBd
         Q4NPLFem9EkgmZovfAvyrHmQV4KNxJXhmle7fnIyGu5Owl4XinACGY82Jkt2M3WwGUz3
         KBc1i8A0Wlo1745q+8LkLCaqwfM2xmhBNSj7i6K0f9hc7DoS/h7ca6mp3KgquBtocyyu
         kFHSZ2OF3qhw8rQpk7bYnmnJpDcvZ9SNenX6VVv8xBrOkYpkCpPpyLT13gUZddkZN12I
         kEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286097; x=1730890897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4baBbCVw8LJX8VUsNI0iSX+HaRxJY9Q26lFxilz6/c=;
        b=PSnJzF41rmhM7ZUNWwWwthsvYG1rsutmAg56WZ3c0cWLpCOowAu8AFpRh6Y8eKgLxt
         4QTQLqLt8Gwm2BXmfRXkow+/EI+IKWW1D8BssUo2oWP596m8HXl3L7ZZmdK5xtz1ZTtw
         w3oDN/2RvNuQfkWIkRDK2HM2Q4zdNweyW3B1AUgoj3iVdW2Ii3xtNfVnKHCI/TBzDjxP
         M6GnhxPVomVj41H6WcJrZcDRty++Nu2+zN2yz0EcOqzLyUEPxA7ZVmD2X7UFGzcYBoGz
         S5DCGQkkEWquZ1kzWGY1+dyYBoCjMh0RfeX999kMIVr+Lp2y2FcHvB+2tEX/cG7shIJf
         F2xA==
X-Forwarded-Encrypted: i=1; AJvYcCWlIK+2UtutSNKjBIY3sNiq+q+JJbyG0o1H5phJFCNzNoxEVdjWh2UatgLSyDS5Tek7ZME18mCqakM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTL5fIoU7c2bJIl2UOi2Zu4bRHduU3l7x566eNJAEiYPBEVK6k
	LTcBswNcmFxVSVJjAqOrs58J5891GpmWzB5Zv91pqUsY8qO+2cnexX87SvjX1Ik=
X-Google-Smtp-Source: AGHT+IHiBr5VSVHKI/wJl7b1DUkZ2teiuj8d/e6AL9/92akooeT1FxovY4Chln4pchEghqU1vcv7kQ==
X-Received: by 2002:a7b:c5cc:0:b0:428:1310:b6b5 with SMTP id 5b1f17b1804b1-431aa802774mr100247035e9.34.1730286097169;
        Wed, 30 Oct 2024 04:01:37 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:36 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 00/10] Add RTC support for the Renesas RZ/G3S SoC
Date: Wed, 30 Oct 2024 13:01:10 +0200
Message-Id: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
IP. A 32 KHz crystall oscillator could be connected to the VBATTB
input pins. The logic to control this clock (and pass it to RTC)
is inside the VBATTB IP. For this, the clk-vbattb driver was added
(patches 01-03/12).

Patches:
- 01-03/10: add VBATTB support that provides the RTC clock
- 04-05/10: add the RTC driver
- 06-09/10: update the device trees with proper nodes to enable RTC
-    10/10: enable proper config flags for RTC to work on RZ/G3S SoC

Merge strategy, if any:
- clock patches (01-03/10) need to go though the same tree because of
  patch 03/10 using the devm_clk_hw_register_gate_parent_hw() introduced
  in patch 02/12
- RTC patches (04-05/10) can go though RTC tree
- DTS and defconfig patches can go though Renesas tree

Thank you,
Claudiu Beznea

Changes in v5:
- dropped patches already applied
- fixed build on rtc yaml file
- fixed indentation in patch 01/10 description
- collected tags
- per patch changes are listed in individual patches

Changes in v4:
- added patches
  "dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC"
  "clk: renesas: r9a08g045: Add power domain for RTC"
- squashed the following patches from v3:
  "Add clock IDs for the VBATTB controller"
  "dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB"
- fixed typos in commit description
- moved assigned-clocks, assigned-clock-parents from the RTC
  documentation to the VBATTB documentation; same adjustment has been
  done on the device tree patches
- renamed include/dt-bindings/clock/r9a08g045-vbattb.h to
  include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
- used quartz-load-femtofarads
- used RTC_TIMESTAMP_BEGIN_2000 and RTC_TIMESTAMP_BEGIN_2099 in the RTC
  driver and added a comment in remove API to mention RTC cannot power
  on the system
- squashed defconfig patches
- collected tags
- per patch changes are listed in individual patches

Changes in v3:
- dropped patches "mfd: renesas-vbattb: Add a MFD driver for the Renesas
  VBATTB IP"
- added patches:
-- dt-bindings: clock: r9a08g045-vbattb: Add clock IDs for
   the VBATTB controller
-- clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
- moved Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
  to Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
- addressed review comments
- per patch changes are listed in individual patches

Changes in v2:
- dropped patch "clk: renesas: r9a08g045: Add clock, reset and power domain
  support for the VBATTB IP" as it was already integrated
- kept only a documentation file for both VBATT MFD and clock drivers as
  suggested
- addressed review comments
- used cleanup.h lock helpers
- update startup sequence for the RTC driver
- switch to 24 hours mode on the RTC driver
- fixed range for the RTC driver
- added a generic compatible for the RTC driver as this will also be
  used by RZ/V2H
- used clkin/xin clock names for the VBATTB clock driver to determine
  if bypass should be configured on registers instead of having
  dedicated DT property
- added mfd driver for VBATTB
- updated Kconfig flag names to include vendor name
- removed DT node labels from Documentation files
- used items to describe the interrupts and clocks


Claudiu Beznea (10):
  dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
  clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
  clk: renesas: clk-vbattb: Add VBATTB clock driver
  dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
  rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S
    SoC
  arm64: dts: renesas: r9a08g045: Add VBATTB node
  arm64: dts: renesas: r9a08g045: Add RTC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
  arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags

 .../clock/renesas,r9a08g045-vbattb.yaml       |  84 ++
 .../bindings/rtc/renesas,rz-rtca3.yaml        |  84 ++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  34 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  16 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   4 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-vbattb.c              | 205 ++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-renesas-rtca3.c               | 899 ++++++++++++++++++
 .../clock/renesas,r9a08g045-vbattb.h          |  13 +
 include/linux/clk-provider.h                  |  18 +
 14 files changed, 1379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 drivers/rtc/rtc-renesas-rtca3.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

-- 
2.39.2

