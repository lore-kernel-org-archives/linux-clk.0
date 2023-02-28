Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FCDC64ED6
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 09:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjB1JQz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 04:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjB1JQx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 04:16:53 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38EF2BEE2;
        Tue, 28 Feb 2023 01:16:51 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 271102024F; Tue, 28 Feb 2023 17:16:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677575807;
        bh=oFMs6phIpJBNXA24Nbc9r74KR/93A/vdt1YyCI02xCQ=;
        h=From:To:Cc:Subject:Date;
        b=f1X96u2OjCpws8n/R/YAt4N7kTH4QDi1y+n7ubaQCCmz4nFtGlzCp3PujvGGOXZ11
         95aQimdoWEHLay55UrfJhsK/E0yDl3ISDWyfgWe1obnxS1Ea3JBEWzrJs9gpzLgf3V
         GlfLUe4LYzvAXLICDU8b/TDepKNTrtOR4yxaCUMDgFMBC+OdpcgD+QKC+NspMIXNXy
         +fUIoPgeysiqS5wffQxJXWIR6PLiyOw3M9LaTl5i+VurON1fQ+sTKGNlAeM4HN9u1Z
         l5x1QNRNdpqBRzCo72fCSuknv75NN6hv098tzqUdeBZcAHj4Cw8+iVO3sQqVOq3tkp
         6ahdSlNtRMFTg==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 0/5] Add definitions for AST2600 i3c clocks and resets
Date:   Tue, 28 Feb 2023 17:16:33 +0800
Message-Id: <20230228091638.206569-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds some base configuration for the i3c controllers on
ast2600 hardware. We'll use the reset and clock definitions in the
proposed dt binding example, hence sending these first.

v4:
 - ensure we have enough space in ASPEED_G6_NUM_CLKS
v3:
 - split dt-bindings from clk changes
 - unify subject prefixes
v2:
 - based on feedback from Joel Stanley: avoid adding RESERVED clock
   definitions, allowing empty entries in aspeed_g6_gates instead.

Jeremy Kerr (5):
  clk: ast2600: allow empty entries in aspeed_g6_gates
  dt-bindings: clock: ast2600: Add top-level I3C clock
  clk: ast2600: Add full configs for I3C clocks
  dt-bindings: clock: ast2600: remove IC36 & I3C7 clock definitions
  dt-bindings: clock: ast2600: Add reset config for I3C

 drivers/clk/clk-ast2600.c                 | 43 ++++++++++++++++++-----
 include/dt-bindings/clock/ast2600-clock.h |  9 +++--
 2 files changed, 41 insertions(+), 11 deletions(-)

-- 
2.39.1

