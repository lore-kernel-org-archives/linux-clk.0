Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA93C38A02
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 11:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJ1Lit (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Oct 2022 07:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiJ1Lis (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Oct 2022 07:38:48 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69EDF1D2990
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 04:38:46 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DA93B84C36;
        Fri, 28 Oct 2022 13:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666957124;
        bh=0I0TEK1G9LDmI03Hv3IB00bvJGwIogJnj1AGaj8yads=;
        h=From:To:Cc:Subject:Date:From;
        b=GctRGkYKi1R2LsxgySLSE6HGHiBvqwlY2XBwUmOgX9W4NeB+DHav9TUCBq9m0VUGq
         Qu6RL3a1FRyagdH8e+fFDgEjz8/4PbMjthVUE17GzD1+AnyNZ2GjihKxHqR4y536ai
         fjAljVJXgm03lcXi3b4JXchdg1mdb1HGVHnBixQstPAi+WZ5YNcbZl/9hKRuNWUM+H
         FqwR9IPdfzRd3C6dpz+qZISi5qLQtNhwVHi7GO5VoO5loyL7RdovqjPnCHZOwwc6Tg
         fDznCQHiO526IKf+52dwVyHZNa3HX3hKHMzYt06GiiU5C4NETA65r+7em2IUd8T4in
         wpXrom/SPdD/w==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Subject: [PATCH v2] clk: renesas: r9a06g032: Repair grave increment error
Date:   Fri, 28 Oct 2022 13:38:34 +0200
Message-Id: <20221028113834.7496-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If condition (clkspec.np != pd->dev.of_node) is true, then the
driver ends up in endless loop, forever, locking up the machine.

Fixes: aad03a66f902 ("clk: renesas: r9a06g032: Add clock domain support")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Gareth Williams <gareth.williams.jx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
---
V2: - Drop Phil, add Gareth
    - Add Fixes tag
    - Add RB from Geert, Ralph
---
 drivers/clk/renesas/r9a06g032-clocks.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 1488c9d6e6394..983faa5707b9c 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -412,7 +412,7 @@ static int r9a06g032_attach_dev(struct generic_pm_domain *pd,
 	int error;
 	int index;
 
-	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
+	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i++,
 					   &clkspec)) {
 		if (clkspec.np != pd->dev.of_node)
 			continue;
@@ -425,7 +425,6 @@ static int r9a06g032_attach_dev(struct generic_pm_domain *pd,
 			if (error)
 				return error;
 		}
-		i++;
 	}
 
 	return 0;
-- 
2.35.1

