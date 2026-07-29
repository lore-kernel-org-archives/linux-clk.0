Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78A946A617
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332193; cv=none; b=Nc8ejuPAoHZQtiBdsDwRpfxS3yPyBNK5PjefuJuHy3Zwj8x2CW7CMN4Eq59imjg8ziwM7UAa/NvIzvJUSJnV07H7vo4IWI3xkCQLjDNmkrXvuQ+EhiPCQcCMtnv4xWE7ZShEn9na6K3Z3KywAhK1q1r6tRqbTeSiwbcMoQPSGWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332193; c=relaxed/simple;
	bh=X0Y5ZnE5h2XzLRr944QGYbuUaeYUdP3tqUzUQAIdOds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EeiGlTsjsp7OgXLB4Joyju7vnSkqWSEf5jhE76+UACwmZn7nE6SBAZKhGTrU83t2agoNV/HF6A8wR3NfacPF0eUUw1NgouvDGyfikji+N3JP8iXAq994p05NAQxbWyuJxgigE8b9hEnw/TEW343n5soWFW3xoBtYDMtI3aSUlh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E8GvlZJm; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E8GvlZJm"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ab04bbcc8fso641408eaf.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 06:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785332181; x=1785936981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUY5prEZuzu079/ijehiQd7Jr/No0FbniJJt1eZlTEs=;
        b=E8GvlZJmBsMoUPkVyZhupHnP3DQ9ef4vg7kirC1QYbM6FHOwSKHAj6vJQyhq0sIE1E
         DzPXBAH06MyslMQoc7VSLycF/oJv70ZwJgBfi6/niD3ZajryT8VAvr1I1heYllJ/zAtb
         43szSIVxfKwaU75z2qdokJaF+SpGAU4g9DMwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332181; x=1785936981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUY5prEZuzu079/ijehiQd7Jr/No0FbniJJt1eZlTEs=;
        b=Pur6Koykmu6Jiw6rmANFonk2b9ujhR4e/9+ZxTpFiltjn9IoehgV9oWi9QI4zI5AoG
         HWIprHi4krj2g3d0PDV5MwBGbdh1U88N7EdR+SA57qnoZ95VwNql0bRP8/kL5lOwWOkj
         v63uBfOHHmrQLm6gSd8wvLLhQBMfFcmPvj5nKCbleUKpRfSeYzMJpd/jDB08eAAtszN9
         PybRbmEEsPDeBAlp9PqukdYTmEvttqo2cTlW2f5CLocWYLGTs5OQs+sGugsCrbqGVq1N
         ERD1Iq12BtBhSoZOizy7SsPy4Rwna3BEPJ3mu5felpZcVU6D7qqSU6tlHMwnAryaI1UT
         3THA==
X-Forwarded-Encrypted: i=1; AHgh+RqzvEIV/NxKBZdR2HqlXB/xdG04MyNNBciyDYt2Zoc9o5qrh95ojaJHpGe7EhvY27DwCHtokOTQvh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1L79D0W+Sy111M+UJ9KLWDU2+y/Cy+UBYTga2ZMCPsSa9dVx
	sJIMDx+X/Vfu/iuzKG86wZFFMY7aCF2A2T6QkjEz7FfHg6Ns19dq6632RmHfgb9O6w==
X-Gm-Gg: AR+sD10UB1DftFYL8/Se29arcSbDNQQGSrwhXCnQ7Il/fdXE/UQRN6NYG456Lhb40yz
	bYMSNjRE7aV4MHln5hlYBB8eR7DxuueB1H6z7D90HRGQSbsyQ78+kmkzSZGPNDM9PyfO1EL1CUz
	wPw3hPkBGcdHvgXnFInIDnYtLQnlmdHin64Y9kfDFsHJ30eeyv+kMG/JvkQy5VTFZUJpHRahiNS
	If/x0VhcW8GDDqu6Jm6Kwc1z9HHQHJLnV8R+gDPKJTluOXwH9s5IN01zU3Vs0FEuXONzatl6nL5
	GIIulyli58sX/Hk7clbs+gHs9Hc4Kj51MuPKi1pSEcvVFxunb6gSeDWYImkcUaQ1/s/wGEgdjiz
	CkVInB8e6m+yGLpVVWRzvGIqYDpaxwFtekTaYMyDsJRrQ18AzVnARdVQadx/6JaE9RC5ALi8fHN
	oMH8t12I45o4e/7/9RVwPTlp/qrT7/XS4c/rpm228FsgkX04SayjIWSZA=
X-Received: by 2002:a05:6820:189b:b0:6a1:7644:772f with SMTP id 006d021491bc7-6ac96d4e889mr3116221eaf.63.1785332180763;
        Wed, 29 Jul 2026 06:36:20 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm1956196eaf.6.2026.07.29.06.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:36:19 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
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
Subject: [PATCH v3 0/6] Add support for the Rockchip RV1106 and RV1103
Date: Wed, 29 Jul 2026 07:35:47 -0600
Message-ID: <20260729133609.3465563-1-sjg@chromium.org>
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

This v3 is re-tested on the Luckfox Pico Mini B: the kernel boots to
the rootfs wait with a working console on UART2, timers, pinctrl and
GPIO, and an SD card running at high speed. It builds with W=1 without
warnings and dt_binding_check and dtbs_check are clean.

Changes in v3:
- Add IDs for the internal clocks, so that anonymous branches cannot
  overwrite the APLL entry in the clock array
- Register the CRU as a platform driver, like the RK3528
- Give the internal clocks real IDs so that they cannot overwrite the
  APLL entry in the clock array
- Drop the pre-mux write of the alternate divider, which overwrites the
  safe divider calculated by the CPU clock framework, and the post-mux
  write, which duplicates the framework's own clean-up
- Add CLK_SET_RATE_PARENT to clk_vicap_m1_frac, matching m0
- Use a separate compatible for each GPIO IOC block, since their
  register layouts differ
- Use the per-bank IOC compatibles
- Place the entry with the other Luckfox boards, in alphabetical order

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
 .../devicetree/bindings/soc/rockchip/grf.yaml |    6 +
 arch/arm/boot/dts/rockchip/Makefile           |    1 +
 .../rockchip/rv1103-luckfox-pico-mini-b.dts   |   93 ++
 arch/arm/boot/dts/rockchip/rv1103.dtsi        |   16 +
 .../arm/boot/dts/rockchip/rv1106-pinctrl.dtsi | 1398 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1106.dtsi        |  321 ++++
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-rv1106.c             | 1099 +++++++++++++
 .../dt-bindings/clock/rockchip,rv1106-cru.h   |  306 ++++
 12 files changed, 3313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rv1106.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h

---
base-commit: fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
branch: rv1106a3

-- 
2.43.0

