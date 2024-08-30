Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1970192B8E
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022954; cv=none; b=AqzAL4WebBpIqhizJd5wDgsZoX1rr0Ox3JvfVhmz/JLVwXrEedbTgh8FSVjco7ZOGmEgF5yCDrnGEeQpgbMV7F3qm93JZ/x/zg5QbYDH/8i1QS4HKha/dkhKc9J/kQo91+YB04/6Klv70dH4gGXyb3ghbRXV8DSXxCWe3JNaSGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022954; c=relaxed/simple;
	bh=dt4FKbEMYk/rV0y2plQpOfZYZE9i1bk/j6bo4oeHAGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n20+lT6s0/OUvvWHt2tMWNbOfdAfKLLxK23UhEJy7qke7xWl4qt30oSUQCOGdEI4k7olcR5KR9/LwCKkDPsY8BzNPRYls0/YKsxxxmqZspaO845fA2NRuCX5wKKinQK43QTqPX06k4DAaKIGKcTlajWhhheZhFv2oV6ZtWbMH/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NqrzlCHR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NqrzlCHR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-428178fc07eso15110425e9.3
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022951; x=1725627751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6nGKHTlsaYnNPo28i56acvgAz+0LehleKY7G1KLCDM=;
        b=NqrzlCHREA+tW6Z0OtQbQVWgX39SHyuSboB92i+EOKDL5K+MfmwZO7k4OQsRWb16HI
         QL5axEW2zjfj4DWxYr4z5IEFb1hVElEFvatCuMlx6cSXGZIcYj6zGUzOyrY5LqMg54Lq
         ZxMk2Zpu5WwPee54ECjiztstAcIeF/R2GtWL5ldZW8hZ3/1h6wqYcjLuzn7lWq1HK22t
         j0s4gYHWXTSQ7459uwj1LH3zyhll0cK1TMDh4/vy1UWEoZQrTgcr/Vh0X5R7n71gqgDG
         HifOLyNJ2gqc1RgmQxDe/2tDH0amS2wMGW0D43QEUFqvbK/22Lw0suEj9OwqAfqdqUOH
         FccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022951; x=1725627751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6nGKHTlsaYnNPo28i56acvgAz+0LehleKY7G1KLCDM=;
        b=J2PoyXZLwGHi+6EetDlE3neXWPOT3IYOGZ6QchDSsSLugx+E7cnxL2/PmMAcJuINCS
         1EoAZpCqBrL0sIZbvhAbKnITHhcz/ivE8CkBRlgFUVa4UFa6KMvdPeNFj0I+ePsiX97M
         8vzRawMLLE7LlTy0M2HJJV3TG5Ck4JZDYWAGaMmvKJPLwhTJG4/GSrC+LJiPT817LvTr
         CAqZBRCHqHkfXCi6LlGq/7Y+WzTllSg/6vT1n+maopIHjGg7Dgl3DBrblkgBtnxyNgpl
         uDRAHTlJHOU4fIw63nsXZy6wqFfC5IVykwabewLo+M1l7Ayv6yxYX4IZ+NF4etvScAqa
         UOzg==
X-Forwarded-Encrypted: i=1; AJvYcCXsETGxwd20sEYXU6nZcXI5vxxdnoceUz2XxTLtsB9cjyi2rNlyQupxTUXkiZ1FK1f368ISj4Eoe0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMH2MZb6qUFGHnd6/WvzAcBXPk2YJst5kL3O1PPvLy61gnDURr
	GUEdWjMOk8tG667RhtMlPsdBE7MTDNB3qS9CrTVS3Qsan81sy3X26PvgXvxqWeQ=
X-Google-Smtp-Source: AGHT+IFf90G7UI94oipmrsRGbRwetRqyjDJaZ1p7GkAjuXdmmZqJgfa2LrZRlu4lQdJfeM0ibK0EqQ==
X-Received: by 2002:a05:600c:3b89:b0:426:6688:2421 with SMTP id 5b1f17b1804b1-42bb02ee44amr47400445e9.11.1725022950478;
        Fri, 30 Aug 2024 06:02:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:30 -0700 (PDT)
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
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 00/12] Add RTC support for the Renesas RZ/G3S SoC
Date: Fri, 30 Aug 2024 16:02:06 +0300
Message-Id: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
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
(patches 01-04/12).

Patches 05-06/12 add the RTC driver.

Patches 07-10/12 update the device trees with proper nodes to enable RTC.

Patches 11-12/12 enable proper config flags for RTC to work on RZ/G3S SoC.

Merge strategy, if any:
- clock patches (01-04/12) need to go though the same tree because of
  patch 04/12 using the devm_clk_hw_register_gate_parent_hw() introduced
  in patch 03/12
- RTC patches (03-04/12) can go though RTC tree
- DTS and defconfig patches can go though Renesas tree

Thank you,
Claudiu Beznea

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

Claudiu Beznea (12):
  dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
  dt-bindings: clock: r9a08g045-vbattb: Add clock IDs for the VBATTB
    controller
  clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
  clk: renesas: clk-vbattb: Add VBATTB clock driver
  dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
  rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S
    SoC
  arm64: dts: renesas: r9a08g045: Add VBATTB node
  arm64: dts: renesas: r9a08g045: Add RTC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
  arm64: defconfig: Enable VBATTB clock
  arm64: defconfig: Enable Renesas RTCA-3 flag

 .../clock/renesas,r9a08g045-vbattb.yaml       |  81 ++
 .../bindings/rtc/renesas,rz-rtca3.yaml        |  86 ++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  36 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  13 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   4 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-vbattb.c              | 204 ++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-renesas-rtca3.c               | 892 ++++++++++++++++++
 include/dt-bindings/clock/r9a08g045-vbattb.h  |  13 +
 include/linux/clk-provider.h                  |  18 +
 14 files changed, 1369 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 drivers/rtc/rtc-renesas-rtca3.c
 create mode 100644 include/dt-bindings/clock/r9a08g045-vbattb.h

-- 
2.39.2

