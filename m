Return-Path: <SRS0=GgXf=7K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D95C433DF
	for <linux-clk@archiver.kernel.org>; Thu, 28 May 2020 23:38:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A40320897
	for <linux-clk@archiver.kernel.org>; Thu, 28 May 2020 23:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590709120;
	bh=xOc6jIfIBzDUCIiwBriGiB/QH5iSqrRwXB9T1VRVhtw=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=2pPmajxzkX9HW+NLrQFdpcQlHG4PhhKTE5E9uY6RJY9zP4Jkl6VpJ87Ed9EO+VWqp
	 fSRhgrfcIRAeV3s5la8CdWOfInLgOi1ymrR1zTRaKnyrQfayJMb9xdhRHXdxw2oX8V
	 LrDGz83RHZE5CADaqVB4lS1wiLc0HszTA25izl50=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437590AbgE1Xij (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 May 2020 19:38:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:54790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436651AbgE1Xii (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 May 2020 19:38:38 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94B702074B;
        Thu, 28 May 2020 23:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590709117;
        bh=xOc6jIfIBzDUCIiwBriGiB/QH5iSqrRwXB9T1VRVhtw=;
        h=From:To:Cc:Subject:Date:From;
        b=JqYc/Mlkf2A1a5eOkXm2xA3qIK7+4L/10mENqkpOIQ8ZwlbkjlyvBATghs4tzH+/e
         46+QB/uqIOftw4pLNgXiv3i9MJCT8dJgGnfa8KDoVP5AHTDtZw/rouyV2eI9Wzcodt
         IbLiTuRDuNMl8lLGMnXn13QMXWXDZyy2+MEvxrNw=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] clk: ingenic: Mark ingenic_tcu_of_match as __maybe_unused
Date:   Thu, 28 May 2020 16:38:37 -0700
Message-Id: <20200528233837.70269-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This device id table is passed to of_match_node() later on in probe, but
on CONFIG_OF=n builds of_match_node() doesn't do anything with the
arguments. Lets just mark the table unused so that the compiler doesn't
complain about this.

drivers/clk/ingenic/tcu.c:326:34: warning: unused variable 'ingenic_tcu_of_match' [-Wunused-const-variable]
static const struct of_device_id ingenic_tcu_of_match[] __initconst = {
^
1 warning generated.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/ingenic/tcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index 153a954b0d2f..9382dc3aa27e 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -323,7 +323,7 @@ static const struct ingenic_soc_info x1000_soc_info = {
 	.has_tcu_clk = false,
 };
 
-static const struct of_device_id ingenic_tcu_of_match[] __initconst = {
+static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4740-tcu", .data = &jz4740_soc_info, },
 	{ .compatible = "ingenic,jz4725b-tcu", .data = &jz4725b_soc_info, },
 	{ .compatible = "ingenic,jz4770-tcu", .data = &jz4770_soc_info, },
-- 
Sent by a computer, using git, on the internet

