Return-Path: <SRS0=vVV6=PK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469D3C43612
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jan 2019 14:59:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0DB7921900
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jan 2019 14:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546441192;
	bh=5bBe00a2TVwTAktQVS87Q4DGO3La3P2XN3cZEhmm+50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=UU13I1+OV2RObZIHM6zi3itRQ9YIGtd+xj6t3DIAVA0Bu+cvoYK6cZHym0woYMyMQ
	 btsPr3vr/kDKorUBwy8eYy89d6yj6ppe7l8pod2MDMJBL3qIAi/UII6ft79MPx4q0u
	 1MTXoSjmLnvtG/7UAOkmJDzs/x+LlKYRcl67Ir1M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbfABO7v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jan 2019 09:59:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:54868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729458AbfABO7v (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Jan 2019 09:59:51 -0500
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81866218FD;
        Wed,  2 Jan 2019 14:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546441191;
        bh=5bBe00a2TVwTAktQVS87Q4DGO3La3P2XN3cZEhmm+50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mGBtlgGffyPN92fifnXXKrM/tQd0mvlyLn6+oYRXHfyVd4vsy0J/IOwDOAqj44Vb2
         M2BW1mdFvXoQTHgEuwxVKz7dnaH7p9p9iZgvYogny5Wnp6/EBC3QU8DPswif/u2kBk
         UWcbhfsBiXhiy26Q6FkYriGZsX2FlHq5h2mOW738=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-stable@vger.kernel.org
Subject: [PATCH RESEND 2/2] clk: socfpga: stratix10: fix rate calculation for pll clocks
Date:   Wed,  2 Jan 2019 08:59:32 -0600
Message-Id: <20190102145932.26423-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190102145932.26423-1-dinguyen@kernel.org>
References: <20190102145932.26423-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The main PLL calculation has a mistake. We should be using the
multiplying the VCO frequency, not the parent clock frequency.

Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for
Stratix10 platform")
Cc: linux-stable@vger.kernel.org
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-pll-s10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pll-s10.c
index 2d5d8b43727e..c4d0b6f6abf2 100644
--- a/drivers/clk/socfpga/clk-pll-s10.c
+++ b/drivers/clk/socfpga/clk-pll-s10.c
@@ -43,7 +43,7 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hwclk,
 	/* Read mdiv and fdiv from the fdbck register */
 	reg = readl(socfpgaclk->hw.reg + 0x4);
 	mdiv = (reg & SOCFPGA_PLL_MDIV_MASK) >> SOCFPGA_PLL_MDIV_SHIFT;
-	vco_freq = (unsigned long long)parent_rate * (mdiv + 6);
+	vco_freq = (unsigned long long)vco_freq * (mdiv + 6);
 
 	return (unsigned long)vco_freq;
 }
-- 
2.20.0

