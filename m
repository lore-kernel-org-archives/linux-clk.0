Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35868C48BC2
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 03:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14319613C0
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 03:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhFXDqV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jun 2021 23:46:21 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:51882 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFXDqU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Jun 2021 23:46:20 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 15O3holk011017; Thu, 24 Jun 2021 12:43:50 +0900
X-Iguazu-Qid: 34tMM6VudEReYShy5o
X-Iguazu-QSIG: v=2; s=0; t=1624506230; q=34tMM6VudEReYShy5o; m=NDm9eycfEKW6r9+oftAomyfGEeGuBFBM2sgWbivm1wY=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1513) id 15O3hmbx027855
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 24 Jun 2021 12:43:49 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 5BC671000A1;
        Thu, 24 Jun 2021 12:43:48 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 15O3hljm012593;
        Thu, 24 Jun 2021 12:43:48 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 4/4] MAINTAINERS: Add entries for Toshiba Visconti PLL and clock controller
Date:   Thu, 24 Jun 2021 12:43:37 +0900
X-TSB-HOP: ON
Message-Id: <20210624034337.282386-5-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624034337.282386-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210624034337.282386-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add entries for Toshiba Visconti PLL and clock controller binding and
driver.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..334d482810e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2661,11 +2661,14 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
 F:	Documentation/devicetree/bindings/arm/toshiba.yaml
+F:	Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
+F:	Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pismu.yaml
 F:	Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
 F:	Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
 F:	Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
 F:	Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
 F:	arch/arm64/boot/dts/toshiba/
+F:	drivers/clk/visconti/
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
 F:	drivers/gpio/gpio-visconti.c
 F:	drivers/pinctrl/visconti/
-- 
2.32.0

