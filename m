Return-Path: <SRS0=HIww=U3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EACC4646D
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 03:19:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68CB2214DA
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 03:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbfF1DTR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jun 2019 23:19:17 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:49286 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfF1DTQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jun 2019 23:19:16 -0400
Received: (qmail 11898 invoked by uid 5089); 28 Jun 2019 03:19:13 -0000
Received: by simscan 1.2.0 ppid: 11873, pid: 11874, t: 0.0449s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL:  $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 28 Jun 2019 03:19:13 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
        id ED70320077899; Fri, 28 Jun 2019 11:19:11 +0800 (AWST)
From:   Phil Reid <preid@electromag.com.au>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, preid@electromag.com.au,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] clk: clk-cdce925: Add regulator support
Date:   Fri, 28 Jun 2019 11:19:08 +0800
Message-Id: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The cdce925 power supplies could be controllable on some platforms.
Enable them before communicating with the cdce925.

Changes from V1
- Add devicetree updates


Phil Reid (2):
  dt-bindings: clock: cdce925: Add regulator documentation
  clk: clk-cdce925: Add regulator support

 .../devicetree/bindings/clock/ti,cdce925.txt       |  4 +++
 drivers/clk/clk-cdce925.c                          | 34 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
1.8.3.1

