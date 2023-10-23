Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C19C004C0
	for <linux-clk@archiver.kernel.org>; Mon, 23 Oct 2023 10:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjJWKW5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 06:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjJWKW4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 06:22:56 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D25BD65
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 03:22:54 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507e85ebf50so2803298e87.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 03:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1698056572; x=1698661372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbHBU/qjptH7973ShNtrvZ+jIeyRnDw/f4+sWGsFAeg=;
        b=AI3ov+zzvFAXzySkRgCZkteWyvTit8xY84xqFQJ1eFGYd4IKtPCufAKWZrNf14HP4X
         a0cf5oth+qwvLm02pEacyyNCSZHxGd2Va6FZ/Xn8zvNc+uccX6UG81+5FO2bMz3ha8Wi
         pxKIjD+3zB0WzW7MmvJMCZuclL7Pp6ta2vQCty7L35CM73K+5kzfIK35UDlHuG5a17Oo
         jAbFb3UUwYoeBqG/9dmavZkXtPAlDNHTD/tlOR/ufG0VNRGrYPYny55B+CG6LNsDXNBW
         fVcHwv//Uj+rPdizK+0RX8kd3kvf0iKWHPaudXKahrdFoeYwOBzpshq37Hg7b9obTzEu
         2EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056572; x=1698661372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbHBU/qjptH7973ShNtrvZ+jIeyRnDw/f4+sWGsFAeg=;
        b=a/tbAiN+R6YAW5U0dNZvbyEIzztGC1M2ukw8rHVsD+rGBE8LRXdHuqB8Z1Sd1PnK3l
         QVwQN4MZtJmmjxBSz6miOK9TpDdhfaFzp0iz50vkBzskw65RNvYmHjS1L4PzyANqvtxW
         9TgFBtBSRXU2hTEtoVxWctuNUdDfqRER/iHJTMPb58dNLR+kxRA+6stRBh0Q7LlPcY7U
         FvAV002UbXbsJYL94ELOID+uLxQpbCA4Mn4cbd0AqCJjhYFpkKQ2ex7LrMFc4dI6GbFV
         rcey6xXuF2pEiXAq4tc9JMFm3rXUy15cH5LIbutJ/VO46s21a6G8DTz/fzroww0I3zYb
         Jfmw==
X-Gm-Message-State: AOJu0YxltQXQPMhit9dAxc6yqQFoVKCxA3Sa6AoJRFcc9clwh3Ga6m8C
        xQgADJylsQK9ccf9wxjY9qP2JQ==
X-Google-Smtp-Source: AGHT+IG+A8PxhX3r2zNXyOFC/Pv2bjvaEKWAWClyOzEZkebxv/h7AmSVTYIlQq521dqF7Ya8MRjrzQ==
X-Received: by 2002:a19:650f:0:b0:507:984b:f174 with SMTP id z15-20020a19650f000000b00507984bf174mr4919458lfb.48.1698056572469;
        Mon, 23 Oct 2023 03:22:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm13593275wmf.5.2023.10.23.03.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:22:52 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     tglx@linutronix.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/7] clk: renesas: r9a08g045: add IA55 pclk and its reset
Date:   Mon, 23 Oct 2023 13:22:18 +0300
Message-Id: <20231023102223.1309614-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add IA55 pclk and its reset.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 4394cb241d99..ea3beca8b4e0 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -188,6 +188,7 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 
 static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("gic_gicclk",		R9A08G045_GIC600_GICCLK, R9A08G045_CLK_P1, 0x514, 0),
+	DEF_MOD("ia55_pclk",		R9A08G045_IA55_PCLK, R9A08G045_CLK_P2, 0x518, 0),
 	DEF_MOD("ia55_clk",		R9A08G045_IA55_CLK, R9A08G045_CLK_P1, 0x518, 1),
 	DEF_MOD("dmac_aclk",		R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0),
 	DEF_MOD("sdhi0_imclk",		R9A08G045_SDHI0_IMCLK, CLK_SD0_DIV4, 0x554, 0),
@@ -209,6 +210,7 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_GIC600_GICRESET_N, 0x814, 0),
 	DEF_RST(R9A08G045_GIC600_DBG_GICRESET_N, 0x814, 1),
+	DEF_RST(R9A08G045_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G045_SDHI0_IXRST, 0x854, 0),
 	DEF_RST(R9A08G045_SDHI1_IXRST, 0x854, 1),
 	DEF_RST(R9A08G045_SDHI2_IXRST, 0x854, 2),
@@ -220,6 +222,7 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 
 static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_GIC600_GICCLK,
+	MOD_CLK_BASE + R9A08G045_IA55_PCLK,
 	MOD_CLK_BASE + R9A08G045_IA55_CLK,
 	MOD_CLK_BASE + R9A08G045_DMAC_ACLK,
 };
-- 
2.39.2

