Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4D7C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 09:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B44320725
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 09:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbhAUJ4l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 04:56:41 -0500
Received: from www.zeus03.de ([194.117.254.33]:44332 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728480AbhAUJzj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Jan 2021 04:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ihXbxxWEwFQOe2
        v9NI1W3swgmIUC6tcmkshQgzdRQ8Q=; b=XnC4QuK42ydelBi/GWTKQMc84sFPtJ
        0cvZrlBT/HEjD5vJtp6xUlJxt8jeJpDyXiaGAmyKMBLSjXJkSsAJy78y3peLQAN5
        +BUPsqWaT8jZpVrXOTKxqy4vmMNIv2qbhTwK3FjpPa+CJjmlnNp92gjdiQ2Glgjx
        V4LHDWWgUGuNE=
Received: (qmail 1784043 invoked from network); 21 Jan 2021 10:54:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 10:54:28 +0100
X-UD-Smtp-Session: l3s3148p1@OMW1Dma5nL4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH V2 1/4] clk: renesas: r8a779a0: add clocks for I2C
Date:   Thu, 21 Jan 2021 10:54:17 +0100
Message-Id: <20210121095420.5023-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
References: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* use S1D4 as parent clock as described in the datasheet

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index ef45b7c10074..613f7b499cfc 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -166,6 +166,13 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("hscif1",	515,	R8A779A0_CLK_S1D2),
 	DEF_MOD("hscif2",	516,	R8A779A0_CLK_S1D2),
 	DEF_MOD("hscif3",	517,	R8A779A0_CLK_S1D2),
+	DEF_MOD("i2c0",		518,	R8A779A0_CLK_S1D4),
+	DEF_MOD("i2c1",		519,	R8A779A0_CLK_S1D4),
+	DEF_MOD("i2c2",		520,	R8A779A0_CLK_S1D4),
+	DEF_MOD("i2c3",		521,	R8A779A0_CLK_S1D4),
+	DEF_MOD("i2c4",		522,	R8A779A0_CLK_S1D4),
+	DEF_MOD("i2c5",		523,	R8A779A0_CLK_S1D4),
+	DEF_MOD("i2c6",		524,	R8A779A0_CLK_S1D4),
 	DEF_MOD("msi0",		618,	R8A779A0_CLK_MSO),
 	DEF_MOD("msi1",		619,	R8A779A0_CLK_MSO),
 	DEF_MOD("msi2",		620,	R8A779A0_CLK_MSO),
-- 
2.29.2

