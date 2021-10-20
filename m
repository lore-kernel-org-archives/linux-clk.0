Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FB3C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 08:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E956F6135E
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 08:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhJTIwn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Oct 2021 04:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhJTIwm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Oct 2021 04:52:42 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E907C061746;
        Wed, 20 Oct 2021 01:50:28 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 385948319B;
        Wed, 20 Oct 2021 10:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634719826;
        bh=KuMbYZy0KqCB6uiczurO6mDyZHG1HljairWQFE7l5kE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZhMut0WMFeX/pnZGTf44hTSSFDDyeFAV0inwSBsHfld3yZRvfPJAHlc+4+TqmYw2t
         +rLbpECWaSy4hDYZWwTEFFET6tvyBuIqlM850Blk86fy7BI+UKKFAIs2B7mUgGwE4c
         GYr3/hxmsRii9/4AgfACjt87ncv2y1mjiDRdKkUyWHeh4HvPQuZAZFYzQBvHOcdptE
         LRJpdineoUUfZFZy1GwNxeoEJtuQ0Cm0x/NWiQrlsEumPXd+JLV566kHXOSz+Ae5GE
         nSdUcPqlX5f5n9EHFXAQCZQntv8vOv/+SJtNV/TxKhhhRCAIVx8GhOv0UlR4PSMrWx
         h21cnBJsuhDtw==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: [PATCH 2/2] clk: bd718x7: Add rohm,clock-output-is-critical property
Date:   Wed, 20 Oct 2021 10:49:56 +0200
Message-Id: <20211020084956.83041-2-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020084956.83041-1-marex@denx.de>
References: <20211020084956.83041-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the possibility to configure PMIC 32kHz output clock as CRITICAL,
so that they are never gated off. This is useful in case those clock
supply some vital clock net, which requires the clock to always run.

The iMX8M RTC XTAL input is one such example, if the clock are ever
gated off, the system locks up completely. The clock must be present
and enabled even if the RTC is unused.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-power@fi.rohmeurope.com
To: linux-clk@vger.kernel.org
---
 drivers/clk/clk-bd718x7.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index ac40b669d60b..a59bc57f13bc 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -125,6 +125,13 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 	c->pdev = pdev;
 	c->hw.init = &init;
 
+	/*
+	 * The clock supply vital clock net, e.g. SoC XTAL input,
+	 * and the clock must not ever be turned off.
+	 */
+	if (of_property_read_bool(parent->of_node, "rohm,clock-output-is-critical"))
+		init.flags |= CLK_IS_CRITICAL,
+
 	of_property_read_string_index(parent->of_node,
 				      "clock-output-names", 0, &init.name);
 
-- 
2.33.0

