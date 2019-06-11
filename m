Return-Path: <SRS0=yexa=UK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659A3C4321B
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 10:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35A54205F4
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560248294;
	bh=Kn3t/CWfkqyvKZFbLUZs5AfcXKZa2BYUNUsJyKA5Gz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=DwnbLaBF4ybZ9b+5UNgieTgzYLhAxLr6Rbv01F4cfNAmQcy5ZziRVo02tHg5Zabmb
	 0BAILPqscowyJf/GxPuxN4mMTkKbWtk4BrrZo3D6b/OgoD8BozbYjnQp0nmhr9IEZ9
	 +LmQ2A/G79XPG7DejFnkK8Sj4iJnyPceTjRqJ4CE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405431AbfFKKSE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jun 2019 06:18:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405343AbfFKKR0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Jun 2019 06:17:26 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FF02217D6;
        Tue, 11 Jun 2019 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560248245;
        bh=Kn3t/CWfkqyvKZFbLUZs5AfcXKZa2BYUNUsJyKA5Gz4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ymAPliOd1nYzigdtr7cOMV+v9MT8eMmXKabPR70y5mCL4qj1cs47JlvfNUYtmgyOq
         9ZShzsyUZy9VOg0hCDDc41T3QaLIZ32exlSgeLn3CVF1IC5dcIrjMgUNUGlNxearQA
         D0VCr/+Uxx++DrF4nUwsN8j4WHQXRxbWyoQRowVg=
Received: by wens.tw (Postfix, from userid 1000)
        id 99DF660C93; Tue, 11 Jun 2019 18:17:18 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 22/25] clk: sunxi-ng: h6-r: Use local parent references for CLK_FIXED_FACTOR
Date:   Tue, 11 Jun 2019 18:16:55 +0800
Message-Id: <20190611101658.23855-23-wens@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611101658.23855-1-wens@kernel.org>
References: <20190611101658.23855-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

With the new clk parenting code and CLK_FIXED_FACTOR_{HW,FW_NAME}
macros, we can reference parents locally via pointers to struct clk_hw
or DT clock-names.

Convert existing CLK_FIXED_FACTOR definitions to either the _HW or
_FW_NAME variant based on whether the parent clock is internal or
external to the CCU.

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
index 8d05d4f1f8a1..45a1ed3fe674 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
@@ -49,7 +49,7 @@ static struct ccu_div ar100_clk = {
 	},
 };
 
-static CLK_FIXED_FACTOR(r_ahb_clk, "r-ahb", "ar100", 1, 1, 0);
+static CLK_FIXED_FACTOR_HW(r_ahb_clk, "r-ahb", &ar100_clk.common.hw, 1, 1, 0);
 
 static struct ccu_div r_apb1_clk = {
 	.div		= _SUNXI_CCU_DIV(0, 2),
-- 
2.20.1

