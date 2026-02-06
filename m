Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE13939C8
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375197; cv=none; b=shFy7QaKP56Q68bAW3UFPzswRhys4h3ttMfDh3/DOCYh/PZ+IF5GRGWXnff4mbPxRcWyNwB6Gss3Lz3cBcPUg62paEcrAOnWsd38TM/cbNnCCMwA3REPxQ4sRIghDzulzqoF9Leyf5Kom8vll2A/vJizRM4heGb65HqAJv11vIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375197; c=relaxed/simple;
	bh=CxSA0nLdfhGStJVuX0JIuUriZDiySdc1TRoiDS7cHr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SISHr1WNrLocHSbwvsO4a5VuL96MS0ntvYOtyiT+IYAZSHkAozQevvRxCVRQwGEEbvdqAwOmbVqGNZM3AJcgogg/ba3a19ymHxTROUaJnFK9g6wUiReoJ9SyLO3S7UhqcrVg3Ye3Nn/x6cdw4+80qpUtgSOwXBvrs/nLTwTvl1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zj/18Yet; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zj/18Yet"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4362507f0bcso1043140f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 02:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375196; x=1770979996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOrUlUstDWEoH39uM2uD3wDhNZIm6BCgL8Fz/zS2n3k=;
        b=Zj/18YetFHUxd8RaC66ytKyswtI/lXmXEKOuZHIS3QzSmr8t1KqvfOWPywTMulieXv
         KDyFeKABWqBv2nNxmPm06gEdKnlf14ZO2hsr532dZQaLQiuyOxWG6Bpkyp4zmbP7VMtE
         kJ40++9KkMuT5jBwvqz3CSbGxb3ikWvgSp4wYgfqS005JOUwdmwptEVApGrD5S3cAcad
         dfGHCjuiATL3zBeKMVOPfAsL6/LrvlGkbknBfkhJ9jF4RExXpogr8FzMmUhRe3DxUG6d
         JxCTURiXpPskgMD6k76AsnNBDu7HmcEHNczEEB5sBfUSdJHKZd7ZMH8zjO7MRS1eapYA
         VQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375196; x=1770979996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WOrUlUstDWEoH39uM2uD3wDhNZIm6BCgL8Fz/zS2n3k=;
        b=UY2235mjI1GnLt2186uZGl+0HTD6aR+fL8E67PcQZ5qmTHvb6miTqG/dJ88Oyi/6Pd
         Wl0Lk4UUZUc3lVJ+a6q/o5uCLdVfEi049UuvhgCdhf/DyI5nasRM4BoxpW90B7/SudJr
         dxNWaLmrdOfgipU9rhN4KCmZdu09dFzJYuWiMuvIOecSl4oOF5wIkcqZIgGUlw8hYa+q
         TTm2DNxeNYMf1677SWpmgIextzhBerAB5ya5pj0Wl9WYuvHE7kozekgYdKjxLdOjaPqZ
         +NL09Y0N0EyIqPt5HB94Wy04o7Mv04QcqGjoFonTjOEtE985H3pZeZ4wkNVP2zPmWdNw
         epUw==
X-Forwarded-Encrypted: i=1; AJvYcCWG2/Wm3i3OE1tXVQ50IlKWjbfQuYhOG+oW5C/ftdWW4C3CmuL6A3gi9cPTKWQAen+gLEBzpz7Ir54=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtUYXb2BuBsf3gl82WOeVgiDipCn0G5jvam+x873hoDNLcTpjb
	/Nd9bH76p+w4b7PoePErZtnm+LhvcMXYGbQSwlM0ny7ch+zLTmbJELJn
X-Gm-Gg: AZuq6aKxvlAZpnMi00NStk1wneCvI1rHDOL9/6C43oQUCa/bdppzsfQs9yXzO3pLM17
	lXfLrSN8JlL8YanoIMQx2Bybuwjalyp0RhOKQRtsPYLocXe4H39/+Air1DaaT9KqswY8gP32hxF
	wg+iRdzC4XO9BusuvmNGEtQh49fAnU+CCT8TTe+DKMY+IX4v8bkOx+2DUmw1zSuYPJJK4F07+rK
	TH7GZssnTdZfgoFtMGoWWfZQ9SdRRWAmaOEMhssHwSAIH/hmqwlMLJb227e1BpUQopo4ezqHMS1
	8Bato3KTs57k0CORGFMGUnt6gt8uvUIltrzC98yLMaeWJW92k9Fp3Xh4BDe9g3WS3PtrhoWmCE4
	+vBmUwggZ5s6X2JXAuvult4Kl4A1EUUiQoRn8pVkJndkrHjlRnCMQyUp5m3ZdcZbA5OCNhWueLn
	BghyTEMg2enn+Ujc4SFw==
X-Received: by 2002:a5d:5f55:0:b0:435:8dd5:ad4f with SMTP id ffacd0b85a97d-436209964d4mr9282945f8f.9.1770375195677;
        Fri, 06 Feb 2026 02:53:15 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629730992sm4519611f8f.21.2026.02.06.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:53:15 -0800 (PST)
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
Subject: [PATCH v4 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Fri,  6 Feb 2026 10:53:03 +0000
Message-ID: <20260206105312.231015-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
References: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for PLL6 clk by registering with rzg2l-cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index d77934872cf4..cc7d3872e9e4 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -29,6 +29,9 @@
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
 
+/* PLL 1/4/6/7 configuration registers macro. */
+#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
+
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,
@@ -45,6 +48,7 @@ enum clk_ids {
 	CLK_PLL2_DIV2,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL6,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -78,6 +82,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* Internal Core Clocks */
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
+		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 
-- 
2.43.0

