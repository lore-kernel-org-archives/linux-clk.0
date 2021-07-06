Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8364C07E9E
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jul 2021 11:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9C0061C28
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jul 2021 11:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbhGFLSO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Jul 2021 07:18:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:53640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232262AbhGFLR5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 6 Jul 2021 07:17:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 245CB61C3B;
        Tue,  6 Jul 2021 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625570118;
        bh=9PUz2JEzNqP8FPrrAIuHzZWbBfeElfuJOzxMMKfDIaU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HrShngvO4/dzNTFifs9e6edNPmSKCjOeDZVCMN4Jf6u151nmj+9MYONqTRYcbzl7z
         9h22Orpn9K/QnXPnbMqsoK6o6y6gHUWVbsvxA0cQk4abAul5vWZ411XgryjExBr1Wx
         twPXY+9T7jbbJ5Gd0cRBBAtb4uE8eGOw7LMVMbqewZaShwSbofI3aDW/xvoHiet3gq
         Y9FXN6vP10X8vYRs6FJ1YaKbAGfpyLZuFZKam7hJYRw7j5bJ3eTSdqp4OY43RUWd6E
         AkYZFCWObBF2jTaiiFtBUaLSueIrQYi3L3OGXeg+9E7cmOidXQ6ynGSsuwl9e7OPxt
         2j9UEiaVisoaA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 049/189] clk: renesas: r8a77995: Add ZA2 clock
Date:   Tue,  6 Jul 2021 07:11:49 -0400
Message-Id: <20210706111409.2058071-49-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit 790c06cc5df263cdaff748670cc65958c81b0951 ]

R-Car D3 ZA2 clock is from PLL0D3 or S0,
and it can be controlled by ZA2CKCR.
It is needed for R-Car Sound, but is not used so far.
Using default settings is very enough at this point.
This patch adds it by DEF_FIXED().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pmxclrmy.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 9cfd00cf4e69..81c0bc1e78af 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -75,6 +75,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
 
 	/* Core Clock Outputs */
+	DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D3,     2, 1),
 	DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
 	DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
-- 
2.30.2

