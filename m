Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D42C64EC7
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 03:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjBMDt2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Feb 2023 22:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjBMDt1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Feb 2023 22:49:27 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8D7D500;
        Sun, 12 Feb 2023 19:49:26 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 85AC6200E3; Mon, 13 Feb 2023 11:49:20 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676260160;
        bh=erDpDwF/cExM1uPDf3agcPHzcsJY6zCHxSnfbsh5mzA=;
        h=From:To:Cc:Subject:Date;
        b=RVbFq5CG921DVFcPRPnb67FYhhn7CPLIgahEtHg/I+rnjerSxXX+5Wz4MFhDEvl12
         vca7cvYsf7NooFdsVk1apdroFoxHupcRBa2D3yX5iM3zh/oVppwzz/QJSuwouV+xtl
         iXshkACFCZkbNe3jTnwR0mPXWjTDvgtysHKnLeHzwNy9JWN8cV8r8hsPSiQalY+jbF
         4uZGvstOXr20otJueIwAk5bbdJO/l9Cu11P6xN3VITKEEEb1mGlo+50D8f1BVqh1I3
         NJXiF9rON5WQ2vHjlXJfgcqEYrMtNitzNBl2vipiX7AfcYlMTLDFtRoGQOE6NQkztm
         x5qqts8dy8EUw==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <jms@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] Add definitions for AST2600 i3c clocks and resets
Date:   Mon, 13 Feb 2023 11:48:31 +0800
Message-Id: <cover.1676259904.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds some base configuration for the i3c controllers on
ast2600 hardware. We'll use the reset and clock definitions in the
proposed dt binding example, hence sending these first.

Jeremy Kerr (2):
  clk: aspeed: Add full configs for i3c clocks
  dts: ast2600: Add reset config for I3C

 drivers/clk/clk-ast2600.c                 | 39 ++++++++++++++++++-----
 include/dt-bindings/clock/ast2600-clock.h | 12 +++++--
 2 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.39.1

