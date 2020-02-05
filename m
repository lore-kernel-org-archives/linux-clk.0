Return-Path: <SRS0=3WMO=3Z=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A1BC352A1
	for <linux-clk@archiver.kernel.org>; Wed,  5 Feb 2020 23:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FD3321927
	for <linux-clk@archiver.kernel.org>; Wed,  5 Feb 2020 23:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580945297;
	bh=46oZ7qfCkoMgiJNmlyL4gPed6RlcQ2p9W5//kGnmdW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=O2grZxk8ThBXUBg6NaSH6+zMJrbJOI4EGVSSHSxynoNMmEeuZic8zUOf21e25aRgw
	 hHZQek2fpyvjvDUL8VfBbFdkkTwODATCaCE92c0IEXB1T+74SX2OP2O8DfI8zCYAjl
	 TqpAguH1n5EfAUXFhgU4KOobKyECp6SCyELkLvwU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgBEX2N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Feb 2020 18:28:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:38386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727562AbgBEX2E (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 5 Feb 2020 18:28:04 -0500
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3910021D7D;
        Wed,  5 Feb 2020 23:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580945284;
        bh=46oZ7qfCkoMgiJNmlyL4gPed6RlcQ2p9W5//kGnmdW4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1qbTzrp3OYJjljGNXksFzohyeQKOG16ZA9ElJOJZYE0pYz99RY6HzML5gYQ89yjdL
         Ft1uzm50Nnv1XOe3XIqJV4vCS265FW8/kDT/HCP/xDGo2rq2kmokIHP8eEkYaKjY+a
         ucPOoZv8Ay10YX+ExJwfnXubPJgxHebXfD3P4Kxc=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 4/4] clk: Bail out when calculating phase fails during clk registration
Date:   Wed,  5 Feb 2020 15:28:02 -0800
Message-Id: <20200205232802.29184-5-sboyd@kernel.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205232802.29184-1-sboyd@kernel.org>
References: <20200205232802.29184-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Bail out of clk registration if we fail to get the phase for a clk that
has a clk_ops::get_phase() callback. Print a warning too so that driver
authors can easily figure out that some clk is unable to read back phase
information at boot.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 87532e2d124a..e9e83f7ae9e0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3457,7 +3457,12 @@ static int __clk_core_init(struct clk_core *core)
 	 * Since a phase is by definition relative to its parent, just
 	 * query the current clock phase, or just assume it's in phase.
 	 */
-	clk_core_get_phase(core);
+	ret = clk_core_get_phase(core);
+	if (ret < 0) {
+		pr_warn("%s: Failed to get phase for clk '%s'\n", __func__,
+			core->name);
+		goto out;
+	}
 
 	/*
 	 * Set clk's duty cycle.
-- 
Sent by a computer, using git, on the internet

