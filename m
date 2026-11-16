Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866704;
	b=cYRZAmbe/BpVZy2MD2nPQ8OoLV5qqWobt8A2lgML8lQ5fKKwDSTKEsBEqqKSG8TQGf3U
	 sa2MVf0gG8PbA8ULxil4lgJ/1Y581Fb8MJahfYDdGMLLDfq5G3lo7q4Rt6Xmac0dhhM/P
	 StLXgZzOtqk47FP02q1X5i7Njtx7nBt3xq2hSpOwIEvwbZXxWnsOU1U1jPhsnvAC7zaPW
	 +KjKixmLIdOdoKZ/pwGSzOlCcer6xL4WuYgUBvVG7HCRfOKa/fxbunNFhSmZmp3woG81Y
	 p0kec6zH4miCYfiAxEF0PLh23UmcowoD54DDCBzg3W4ihxcRik/3oY6Akx6BhIqVm7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866704;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=o3DAJ0HRnUrcXoNvv8+08efsKdySAWu+2qsLbILDMv0=;
	b=ZYxW012Pmu4bi5Rb//T3LfIhs0iQjypQQMn/nj8u7cpJjQLs9oDQ7vgVJEyZHJ7umS6m
	 b61EJBDG+dqzBu3Y9E/mYOj6KFOGquJ8+wN43uEclr/7QIkdsZeK6OeeMmEWxYbsxvGJA
	 ShPdnawvd4oVG45Uctb5eWnCl/slmAXWtKoet5PSxs3aEQupUoApj014QiDcD3yx4stNB
	 bH50qtUwovy5bS50FsH6T/i+e4bZ31kxRJ7sGlLh7F9ZSRzeSt69jKizeWsZZNpgGvCqB
	 4ICwtgLOStBpFr115bDn49vLc+Y1ZLVuxKlJe529RO9g+oMd66MZBCdejySH8FUKHGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2DuPZa6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48413606A333;
	Mon, 16 Nov 2026 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2DuPZa6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794866704;
	b=cJerBDnibBNp8gfXfDZ830W8VHTUii8auGP8qaXEWLLteXDwaaO7WmL37TN3VVnASuSb
	 FSU9z8JeO9VPWTD5Aeq6Bq1CGhdrz0fTyTAm0VC6iNBM1dtvirG+N3ncSuqMz9JSZSKot
	 JYpl83ILgTdfYxlK5QtlJAunrzl3Tgfjv4PUfql3Y8XHIlHNAfAgt4VC5f8u7dfdVO7kg
	 qH3jUPdEiKyRpRqNo1mYkiXMTf4tjdvc8Rdq6scwgpqdtNCKgFq5iyOqX7mFshgi0ocxm
	 VPV2DeQh9UxQqMgxoMalBC+JN6dYzMtFE4CNvBi3tBBzxJyG4M/9LRcM2hcXUbc8tIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794866704;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=o3DAJ0HRnUrcXoNvv8+08efsKdySAWu+2qsLbILDMv0=;
	b=tSAezXygdL/M6baR9pKvCX4zoT+3m2MakEOmYop91x4YfCRa5S82OzTzzO/If7iPZBoM
	 56W8qMFlx8dQ6qylfN2wDaMKygjpOTDYihOvrrWM7orJV028GXvqh0CLfl4CWv5o3kzKx
	 9/WTMHxMbNVG/s/aZtXkdLf3bWvqhLLIg48kQR26rW6D8M6ReMpfz66DgLxCC2C8AbVqy
	 geApkLcLFZUrbThBifv13Hk2BPI5q1ZB0O2Kc0XJx2WQqOl+NBHv4xNkHZ3ZbOZSO+31Q
	 FKKg9NUmpPQFPiLVkWJyEXTCHJ1LCSkK/ZQSQVnvwOpeHMJI5ubFVZr4e94oEX533tg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 016AD1F000C5;
	Mon, 16 Nov 2026 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866704;
	bh=o3DAJ0HRnUrcXoNvv8+08efsKdySAWu+2qsLbILDMv0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=X2DuPZa6ToXmzzrJKJAQHfyWctdN+TMSSI2cImS+iPFgnZy62FeUWjIAlvzbqskHZ
	 7dVizIUVS7AaIi7lLtcSUx/7+2r8VHkf1Avw6Msf9ikajNKEPPVWdAYGjXEXOYcIMb
	 /jl93qDJV67wBDgmATXkD5DN7pLTMIhiLJqqmDxd/kSomX+63QBxIVaL1FIACPydXR
	 giBQhRsaUwRgapvuMdnVyy6PJjuoGBTL+OIntKBQD5McZXtuBw+aQRvcTcUYMp6mVj
	 0Fi7eIP8jb5K8AzBfjjDjar5BLVhuGiLuc1r9JFxNNas1GHtiy9DX9MY9o/dyFMB/7
	 aAaBe90FIYpaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 56F654A604;
	Mon, 16 Nov 2026 22:05:02 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v3 0/4] clk: Add the Siflower SF19A2890 clock manager and
 peripheral clock and reset managers
Date: Mon, 16 Nov 2026 17:04:46 -0500
Message-Id: <20261116-sf19a2890-sysm-v3-0-b07bc7833a87@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAP59+2oC/2WOSQ7CMAxFr4KyJih2CwVW3AOxSBOHhpm4jahQ7
 07KIKbls/7731fBFDyxmA+uIlD07I+HBNlwIEylD2uS3iYWqHACoFCyg5nG6UxJbnkvtQFXmhL
 B2rFI0imQ85d74XL1YG7KDZm6b3kmAp2btFS/Y5Xn+hja+xsR+utrMf9djCCV1LnTRhXWTTFb1
 LTTejuyFEXfFfHDB/jzMfkWnSkLzCh38OV3XXcDf8V9gBQBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866701; l=4774;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=lj+d99xoFwkdyN2+RnvfppViMpO8GlW8yclhuqv6J6I=;
 b=63QImwQ1uC8d3XutETgwiR66VqeySik1W+fW3phzPCG4D9Hk0TSkvRLSBDHKvlL+RM6StiF+D
 mC8qobbjblTCIZEwdEvx4kdVEpnIRJbAxIWyx0Uafxbidik/4Eg0TAG
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
Changes in v3:
- Patches 1 and 2: name the NPU clock CLK_MUXDIV_NPU_PE, without the _CLK
  suffix that no other clock has (Brian).
- Patch 3: add Conor's Ack.
- Patch 4: take the spinlock with guard(spinlock_irqsave) (Philipp).
- Patch 4: explain each multi-bit reset group in the commit message, not
  just the GMAC's (Philipp).
- Patch 4: add Philipp's Reviewed-by.
- Link to v2: https://patch.msgid.link/20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev

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
 drivers/clk/siflower/clk-sf19a2890-periphcrm.c     | 362 ++++++++++++++++++
 drivers/clk/siflower/clk-sf19a2890.c               | 419 +++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf19a2890-clk.h |  27 ++
 .../clock/siflower,sf19a2890-periph-crm.h          |  87 +++++
 11 files changed, 1156 insertions(+)
---
base-commit: fc1f8f0ceb3b949b58c2f7819976644f5cf84249
change-id: 20261102-sf19a2890-sysm-ac1fbcb21dd5

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


