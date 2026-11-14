Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699751;
	b=EYsY/S8xsIqhdan6NrbIC9XvtWo1JDTpXfcCYp5VrkmQPAGPwUXYeszh7QWPYpcxTToX
	 tY/7d3Fe/IWQbZ9WRIK+ZX/jL8DIeP4D+dGWolj6xPuXHR77wuSIKEvHIKj8Q9VRJl7I8
	 TgA53SR8ASTwf9xUL6Lhr2QukPctFxYcZA7RKaAsad+VS/ghWDnEWR/B4wgKwmLz5YhCE
	 YnYrIi0UzBkhBXU8Ez3EBzFX6PE9Heewkd5SfFlYYVcEuIRi91r34Et3GloC8yF66JyJj
	 dYzmkPZAkoA2vT5nJV5v+vqDzQck9H2MAiBWI+8llETH0PMFxsx6BhBE2lujtoAsS1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JIdwViW3MwPcND+fB4xrX/lkNYexl/I2+Vos84GFCrU=;
	b=0kZm8vsPNzxPNIO4Hq04z32XCxBByZlh9FEPtnrrFSFI9FmerkqFdc4op3EYg5wpjUSH
	 WEbCSHOxH25+Qveb+Sypt6bVh1WYHKMw0MCNcqLewkHtWGb/SieQb1m1iFlfZ/GL45sqB
	 XlaOA1ZT0IJDarcUwujdag9D0WlahPaIME5DCf3vywjRQz8xPpKKd5UFxpSoNFmQwUGCx
	 Z6FgFAXMQGhuxhWbtDLhuSqNYe5Gim4FpqlbLBZOQu2L09Z5vJmBYzKPVDGLguTuDdDNX
	 CHVK/mWXPwNjx7pF0Wvkj7vw62JoZJ8gS+gt76jXQNfo2RDpey4C8zKKAMEQi776DDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n478R7Ht;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DB606A327
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 23:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024DB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n478R7Ht
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b1535be329so1855877a91.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 15:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699750; x=1795304550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIdwViW3MwPcND+fB4xrX/lkNYexl/I2+Vos84GFCrU=;
        b=n478R7HtBE31VtoF09RFDgvxLOdNJoP0n6hcHMrmUrktIseH+Qot5DT3T45JARLpxK
         EYwmhr50HgrfShPJAUdrCoDd2KsN7eEeFQDpaLiUDvchx+qtvulWhlizHuXtyj7mMeYl
         n6RvHqXXfrfvyoPYgV/VRU8cswKUutBBdt7rdDXUlZW4Nc2SCtzhBDzkNNCyr8XtvsKr
         zTtrSucpEADd71MimhQc3qA/+Q6kz2rt8IHIKacsVFhb3ssD0B7vAHEoumEZof9coiFQ
         yvPbgVJlMWFwMV85in1/o6mZr3cUBIdUkL4jiqIdmvvXc0siKwLF4D1ci3eSv1SbVp74
         E2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699750; x=1795304550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIdwViW3MwPcND+fB4xrX/lkNYexl/I2+Vos84GFCrU=;
        b=nW5PcGV/r4PKhLbtjvAynFS719XOA2+6R/FVTkKoD1Yif2gTPBG7TEF0J6VxhwS5xm
         2TdfBJxb5YYL7PZ5hkEhWg1mvbMJe1KVlD6k2XsI0z6Brjh60ymYBCwg5vFaFQnI0pPA
         e7UujxajUEOPs9PopJ4owVM8Xo3Qb9TkSHBnLqrHqUDp7FNFezwGcMgrG9KcN/DqtELg
         4E6OjphEX1TyuSmS+wNWdx82PW49R45U/P8HtxFQ3MqC1ACiF+GD9Dl7/Z5XSDvJE5LP
         E4ffbQ9aEyL7VrSBQwPQU7NVVXAVZ26XZ6kXYWX5f0CoitBgAA+/1YMQcA46YoKGuwVN
         kgNg==
X-Forwarded-Encrypted: i=1; AL+hErF2m+Ylk/POjrzn48hzmY+FI56SC3ih5yZvl8etViIhA/Y1whFKvQ+JBEmQdvEJikcwaBt8NKJ0Nr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4p6ZeepS7g87CI41nejMCOj9yJgKSoZAqWwubeSWHTFrxhBQf
	lYk7UfeSmaLW3ZwcZKVxmESzMIJoyqP6h/rMGoBlKIMYpuDBR0VUGS5Z
X-Gm-Gg: AYBFou1IJt7fxghbeGLX0dbJxgLqg4j4MCiz3a+CnBFifo0/idBa8AhIoto8RrJJKte
	Loe1DGAgysPLOIp93iiIKSiV4uNaHdNYVJrbNdu2FW7FT/9JgitAZ6W/cOKS2XhwG8PgvQwwYYe
	g7qulEbo5YHSX4zQ+O7BJvXM8u+8+sgluTwCJ5ixjKMxs33aDHj4iLYoG6lLCZsVjsFaNwhxIQV
	ewjBNuV2DfpEvktw/HYXClzKCLrIYKLoCZftae3i3T/8Zq6O5IyNIGKwXQtdviaF/G0db/nzRlw
	rUTQBqnPdA59k1pgN+R2APY9My7TRWylGEg9cRlWs9Zeb/6Nrwidm0iFwhZ3cHoS0z4eT1rHsTN
	m8IzxmjffXLDpZBphF5TheZU93Ks22kY3BFSxkuGOxq6Mx+MEKGfecELqrSHmhi7p4KZydll050
	Qvvii5SODXr9F6Mh3gteCDp3A9udWB/MPOHNEtCH11hWct+IK0gftEXtFiaNq0Ud+gZLnpIMEGr
	h1im7D/IPzaIgBgsuLRysZLEopYO7mM8Rm3BDP5xgzEj3tQF2CBXZ/hHRxFCwSBX1p2jBx6Bv0M
	SbM0JFASm+xNGebvH+ueU4uBjv1PKmMoHpyCW86awqJv3eOsSAfSyi9RonU+djNQtKhMcByYb7A
	Bf1eeNyyNIAVuLRfpSv1foHcTXH+DPRoUvuuxoYFPv2DoJJpoK4kuWH0CyatdjPBuB551LMDI4W
	/zNQ==
X-Received: by 2002:a17:90b:3ec9:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b1b0b8695cmr6283495a91.64.1794699750313;
        Sat, 14 Nov 2026 15:42:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/7] clk: add a driver for the ath79 PLL controller
Date: Sat, 14 Nov 2026 15:42:15 -0800
Message-ID: <20261114234222.88337-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
clock before the driver core is up. This series replaces it with a new
driver in drivers/clk.

Only the reference and CPU clocks are registered early, with
CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
plat_time_init(). A platform driver bound to the same node registers the
DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provider
returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.

Patches 1 and 2 move the two remaining non-clock duties out of the arch
clock code, so that it only uses its own registers and the clk API: the
QCA956x timer interrupt workaround, and the reference clock that is
read from the bootstrap pins when the device tree has no rate. Patches 3
and 4 drop ATH79_CLK_END, which is not ABI, from the binding header, and
patch 5 adds the UART1 and PCIe PLL clock IDs. Patch 6 adds the new
driver, and patch 7 removes the old code.

Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
of the old code. The serial console, both GMACs, the PCIe PLL with a
QCA9880 behind it, and the WMAC all work, and no devices are left
deferred. The debugfs clk_summary, consumers included, is the same as
with v2, and stays the same when the clock-frequency of the reference
clock node is removed. These results are from v3; v4 only changes the
QCA956x rate calculation, which the C7 doesn't use. The other SoCs are
not tested on hardware. For each SoC the rate calculation was compiled
in userspace together with the old code and fed 2 million random
register sets. The results are identical, except where the old code
overflowed 32 bits with register values that no real setup uses, and on
QCA956x, where v4 fixes the upper fractional part of the PLLs.

Changes in v4:
- Fix the upper fractional part of the QCA956x PLLs, which the old
  code computed as (hfrac >> 13), always 0, and follow the formula in
  the QCA9563 datasheet. NFRAC[17:5] is not zero at reset, so rates now
  differ from the old code on QCA956x (review feedback). This part tested on
  Archer C7 v4.

v3: https://lore.kernel.org/linux-clk/20261111215729.10683-1-rosenp@gmail.com/

Changes in v3:
- Register the reference clock read from the bootstrap pins as the
  provider of the reference clock node instead of with clkdev, so that
  its other consumers, such as the AR933x UART, find it and fw_devlink
  doesn't hold the platform driver back when the device tree has no
  rate. Drop the clk_get_sys() fallbacks (review feedback).
- Wait for the PCIe PLL update to finish after each write in unprepare
  too (review feedback).
- Add the UART1 and PCIe PLL clock IDs in one patch (review feedback).
- Drop ATH79_CLK_END from the binding header instead of growing it, as
  the number of clocks is not ABI, after moving the old clock code off
  it (review feedback).

v2:https://lore.kernel.org/linux-clk/20261110013646.1582970-1-rosenp@gmail.com/

Changes in v2:
- Post the new driver as one patch, instead of moving
  arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
  patches (review feedback).
- Register only the reference and CPU clocks with CLK_OF_DECLARE, and
  the others from a platform driver (review feedback).
- Describe the SoCs with match data, and read the CPU, DDR and AHB
  selection of AR934x and later with one function.
- Keep mapping the AR934x SRIF block from its fixed address. It lies
  inside the wireless MAC registers, which ath9k claims, so it can't be
  a reg entry of the PLL node.
- Drop the clkdev registrations, which have no users.

Claude Code (Claude Opus 5.5) was used while preparing this series. It
wrote most of the new driver from the old one, together with the
userspace test of the rate calculation. I reviewed and tested every
change and take responsibility for it.


Rosen Penev (7):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  MIPS: ath79: stop using ATH79_CLK_END
  dt-bindings: clock: ath79: drop ATH79_CLK_END
  dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
  clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
  MIPS: ath79: remove the old clock code

 MAINTAINERS                           |   8 +
 arch/mips/ath79/Makefile              |   2 +-
 arch/mips/ath79/clock.c               | 673 ----------------------
 arch/mips/ath79/setup.c               | 107 ++++
 drivers/clk/Kconfig                   |  12 +
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-ath79.c               | 782 ++++++++++++++++++++++++++
 include/dt-bindings/clock/ath79-clk.h |   4 +-
 8 files changed, 913 insertions(+), 676 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.1

