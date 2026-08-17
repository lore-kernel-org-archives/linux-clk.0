Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA243E1208
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 19:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994754; cv=none; b=ktBx7WNzyRZcRLVLDM3QZ6RupyAMz0yIs6JsqD231QE/l9rXrqEd0pTNv/73+HXTuZ93zzynRY6zalwaOa4qGXtJjzu1X1Y2KLiAxlQYdeJNYzc2gkmIxFz3HaXXGC8kCB6V0AI9U1KtctJxHevnN3S7pbpJKrCgdLf9jw0FaaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994754; c=relaxed/simple;
	bh=z4DT6dN/jk9zq+6dKLH26w7v70HEmqs7syBrbJ8So2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezTfAAqVx+J363eNflMH+Bg7W+RhDmuQHbP4DJH8JQhVXtPWOrQPQTvwnPe2UNhWIiTRKshEHKE4Dr4jhA2PTmLPBCIowy9kppsAQUQLJmjlmRB4tq5GaCVHiuNslcwSWyhAQ3Kt+/ahJ8ph9uGGpvG4qO9huFoNijvYdhXc8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtswwQEZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtswwQEZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d0407aedd6so46867685ad.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 12:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994753; x=1787599553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7mcvMe3XH85aCVxTOzu3XLPa8g4zrrCk8XeaSRvsHMk=;
        b=RtswwQEZ98Nfq/BlwLuk3U5MYmPlGUyKdqlruyRyo2NIBoKJpaGihvUfTtZyFhpiD0
         4lHhJejnGVmIQcL8hjgOR89ErQfdpChDDrE+WDQ0Z8do9dunwrl4xuXM/S36mIsYp1ui
         klCqAXax0fBF/ZdBMaL2PrmOAjKvGotuSqFdK3G4auJLUZCvEs21ecdNgM1TM4mr30lw
         LLBith5oqkYt097uTXCrgn0aAtPxIeL5uKljhnvq556nwTl2SUOKI4uLqzbSUFrtKOmp
         fn80WVhcXMVvF/fbL7w1MpzNqcFP+ZKWAesVhuYoW9YttSf13Khz5LJeZ0JhxCZKUGtW
         AB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994753; x=1787599553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mcvMe3XH85aCVxTOzu3XLPa8g4zrrCk8XeaSRvsHMk=;
        b=U50SEVD/fSyY2LVWWgPrcoRSObZhBfGU+RJEqSMOElSBEIaMxtNdgoWij/QeUYbt0T
         4CQ/huaAcmVGzR8E9uYYFeLCanqkwSGN0ys8ZctswJUs7sVqGT3qT3jE1d0LkKhrfy/y
         Qv8bjAraIrWYqGQlz5R3DjDt/kDfUX/4IwXbHVTbzzYWDQTcB70UL3TSYmS7UAkZUjSK
         ma438PROUdsZEwY2+eARTL9ThNnU+b++DRgUIJPRN7QXVeIj35fBMjNZI8bUgQyScM09
         26Q9n5JtfQk8fmxAZN/eM5gyTe6EQgKx/BOdOGyqyGGD1RUBnhNmrfzO+Rl1Rr3N2zIj
         7+Mw==
X-Forwarded-Encrypted: i=1; AHgh+RprsXwRWITYu7FdEXEDK3PviNRDACtDBvrIVGwcdTB2P63a0nLE5LLPsiOc98CLKWJwtuJihI+rTco=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxolwYmpImoaUzh0hT3a+qjBt+QsinxrLDq9l3u6E/rHJOcjL
	q8cunR/ZuAnj5Fri+MJlQ+aGqhHphFeQGacJXQqz11+t4yX2hpArAYgQ
X-Gm-Gg: AR+sD12dUP43AzscvCTriKAwYjzi0vVV8Gv7s5CU9z7lI7i3yMb8RqanuZHr1B6kLfg
	wpPQF2Jl17imUk4eo7K2DJuOxmY0J4EsphlqKV1jx/r9JfkKBP0mDIgzCEYcLpppP6BnWpSYD96
	Kx8ibQgrEbk4lU8/Ds/2BFsBX3TFX9UUqSS/Wu/z/3IdFzoQ5Yvyt87glASI66gReLiq/F0yN+L
	/FL57GaYORaL3rND3Q9elHKmqQIQIWfXTYOvrjD4pGj29QaraGdr3kAQ+J/r+H5wdTf3jiHm4FY
	VNchH2o32GFfoHoq8/1noQg8y4+lDUFH+yRTyhMM+vNtehIKEL35Ac0kpAkcAp5D/0ERZwikgH9
	udPDrXLkqn6QgW+6q+jPZL9OJCWR+AnSM47U1FWQO7nPNklQdxEtOto1LHzaY/SNMeFdckcgKLm
	QSkJ+eLC28MAvxJIU8KyWt1rtxqMwTB+QLfJYNbhakhLfLIZomj6VVAt3RH7pMaxTq2kURmItuI
	5grYzyLItR8Hm2NrCrPBsSrRnf4DmbqXGT2gYrcluS95cRAraCl07oULPCslNFb5E4J4S1UT9s7
	qfyLXLZexIfM04DYtR6U
X-Received: by 2002:a17:90b:3908:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-3933e74e1bbmr25944829a91.18.1786994752447;
        Mon, 17 Aug 2026 12:25:52 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:25:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in CPG/MSSR driver
Date: Mon, 17 Aug 2026 20:25:33 +0100
Message-ID: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
multi-function block that integrates several system-level features beyond
clock and reset control, including clock monitoring, write protection,
and peripheral configuration registers.

For the other IP blocks to be configured a syscon support is provided in
the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
registers via a regmap interface.

Note:
- Patches have been rebased on top of next-20260817 + renesas-dts-for-v7.4 +
  renesas-clk-for-v7.4.
- The WDT driver patches apply on top of series [0].

[0] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com/


v3->v4:
- Dropped DT binding patch that split up the renesas,cpg-mssr.yaml file
- Dropped RZT2H_SYSC_BASE macro
- Added array of base pointers to the r9a09g077_sysc_reg struct to
  support multiple SYSC regions
- Merged r9a09g077_writeable_readable_sysc0 and
  r9a09g077_writeable_readable_sysc1 into a single function
  that checks the SYSC block and offset to determine if the register is
  readable/writable.
- Added RZT2H_CPG_REG_SIZE macro
- Updated r9a09g077_post_init() to call of_address_to_resource() to check
  the size of the mapped CPG register regions
- Dropped changes from cpg_mssr_common_init

v2->v3:
- Switched to non-RFC patches for the series.
- Added new patch to split out the RZ/T2H CPG binding from the generic
  Renesas CPG/MSSR binding.
- Dropped WDT driver refactor changes from this series. These has be
  submitted in a separate series which makes use of regmap.
- Dropped registers from writeable_readable list.
- Renamed sysc_init to post_init and updated signature to take
  cpg_mssr_pub struct.
- Created a single regmap covering both SYSC register regions
  instead of two separate regmaps.
- Updated commit messages

v1->v2:
https://lore.kernel.org/all/20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Updated commit message for patch #1
- Made use of for_each_child_of_node_scoped
- Moved sysc_init() to the end of the probe function

v1: https://lore.kernel.org/all/20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (7):
  clk: renesas: r9a09g077: Register SYSC regmap
  arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
  arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
  dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
    support
  watchdog: rzv2h: Add syscon support for WDTDCR
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 .../watchdog/renesas,r9a09g057-wdt.yaml       |  29 +++-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  28 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  28 ++--
 drivers/clk/renesas/Kconfig                   |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 140 ++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/rzv2h_wdt.c                  |  56 +++++--
 9 files changed, 247 insertions(+), 41 deletions(-)

-- 
2.43.0

