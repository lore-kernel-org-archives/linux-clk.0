Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38D5C433FE
	for <linux-clk@archiver.kernel.org>; Wed,  2 Nov 2022 17:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiKBRLA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Nov 2022 13:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiKBRKw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 13:10:52 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301D01DF08;
        Wed,  2 Nov 2022 10:10:51 -0700 (PDT)
Received: (Authenticated sender: kory.maincent@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A112E100005;
        Wed,  2 Nov 2022 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667409049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lLraTOre/NKFIPvF9c2t40s43oz6eKUAFvet+eTCKV0=;
        b=WmNKFJHK63xQXbwWl9oU5MBFMc4LRfHpv0gu5rNegTQbfnudu6Nv7o281N+ksOXxusOqDx
        sK+wWtgk2GDBQ8j0K2aA6NT1i3SrE8Dto2pFxIh4NAn9MOE4oZP2di1BYLYvb0Yy5h7GMj
        /9WM0xSKn5lQeKVa1owc9FcxR3UbBumgyvkouC3kc47fLF8h8cskIHfVbEFW+GRGAoKYjE
        TUcRQWO1bbhtPioqAg7y2aP8XLUEe9yngQJ8dixYAZLvtBYlREbN6UgwFSTK79IUyJhAOo
        zk0wlRNHLF18y475ScT9GPjHI7wjWPMdDUIfnnnOeXYsmWQCWxGqNEv/6GmI/A==
From:   =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To:     viresh.kumar@linaro.org, Vipin Kumar <vipin.kumar@st.com>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Vijay Kumar Mishra <vijay.kumar@st.com>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>,
        Deepak Sikri <deepak.sikri@st.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Kory Maincent <kory.maincent@bootlin.com>,
        thomas.petazzoni@bootlin.com, Viresh Kumar <vireshk@kernel.org>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Bhavna Yadav <bhavna.yadav@st.com>,
        Vipul Kumar Samar <vipulkumar.samar@st.com>
Subject: [PATCH v2 4/6] clk: spear: Fix CLCD clock definition on SPEAr600
Date:   Wed,  2 Nov 2022 18:10:08 +0100
Message-Id: <20221102171012.49150-5-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102171012.49150-1-kory.maincent@bootlin.com>
References: <20221102171012.49150-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Kory Maincent <kory.maincent@bootlin.com>

There is no SPEAr600 device named "clcd". Instead, the description of the
CLCD (color liquid crystal display controller) name is "fc200000.clcd", so
we should associate the CLCD gateable clock to this device name.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/clk/spear/spear6xx_clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spear/spear6xx_clock.c b/drivers/clk/spear/spear6xx_clock.c
index c192a9141b86..ee0ed89f2954 100644
--- a/drivers/clk/spear/spear6xx_clock.c
+++ b/drivers/clk/spear/spear6xx_clock.c
@@ -207,7 +207,7 @@ void __init spear6xx_clk_init(void __iomem *misc_base)
 
 	clk = clk_register_gate(NULL, "clcd_clk", "clcd_mclk", 0,
 			PERIP1_CLK_ENB, CLCD_CLK_ENB, 0, &_lock);
-	clk_register_clkdev(clk, NULL, "clcd");
+	clk_register_clkdev(clk, NULL, "fc200000.clcd");
 
 	/* gpt clocks */
 	clk = clk_register_gpt("gpt0_1_syn_clk", "pll1_clk", 0, PRSC0_CLK_CFG,
-- 
2.25.1

