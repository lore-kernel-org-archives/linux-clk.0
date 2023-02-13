Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FD1C636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 06:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjBMGCh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 01:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjBMGCg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 01:02:36 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A422EF93;
        Sun, 12 Feb 2023 22:02:33 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id CA752200E3; Mon, 13 Feb 2023 14:02:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676268151;
        bh=SOWZZPJGDZPZMw6VKanvUlJnXziSzitX11n08pf7ETU=;
        h=From:To:Cc:Subject:Date;
        b=WIPpnDakZLa8iCkeyf1vdmoJdKgUIaYQ4zYD14hyUbevi9/HAkrzbHCcVldhWMf6g
         UYxgC0TW97byyRIOWVN6Mgy816YYaH3kOJZJjREWWn9BmlRL63vmxjD0WqFZux6vTA
         8VxMyGmNcz8jOy0vtMaYaEHJKtC8w8ZvJPjiY9CWrO/d8ZXaah+LvsO6byWvmED2Ju
         fWX2f4tTAND/Ap3nCnSt6HN7hc3gmxr3WhXOLmvjObHpFw8RWqqAg7d93UypdA7eEi
         JQnV4GdcSd81JfmM2aEjBg6qkEnELi1cVpzdlPvCzA63yz+QASoyE3rjjNbdAxJToT
         SlWAJMdbOxHcg==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/3] Add definitions for AST2600 i3c clocks and resets
Date:   Mon, 13 Feb 2023 14:02:05 +0800
Message-Id: <cover.1676267865.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds some base configuration for the i3c controllers on
ast2600 hardware. We'll use the reset and clock definitions in the
proposed dt binding example, hence sending these first.

v2:
 * based on feedback from Joel Stanley: avoid adding RESERVED clock
   definitions, allowing empty entries in aspeed_g6_gates instead.


Jeremy Kerr (3):
  clk: ast2600: allow empty entries in aspeed_g6_gates
  clk: aspeed: Add full configs for i3c clocks
  dts: ast2600: Add reset config for I3C

 drivers/clk/clk-ast2600.c                 | 41 ++++++++++++++++++-----
 include/dt-bindings/clock/ast2600-clock.h |  9 +++--
 2 files changed, 40 insertions(+), 10 deletions(-)

-- 
2.39.1

