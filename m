Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97858C3A59D
	for <linux-clk@archiver.kernel.org>; Sun, 23 Oct 2022 16:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiJWQq1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Oct 2022 12:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiJWQqZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Oct 2022 12:46:25 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F9A4BD1B
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 09:46:21 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 0399684B51;
        Sun, 23 Oct 2022 18:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666543579;
        bh=1SjSb6X2zIC4YiHwYb8YRI0rt4p/SSZUndc5Bapk06E=;
        h=From:To:Cc:Subject:Date:From;
        b=k2Z3ngPkEln3IlJu+rGR5Mdmyv3Tg9IhozSzM/1prVRhu/bHEKXzzJ5RTmwV5kHjK
         QkTUV6YLtqXuFFcsxXFAEvVo1rtHInY4tctKyOjGgiIbKTb/6WlUs70+5RmF1rtwHG
         b6+u06jbdSMYUJ+2xIN1F2FufE0UU4e1vP+7l/ruyO4k1N4gtsk4gp6YhQqCwIkQ2U
         YJBoRe2DDz5D2RHm4QTih2yPwp9YrAQE1dGgaU7UShFmneJ0A4/lnt0B1QSBF9fxxJ
         tVLt7rC3eAl6bL39MaUTkpsBmS2m10mo4E1zmTCo8GGPu8rt0uOzDdvvoY4yBGMRXp
         VLdtlxxU/cD1A==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Johann Neuhauser <jneuhauser@dh-electronics.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] clk: stm32mp1: Staticize ethrx_src
Date:   Sun, 23 Oct 2022 18:46:07 +0200
Message-Id: <20221023164607.556118-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make ethrx_src array static, this is local to clk-stm32mp1.c

Fixes: e9ed1ef18a37a ("clk: stm32mp1: Add parent_data to ETHRX clock")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Johann Neuhauser <jneuhauser@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/clk/clk-stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 7ad2e6203baef..01e5a466897f8 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -155,7 +155,7 @@ static const char * const eth_src[] = {
 	"pll4_p", "pll3_q"
 };
 
-const struct clk_parent_data ethrx_src[] = {
+static const struct clk_parent_data ethrx_src[] = {
 	{ .name = "ethck_k", .fw_name = "ETH_RX_CLK/ETH_REF_CLK" },
 };
 
-- 
2.35.1

