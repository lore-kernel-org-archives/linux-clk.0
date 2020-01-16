Return-Path: <SRS0=DYql=3F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC098C33CB6
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 16:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B894020728
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579193977;
	bh=oJ/J1nwHNaBUQwjmCIAEOfnpZdET2hlGzDmtrS2NE9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=y9lJeI+vtqgx1teAMLWBEAYEwBKvPx+vPfKRgXBM/Rvoe/giiUoUU3jRCRgDyWd8b
	 9W/U4LbmpCtJ9P+dSEJ+GBW3844A/WRATQ8Efo7LOBrUKXrnUBj3qf0o9afxhFBdUV
	 IZZ2gpUKi+HNzK6Faodeb93nhqmlw11t3OPRC9dk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387462AbgAPQ5Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jan 2020 11:57:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:44162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387459AbgAPQ5P (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Jan 2020 11:57:15 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5273424656;
        Thu, 16 Jan 2020 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579193834;
        bh=oJ/J1nwHNaBUQwjmCIAEOfnpZdET2hlGzDmtrS2NE9s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=y5xMA6VbtMnACaOgUklK6VUDphvLYhYeqb2hOY88VNN3uETfnIUKF9bhryg4pBHz3
         +bwLoqCBB8vjwIFrkkQXwyShiQZ1LDTwxLgQ8znxiJc+cAXXyYPfw96Cb8Mx37sH22
         VGySBNlamwC7nNlqvYD5FdPveOo1nn5eopAp0KJg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 090/671] clk: imx6sx: fix refcount leak in imx6sx_clocks_init()
Date:   Thu, 16 Jan 2020 11:45:21 -0500
Message-Id: <20200116165502.8838-90-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165502.8838-1-sashal@kernel.org>
References: <20200116165502.8838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Yangtao Li <tiny.windzz@gmail.com>

[ Upstream commit 1731e14fb30212dd8c1e9f8fc1af061e56498c55 ]

The of_find_compatible_node() returns a node pointer with refcount
incremented, but there is the lack of use of the of_node_put() when
done. Add the missing of_node_put() to release the refcount.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Fixes: d55135689019 ("ARM: imx: add clock driver for imx6sx")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/imx/clk-imx6sx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index d9f2890ffe62..57ab96a47775 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -151,6 +151,7 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx6sx-anatop");
 	base = of_iomap(np, 0);
 	WARN_ON(!base);
+	of_node_put(np);
 
 	clks[IMX6SX_PLL1_BYPASS_SRC] = imx_clk_mux("pll1_bypass_src", base + 0x00, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
 	clks[IMX6SX_PLL2_BYPASS_SRC] = imx_clk_mux("pll2_bypass_src", base + 0x30, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
-- 
2.20.1

