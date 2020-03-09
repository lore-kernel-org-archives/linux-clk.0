Return-Path: <SRS0=a9zA=42=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7719FC10F25
	for <linux-clk@archiver.kernel.org>; Mon,  9 Mar 2020 22:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50EF824671
	for <linux-clk@archiver.kernel.org>; Mon,  9 Mar 2020 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583791954;
	bh=QEVIOTTGFengVBGIhcnZ/0ApXq8GfPuUZGdR/tCXeRY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=Z69PUmzPjz/8XKWaXwZ2xvkb3RCYeGjxPnqS7bf35rtAWcgVUh9B3Y1KeYAw4TLaX
	 PKzyNaUMYdMGM3SS3Vg27XeXgSl614Wrm2VGc7Wc34AcCxDqylq2Bjn28/PQ4OrUh5
	 YK8wma6EDdPOlGWaFDD6rno2QZq2y6b5s5f4ZrZ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgCIWMe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Mar 2020 18:12:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgCIWMd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Mar 2020 18:12:33 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22F5B24655;
        Mon,  9 Mar 2020 22:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583791953;
        bh=QEVIOTTGFengVBGIhcnZ/0ApXq8GfPuUZGdR/tCXeRY=;
        h=From:To:Cc:Subject:Date:From;
        b=bpbppBxNSUgInxz9YBIANVOaRz8t8G3yi73EGdNjue14Tcm4NmfT2Noz6o2p8Fms7
         PZEWRx3jDt+AoTToWOlcyTpDP13JxScrekrNN6GPdXDCtInfIdYNNTzkztGVHoLq4q
         od+cfso3hqbV8Jv69dTcE2Fp+2KfrMpB0/GP1J/k=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk qcom rpmh fixes
Date:   Mon,  9 Mar 2020 15:12:30 -0700
Message-Id: <20200309221232.145630-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I had to read this driver today so I'm reworking it a 
little to ease readability. Based upon patches I've applied
to clk-qcom in clk.git

Stephen Boyd (2):
  clk: qcom: rpmh: Simplify clk_rpmh_bcm_send_cmd()
  clk: qcom: rpmh: Drop unnecessary semicolons

 drivers/clk/qcom/clk-rpmh.c | 41 ++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 23 deletions(-)


base-commit: cd5d5d8dec5e08e3e6ded9fa8366750a203b1d2a
-- 
Sent by a computer, using git, on the internet

