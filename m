Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E73C4360F
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 23:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B570F2084C
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554246089;
	bh=wb5hHeJ6wRMHMCIoLbx190AyCDTefryBJkqwy0zDlno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=1QqQauo6aL0WgX91oiO68l4UlJSJol5dZlGnZTkpPQqG2tTUY/n8hVpt8Q8d8g64i
	 gTzjsshGYbiVsLQP5tKtLXHFSz8NpY1XIEdC62GC4ZtvLO9lQXiy55wV5JsSNpkClt
	 f0pNIKoGvNksbcuLz8NtbuU4GbVBs06KObjJzTig=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbfDBXBU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 19:01:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:49924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbfDBXBH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Apr 2019 19:01:07 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B89720856;
        Tue,  2 Apr 2019 23:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554246067;
        bh=wb5hHeJ6wRMHMCIoLbx190AyCDTefryBJkqwy0zDlno=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lf2gLtRZD8P06cfZTsw0RTbBbPRhA4sesSoi1m6eKD/gDAalWmeQ1Xgd5t2f+Yjzn
         hNwA6YEatBN1C6pBsN+cX96KO325ucGewi+1LPqr6bKLkHclaWJ/2mfR6rdQeuua8T
         gqbjR7X/g4sKQdtW2vVHZqp5FoLc4k0SPA7ql3ic=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 6/8] clk: Remove 'flags' member of struct clk_fixed_rate
Date:   Tue,  2 Apr 2019 16:01:02 -0700
Message-Id: <20190402230104.105845-7-sboyd@kernel.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
In-Reply-To: <20190402230104.105845-1-sboyd@kernel.org>
References: <20190402230104.105845-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This member is never used nor documented in the kerneldoc. Remove it.

Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 include/linux/clk-provider.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index edff3c5883bc..a1705a0f08c7 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -307,7 +307,6 @@ struct clk_fixed_rate {
 	struct		clk_hw hw;
 	unsigned long	fixed_rate;
 	unsigned long	fixed_accuracy;
-	u8		flags;
 };
 
 #define to_clk_fixed_rate(_hw) container_of(_hw, struct clk_fixed_rate, hw)
-- 
Sent by a computer through tubes

