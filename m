Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385310;
	b=fx3IHEMYvN2JrKF6FQNNSLjDoWcoYrZFiOJ69KDXjOehHBAOFBxlHzSw0xG7ml8/O913
	 5s4806ZB1oQa/rkUL56LxpVTYj83L8zmE5djiRlTmXEUi/enW5jvB9TKZEtAu14NFq+Yi
	 gGSXHz2lrkO9oSw0RnwTT4iIIv5nIEOVPAYb/PzFdd/ldk9Xj63Sp51+7TLNqFiflICQC
	 FozAeb6Cktt1kEb/43q4u75rDtK8Enle0bCxhz+693+1dhjhjXqxQHQgtydYFtK6bC6Q4
	 bVzXQXFZrnnQHgufzm+ssmWbpthRSNDkPFbDKDd8MLfKd5XonYSwfmoMPx/gk29Qedw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385310;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=R+t9TTQevWbIVqkEmr3FE3HZdhqg2+gJrk5fgBgGCis=;
	b=mFxhP+P5YZa0Xhu/pBm/XXy8Tdvctp10BIOnRFBQcr6vWjLzGe9ctS3crRWvJ2qIZAnV
	 tdKmiTx/MXAKYUarW5DYeE78UhUr01UWGGnO/httxxfpbFgYm9xOzOw+WzrMELrdzdx67
	 /EF70CbSVE95lczE07+caQRSarM1e/bPKHfz4XzGe4O4pExN75paJTGaZpRR8SIJa2cCT
	 SC20LZxgeKyHBHDbYezEn5dY1GkRJOLln8dCIbXlpO+2xkdPYhlDmVtAdlN2v6M8D1Kro
	 +81yM5kv2O6n52E7trvGHpbkp1JFP1NuxeGkNwuiwnpvaOnVjokc1yBKYYhDMMjI2WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EP7NmiVC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FB7606A32A;
	Wed, 11 Nov 2026 08:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EP7NmiVC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385309;
	b=WtjRgu+oDnAExypFJqyPeCS2GYR2/StXWdEEnNBcsjAYroJF89FXVJ0t34LcIREjKA8A
	 u3ZtnpHRJMYjwfZCncj2+ERoqoCtAlXg4j3rtxKmuM8HLqNGeJx//bo36kgmpNSXSCq2v
	 OkdXbH/tgnsJkHb2PJ4gL0+scsMCAWbhzwrwY44mVNm2kWd+7F6EF8b/WTrttuqU4GbUS
	 DbFJKSasuDuU64/lyoAmQNrYQVkk3jv+iBKnDWnkQ6PXKvfLiPadLLsUyK67Z3hUYoGtQ
	 CV+nnI5fn9x6UjnO/aa2nVqE7uKD6ldAkC7oKbiI36SidtvmA8Zqz+cjLNVyzLDVAeA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385309;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=R+t9TTQevWbIVqkEmr3FE3HZdhqg2+gJrk5fgBgGCis=;
	b=0/YB6ZhwB6fzi4hR7SFLti7Ou+O7cjPnZCUIr/3shzC15ZpJD5FTcsWyk84Y98coqkHr
	 PLNI5GGTIu+2PED5RkjoX2ykAhdgp60A5WkuG2YVcmbZpaSw8ZoLeRpeVghVJogqpPga8
	 swcZJjjewFY1yWR7fHDWz2HQ1YUz628hxTNkeeZtzk8t2zb5efsF0sJnatIH//yXI7YN6
	 1DERM4haIF7ikOeGUf16/SzxRA16JfXKVTPjix3ET5IdJRxXWdvAPPCS3//KiEl0sO4HW
	 wftBk03C5Au2w0/m0cXgUMt+7wFI9WdfXGPgTTWKDqOJH3TsAg22k7AgwjoO9nA7FKg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CDE91F00A06;
	Wed, 11 Nov 2026 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385309;
	bh=R+t9TTQevWbIVqkEmr3FE3HZdhqg2+gJrk5fgBgGCis=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=EP7NmiVC3gN60SUdJWWUaQAbFMHfnBNL4A0zCdxOlrvNfy/7mt3U4IWPTeFQ4HSk6
	 tEvUPyZw0K5WCZDSIWeh7SetABLIUWBOEi1vAyTwG032B1tvC1Ld90J3bOT2yqjJpi
	 hBvE0S2bKe9ZwFQnQbNQzg1nVgH6ktOjSxV1mybbABzZxCjlyv3h7mreLAP8qCmqiE
	 TZVNqpej1FdG/5mPrBt31jnKJJQp355ur7sgKdKN5jFw45/BVqqCc//iD0YT/4m9wF
	 1Kyh4+NylvcUYX0KkYJkbbmJW8UKmTf81Ygq9o8+keT7rzWiDSqWQ12hcEvOnmaYfF
	 nLcBPJDO/QfJg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 717E348E75;
	Wed, 11 Nov 2026 08:21:48 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v2 0/4] clk: Add the Siflower SF19A2890 clock manager and
 peripheral clock and reset managers
Date: Wed, 11 Nov 2026 03:18:59 -0500
Message-Id: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQk9GoC/12Oyw6CMBBFf8V0bU1bUcGV/2FYDO1U6gO0UxoJ4
 d8tqDFxeSb33jMDI/QOie0XA/MYHbm2SaCWC6ZraE7InUnMlFBbKYXiZGUBKi8Ep55uHLS0la6
 UNGbDUunu0brnPHgs30xddUYdppVPwuOjS6bwi9WOQuv7+Y0op+vXmP0bo+SCQ2ZBi52xuVofA
 l4BLiuDkZXjOL4AM5GkotQAAAA=
X-Change-ID: 20261102-sf19a2890-sysm-ac1fbcb21dd5
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385307; l=4303;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=HkAdTr0yGZ2/sgV90XoJlVTobOT6ff+qpF7El7nvuMk=;
 b=TRifMZVGTFZYkTTlHZ+ZBeQjq/IQFWCC4K0nWGAURZORsFk+kQDBqxD39MvZ/M8GQcJkZ51d+
 zfucitSD2dICIp0X2i0opEQBuzWaUDN0VIpy486ghG7LmvMKardZkCo
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

The Siflower SF19A2890, a MIPS SoC for home routers, has a clock manager
with its PLLs and the muxes and dividers that feed the CPU, the buses
and the peripherals, and for each peripheral block a small clock and
reset manager with its gates, its resets and a bus output enable. This
series adds bindings and drivers for both.

Both drivers are Chuanhong Guo's, from his SF19A2890 branch [1], with
his authorship kept and my changes noted in each. The clock manager's
driver is unchanged apart from fixes. The peripheral managers' binding
is rewritten: Chuanhong's described every block with one compatible and
its bit layout in properties (siflower,valid-gates, siflower,reset-masks
and so on); here each block has its own compatible and the layouts are
tables in the driver. Clock N of a block is its input clock N, gated.

Following Conor's review of Chuanhong's SF21 clock binding, the header
has no count at its end.

The clock manager registers from CLK_OF_DECLARE because the GIC timer
runs from the CPU clock. The SoC support itself (MACH_SIFLOWER_MIPS)
goes through the MIPS tree; until then the drivers build with
COMPILE_TEST.

Tested on a GL.iNet GL-SFT1200: the rates in clk_summary match the
vendor firmware's (CMN PLL 1.5 GHz, buses 300, 300 and 375 MHz, PBUS
100 MHz, UART 125 MHz, GMAC reference 125 MHz, USB PHY reference
50 MHz), and the CPU clock reads 800 MHz, the rate the GIC timer was
checked at against a reference clock with the MIPS series; the console,
DDR and buses survive the unused clock sweep; the UART, SPI NAND, I2C,
GPIO, GMAC, USB and watchdog drivers probe with these clocks and resets;
and the I2C controller works again after an unbind and bind, which
cycles its reset.

[1] https://github.com/981213/linux/commits/siflower-7.1

---
Changes in v2:
- Write my notes on Chuanhong's patches as lists, with Co-developed-by.
- Use GPL-2.0-only, not the deprecated GPL-2.0 identifier, in the clock
  header's SPDX line.
- Add a MAINTAINERS entry for the drivers, their bindings and the
  headers, with an F: line per driver, since drivers/clk/siflower/ will
  also hold the SF21 drivers.
- Include <linux/device-id/of.h> instead of <linux/mod_devicetable.h>
  (Uwe).
- Word the error messages the same way, and use the current SPDX
  identifiers in the new files.
- Explain in the commit message why some resets cover more than one bit
  (Philipp, Chuanhong).
- Patch 1: add Conor's Ack.
- Patch 2: with the PLL's fractional modulator on, scale the fraction by
  the reference rate, not by the integer VCO rate; and reject a rate of 0
  in the mux dividers instead of dividing by it.
- Patch 3: add include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h,
  naming the clocks and resets of each manager, instead of listing the
  resets in the description; patch 4 indexes its tables by it (Conor).
- Patch 4: no comma after the match table's sentinel (Uwe).
- Link to v1: https://patch.msgid.link/20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev

---
Chuanhong Guo (2):
      clk: siflower: Add SF19A2890 clock manager driver
      clk: siflower: Add SF19A2890 peripheral clock and reset manager driver

Joseph Telaak (2):
      dt-bindings: clock: Add Siflower SF19A2890 clock manager
      dt-bindings: clock: Add Siflower SF19A2890 peripheral clock/reset managers

 .../bindings/clock/siflower,sf19a2890-clk.yaml     |  57 +++
 .../clock/siflower,sf19a2890-periph-crm.yaml       | 166 ++++++++
 MAINTAINERS                                        |  11 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/siflower/Kconfig                       |  22 ++
 drivers/clk/siflower/Makefile                      |   3 +
 drivers/clk/siflower/clk-sf19a2890-periphcrm.c     | 368 ++++++++++++++++++
 drivers/clk/siflower/clk-sf19a2890.c               | 419 +++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf19a2890-clk.h |  27 ++
 .../clock/siflower,sf19a2890-periph-crm.h          |  87 +++++
 11 files changed, 1162 insertions(+)
---
base-commit: fc1f8f0ceb3b949b58c2f7819976644f5cf84249
change-id: 20261102-sf19a2890-sysm-ac1fbcb21dd5

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


