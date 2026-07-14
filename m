Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B43241DE1A
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 19:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057827; cv=none; b=rsEv4ZhEx/mMT5nnIFDMniSchLtgckjn2dRT3OMFfryw/cGHOkakWH6lM5aHa2+bvucdxcn9U/vGwzb0OFcdKpIsT1Ak+BNFxIegLHva3sH1FJWEI/SRQG4J+IB2ly8ZbyaNgRyHgiNh9gdOgVkCL+zw2nRTVCRn3Z3G8314lbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057827; c=relaxed/simple;
	bh=6Gi6bVCOYouVgUFj/phGYvWE0wX3SO1+XYiERUL0ctc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SGHxoYjEwRHkJa4rPROkc1cPR5StRV/DpWQFfocU+VSKQ6SFE81O5x2zrHnjcqTmhB4mABmjDyJzXWg/lnW4hIOQHr1ywN3MuQCWO7Tv3LuX55CxlYoItDByMz0g4sbtuaZcUIV5rcmKSJiuAw9EwNA+u/kR4NK07rlf13JRFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TUTqTsuN; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TUTqTsuN"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so1012465a34.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057823; x=1784662623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yoY75yqFw5mb7tU/+ruk6fsKo/hettBezB5T0NFLox0=;
        b=TUTqTsuN+fvjqWJl/GHpGpBW9Y7cETk3UdcQtmXk+iiV9c2VqIcPWFggsfs9X1QwtU
         LHZuwhWzkeKwIjZ0D4W/0T0QhpM8vsaHcicY6XvoIgD2tOJ/zde9fCUcNYJw0KFU8DxA
         biGxA7CzyHrhBtCK8Fv3u94DqUrtcghUf/mT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057823; x=1784662623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoY75yqFw5mb7tU/+ruk6fsKo/hettBezB5T0NFLox0=;
        b=CAvQ0hq9XjWT6onm5oQVo5Zvaz0uNbQlzzqVGpKWcrp5iJFbmJP/H4elaI9jAPQd5Y
         LTZucuPekT0LxPAWN8fs8qi1GQ/JTlMLdgO2ngdcEuFsfL19d+A0jyL0tsoDXIdcgIBq
         WP/pSK2IkyLeoELtdtjPGevwlnG213u35JQ6tATpm+3ER+2GczJr1XQE8hYNqtf0duyf
         oOp5867+cFTSr70OSQbtc87JjIyVw30MRyplbTMX4zlTVdm3vHtXNw45CnvTbUIdDJc0
         5dh6NlkDZ9QCsXHlx4ZQpblcFndIGcurRBLWuZf23UzglzjSKAd/wdxAYJZM83t4Mrqu
         j/4A==
X-Forwarded-Encrypted: i=1; AFNElJ/Xs/LemAKkFBHnzTQT4x51v8pmdt8l8xjbm12a+FD821yZNmwiIO3hyR0jvSjEwnYPow0t9hrIRdY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+heVEgFxPvW3vpMzQqECBW4JSgODkMSjHHa2Z3fwdKyI7+Ol
	cYo1EPfNlWWmp+/G4/fMsiTOLE7JtCbRdeNLA3znf54F120Dd1ZR8+I6xZzVSr+how==
X-Gm-Gg: AfdE7clqfGUNhOleU/VlzFKdG3PsJmpwZF7iZcCxChxH0F/ijqow8np4fgs85nkrYFx
	Wp8j+9KoZV3ieHTNxKmtdO8QWPWbsvPm20YM1PoKOdjtxupCj3YF5dSLTwCH/+ERvcHORfHP+a/
	JqnGQ1osBcIhOrPJvbwn+vhvRSlWI9FPQJzxkOyWefWmUuorcp0fcghQB5PQ+uuGW7bYKXCV2Us
	xtSIkamHIGEvyxbxccR0/+0bPg6iph8AyYMdJj7niaP+K4oSwgPwxUfP5ocFZZgTqumpt285IPV
	Tv9xWGWaTEh2bDZbMAIkvemyiyAYJeNDrCLpsPY+PJRRrXYCBWC1sxx3iuTMIoH27tSoo3jExjN
	IIzyLpTIi+eDLA0krXPQvAbFh3a0hb/uWkTt0bYOecOLXYCSskX39UEngSdbbSEa5qa1DtKWAUO
	a7RYDKzdDmccsIUywzyQ==
X-Received: by 2002:a05:6830:2306:b0:7e9:ead3:4449 with SMTP id 46e09a7af769-7ec0967b3e2mr9214494a34.6.1784057823394;
        Tue, 14 Jul 2026 12:37:03 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm16004026a34.8.2026.07.14.12.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:37:02 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Add support for the Rockchip RV1106 and RV1103
Date: Tue, 14 Jul 2026 13:36:37 -0600
Message-ID: <20260714193656.2196447-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Rockchip RV1106, a Cortex-A7
SoC aimed at IP cameras, and its RV1103 package variant, together with
the Luckfox Pico Mini B, a small and widely available RV1103 board.

The series follows the structure of the recently merged RV1103B
support. The clock driver is ported from the vendor kernel and is the
work of Elaine Zhang. As with the RV1103B, no resets are exposed yet
and the CPU pvtpll is initialised but not calibrated.

Following feedback on v1, several parts have been split out into
separate series: the pinctrl driver and binding, and the serial,
watchdog and iio bindings, are submitted separately to their
maintainers. The mmc binding is already applied for mmc-next. This
series carries the clock support, the GRF compatibles and the
devicetrees, which depend on the clock binding header.

The devicetrees cover the devices needed for a basic system: UARTs,
SD/eMMC, the SPI flash controller, SARADC, watchdog, GPIO and pinctrl.

This v2 is re-tested on the Luckfox Pico Mini B: the kernel boots to
the rootfs wait with a working console on UART2, timers, pinctrl and
GPIO, and an SD card running at high speed. It builds with W=1 without
warnings and dt_binding_check and dtbs_check are clean.

Changes in v2:
- Renumber the clock IDs to be continuous, starting from 0
- Provide the MMC phase clocks from the CRU rather than a grf-cru
- Mention the MMC phase clocks in the rockchip,grf description
- Provide the MMC phase clocks from the CRU via an auxiliary GRF regmap
  rather than from a separate grf-cru clock provider
- Drop the grf-cru clock-controller child and use the syscon-only
  group for the main GRF, since the CRU now provides the MMC phase
  clocks
- Use a single gpio-ioc compatible for the per-bank IOC blocks in
  place of the ioc and pmuioc regions
- Take the MMC drive and sample phase clocks from the CRU and drop the
  grf-cru node
- Give each GPIO bank a syscon for its own IOC block, referenced by a
  rockchip,grf phandle in the bank node
- Add gpio aliases, which the pin controller and gpio drivers use to
  identify the bank; the rv1103 removes the gpio2 alias
- Split the series by subsystem: pinctrl, serial, watchdog and iio are
  now submitted separately
- Drop patch 'dt-bindings: mmc: rockchip-dw-mshc: Add RV1106
  compatible', which is applied for mmc-next

Simon Glass (6):
  dt-bindings: clock: rockchip: Add RV1106 CRU support
  clk: rockchip: Add clock controller for the RV1106
  dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
  ARM: dts: rockchip: Add support for RV1106 and RV1103
  dt-bindings: arm: rockchip: Add Luckfox Pico Mini B
  ARM: dts: rockchip: Add Luckfox Pico Mini B

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../bindings/clock/rockchip,rv1106-cru.yaml   |   60 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    2 +
 arch/arm/boot/dts/rockchip/Makefile           |    1 +
 .../rockchip/rv1103-luckfox-pico-mini-b.dts   |   93 ++
 arch/arm/boot/dts/rockchip/rv1103.dtsi        |   16 +
 .../arm/boot/dts/rockchip/rv1106-pinctrl.dtsi | 1398 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1106.dtsi        |  321 ++++
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-rv1106.c             | 1100 +++++++++++++
 .../dt-bindings/clock/rockchip,rv1106-cru.h   |  300 ++++
 12 files changed, 3304 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rv1106.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h

---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106a2

-- 
2.43.0

