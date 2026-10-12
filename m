Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067947252B
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799727; cv=none; b=Fx3ca+rXO9AyQWRbu8h/YQYo4A3ottQbnn/OmXZDhfNkwonJgNhfFUYrJDCvB+/yQYf8nveGBiUgPnd1+EYGlypdDaAJrAqzrnPnkSIAkOQTNxJMMvIwqPqKXmKB8KtXcwj7O0YU5JhypwtTqKWGTFAipDaPukP5vTl5Uax8/Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799727; c=relaxed/simple;
	bh=8Mnnl0Z3pOG5cs0RKth4xk3lylmk99qeafTSSPrIRo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TIxv1p4BhtFiXhNT7fTD0GlPBnEVRHsqnE70V0On/4VBAzBmpjTWKx6BLc0DuE1cpfyhr1lRL3PbFIICLt5ifbKX/pngvB2sb8f4R4i8HLOzej6BY9OzFyoZBaPKXHvv8XhId3U0R9KDsfIhVIp1aYO0T6LqUQMqt22esH9dPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVPXMP/i; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVPXMP/i"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so11099575e9.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799715; x=1792404515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=58Hpz3IL7+FBFo99aVZrTh8mHeTaosnWqfT/ede3fC0=;
        b=CVPXMP/iPu2mahMEJGKtCfwXDBu+oYwgjPjTdn1QpAP8FLtKgpofb/Kn6KnN3mOcwn
         StpFor7oq5E0ajxBdb+o7puJEYmy9MAMN5EWYf0vN2OGlRBmD2ZG5QizP1Gkkci5CED/
         x4Xa2WqRBechn+2tl1JCogHlV8SguxYItcAMcopCVc75uyTDgAumJMN6MwmeYOG2ix6x
         lnNK9BdQ1Jkhhl6f/R7GplusTml/UP6irb9IJpzYIL+gPe6zBkqCPL88WpBET/k4OREG
         R9KEYQfIMKdPaw52JMUfDozWw+tLS5fo7kQWQq3nri6VOnaHhs4mB8hUTkfXtGjBD4wY
         Jprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799715; x=1792404515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58Hpz3IL7+FBFo99aVZrTh8mHeTaosnWqfT/ede3fC0=;
        b=LmDRygCE/So2/bE2lEq409bbPj3jjroRfhhnUY08bJfM56k3WHmSdBZBOm1AXejBYt
         RGZ81b7eL/fDe9Hu6bpko1nGAzlZC+vg+osDAYd7BtCpqtf/tm1TDIVLNoM5P6qsrrx6
         6Zo52vU/dunkHG8tdITHu9nSEFH13fif3v700vO8hHgQm1XajlhCqkQzcQmLdQ0FVzhU
         bMeeRdYRa7/ZjkJ+iPVUKc3PP3rJbJ2zDjOQcGFs9bTpZXTNFXHreoxn02kpAOodmJcF
         Vm0nOCLwBOk/ONg2JEF6mQ/zpQP71e51VBHxVDK9D7Dg0m0U9cufAAxi0kdOnStncz8s
         oLTg==
X-Forwarded-Encrypted: i=1; AKwUvBwYOpBWaQ9HR0V6R9dJMh1fgxWH7hoK2MYRezd9KrO4hpOz9Ct/v9axCCeOXtkMn0G++aSROT6UpPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq9dn0N1Ds71tCKDlbwv37ulUMl06JiYOqBTZuK+xDWUmhu7XB
	gfmeDsooQGr9IGkK6EcA+S7tEkhlD+pwg89UE+yQOwvc6RO79dfhxriJ
X-Gm-Gg: AYBFou0hEq7RkuVR2CGph6t5ajZhK466ZQgp+At80T0PJUcZ/UFWWYcNW1++k0XYBhk
	XV0tMvNm3AHYQTtXGqhfM/JBjvtjjPIy0hSO1c1UR8xctCPUSFcCoXDadJsoKZzcubbYVs7mn0R
	8Tg7Tk0gP7TdqDmkk94w0AVzG0SKCIghSvfTHqRb0PvPbAICrqII+jqB1dsQQfFCXcXdPtcJPKj
	orwqDrBGrLU+T3IleKVTy5UxbPAFPcs+wkgCJW6h5Lel0tL6kBzFEDEuQp0j28LbPxMwKvmHy6F
	0dHvLG/C9sLK/2O/F70KRut73WDLI9JqFS4ImqJ4v4YDsRwpS9yKeICfi7psF3/K48NdZolVrV0
	yznzRzZ6Ka+5+bcy10YB76PSL+GOfGLtOVa+0e3qrFAoxLGFHGQ3lzUEj/AusSxKmNba+yHh16a
	4KE+QZFYD16W3L9jCEmeHQUlb+hU/Ju8bODtHyjkdpDbd8L3DOcWMD1BNKHNgerrsTVEn7rUtbE
	5SXktJmOD1WWJUD5jNafaxVpIAGEQPq
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr155420775e9.21.1791799713755;
        Mon, 12 Oct 2026 03:08:33 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:08:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 00/11] ARM: sunxi: add Allwinner B288 and the PocketBook Verse
Date: Mon, 12 Oct 2026 11:08:05 +0100
Message-ID: <20261012100816.331033-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This series adds the CCU and pin controller drivers, the RTC,
I2C, NMI and watchdog compatibles, the SoC .dtsi, and one board: the
PocketBook Verse (PB629), a 6" reader.

The B288 is closest to the A64: most of its PLLs are bit-identical.
The clock and pin descriptions come from Allwinner's BSP, cross-checked
against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.

The pin controller relies on "pinctrl: sunxi: dt: number the IRQ banks
from the first one that has IRQs" for correct PIO interrupt mapping.

Changes since v3:
  - CCU: reference parents with clk_parent_data and clk_hw pointers,
    as newer sunxi-ng drivers do; add the audio PLL's sigma-delta
    settings, as on the A64; fix the PLL_24M rate and parent the PLLs
    to it.
  - RTC: register the 32 kHz clocks, reusing the A23 data (Sashiko).
  - DTS: take osc32k from the RTC, as on the A64.
  - DTS: allow the eMMC up to 150 MHz, as on the A523.

Changes since v2:
  - Drop the MMC binding patch, applied by Ulf.
  - Rebase onto sunxi/for-next.
  - Constrain the RTC clock outputs and pinctrl interrupts in the
    bindings (Sashiko).
  - Add a B288 watchdog compatible (Andre).
  - DTS: drop the memory node, the arch timer workaround and the
    sunxi.c entry; add disable-wp and the eMMC 1.8V modes; DLDO1 no
    longer always-on; mainline pin function names (Andre).

Changes since v1:
  - Add this cover letter.
  - Drop both new bindings; add the compatibles to the existing
    allwinner,sun4i-a10-{ccu,pinctrl}.yaml instead.
  - Rewrite the pinctrl driver in the DT-provided pinmux style.

Pablo Mazzini (11):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver
  dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
  pinctrl: sunxi: add Allwinner B288 pin controller driver
  dt-bindings: rtc: sun6i-a31: add Allwinner B288
  rtc: sun6i: add Allwinner B288 compatible
  dt-bindings: i2c: mv64xxx: add Allwinner B288
  dt-bindings: interrupt-controller: add Allwinner B288 NMI
  dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
  dt-bindings: arm: sunxi: add PocketBook Verse
  ARM: dts: allwinner: add B288 and the PocketBook Verse

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  22 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   3 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   1 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 114 +++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 292 +++++++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 749 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c    |  49 ++
 drivers/rtc/rtc-sun6i.c                       |   5 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 ++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 20 files changed, 1398 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

-- 
2.52.0

