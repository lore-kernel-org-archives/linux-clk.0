Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E99C6FA99
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 13:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjBMNYs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjBMNYj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 08:24:39 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC625FF4;
        Mon, 13 Feb 2023 05:24:37 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id CF17C200E3; Mon, 13 Feb 2023 21:24:35 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676294675;
        bh=xWVo/cioNLips5Na/dw9hBc7pbRVy2N8LT3wjXnTbLY=;
        h=From:To:Cc:Subject:Date;
        b=DLyAgzZrUNhDLoWUzhUmVo0X8GxWUH+wrRKqT/mW1MQgBw4R4YMJsAdaFh1nyuuJu
         OLOwv466GEoyxkzNrBm5/bv6ddOh7kCcN3miqpRhjl1zseuEIu9O3HL+Un2dJQkDqj
         biIzuw3b2KIZoDSSAA5Xl4bsiwYx2Fr7shBBqssqm7SVMLwQFMT6QGOP0zaRwShTrX
         4/Fd9WdB7RJSs8b2NbmvkT0CK8gg1B2CoOLvzEiRKDYf4qfe7D/ioUe546vjM6m8G7
         apD61JindsZulZ8NInDLxtmUprZJNg0lSA+aPgrpH2baZJ53cw8pE9EV29/9OEb5fY
         N1ky0iYqEkUEw==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 0/5] Add definitions for AST2600 i3c clocks and resets
Date:   Mon, 13 Feb 2023 21:24:16 +0800
Message-Id: <cover.1676294433.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds some base configuration for the i3c controllers on
ast2600 hardware. We'll use the reset and clock definitions in the
proposed dt binding example, hence sending these first.

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

 drivers/clk/clk-ast2600.c                 | 41 ++++++++++++++++++-----
 include/dt-bindings/clock/ast2600-clock.h |  9 +++--
 2 files changed, 40 insertions(+), 10 deletions(-)

-- 
2.39.1

