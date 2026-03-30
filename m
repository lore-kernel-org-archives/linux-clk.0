Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847F83D522B
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877038; cv=none; b=c7GzBo+D9QcE6DW424d5KtL4rwaXSDqXUrjWY8dHxqnShKTGnBTqtQ1yX44S1y1YdYOi7yL6HZmZmE7qpbnkiW+sZYpAAcRULYEinLuILXj67yyrM+nbsjJdof0bnNJd/q/LIZt2UzDJvWfGNc+CkRy3LDKSzQ4WAq6fwKTTlyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877038; c=relaxed/simple;
	bh=22Wj3PL59w7WQlU7uZqeJvafxD1ELLda18RL46qv9Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leovdAbW3c2Qjh1xM98nfOe23ynsHvqFOXe3Vk9CeuXUDtyVD2AS9PJFt/0DtivnfpExZN0aS60qMqgzrj+9qcfQwodn+c/VwU8bujotCofkL5sSEQJci7FX9IXaS38ttShlcfM0GwhP20w9OHZdNnjG5lX72n+xSSECLN151Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oaDO0iDv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oaDO0iDv"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b983bb07eso2252013f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877035; x=1775481835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAOuvFX8TFjsxOubezK4NKoeU7tZyw6BQVfZ55MuGkE=;
        b=oaDO0iDvaIzCnfbJyjR+Mudvg9z8nUmFuV+gRm56II1bDbgOesodg5VrQqY4oE7fb5
         xT8yir8peBSmYZ5i/Me8nLUceaDL9C7KzeUNFKCCD8JhenXL2qB21PRSPAa3ZWoSMrT4
         GDdZA0L4eHh4w28a6J2HVgLftXsvmhvL8O7P0qOD85xem+4NZe9/euwvbdICIY+gxiku
         8MFDnx5zijYy7XDSqAsD4VhycR86IzfZrXS/W4q4oZXIMFe1oZyhjyv0rhnR8ti9ueWV
         8Rcp5eehSZAxTalm+t5Kk8HEAsGdB8b4EgfPC6xFrx1jKvnijhxWxBKBqCbe+zBivE4b
         M3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877035; x=1775481835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZAOuvFX8TFjsxOubezK4NKoeU7tZyw6BQVfZ55MuGkE=;
        b=Z9f5VmW6NhVCPAfCuXHL3i+S2ySNhS3roazUTdMAfPlek5b/wnKsgFNzhEcCnv+GK+
         4Q3Gd3qMsPqEivkLIkVCHhmgoIpw+KebmE37OoSo3Td5imDmiFQ25iw58C5lD3hfrw99
         athvNdKmhGunLSpiGZnCPTh3ebT11YDR/f+Tv8INobknlOXfmh+UI7uIh1HPkRa0qEhw
         5smmSd1+aFxhC/WvswNH+1P39rbq8hh26X1aD6NDJ5L3C+s2omnZtepHo2rFoJp7xRVi
         VymRt2edkOgBB8FV1A5WG3qGZAlQ+EGTh1a1lZqPwEWNVmLQGAcsYflhcsSRgMGgIkZs
         WEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvgeEP7hymNN3aSbhGdpmCGAb1CvGpwvilK80Ft2ffV4NuyIJ6Ec1KK3NMDw3Eko5TfNEt+eOKk10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxofHr0QT9Wh99VI3qgUZJ18cwA3gPCbL22HzCKN9mIwwV1MjD4
	kRi2NDyo78qvFEHA7i32yJIL7YPM3LHDNVVKUnouqIhEOY1+gyOpTBHA
X-Gm-Gg: ATEYQzx/epaNzrBFCWH12k999h0m+IUygReC39o5mezpH+hFlnmGdCQ18lcWACim8bO
	8zSj65Nm9/4+XBmG87Bu33FnJ/5YMIv6sJtZBlv1SC2jmnIOseQMhun4zIl/QV662aUio9E8i5l
	6rCSpRTd2IMDmTTubr/StCT+TOU7z/hifI6sckBOu29ZPxLz5DwRubDcw4yfh/3OXKgQoy18hl6
	QJqheB+xBH8yv+GGrCMfRYYKkPf+qvNY8/NtM6bJ5DN1xpFxrttTQB0vuYt2HoaMOKCbimf2bxk
	nA77tsn2CnArzeOzR21OVGBB4JcLuhg4R0yW/x4yLnTDlCP7D2N7UMrBb+4FnCYhjJwMurkwDIu
	i6AKlhT3qSuFDR13Z0gpOGFaUp3JD3p3iQa/Yx2nqB/ye/wacDZKj2l9Nyi+mY5/PQJ1H0/FZzA
	PNtctWJNdij3ByBSlDv3wrFGhJQCecJQ==
X-Received: by 2002:a05:6000:188e:b0:43c:ffee:ee9b with SMTP id ffacd0b85a97d-43cffeef22emr5747643f8f.15.1774877034878;
        Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 5/5] clk: renesas: r9a08g046: Add I2C clocks/reset
Date: Mon, 30 Mar 2026 14:23:42 +0100
Message-ID: <20260330132349.149391-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add I2C{0..3} clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 13c158bb9215..a962b5ec6977 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -267,6 +267,14 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 	DEF_COUPLED("eth1_rx_i_rmii",
 				R9A08G046_ETH1_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX11, 0x57c, 13,
 					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_MOD("i2c0_pclk",		R9A08G046_I2C0_PCLK, R9A08G046_CLK_P0, 0x580, 0,
+					MSTOP(BUS_MCPU2, BIT(10))),
+	DEF_MOD("i2c1_pclk",		R9A08G046_I2C1_PCLK, R9A08G046_CLK_P0, 0x580, 1,
+					MSTOP(BUS_MCPU2, BIT(11))),
+	DEF_MOD("i2c2_pclk",		R9A08G046_I2C2_PCLK, R9A08G046_CLK_P0, 0x580, 2,
+					MSTOP(BUS_MCPU2, BIT(12))),
+	DEF_MOD("i2c3_pclk",		R9A08G046_I2C3_PCLK, R9A08G046_CLK_P0, 0x580, 3,
+					MSTOP(BUS_MCPU2, BIT(13))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
 	DEF_MOD("scif1_clk_pck",	R9A08G046_SCIF1_CLK_PCK, R9A08G046_CLK_P0, 0x584, 1,
@@ -292,6 +300,10 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
+	DEF_RST(R9A08G046_I2C0_MRST, 0x880, 0),
+	DEF_RST(R9A08G046_I2C1_MRST, 0x880, 1),
+	DEF_RST(R9A08G046_I2C2_MRST, 0x880, 2),
+	DEF_RST(R9A08G046_I2C3_MRST, 0x880, 3),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
 	DEF_RST(R9A08G046_SCIF1_RST_SYSTEM_N, 0x884, 1),
 	DEF_RST(R9A08G046_SCIF2_RST_SYSTEM_N, 0x884, 2),
-- 
2.43.0

