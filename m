Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A34C7EE43
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 00:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjCBA6v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 19:58:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjCBA6s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 19:58:48 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE6925960;
        Wed,  1 Mar 2023 16:58:46 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 7702B2024F; Thu,  2 Mar 2023 08:58:41 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677718721;
        bh=lYoTPeexRcOzzTOGXNKHbOel7qjqCaaeX1rZP2bFTX4=;
        h=From:To:Cc:Subject:Date;
        b=U2Q0zgjRpreRtnQiVkZ+hd4kAZ01WdIXMuzxbAcRpPaMB8M0nhBk1ZzpvnQQvBuVy
         QnoYzqraoWiTqtzrwAylgYGQ1YL8TJ3ledWHbiIJYtt6oFRUvGlusDTXAYCca8FIg3
         o2vGoqQEI2Vj4bYeRDwHo2+HA7a6uD1uAxcTeOvqaaz3roPaxYCPyBHBGlSbAmGBUD
         JO9NMaKwl/mR7nUkUBGxpRKTv/0+hBVXE5yp2E1DW+qqIcI/JDHryxH2Rw405xJ1e+
         7ovoJVUVT4llNRFCeFSsWHtSTd1jFXJgg89POg4WMJUNoCQmRmHydoY7C+c4FbjEAc
         YPeXEv2xqtWTA==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v5 0/6] Add definitions for AST2600 i3c clocks
Date:   Thu,  2 Mar 2023 08:58:28 +0800
Message-Id: <20230302005834.13171-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds some base configuration for the i3c controllers on
ast2600 hardware. We'll use the reset and clock definitions in the
proposed dt binding example, hence sending these first.

v5:
 - use regmap_update_bits rather than FIELD_PREP
 - drop reset defines; resets should be handled by clock control
 - add comments for the above
 - add comment for NUM_CLKS semantics
v4:
 - ensure we have enough space in ASPEED_G6_NUM_CLKS
v3:
 - split dt-bindings from clk changes
 - unify subject prefixes
v2:
 - based on feedback from Joel Stanley: avoid adding RESERVED clock
   definitions, allowing empty entries in aspeed_g6_gates instead.

Jeremy Kerr (6):
  clk: ast2600: allow empty entries in aspeed_g6_gates
  dt-bindings: clock: ast2600: Add top-level I3C clock
  clk: ast2600: Add full configs for I3C clocks
  dt-bindings: clock: ast2600: remove IC36 & I3C7 clock definitions
  clk: ast2600: Add comment about combined clock + reset handling
  dt-bindings: clock: ast2600: Expand comment on reset definitions

 drivers/clk/clk-ast2600.c                 | 67 ++++++++++++++++++++---
 include/dt-bindings/clock/ast2600-clock.h |  5 +-
 2 files changed, 60 insertions(+), 12 deletions(-)

-- 
2.39.1

