Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638303;
	b=mCd43igmz/yOrymJ1TdLOK0FU5VUZdaVJJ6CT/55eunZHjavBU3mvTfPjOMaLyQ+JVe/
	 U2xwJuTPCDULqTGXNe6E9OOiVD5kmZxqIH6TtAufdRZoXcxNHNK45GNqdP9BKPmr7f4jA
	 PGImP0ep6sHQThtX6idSRHYRZiFx4j291R9IQA7ml6OFntSJTTGC1YCUZPZlGWO0RhuU6
	 5fIkZJWA2UkLE/+wG8EFEqnGqMdprmUqMH94g7DFyZzYHVP5IqtUrwatU3M5iiZy5h/ql
	 cKvS+DuMp0hUVXQrSH2phyNelQDYPlrJWzzv96z81CZCFi/70hSuyUEsCmNeEucLJXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638303;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=uzyPE1HCfOBsBncC2Pj7IbT3ZTq7U5PwcmywOMIyjKo=;
	b=NT9u15jLVqmnENZ10DN72y8lgYlWkzLcNKYqSVT8hfgz2iGwrLinpY9kek3BywdGzyw7
	 Wd8mOhf8jadAmA/+qOHlPWES1ptyCjn7IqtCCLKEcMWQ64RDDtMG/V6s+og9GFatwv7R0
	 p+a/guUECqPgIMSV6C0xp3ggx0CcBHF7kk4q25Wr3bSMoavXS+1xr8yA0W9RNGvYDPfr4
	 AeyDwyqC23L8CIqSaWRUhvkKryvVRlYgxGtOTFv17bRw5WfsKNFKJkMlU6TjDQPaj6Ab2
	 BVAzip5mugIDDpIp18fs/7qp9JaK3tkVaXOilG8LTZ5LD7Tga9ZHX9eNBcTHWNVEDFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEebNBFm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A59606A32E;
	Wed, 25 Nov 2026 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEebNBFm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795638302;
	b=YeHZF13zSIuNHNv9trEHDLA1h/kmCcohCqnI3xa6RH/UZwi/+YeLaa855Jypo/HpKxps
	 /ZwC6xe+HEYWd+BkIYiAW6c+wyVhLq1qh1xthIIASPN0UbCAAt7WJ1Bve9TNvLSLsM9Lq
	 OBGUB8rK+du5S8D84FOYi2DF2diDVtzA/8g9XyKSn46N/LtmtGEplIx28j3rIDr/D65IT
	 UE/oJ/GZfnazVAHGWPhJn8sVBqVYy+TwdMfyYlU93/5WiIY0mKc1f4QVON0B0XTsXvOFj
	 vfYQNPe4vFYF5CMhigqpk17lQPZ/sylQhUnd51hwixPVMjpUv22FS4WxY2c3Q2tRxLQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795638302;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=uzyPE1HCfOBsBncC2Pj7IbT3ZTq7U5PwcmywOMIyjKo=;
	b=AB8QK1ya2SX21fJ6qisF0vTDX3ClGarxwmn5zlD8UKiLDjw2g2OWXjeCKncfqPm6IaqX
	 pr3wT/zCXG86TneoeedgeEXzilAj2+WxdCzf5Ck2lGb3YwhuOA89PoLjHTjLhrpb29YPO
	 4bynLPhUwR8bBvK2visq5Bcuw7im86y8lUeeqYpDftWdzs+FBKHuzckqnUSkz7xpDt6Uq
	 BREe7A3hd+MEzfzw742Arj8tJ+v63FCgmU0PD4PlEvTSE0d+RZkwiSeGHlf0kLE9sjnyz
	 3j3/ntXP6zLGmYrgw0joxYLxJMiBQfpFcx054ew70rw0yVSunA1ynncxYiwb30RNV/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD29A1F000C0;
	Wed, 25 Nov 2026 20:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795638302;
	bh=uzyPE1HCfOBsBncC2Pj7IbT3ZTq7U5PwcmywOMIyjKo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=YEebNBFmCthOXB0mMz5ASlfGNqUMswemD0RtEbZx+3sMnXn16joQxnrTodNqTMtqT
	 GIv2/BtLUGU1K52rj+PpxZMy0qQcaafBvyejut+nK4Gugc2wBsLcV6dnLCytWA2EPB
	 l5/iF1/OxtCvQ7kINc72aZXtb8Yx6VbKsYOnYRlPNlOK9EsDU921eWcmaJx83PWcrh
	 n/OtrTN9nRdDayuNnhfZjTkdDT15vDeJkGEb5xYXOQrmWng/IWvLY8kQMiBdfBX0Xb
	 ZgMqdeHOM7cpeNeZQYGeW92uAaymehKUWGZ4FTeUhsOsYzCGZw2R2i43wyPC+1gmYS
	 TSrkzaB9z5Iwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1C3634D021;
	Wed, 25 Nov 2026 20:24:55 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v6 0/6] clk: Add the Siflower SF19A2890 clock manager and
 peripheral clock and reset managers
Date: Wed, 25 Nov 2026 15:24:47 -0500
Message-Id: <20261125-sf19a2890-sysm-v6-0-181875c10682@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIABBEB2sC/2XQ3U4DIRAF4FdpuBbDDOyy65Xv0fSCn8GitlXYE
 ptm3122alzl8pD5zpC5skwpUmYPmytLVGKOp2MN/d2Gub05PhGPvmaGAnsAgTwHGA0Oo+D5kg/
 cOAjWWQTvO1bRW6IQP26F291Xzmf7TG5aWr4nEr2f66bpd2wf83RKl9s3CiyvPxvV/40FuOBGB
 eOE9mFA+TjRqzEv954KW7oKrjxA47F6j8FZjZJUgMbLte8bL6u3QlunBynNoBuvVh6bixW1eBs
 InBo7Qmp8t/ay8V31yhqljPAWtP/j53n+BBuL8izUAQAA
X-Change-ID: 20261102-sf19a2890-sysm-ac1fbcb21dd5
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Chuanhong Guo <gch981213@gmail.com>, 
 Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795638293; l=9065;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=VpA0kqClLc5YSFfPt0R5xdNwLxlg3Gwqt0JMJXbAyHM=;
 b=VkEYzl/5IfyYO4mEl5T2PD/zwUmrlzO2WBbkP4G7HitLhGPpaLVubsKawgscjtgh+uHgHmE2h
 XelsjlOjFE9BLJbxnTxqnQIz+xirCRvRd/9PQxKrBBzO9qQyJrO0Zql
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
series adds bindings and drivers for both. The peripheral managers'
resets have a reset driver of their own, which binds to an auxiliary
device that their clock driver creates.

The drivers are based on Chuanhong Guo's, from his SF19A2890 branch [1].
The peripheral managers' binding is rewritten: Chuanhong's described
every block with one compatible and its bit layout in properties
(siflower,valid-gates, siflower,reset-masks and so on); here each block
has its own compatible and the layouts are tables in the drivers. Clock
N of a block is its input clock N, gated.

Following Conor's review of Chuanhong's SF21 clock binding, the header
has no count at its end.

The GIC timer runs from the CPU clock and probes before the platform
bus, so the clock manager registers that clock and its PLLs from
CLK_OF_DECLARE_DRIVER and the other clocks from a platform driver.

Patch 1 adds MACH_SIFLOWER_MIPS, which the drivers depend on. It is
the Kconfig part of patch 2 of the MIPS series [2], whose next version
will carry the same patch, with the kmalloc.h override in a patch of its
own, so that whichever of the clk and MIPS trees takes it first can put
it on an immutable branch for the other. Thomas, would you ack it for
that?

Tested on a GL.iNet GL-SFT1200: the rates in clk_summary match the
vendor firmware's (CMN PLL 1.5 GHz, buses 300, 300 and 375 MHz, PBUS
100 MHz, UART 125 MHz, GMAC reference 125 MHz, USB PHY reference
50 MHz), and the CPU clock reads 800 MHz, the rate the GIC timer was
checked at against a reference clock with the MIPS series; the console,
DDR and buses survive the unused clock sweep; the UART, SPI NAND, I2C,
GPIO, GMAC, USB and watchdog drivers probe with these clocks and resets;
and the I2C controller works again after an unbind and bind, which
cycles its reset. v4 was booted again on the same board: the GIC timer
runs from the early CPU clock (0.02 s off the host over 292 s), the
other clocks come from the platform driver at the same rates, with no
orphans or deferred devices, and the same drivers probe.
v5 was booted on the same board too: each of the twelve peripheral
clock and reset managers binds and gets a reset device of its own, which
the new reset driver serves, at the same rates and with no orphans or
deferred devices, and an I2C unbind and bind asserts and releases its
reset bit.

[1] https://github.com/981213/linux/commits/siflower-7.1
[2] https://patch.msgid.link/20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev

---
Changes in v6:
- Patch 1: move the kmalloc.h override to the MIPS series, as a patch of
  its own, and say in the help what the kernel leaves out (Brian).
- Patch 3: put each clock registered at probe in the provider data
  before registering it, so that its orphans find it as it registers
  (Brian, Sashiko).
- Patches 3, 5 and 6: add blank lines before returns (Brian).
- Patch 5: prefix the gate names with gate_, so that names like gpio and
  wdt cannot collide with another provider's clocks (Brian).
- Patch 5: order the declarations in probe longest first, put each gate
  in the provider data before registering it, and suppress the bind
  attributes, as patch 3 does (Brian).
- Patches 5 and 6: allocate with devm_kzalloc_flex(), devm_kzalloc_objs()
  and devm_kzalloc_obj() (Philipp).
- Patch 6: move the comment on the reset masks that cover several bits
  to the masks field (Philipp).
- Patch 6: depend on OF, since the driver only matches by its parent's
  OF node (Sashiko, kernel test robot).
- Link to v5: https://patch.msgid.link/20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev

Changes in v5:
- Patches 2 to 5 were patches 1 to 4 in v4.
- Patch 1 (new): add MACH_SIFLOWER_MIPS, patch 2 of the MIPS series
  without its MAINTAINERS line, for an immutable branch between the clk
  and MIPS trees (Brian, Sashiko).
- Patches 3 and 5: make myself the author, with Chuanhong's
  Co-developed-by and Signed-off-by and a Link to his commit, in place of
  the lists of my changes (Brian).
- Patch 3: hand out each clock registered at probe as soon as it is
  registered, and leave the orphans to the clock framework (Brian,
  Sashiko).
- Patch 5: describe the driver at a higher level in the commit message
  (Brian).
- Patch 5: move the resets to a reset driver, patch 6, which binds to an
  auxiliary device that the clock driver creates; drop Philipp's
  Reviewed-by, since the reset code moved (Brian).
- Link to v4: https://patch.msgid.link/20261122-sf19a2890-sysm-v4-0-bbfe1c495e2e@telaak.dev

Changes in v4:
- Patch 2: register only the CPU clock and the PLLs it may run from
  early, from CLK_OF_DECLARE_DRIVER, and the other clocks from a
  platform driver (Brian).
- Patch 2: compute the PLL rate with div_u64() on the parent rate,
  without first dividing it by refdiv (Brian).
- Patch 2: map the mux values with a table and clk_mux_val_to_index()
  and clk_mux_index_to_val(); a value outside the table now leaves the
  clock an orphan instead of reading as the 40 MHz oscillator (Brian).
- Patch 2: change only the source field when setting a mux parent,
  keeping MUXDIV_USE_NCO (Brian).
- Patch 2: drop CLK_SET_RATE_PARENT from the CPU clock, which had no
  effect: the PLLs cannot change rate (Brian).
- Patch 2: join lines that fit and add blank lines (Brian).
- Link to v3: https://patch.msgid.link/20261116-sf19a2890-sysm-v3-0-b07bc7833a87@telaak.dev

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
Chuanhong Guo (1):
      MIPS: Add support for Siflower MIPS SoCs

Joseph Telaak (5):
      dt-bindings: clock: Add Siflower SF19A2890 clock manager
      clk: siflower: Add SF19A2890 clock manager driver
      dt-bindings: clock: Add Siflower SF19A2890 peripheral clock/reset managers
      clk: siflower: Add SF19A2890 peripheral clock driver
      reset: Add Siflower SF19A2890 peripheral reset driver

 .../bindings/clock/siflower,sf19a2890-clk.yaml     |  57 +++
 .../clock/siflower,sf19a2890-periph-crm.yaml       | 166 +++++++
 MAINTAINERS                                        |  12 +
 arch/mips/Kconfig                                  |  33 ++
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/siflower/Kconfig                       |  23 +
 drivers/clk/siflower/Makefile                      |   3 +
 drivers/clk/siflower/clk-sf19a2890-periphcrm.c     | 306 +++++++++++++
 drivers/clk/siflower/clk-sf19a2890.c               | 501 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  12 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-sf19a2890-periphcrm.c          | 195 ++++++++
 include/dt-bindings/clock/siflower,sf19a2890-clk.h |  27 ++
 .../clock/siflower,sf19a2890-periph-crm.h          |  87 ++++
 15 files changed, 1425 insertions(+)
---
base-commit: fc1f8f0ceb3b949b58c2f7819976644f5cf84249
change-id: 20261102-sf19a2890-sysm-ac1fbcb21dd5

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


