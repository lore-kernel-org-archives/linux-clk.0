Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809BC3D4120
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877037; cv=none; b=kdL4nGWRZcJeAopHwzn8Nud8Ymmv7c2TafhV26pGPBNVqWdeWw9dB3PjQzqxiKyahD/XiQcfhjOQCgxF12+uvWilbBnHJqPkb66TSWJAM8rTBwnql47vk38SNMR6oqLZzjc1DfxVy/TLgH4QB0oNyGXNO96VyZPEBBJF0CDPN18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877037; c=relaxed/simple;
	bh=go74QWu+iFgVsqmWU0G/IsVCO0weIN+J6ho4FS1p4EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mV2gq426p4Bw0xp/C3OtzaTT1au9UueyLfgH+2iaZF/UgqT70EplIZ8+P0yYXfVv6Bkmh73aQ8mr3034T0S/FtvnDjxD5K+9SVy0Wb8e63KM5/3ZvU4rDP3/mZu0Faja8YA9OPVkHJy37dR5LPiXcS1cCsxnEkCuR4Kqr4/PJ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XY/M0nAH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XY/M0nAH"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so906727f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877034; x=1775481834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhXFPJKJGd0bXOpzHVgD/0nUk4ZFzTqAFRwOROjJVjI=;
        b=XY/M0nAHrN/aLuz3DbY4g8zAgoCD+pg4OW3U8USKQ0vuOdhy5RWNgAut8ahXVQJNzr
         DZp/sn2VNcHoRkA6wrCi3w1W1W3BP6BYi7H255925xFHGIzNmoEWPDKIS3SUReg4Hp+c
         qE4hbo1Ev0izWfL4WjL7utpLFTLHQ8qtSRzb+O003stOfwX00koA4PqwV45HATmYAPKa
         Mw9N3Rw5yxMgKVT1tEm6BGdXB3YHuNaws0bMYTVl4i/sXFfqcFZ0cMg4JWSA/PVxx5Ab
         IvZv7f5kZfX2u0mWQV8b2HDWDqRrbwddkUD+Eb0J/+0kMu+4Rj4g6mCBCEtcR/58QEKP
         hsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877034; x=1775481834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fhXFPJKJGd0bXOpzHVgD/0nUk4ZFzTqAFRwOROjJVjI=;
        b=j/FAJkkIpTybK+hME97tnsG48SiItjSIzqCbrnbjcuVgLfpAtbkkv++N8nShrtLr21
         3WV3lJ27h+n34OqZ22ur/d5CEU0CZmWNpipWodwHac3DftxyMlCmSNEq5kqGdY98EgR5
         wf04rBWnl/Kyb6tlMyHQB9sjOpZ+f4/hvnWJtwJgGJw+IMHt3lc235FLOaEQ+9VTVUQO
         7PHvRk5sFYAe6R9VJ0IvE/Au7tKW958KJ04JYBaW3f3XZGfew7/wCz8G80i0viinH2o6
         3bL4uCSASVU2Bbp7KwkZPaajE/qVxjXjXme2j4yQqDi2VWPmmOM2r1bqNtjcFTrd2eW7
         zxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy4k1LQ9+ibUar2YxcdKAOx/uSwgaltx6hP62SQftQFK3wknTcVFirz050w3E0tPlX4rzxyxq4S7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Zbw153UbMSqV9dzATlZuMfNn/hwhi838tEfo8mOubegtmYnx
	A1ZZLziXrHOGyU2NfPx0zImAQLVsei608h4BfOPiU/LsRb8KqKAWwUNY
X-Gm-Gg: ATEYQzxR1XlPp7Y+u9+BlprztWpYG7w6KCSamUzqGT2YNo+gl27r0uXwhTj7TSjfa0b
	+A7pUIzCra8CIHwrZvLFlMaBD53+j8WvPyLE8yc6iKyT4a+Pezmhxm8u78J2qbTxEg0GX9TpKVR
	CTr1URDCPRdROgfKousaL44Nmd4I0hNawRqWdsW7dGrrrkOnuD0vcM6ysqZ8UX70z+iHK86bKZ2
	88aflFIMMr7/s3DdsTxrDYLuwbuqSV1TKxfQVXf0rgsVklGyYyBJJ0/CRmDT8b13y4evUIiXodv
	EtYZgB5vDbRL0iZPvrxjOCIIV5IfU+DbXAV9K9b4oWiqDJt8AApdO6b5Q7jUivvY3I8F860IlbN
	cbHyrrxdXvXmd6lauCZiHkyM+5g+Yq+jRzryR5NFJY3NIiJ6dbm6ecRxib1bnXOugAW7nNz5Qoi
	DaLdEAXTWu+pvBI0ZQQf589dCiUTmqLw==
X-Received: by 2002:a05:6000:430b:b0:43c:fe7a:491e with SMTP id ffacd0b85a97d-43cfe7a4b9amr6697096f8f.32.1774877033717;
        Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
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
Subject: [PATCH 3/5] clk: renesas: r9a08g046: Add WDT clocks/reset
Date: Mon, 30 Mar 2026 14:23:40 +0100
Message-ID: <20260330132349.149391-4-biju.das.jz@bp.renesas.com>
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

Add WDT clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 4618c4d1d503..28d035613272 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -219,6 +219,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_REG1, BIT(2))),
 	DEF_MOD("dmac_pclk",		R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
 					MSTOP(BUS_REG1, BIT(3))),
+	DEF_MOD("wdt0_pclk",		R9A08G046_WDT0_PCLK, R9A08G046_CLK_P0, 0x548, 0,
+					MSTOP(BUS_REG0, BIT(0))),
+	DEF_MOD("wdt0_clk",		R9A08G046_WDT0_CLK, R9A08G046_OSCCLK, 0x548, 1,
+					MSTOP(BUS_REG0, BIT(0))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -275,6 +279,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
-- 
2.43.0

