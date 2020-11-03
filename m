Return-Path: <SRS0=je5o=EJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7F7C388F9
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 16:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A07122280
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604420699;
	bh=WSq+jGqn7IIOco4olcXArGnNZtTL3ya7nktnhlMAieY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZU4Qu/+4Z6IwRgNuJeN6XnbbpQjPiyz1A7DNMmHsBnYhguubGGH2alooLITEH3XPO
	 vG5OWqTe6PJ0XpC5Wm9dWU07s5Zh/lshuoGyeAhA2XhnOF82Ur8Gs4DOctnMl46Qhf
	 zRhpCXLtm05uWSkxgRTfoUQQAmNYNerHPz0sBUVQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgKCQY6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Nov 2020 11:24:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:51582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728532AbgKCQY5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 3 Nov 2020 11:24:57 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAA09223EA;
        Tue,  3 Nov 2020 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604420696;
        bh=WSq+jGqn7IIOco4olcXArGnNZtTL3ya7nktnhlMAieY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yrMBsSVpyHPGYp5WdpHIcomDX/1s7Fplmr9Z+EABIl+81/8DnZ8QV3Z45fS6g1+Az
         9sSwRq+O1v0J10XthWmjnbMGyMCDdG/t2VgL8VvZp0wrhAx7txHVCLIzd9xBcPENqZ
         9/Plw74JvB3w/LtLcedTi2KlfWvUeFTl2ZZ0rDxg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 5/8] clk: imx8mq: drop of_match_ptr from of_device_id table
Date:   Tue,  3 Nov 2020 17:24:32 +0100
Message-Id: <20201103162435.13689-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103162435.13689-1-krzk@kernel.org>
References: <20201103162435.13689-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might be not relevant here).  This
fixes compile warning (!CONFIG_OF && !CONFIG_MODULES):

    drivers/clk/imx/clk-imx8mq.c:626:34: warning:
        ‘imx8mq_clk_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/imx/clk-imx8mq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 8265d1d48af4..75186888ecae 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -639,7 +639,7 @@ static struct platform_driver imx8mq_clk_driver = {
 		 * reloading the driver will crash or break devices.
 		 */
 		.suppress_bind_attrs = true,
-		.of_match_table = of_match_ptr(imx8mq_clk_of_match),
+		.of_match_table = imx8mq_clk_of_match,
 	},
 };
 module_platform_driver(imx8mq_clk_driver);
-- 
2.25.1

