Return-Path: <SRS0=DYql=3F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6702DC33CB8
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 16:59:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 352492192A
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 16:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579193984;
	bh=6IKZmcbn0aY0zYcRkmYnfljl6rSXMsXt489XGbFz084=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=fk/RywXTJYpZ5thn80XTogHC+qpuUpGLYO8ad839Pe8fe9WTmh0ycNq9oVLS6G+Xk
	 N511AMOnFLP06kFR9cgOImMUiPTCd0Ei17sFNGwjAwoaqIfywT8z4ITcA9CAwVqzNu
	 yE9CinWelPE1DEN6COexXmrdhq5yaOw6DZBHD/Y0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387456AbgAPQ5N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jan 2020 11:57:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:44132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387455AbgAPQ5N (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Jan 2020 11:57:13 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21D2D21D56;
        Thu, 16 Jan 2020 16:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579193832;
        bh=6IKZmcbn0aY0zYcRkmYnfljl6rSXMsXt489XGbFz084=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KuFZA/PuPQUWPSre/Q+z1fVi9BpnJ+2mmrXimPwFPvYCoIJdty+WTpha2GZ9FVhJi
         8U/CWOXPLXswieaa7AohLiq3obXTp5xZEHkkki8+5R1UCGKQ9oXwY7GslC6Gl7xSrE
         aIckVSwi+Yi+jqYGY6aeiRKT31UQOsFZ3RDLRmts=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 089/671] clk: imx6q: fix refcount leak in imx6q_clocks_init()
Date:   Thu, 16 Jan 2020 11:45:20 -0500
Message-Id: <20200116165502.8838-89-sashal@kernel.org>
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

[ Upstream commit c9ec1d8fef31b5fc9e90e99f9bd685db5caa7c5e ]

The of_find_compatible_node() returns a node pointer with refcount
incremented, but there is the lack of use of the of_node_put() when
done. Add the missing of_node_put() to release the refcount.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Fixes: 2acd1b6f889c ("ARM: i.MX6: implement clocks using common clock framework")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/imx/clk-imx6q.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index c509324f6338..8ddf9b1f1677 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -424,6 +424,7 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx6q-anatop");
 	anatop_base = base = of_iomap(np, 0);
 	WARN_ON(!base);
+	of_node_put(np);
 
 	/* Audio/video PLL post dividers do not work on i.MX6q revision 1.0 */
 	if (clk_on_imx6q() && imx_get_soc_revision() == IMX_CHIP_REVISION_1_0) {
-- 
2.20.1

