Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0111B1C3BFC
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877036; cv=none; b=XJtAhFTdOTZA8lzu2uMjx3+doFkiS0StuSK8sdFX9RL+k9+RchvUB3lYaz/vIzjOs6tq3kogcW7pskwAX971UtzKG2bA8OQT3AqUTkLnmt3+pw6CoRt6alURyjdth7zrMMUEvCVA/Swd7+0PCxAx7lFcPBKc1fJkwb08fZf8uw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877036; c=relaxed/simple;
	bh=318rkCOtOIcwyCbPWpmQU7rBPO8pQ3u3Zsk20tNNVWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIKAjBGOKg0nQklKyCUYEPPuBkyJ61rqhyoZlm6sdlUCnLWTWxgW6CJB6Xsi2LlkDU8Vc7xSd4X2uTq5E7vxB18INMgCWKB9AC9e1p61JFjH2Yl5rbsUUTX8KyqA/nnCWt+z2nbTGJ4IhRNrRmE9kIo5NtQ8/+X8pCeahdlJyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T95pO3zm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T95pO3zm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfd832155so677861f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877032; x=1775481832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7h3LG+LbAv4GOv1xUL9LKPpxkrnSVky+7zMr0jPZb0=;
        b=T95pO3zm+DOkNymM1Ld0vsJrcpAJwoymWvJQSLzHRK3aZ3c2LnoOlChxnWOnLFwxu8
         b/vx1WNs0gPMQrw2UE0Lam5qZ8SCVQp0IT84MyhIFSF449QzZxGcSFVSMuszRLoGwsGZ
         DKnyw3LkRoRIFp9t/w/EB3dTMZ2t6LkDRlAOxhA+y8e4VYjl6Jf2mnbajlLCe5Vm4Hd/
         SlnAIklvZ14VjeamPUFdqqeMBUqKBprG4nOvWyvOEOfrr5uR8Jzy5CNIiHY0oBNm7mej
         rf2sN11Yxp21sextHb2WI73vktoU25C3S5fLdZlOK1KV+La56vnR0pNP5rS1WOWlWTh7
         iiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877032; x=1775481832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7h3LG+LbAv4GOv1xUL9LKPpxkrnSVky+7zMr0jPZb0=;
        b=bsz57RZejy6x5NjJ5TgcAiLVnIEsZk+nvGTqq8clQkUVggziXGHIX8ypCFsi5RCxOq
         FL/MprINnObBBIYyROzX9FFDQ/jR7e6Y01EJR7qxPOclCn5FvGSA/veJ2n891vy093OG
         oVdtV5vpuDi5Xen7Mr5Xsn0FfPs2XxmyV6UxCygI9qT//aAKdQQ0acyTSM3L1OVJnpe8
         6nuvYoMsCLOygr2HboCb231Gk28Jr4GicIf0cxm6BIp1gHpak7+Di0Twu+HjpXKvIFUl
         8NxZjScuTq4adPkLY+ipMpQOJWJkv7oW/oB1C/F9WcvYnkXPom6PFYm+dAn5rLNjBHVv
         B4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeQer5WVE8Zc1KYpj4ghciyoxv4txXm4CoOmQ3ilrw81UJCS8o4zB3kS0wadsGNg+ZapUXCSMQIHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2PY8Mj9eNfDxCFOaZK2QTGYAY129ZKpSifBIAesFmPFin6ck3
	cHJZfrM7b4Zs8beXTongT2AMKgnq1/wrAun4cXKAPUayF0pbrTic1A4H
X-Gm-Gg: ATEYQzwVir8zqLRCmNwhs+qmvjQ1J9vMNhbXS64Kw2kL5KFiUxNDwM946KYmQ6V+mg4
	wqkgPoidRhHtL3x8R9mO237teI983B+83TwKXzteOWzuQAcU93+jPCfONQMGM1jtCZ+s30csuEs
	t/efHh9OOuqB5QEA+DCqXvAyGQ3eXawyhdV4Ba2Epvqc4CXQ/Gpv5kneU2iPMtCUrHaq/CO7GbB
	XBnsQvOPm8ZWRpO4MeIDsnXOyyyFsvHmN1fyxDNNHe25JCbDkieW0r3BmRONHcdPEnYWZJcVlL1
	9inQlvHoJy4vyxucFwLAUrx++Lwc3jMun7xZCiokCIO7qv4NLP5CRHowg64eJIb/K0/a919jXqO
	5sjgK7oL7LenJ07RJL7TRWknQcV4px20CFEIQ4CMIZpGXAwlVfRQFq8g7PkKVMPxDx/ulqOAm1O
	uwlu5bHO8lVoNj7PiAIHdIGDeeI7KAtA==
X-Received: by 2002:a05:6000:40c9:b0:43c:fe0e:5bbc with SMTP id ffacd0b85a97d-43cfe0e5e22mr6360429f8f.19.1774877032194;
        Mon, 30 Mar 2026 06:23:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:51 -0700 (PDT)
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
Subject: [PATCH 1/5] clk: renesas: r9a08g046: Add GPIO clocks/resets
Date: Mon, 30 Mar 2026 14:23:38 +0100
Message-ID: <20260330132349.149391-2-biju.das.jz@bp.renesas.com>
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

Add GPIO clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index e75781198873..d31572a99f73 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -174,6 +174,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
 	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
 	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
+	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -233,6 +234,8 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
+	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
+					MSTOP(BUS_PERI_CPU, BIT(6))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -244,6 +247,9 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
+	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
+	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
 };
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
-- 
2.43.0

