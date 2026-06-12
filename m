Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A338CFFE
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274657; cv=none; b=T+wMsESCp2ZvHxH99hD+WcfNr3d+eUINX3f1BfGRsnsSQI6eg918I2LNLeJhnJcvqzq6+/FypB2CzPAmiaGG+/fi2b8AOcD6iiQpUe2d3VJWiEWqG7mPmfDiesHnY2W+GvSczUalOE+jVp76oQAw8vHxdN5K6qCrUc/YjezlhS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274657; c=relaxed/simple;
	bh=iGtG+0lwcDHNaDdsmWDwoW1Z4Hd+hBkqiiVoObvf+dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGR7Yp73B8L8AjdbEnVU7vcQ6D25AHFTEpUS0dCChzVPR5fMIbKNvDzaJ8pJmw2oAV1m/lOxsq96tDgd08TgsEYHOzyGQDZD56EqkXtbpDxsZsVEo/38eroljFW8vaDJE1LGREWpY4P9rzwyPwYfhc6ZbHWRdh8EbUbt3j6pOYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNwTQSxT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNwTQSxT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1344826f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274655; x=1781879455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXfYvyQdjiG+rGpfHpfWBCGzM82QHIcgpJsxLzxBnRA=;
        b=cNwTQSxT6ZAMPe9MUfwTH7TDZB/ZrfauneauFG77PBoG2kpjXcAaZA0eu3jio3H7TO
         fbVBeEZE4w/xe2ZovP15ErLQ4seZ3EypbGuCR8wssU0U+BOOTFBzzEl9KTu7NQPAC0Bp
         31yVy+BobWtSik/z1iCUzEhGw9yRkmCC/AVk/JNHSzC69W2qhw3Z2jVNfmr8OC1SVfr/
         b2KmpjfiWYPcTsBEnCYydNDELTSCmXHdooPVedGof3BAkqknXSBWkSm/qn2uoXwBzHO7
         luGiFn3DKtFOrUnfPvKjuicN6wwU8Bb5WzdwXuUf+RjWwi2NS0hPdKJedzSjWhu6YP/G
         j+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274655; x=1781879455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXfYvyQdjiG+rGpfHpfWBCGzM82QHIcgpJsxLzxBnRA=;
        b=UT2a/VDsK4a77Gt1UiGQFgjBRLcYhEpVRRjBXwS6g095bftBjm9157Ugy89VQGRPwV
         QQ9KKfj/D7+dBXS3I2ym47+QB+x025urs7XQMjKdJDh3+wyGY6eRpzSZshbxzgfXPZCm
         yihqXuVxGlEFu5xvFgGuNZUzxpEpDHQmrVEojXZ7uU0Opa+4IGwqjH3VFIEPWn5V6D3H
         quZz4hV3MCbk0qEueecmXBv0HKUHEum8GVVdQLezprmAcqyqQgc8E+8Wi0CLTXTRzWr4
         k4gehUpom01qbuvKzReTEmCS7gb2dp7UQ24VKwOJjiXfAUsxnrpTx4c+AloozhEwW8uV
         lFIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vFKkwNlncNoyevXJzOFUTY1qatNdeuBpHhjK/mQ0HnrlgWxpW1NgYSpjZU4d3N3GV5svkTZwKWRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzofVfRo/vjhwbC9r/FKjGMnLFII+lMTUBybPQeZ25WL6fHBTVw
	5BR14ajnV8CIEmWUDbru+qlx+9XGHLjAl3AolweIWd+PqJZ6Hj67H1EeGPWP/Q==
X-Gm-Gg: Acq92OElSTOAzq1hiOKOTVpC1P6MF1pWFiUQngT/U7uVnrVzMnxO9ylYoLW9r0hAwNl
	KfmNL7winyVWxwqvPxM4teq0lvP7Kkc59eQLWF2g+37FwauUEtrTSeWagnKQGVz9JyPKF3UK+rb
	b2WBTkvIlIJDNIyan/slR3rYu1/wcJJeWMz2m1Np0+VjhPcarHL3MLwM3NsEqGkSdicybUfe+Ko
	WvvAlQGFg+JZCHWyshpLyB1Epxi9DMeBhV/oSJSudNKbvZHVzRWbM1PC6qDh36N20pbeHwNWdEv
	ulwgbbei9VRMyspF1rZ3MfJRNshy/yop5926ijEqSpgpEmuDPTTtYRUjzOIL2JAwi0ytGaRaH5v
	7oyq4YXWQhbIWiWMFcDS2zYuKq9k8UYl/MSeYpGzyrAUFqwj4nfcCV7HEkbGrdHrYaRsgFh68gB
	Fm41i9NpDaA66uXarfZUptno+rn8hAGbQKKso7N0AMN6+h5od+
X-Received: by 2002:a05:6000:2086:b0:460:6b59:c471 with SMTP id ffacd0b85a97d-4606d035fcfmr4098308f8f.25.1781274654803;
        Fri, 12 Jun 2026 07:30:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 03/11] clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
Date: Fri, 12 Jun 2026 15:30:31 +0100
Message-ID: <20260612143048.317907-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add module clock and reset definitions for the USB2.0 interfaces on the
RZ/G3L (r9a08g046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index edc83a4104b2..4488bd1988e8 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -416,6 +416,16 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("ssi3_pclk_sfr",	R9A08G046_SSI3_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 7,
 					MSTOP(BUS_MCPU1, BIT(13))),
+	DEF_MOD("usb_u2h0_hclk",	R9A08G046_USB_U2H0_HCLK, R9A08G046_CLK_P1, 0x578, 0,
+					MSTOP(BUS_PERI_COM, BIT(5))),
+	DEF_MOD("usb_u2h1_hclk",	R9A08G046_USB_U2H1_HCLK, R9A08G046_CLK_P1, 0x578, 1,
+					MSTOP(BUS_PERI_COM, BIT(7))),
+	DEF_MOD("usb_u2p0_exr_cpuclk",	R9A08G046_USB_U2P0_EXR_CPUCLK, R9A08G046_CLK_P1, 0x578, 2,
+					MSTOP(BUS_PERI_COM, BIT(6))),
+	DEF_MOD("usb_pclk",		R9A08G046_USB_PCLK, R9A08G046_CLK_P1, 0x578, 3,
+					MSTOP(BUS_PERI_COM, BIT(4))),
+	DEF_MOD("usb_u2p1_exr_cpuclk",	R9A08G046_USB_U2P1_EXR_CPUCLK, R9A08G046_CLK_P1, 0x578, 4,
+					MSTOP(BUS_PERI_COM, BIT(13))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -531,6 +541,11 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
 	DEF_RST(R9A08G046_SSI3_RST_M2_REG, 0x870, 3),
+	DEF_RST(R9A08G046_USB_U2H0_HRESETN, 0x878, 0),
+	DEF_RST(R9A08G046_USB_U2H1_HRESETN, 0x878, 1),
+	DEF_RST(R9A08G046_USB_U2P0_EXL_SYSRST, 0x878, 2),
+	DEF_RST(R9A08G046_USB_PRESETN, 0x878, 3),
+	DEF_RST(R9A08G046_USB_U2P1_EXL_SYSRST, 0x878, 4),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_I2C0_MRST, 0x880, 0),
-- 
2.43.0

