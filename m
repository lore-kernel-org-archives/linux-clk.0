Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A4FC4360F
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 23:01:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 654542133D
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554246066;
	bh=rkFp3QAwCeZzIOHeZDwx3ZkejrLUQLxd5alhZjCdKvw=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=e21hOoPqXzzHXqOaPKuRsJS3bH1heILCNDjV5MizayCTlHE8l+uiE5jabYslSJY4w
	 C+XP5c8HgN3n1wrfk9bPTLV5oeJR2G6XzpI/igDOD8WnRrpO62BQT51J57dOToyG91
	 mpIdksrR+p/yT2740XRTwoHuFgzsbQaVTi0/9hDY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfDBXBG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 19:01:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:49882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726074AbfDBXBF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Apr 2019 19:01:05 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16BA52084C;
        Tue,  2 Apr 2019 23:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554246065;
        bh=rkFp3QAwCeZzIOHeZDwx3ZkejrLUQLxd5alhZjCdKvw=;
        h=From:To:Cc:Subject:Date:From;
        b=uLWMqNfV6ojw1xuuRy4cqQuluspGggyE40dXMJKQA32uocibV4yAwe1RcTVLlOJdB
         Kxcs5zy9uL7AqM8g+INt1/HxMHh3j3XdHZklA/Oc1RR3o6FX0LajuW7cPCz0vUPnZS
         Ku4Fe6Oaotgf2Y8M2ssMXOli66fXNL+OWq61HHiQ=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/8] Clk documentation updates
Date:   Tue,  2 Apr 2019 16:00:56 -0700
Message-Id: <20190402230104.105845-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Here's a random collection of core clk documentation updates.
During the process I noticed that the 'flags' member of the fixed rate
clk wasn't used, so I dropped it and updated the user in the NXP driver.
I'm planning to apply this for the v5.2 series.

Stephen Boyd (8):
  clk: Collapse gpio clk kerneldoc
  clk: Document deprecated things
  clk: Document CLK_MUX_READ_ONLY mux flag
  clk: Document __clk_mux_determine_rate()
  clk: nxp: Drop 'flags' on fixed_rate clk macro
  clk: Remove 'flags' member of struct clk_fixed_rate
  clk: Document and simplify clk_core_get_rate_nolock()
  clk: Drop duplicate clk_register() documentation

 drivers/clk/clk.c             | 46 ++++++++++++++++++++---------------
 drivers/clk/nxp/clk-lpc32xx.c |  7 +++---
 include/linux/clk-provider.h  | 39 +++++++++--------------------
 3 files changed, 40 insertions(+), 52 deletions(-)


base-commit: bfeffd155283772bbe78c6a05dec7c0128ee500c
-- 
Sent by a computer through tubes

