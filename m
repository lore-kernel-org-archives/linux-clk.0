Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59937C4708F
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 05:31:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36BCB6136E
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 05:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbhFAFcn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Jun 2021 01:32:43 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:42184 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbhFAFcn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Jun 2021 01:32:43 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 1515Unv3021389; Tue, 1 Jun 2021 14:30:49 +0900
X-Iguazu-Qid: 34tKOQR7Jx8HZepPvF
X-Iguazu-QSIG: v=2; s=0; t=1622525448; q=34tKOQR7Jx8HZepPvF; m=/fEaRDidXZyoAZy1z8DDch/yNMGf2PRJ9OVynpWkct4=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1510) id 1515UlVl009135
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 1 Jun 2021 14:30:48 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 39A541000C2;
        Tue,  1 Jun 2021 14:30:47 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 1515UkeD008244;
        Tue, 1 Jun 2021 14:30:46 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, punit1.agrawal@toshiba.co.jp,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 4/4] MAINTAINERS: Add entries for Toshiba Visconti PLL and clock controller
Date:   Tue,  1 Jun 2021 14:30:37 +0900
X-TSB-HOP: ON
Message-Id: <20210601053037.233573-5-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601053037.233573-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210601053037.233573-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add entries for Toshiba Visconti PLL and clock controller binding and driver.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..7260de6d050d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2661,11 +2661,14 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
 F:	Documentation/devicetree/bindings/arm/toshiba.yaml
+F:	Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pipllct.yaml
+F:	Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pismu.yaml
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
2.31.1

