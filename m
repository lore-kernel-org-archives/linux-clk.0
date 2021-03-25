Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92C9C433E2
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 07:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8400961A13
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 07:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhCYHv2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 03:51:28 -0400
Received: from st43p00im-ztfb10071701.me.com ([17.58.63.173]:55271 "EHLO
        st43p00im-ztfb10071701.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230071AbhCYHvI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 03:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1616658667; bh=gOHpXquEfX1hsU0THYneHHqC+i2psTEBMcaJtktWXlc=;
        h=From:To:Subject:Date:Message-Id;
        b=bHVArKRwBhSX6m9YyRknWT+7gKwqoRCRSW6kjgsnvW9AGL0zSz6Ld/tEI2LvFUCds
         UADPssIutYbZstRxFsHLVdRNbfVyapdNxUlz0Pph3h8XFhZ+CAOkBQG0FobFC4hA1q
         +2JIJIxMY/nEMGnwYxbXqkVHC7z5TuwcQ+wYcFBjew+dqnbEBx06HVEV4zdt1vtzwP
         PjuJuIXZ7bcErqJ26/RhuHvtDIZUZsxgTvVzrM1EgKUqvsGjKTsZF2MbyemH+xu29B
         APrxY7seJ4PipklorO70aPtT8eMCDWspfL1ldLZwWPaxKtN/Oz6zkPtnlb9bq7hnM5
         C7kWlKXIeayIA==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
        by st43p00im-ztfb10071701.me.com (Postfix) with ESMTPSA id 0F42E8A02BD;
        Thu, 25 Mar 2021 07:51:05 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [PATCH v2 01/16] clk: st: clkgen-pll: remove used variable of struct clkgen_pll
Date:   Thu, 25 Mar 2021 08:50:03 +0100
Message-Id: <20210325075018.6598-2-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325075018.6598-1-avolmat@me.com>
References: <20210325075018.6598-1-avolmat@me.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

ODF field within the struct clkgen_pll is never used by the driver
and can thus be removed.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 drivers/clk/st/clkgen-pll.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index 119c5b33080c..f6c56ca90c7d 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -146,7 +146,6 @@ struct clkgen_pll {
 
 	u32 ndiv;
 	u32 idf;
-	u32 odf;
 	u32 cp;
 };
 
-- 
2.17.1

