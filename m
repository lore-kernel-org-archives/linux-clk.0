Return-Path: <SRS0=LMZy=WR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38504C3A5A1
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 09:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1784F22DA7
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 09:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfHUJPa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Aug 2019 05:15:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41934 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfHUJPa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Aug 2019 05:15:30 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 522EF25B7C3;
        Wed, 21 Aug 2019 19:15:28 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3C9489405AE; Wed, 21 Aug 2019 11:15:26 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] dt-bindings: clk: emev2: Rename bindings documentation file
Date:   Wed, 21 Aug 2019 11:15:16 +0200
Message-Id: <20190821091516.16372-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rename the device tree clock bindings for Renesas EMMA Mobile EV2
from emev2-clock.txt to renesas,emev2-smu.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1

v2
* Drop emev2 prefix from new filename, it was unintentional
  and does not match the proposed naming scheme
---
 .../devicetree/bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt} (100%)

diff --git a/Documentation/devicetree/bindings/clock/emev2-clock.txt b/Documentation/devicetree/bindings/clock/renesas,emev2-smu.txt
similarity index 100%
rename from Documentation/devicetree/bindings/clock/emev2-clock.txt
rename to Documentation/devicetree/bindings/clock/renesas,emev2-smu.txt
-- 
2.11.0

