Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B45AC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 26 Feb 2022 04:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiBZEI0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 23:08:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiBZEIY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 23:08:24 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61193205FB;
        Fri, 25 Feb 2022 20:07:48 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 88DA7836D2;
        Sat, 26 Feb 2022 05:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645848466;
        bh=+yPvdhSSWuNYYCInuYxiC5//mOEecBxlV4LWjlfU1Ns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GcyBVNurqdq/Mah479mdPZsPWceTrMW/dKAwaTlYBkfS3/miEGVsV32f7qEGRFUqf
         iLAKh8MiI7D0KU/quwZYnXxNEALbBpQHIh3t2VyROwOw4GGEl4qby5OMq5h4Q6f4bg
         p8VQK9ik1lh5dgSeiFBIEawzlf0dAj0tjncHFxPulsFsCWVsSCiOwP0atZRTGl52UJ
         Ex/cOUWbgAc44hiItqQg/e1dr66WI+yV0IMZUHLYtxMkXsk0qOH86JBuAE+gMcPyyH
         qq734OMRdtHrMRCTK5CjEbnPyuucULO4kSrM9drJcnQTIzisigvBcvnI6Z/BoFtGtN
         0ZKlt1xfr2I4A==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] clk: Make __clk_hw_register_fixed_factor non-static
Date:   Sat, 26 Feb 2022 05:07:22 +0100
Message-Id: <20220226040723.143705-2-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220226040723.143705-1-marex@denx.de>
References: <20220226040723.143705-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Access to the full parameters of __clk_hw_register_fixed_factor()
is useful in case a driver is registering fixed clock with only
single parent, in which case the driver should set parent_name to
NULL and parent_index to 0, and access to this function permits it
to do just that.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-clk@vger.kernel.org
---
V2: - New patch
V3: - No change
---
 drivers/clk/clk-fixed-factor.c | 2 +-
 include/linux/clk-provider.h   | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 4e4b6d3676126..81d8c9e430a23 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -76,7 +76,7 @@ static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *
 	clk_hw_unregister(&fix->hw);
 }
 
-static struct clk_hw *
+struct clk_hw *
 __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 		const char *name, const char *parent_name, int index,
 		unsigned long flags, unsigned int mult, unsigned int div,
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2faa6f7aa8a87..d216221448d31 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -992,6 +992,11 @@ struct clk_fixed_factor {
 #define to_clk_fixed_factor(_hw) container_of(_hw, struct clk_fixed_factor, hw)
 
 extern const struct clk_ops clk_fixed_factor_ops;
+struct clk_hw *
+__clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
+		const char *name, const char *parent_name, int index,
+		unsigned long flags, unsigned int mult, unsigned int div,
+		bool devm);
 struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
-- 
2.34.1

