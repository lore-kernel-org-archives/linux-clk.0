Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519494;
	b=hE28ZMrKDEJtXz0ZFg46qGbetxYyuer/lvfSeVZ5DtDB7TPj66DlUDm3yHNnsW+zskuL
	 mpTpqmT5ZEho7JxdThQk8DyRBH5O4QGqwDvi4Qf2BOqlIi7FubxxWGKQCnGIauahn6ykQ
	 eggJWWUqevt8V16hVk5WAZF5IzCXDZGr9k8PVNWTKluRmZUcVG0g8MJ0HFbzvVekqxwfa
	 GscjyUPR+yPFBtk6B4hRjwm/40BUvCD2+Gc0nZrahLj2ZTalmP7XVOuj79/OBqrpC3i+G
	 cd+sEajeZ4j9jy6FJTIzbIntoZT/ABVOfT3tgp2sYy7a6Chfb5FYPf0oPjON8QO/6tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EaGxXuKjbqWsjiNJFFTn53rRjYcJvhNf+ZE9bk47lFk=;
	b=ZTKsn+t/1cBYJJNphGOJYfmYl1Q5TMcLbvDg70TAikp9P0mOcqsk8rILx6McyNW0fMa5
	 rvyIdhye03qzUGNiudAMCLM0ihl+X17bhrT/tyHgPmDku86nylzA1gh0pNgTeigptTEE+
	 DQ0vC/n7zYriAmL3T7KdK75tUSyYTmn+T/YbopAyQYR0rP00Yu69aZpjckyERiVqPhGU5
	 F7WHWwV6YEE08g0g/Nd0v1rAUjLWB6YwUIFva6ll3T7F7ILZNR04zCs6TpHB/sZOXcIu+
	 1qSi5bG3yVf2/oPXOcA0a42b1ZWE1s/iCy0YDxUf67uirw+5Lu/Rpiw64x/e+KVXkIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jvrzdBHz;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA213606A880
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 21:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA213606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jvrzdBHz
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-716c0217635so472315eaf.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 13:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519493; x=1795124293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaGxXuKjbqWsjiNJFFTn53rRjYcJvhNf+ZE9bk47lFk=;
        b=jvrzdBHzkAgWJklCN6ybBmVmuacHe2Rn8s1JzuhqK7QkFcAcfM+M+Bwq3KwbTz0OTn
         dtMojqLY0tb75/MNE9s3HXr9aoKXH8xPnIQoxv+8DZkOohPc/qPPmDcs3NEFet1g7xoY
         7zN3DiVlW4VH67I9W6DrCF4XTcdfgkXTaoIUUriZ2bC6dhcL7OqM7BsnB1rML/i15aM+
         NWBiRNQzllSp3k+D9+00IWdDN9pddFeSN4jBqBetbUQiJWuAkoZDchuT28NyJbV6+69A
         uA7NMYOwx0XKU6LBX2xMwHcHOnUQUwtAjd1YmxdpOOOZpdVcjH2CKY5mHYlN8IK/UQ3+
         xzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519493; x=1795124293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaGxXuKjbqWsjiNJFFTn53rRjYcJvhNf+ZE9bk47lFk=;
        b=wJTfe7OW0ERQl1oixN0+iOnvzCiDnpKTIyaTcjWjKjtnJhEUqtrq2kYpOrHdXgB/D+
         W4tvofa5Ch+vLnoqpxE5oEcRzthI5wdJUzXYYC9j4l7z0puFNyckdWia+XgzjrAgOiy+
         hA8bYyMSj9gDB6UR31FQJyMccPwz6TuRltI/zXBpT7hekpBw6anf8UQwSBeKNxpMHaca
         n39Ri1OGJPy9BEco60GOOJ+yCEZ2kcK/SpnQ3DgYplN/pMgmceNYbiJG1y92f9MvZN3Z
         pysn8kuGJyY4xhoQYbhLXuCb1WYbZrTSI/Rekz96ZKH2HJlJny8KKB3tyMrnxk13UAZo
         hOXw==
X-Forwarded-Encrypted: i=1; AL+hErEos+LyCKbX7Q1zA3Z5GHZCdxNLG0rNnJS090UcUcU6sJ17nh14tHyUM6YKUxdvlpReYeCL5/UfjQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z83KNXqZGlwNP8ULRiz5YUQavFcZE9DWsg+Nu/VSidmsEfZwnQg
	fAusPxmtn3zuv48uO50VP1kUxPWpN4Xa22xWKKQYhnPtqcKIXL4Ir6wx
X-Gm-Gg: AYBFou1h9efwXpBuoyReFWNvgiTRO7MWnRga9CgH31i9GvQItG/H2LESB6pECKEsBZ3
	JTFgv/36/utd8tyCjhxUOgL1jhNbpWusLcnBlAGh7FwWea5dkiUtmVgFNgAU+0vFPfDTeRkhSEc
	TLcIvP4PQYYLeEMSMGhnY8qCQIRB9H05QA3GAzOdebsIk1oRSDbxLfjkt7SPu7uecwEwUL2f1TM
	nTvNt6O0eLVfVBJdM2lE7M1GiQ78I4q+O4RxeX+sFE/0HZNexTN5pMWm/k7HRvUa0D1JIRRtzVY
	QpEQQDy9aJ7hEk0snGdapexxUIKUUzbOqWArhWcKvPnKAxJi6cTGfIAe2/6gooPjBguvvMQgKZo
	qb4Q2GnmdsPQWz9vkf7dbGgxWDd2BCVGmsGqijxsU+bRO1qhyRuDJ8MXPyPNx3z115eF7IsHaUd
	xXBoVhNTexnhRlX6qxHqCZS2Y2Lx2gWTmjrQD4GIkeGuj3J30O84BsVD9A+A91+PqQiHDWJrlNi
	AzbCAl//icECzQD50qfm1RQsdl/buRGiPapDi06cVqjg0LeAjk4IX/e3B5sWCj+45InhLKmWI8f
	SioDLkGUuW5HfsKU7pQPfPxDXYdnwfcI2ILDY8+kAVi+6Are/hiF+mTassi+xaWeDBnTe48TnnF
	3dMjQ
X-Received: by 2002:a05:6820:f02d:b0:6d3:abd1:9b8e with SMTP id 006d021491bc7-7197cf224d0mr2811908eaf.52.1794519492651;
        Thu, 12 Nov 2026 13:38:12 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe229b9d1sm234017fac.11.2026.11.12.13.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:38:11 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
Date: Thu, 12 Nov 2026 16:38:09 -0500
Message-ID: <20261112-a733-fwclk-v2@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
consumers, so unused-clock cleanup gates them. With vendor SCP firmware
running on the E902 as shipped on Cubie A7S, warm reboot then stalls.

Keep both critical until remoteproc/mailbox drivers can claim them.
This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng:
Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI firmware
clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.

On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
clk_ignore_unused, warm reboot returns with both clocks critical and
stalls without them. Vinicius found either flag alone insufficient on
Cubie A7Z. Power-off, suspend, single flags on A7S, other
boards/firmware and upstream TF-A were not tested.

Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v2:
- Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works with
  these at 0/0. Keep only the two E902/mailbox bus gates after Junhui's
  review, pending remoteproc/mailbox ownership.
- Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.

v1:
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech

November 12 board test: two RAM boots and warm reboot -f returns on
Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unused.
Both retained clocks were 1/1; all three dropped clocks were 0/0.
The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
byte-identical in v7, where the no-flag control was not repeated.
Runtime used DT v3 and its dependencies (all four UART v2 patches),
with the PMIC identifier and pinctrl IRQ-map context adapted to the base:
https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com

 drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
index b8f6e8c6e507..f2965daba0d3 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
@@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
 				  0);
 static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
 
-static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
+/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
+static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw,
+			 0x17c, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
@@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
 				  24, 2,	/* mux */
 				  BIT(31),	/* gate */
 				  0);
+/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
 static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
-			 0x21c, BIT(0), 0);
+			 0x21c, BIT(0), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
 			 0x21c, BIT(1), 0);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

