Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE6FC4338F
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 08:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51F5360EB5
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 08:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238342AbhHRIGT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Aug 2021 04:06:19 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:34601 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238405AbhHRIGT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Aug 2021 04:06:19 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 17I7lBOB092603;
        Wed, 18 Aug 2021 15:47:11 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Aug
 2021 16:05:23 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     <bmc-sw@aspeedtech.com>, ryan_chen <ryan_chen@aspeedtech.com>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/1] Fix AST2600 hpll calculate formula
Date:   Wed, 18 Aug 2021 16:05:17 +0800
Message-ID: <20210818080518.9491-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17I7lBOB092603
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

AST2600 HPLL calculate has few different with other pll calculate

Ryan Chen (1):
  clk:aspeed:Fix AST2600 hpll calculate formula

 drivers/clk/clk-ast2600.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

-- 
2.17.1

