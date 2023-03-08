Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F436C64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 18:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCHSwA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 13:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjCHSv7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 13:51:59 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B77392BF
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 10:51:57 -0800 (PST)
Received: from stefanw-SCHENKER ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MatZt-1q7ezx0LoR-00cTgR; Wed, 08 Mar 2023 19:46:26 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] clk: imx: clk-gpr-mux: Provide clock name in error message
Date:   Wed,  8 Mar 2023 19:46:03 +0100
Message-Id: <20230308184603.10049-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l+FAs1mpJfR268hEJgY5XDzD9Ul/vUp0E/XeiPUFFMnqWuytiTY
 2jhPF23J1tEoF7BnauHiBO6wh+ZIYSS+4dTLtmH/Jbs/wridXJLegHA0QqrfcKXEboHFoMU
 Cbn4eMiB31KKWGip8Qvugv7hY8huGpNSSj0Mlp9gptNL+IBHeLci0en6hDGqY0Myu116Xn2
 iyQshkUS8Qk1cIunlhr0w==
UI-OutboundReport: notjunk:1;M01:P0:xPnspzz9GSY=;S1aVQcxkGRALLAV1UTeeq1yVNP0
 n0VMdc+/sckFehly16YQiE8TIPuxiOR0C94+gLQs0XGoNUThndfSU7LRx3/bJKGg8cE21qCDI
 7lurgsyrZTgeDFuJmwTHWImzXMkanF+INFkmYhdgtkTGyY+mJAiWAjl+pjDqZQToQ2YpdkhHW
 ucJNDeNA6pYW4xJpAQtC80duznegatKOk/wbJsNRExzMZhTM3VkQZiNZRxJGH9dqmdEdapH8G
 UTkmGfjSQv048jyZOHI7dDcdbtF34pLvxZYejEuoLvb5F7RqWSCL/lvqBUeh3n8kTYBXB0YC8
 MYV0J5g3l1bkpNW6BPXxF/slvDo+5BPyWrIi7o7dYEJJNWYtIOq4HN8XK5ehPu82oKUCyIRS3
 pdyn8uyg8/qQROUFK3BERV+r4lCcbZ1cdEYR6NQMbp9kuJS9pTuWBbTrVy/Uotq30WsanSeXQ
 VQPx4BFGrjnTaitrrnmnNMVoQhHAht6TmNIjWCTBaVoHdECTmlk1PbJw6aAHqwS5sSclpg0+k
 o61jRJpRI3n1UJ4AmO9aEOXSoW6OIHMxSxp7NfR/1IMCA3NQmpqpl5iOHOQTuYIMR0d4YnMTA
 UA/rJv3MW+YSY0CI8/c93iq3nOloDKzIeg3BQloWfezdNUXtKjUc3/6jqt7wqpE44m3/B12ad
 1ZfvEl2vLtwjF4QjofCg3JRAqOxBTs1VqjigJROeQg==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In error case the error message doesn't provide much context:

imx:clk-gpr-mux: failed to get parent (-EINVAL)

So additionally provide the clock name in the message, in
order to simplify the further analyze.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/clk/imx/clk-gpr-mux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-gpr-mux.c b/drivers/clk/imx/clk-gpr-mux.c
index c8d6090f15d6..0b5a97698b47 100644
--- a/drivers/clk/imx/clk-gpr-mux.c
+++ b/drivers/clk/imx/clk-gpr-mux.c
@@ -48,7 +48,8 @@ static u8 imx_clk_gpr_mux_get_parent(struct clk_hw *hw)
 	return ret;
 
 get_parent_err:
-	pr_err("failed to get parent (%pe)\n", ERR_PTR(ret));
+	pr_err("%s: failed to get parent (%pe)\n",
+	       clk_hw_get_name(hw), ERR_PTR(ret));
 
 	/* return some realistic non negative value. Potentially we could
 	 * give index to some dummy error parent.
-- 
2.34.1

