Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA4AECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 16:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235531AbiJ0Qb0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 12:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236158AbiJ0QbY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 12:31:24 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E9372EC9
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 09:31:20 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9529C84E66;
        Thu, 27 Oct 2022 18:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666888278;
        bh=RGtOYCrFWB3l3UIHaUwlxd7DeJ/i11lZbW0UoYmPXA0=;
        h=From:To:Cc:Subject:Date:From;
        b=l6mb6Af2OD/mo2dvODEvzlEDeTFG40LCkReEMlXUnCdvQN0xe4Z70ddf+J/CFwKny
         UqgaWx2cNAllRshskT6kJWqKgb4hisH9uMFUVRGcXzn0Xi1iaRHn86zm9g0LEKuvDm
         BNew3xXDTBFUSf7eK6mQ3lHhpM24yo+SO2TOPAJPP1RgH0CDi/4m3lzPlt02SUNaNX
         5nHICf8lS8Ncm0T6FI5IJb9bME8eTxuuxduaS4CzoGpCRIMhpmCnuMoyRrlIHqEbbj
         lXmLpfGfeaTzHCY4nRD+cBLpp6wtEglEL0c/vQIholCBESAfo7bxCIWxTFy1j+46/l
         8RoyeM8CQHpLg==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] clk: renesas: r9a06g032: Repair grave increment error
Date:   Thu, 27 Oct 2022 18:30:57 +0200
Message-Id: <20221027163057.37257-1-marex@denx.de>
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

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
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

