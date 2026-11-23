Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795398075;
	b=15XNX5fpdr+L4kvDDgVUQqjvwYTOfZ+sTpTbym2OcdhuIiY10eqmUGn0f8D+6N5T6FCl
	 BYwMrog8/gguILB3Z+TVT5oSUV+5PYB3+dai5iOXO7nY3YVDuCXbNBnozlEo0xOSl0DFa
	 pd/XdIKqjUwyNM6vKqI7H/fR8MID5lTfhFvqoB29Ft4GmXaRM3OVkCL5BPdESocWtIPj5
	 0Xo3J1MRQYenYemk3iXXGVyxrd0hZViMcRA+ikI4vj1YjrANLk5bge28i+jTJzN1Txujm
	 4Mq/C3Dt3v5ktHd3M/b3iqKAQ8x3jrquYvP4WhQADnSFhoL10LGX1MmvH2AKqYqZhnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398075;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=tLsocaNpnQfL2Qn3za7FM0BrdFl/Nn6dKJAwiMy+40w=;
	b=ATMJcHhNP2cT1ZW44cvZ0HvmXcX9iT6HypOQTc1kBuraxGEf3ABMIDgviMNaXhM9honJ
	 7Ap1KpoMgj6+Rem6uas3vfzQT3RJjnjqct0Z352Yr7eorRSb72soAXLO/N0FnXNvQ9lz0
	 ywFQTudufmln7b46qsykabNQ6ujeXqfSl6FwwG++fQV0h8Fi0VDgPVhXV7t6kUyzO/UyB
	 682FYt1hpFc3sPh+kmh7lTxZhUYTh6wxyHU9y3YoY0z/2pL2BE9ldO0ZIitVRezvsRh8i
	 aD0X+f4q34afs4WxjJqszhthYu7ImcBoB3MKT8Jh5TIYXzd1lFxnwDJS9NbcnUIXQdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hd81+JGX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF701606A320;
	Mon, 23 Nov 2026 01:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hd81+JGX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795398075;
	b=bCtKDKGfPePUOvwMrTaFgI5/BBIfuZRolsWSHHlnrFzugxQSS3S9q8UqOrqIQr6gWLm8
	 fGbenr3JwLw7LIqYzTW2SSSsf/VZ/c40S1T78B1+TBPxelXZphTyuHdGLxOgXY5RJnaC+
	 cBF21ol/sLCC866kNclsoM6cPLTv1vKXk/ic/rEL25eT4DQ91qIivf62DpbaLPSnGjCzY
	 0Hw7ecx9OKBlnTL4eJtgPSkycG9c/HiEN9NDaMRWWdL26Cy6kAWPTRqSH75+n6iCRnv5K
	 UA+0zm/GCLSSR5D22I4PzGxxJE5276r5QLDtsPExbuaJOzXt0gBlO8JPpXPx6qXJ1Bw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795398075;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=tLsocaNpnQfL2Qn3za7FM0BrdFl/Nn6dKJAwiMy+40w=;
	b=dFxOLD4aq/m3X1qyCt98ufBKmqie9FmcnbMJZM6LMCc6EE5s0Jk5l80Qe49NfPUvTWe6
	 qbsOZI7LnFhS3IBj/NhNrIpVc/aMNfxw0fuuKHZPEO9e7LsKAO6C64u8656AmubnVLV3f
	 DyvdH634w9icuVnF0YTCzBa0re+GDo/XmeFfm2Yp67lJ6avvcPIixREY3UGlMGYbbubCe
	 1Lgr26xPsnW7K68hIU7Dj5tZ4gujK+thx+R6dSVdUJflkd033F5mbesLZdzSmcwyy2Bo4
	 baUpEz535f3u4zTNtGeXUL6h1aCjcbR8bkdANc01kPnYBmiijykCta5nP7TCSWkYIOQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBDDF1F000CF;
	Mon, 23 Nov 2026 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795398075;
	bh=tLsocaNpnQfL2Qn3za7FM0BrdFl/Nn6dKJAwiMy+40w=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Hd81+JGXmcjUU71t+glZLP2av2xGbDvXzsb1Vid6LtU55b1CcZHlq0k/K/DrhKBw2
	 lhbXSHNc0xrdilo9u4957qXya/2m9yiFBtXDmlh8HWQqPn2X3ZC6e05yNHjU7hagUv
	 nyoWeeQe5CKiDF2wLGdEAJW0w4vWAt9pOmP7M2jGWhVpLzL73pdEDM0ju8272g9kNe
	 MxiRRVpaqGsNQXUZA5lwvmjP/Bhd6Gz75arwzEKoGN8TAT0Hu6mQdQ6+Am1opxZ9rU
	 5JCfs+pdzbIp+NoTfYfLtN+oUWAgufroAXA488qkY3XElm7uUhLDq336XhxQe0TIcE
	 yDvJpz5o77q4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1C5224C2C4;
	Mon, 23 Nov 2026 01:41:03 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v4 0/4] clk: Add the Siflower SF19A2890 clock manager and
 peripheral clock and reset managers
Date: Sun, 22 Nov 2026 20:40:55 -0500
Message-Id: <20261122-sf19a2890-sysm-v4-0-bbfe1c495e2e@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAKeZA2sC/2XOy27DIBAF0F+JWJeIGVzjdJX/iLrgMTT0ESdgo
 1qW/73YadUkXl40515GligGSuxlM7JIOaTQnkqonjbMHvXpjXhwJTMUWAMI5MnDTmOzEzwN6Yt
 rC95Yg+DcMyvoHMmH76Xw8HrNqTfvZLu55fci0qUvS93/2TGkro3D8o0M8+vfYvW4mIELriuvr
 VDONyj3HX1q/bF1lNnclfHGA6w8Fu/QW6NQUuVh5eWtr1deFm+EMlY1UupG3flpmn4A37+dh1Q
 BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795398062; l=6013;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=oMM77eVn7G6gdAIeKsbvVgADmowcFU+4UySPajp1GoU=;
 b=BX+480K5tUNbPEtSrAzd212msLLMC4Gtf1ZkVHTopBUBpB6kzKoHN/me1hcT+M2OfWSGNhS6u
 z0UDLjJvwwqD+ZrMgvtVbCx+J4J0rphB0h1rOOuiUkG8h6lNBXDqOJc
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

The GIC timer runs from the CPU clock and probes before the platform
bus, so the clock manager registers that clock and its PLLs from
CLK_OF_DECLARE_DRIVER and the other clocks from a platform driver. The
SoC support itself (MACH_SIFLOWER_MIPS) goes through the MIPS tree;
until then the drivers build with COMPILE_TEST.

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

[1] https://github.com/981213/linux/commits/siflower-7.1

---
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
Chuanhong Guo (2):
      clk: siflower: Add SF19A2890 clock manager driver
      clk: siflower: Add SF19A2890 peripheral clock and reset manager driver

Joseph Telaak (2):
      dt-bindings: clock: Add Siflower SF19A2890 clock manager
      dt-bindings: clock: Add Siflower SF19A2890 peripheral clock/reset managers

 .../bindings/clock/siflower,sf19a2890-clk.yaml     |  57 +++
 .../clock/siflower,sf19a2890-periph-crm.yaml       | 166 +++++++
 MAINTAINERS                                        |  11 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/siflower/Kconfig                       |  22 +
 drivers/clk/siflower/Makefile                      |   3 +
 drivers/clk/siflower/clk-sf19a2890-periphcrm.c     | 362 +++++++++++++++
 drivers/clk/siflower/clk-sf19a2890.c               | 486 +++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf19a2890-clk.h |  27 ++
 .../clock/siflower,sf19a2890-periph-crm.h          |  87 ++++
 11 files changed, 1223 insertions(+)
---
base-commit: fc1f8f0ceb3b949b58c2f7819976644f5cf84249
change-id: 20261102-sf19a2890-sysm-ac1fbcb21dd5

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


