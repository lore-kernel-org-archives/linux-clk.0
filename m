Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5C6C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 21:26:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68D7D22CB1
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 21:26:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388268AbhARV0q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Jan 2021 16:26:46 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:58748 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388486AbhARKKW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Jan 2021 05:10:22 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 10IA2xvj051674;
        Mon, 18 Jan 2021 18:02:59 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Jan
 2021 18:08:17 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andrewrj@au1.ibm.com>,
        <joel@linux.ibm.com>, <BMC-SW@aspeedtech.com>
CC:     Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/1] Fix AST2600A2 APLL calculate formuula
Date:   Mon, 18 Jan 2021 18:08:12 +0800
Message-ID: <20210118100813.30821-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10IA2xvj051674
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

AST2600 A1/A2 have different pll, this patch fix for AST2600 A2
APLL calculate.

Ryan Chen (1):
  clk: aspeed: Fix APLL calculate formula for ast2600-A2

 drivers/clk/clk-ast2600.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

-- 
2.17.1

