Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD81E867
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716910247; cv=none; b=rfqin05gLly80plULzDlpP1O/R+51ZuWlh2oB78PROmPOWs8W7Fd81zcuhYYQBcLtDP4d2O5Cezm7Ee551/oXNk4bnOd5AIZxuaRxT3tQPztIogzK59dRIUXRMSQuMjqiDa/uPmvPJQFnvXxROvYp6kYhTUoLtSTZseFZsU10tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716910247; c=relaxed/simple;
	bh=MEpI9cbiuyp4XqZwjDIfCb+8/tqlEMab6Gbx7NbkZgU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZF+gOAJ7FgMI9OMG7teVWzrJOF2vD2nq+DqKcpkrmajW9/bewoZ3EhU5VY4OFcSJsA7gw5tDxmRhKwng6nefKUrl3fEyWwImlMMDCFnwmGsyBt0bxilM24YqUeOX4GWuiGtz2nFLsr5AS/4LFFb4FPuApJS4XnwFdp6GPZcPCzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smartandconnective.com; spf=pass smtp.mailfrom=smartandconnective.com; dkim=pass (1024-bit key) header.d=smartandconnective.com header.i=@smartandconnective.com header.b=kza+oIZP; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smartandconnective.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartandconnective.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smartandconnective.com header.i=@smartandconnective.com header.b="kza+oIZP"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Vpbf94QnDz7nG;
	Tue, 28 May 2024 17:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=smartandconnective.com; s=20191114; t=1716909281;
	bh=3bUxCMue09hBn28f4SiBpgvkHgQHBTwNx6pE/uKig6Y=;
	h=From:To:Cc:Subject:Date:From;
	b=kza+oIZPTVXxTlz1ZM527xyVxTPuxb24dIH12C62NsMEr607xEiPUZK5N/0uLvg2I
	 aY5B53xN9B1qGCLHD06MGeXb0NirMpTrwHbuYeTp32wF4S97bEvcVYeUlN6F7Qi05A
	 X4VdQMGMIkID7DIJjJyyaOzQBH4QaWHt+PShHhc8=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Vpbf83S5Qzw36;
	Tue, 28 May 2024 17:14:40 +0200 (CEST)
From: Sebastien Laveze <slaveze@smartandconnective.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Lee Jones <lee@kernel.org>
Cc: Sebastien Laveze <slaveze@smartandconnective.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx: imx6ul: fix default parent for enet*_ref_sel
Date: Tue, 28 May 2024 17:14:33 +0200
Message-Id: <20240528151434.227602-1-slaveze@smartandconnective.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

The clk_set_parent for "enet1_ref_sel" and  "enet2_ref_sel" are
incorrect, therefore the original requirements to have "enet_clk_ref" as
output sourced by iMX ENET PLL as a default config is not met.

Only "enet[1,2]_ref_125m" "enet[1,2]_ref_pad" are possible parents for
"enet1_ref_sel" and "enet2_ref_sel".

This was observed as a regression using a custom device tree which was
expecting this default config.

This can be fixed at the device tree level but having a default config
matching the original behavior (before refclock mux) will avoid breaking
existing configs.

Fixes: 4e197ee880c2 ("clk: imx6ul: add ethernet refclock mux support")
Link: https://lore.kernel.org/lkml/20230306020226.GC143566@dragon/T/
Signed-off-by: Sebastien Laveze <slaveze@smartandconnective.com>
---
 drivers/clk/imx/clk-imx6ul.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index f9394e94f69d..05c7a82b751f 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -542,8 +542,8 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6UL_CLK_ENFC_SEL]->clk, hws[IMX6UL_CLK_PLL2_PFD2]->clk);
 
-	clk_set_parent(hws[IMX6UL_CLK_ENET1_REF_SEL]->clk, hws[IMX6UL_CLK_ENET_REF]->clk);
-	clk_set_parent(hws[IMX6UL_CLK_ENET2_REF_SEL]->clk, hws[IMX6UL_CLK_ENET2_REF]->clk);
+	clk_set_parent(hws[IMX6UL_CLK_ENET1_REF_SEL]->clk, hws[IMX6UL_CLK_ENET1_REF_125M]->clk);
+	clk_set_parent(hws[IMX6UL_CLK_ENET2_REF_SEL]->clk, hws[IMX6UL_CLK_ENET2_REF_125M]->clk);
 
 	imx_register_uart_clocks();
 }
-- 
2.34.1

