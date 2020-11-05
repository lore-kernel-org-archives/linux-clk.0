Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A74C4741F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 19:35:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 975252078E
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 19:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="A8Df9VDw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732090AbgKETfw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732136AbgKETfU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 14:35:20 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0529CC0613CF;
        Thu,  5 Nov 2020 11:35:20 -0800 (PST)
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 52D3C22F99;
        Thu,  5 Nov 2020 20:35:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1604604918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=neMeSekzaAOM6uqf+1gwm202RIk2AZiqN2dpHLhDA9s=;
        b=A8Df9VDwQZ24vyDkWrR/M783tkkWZoZs+RaiwlVXP9THuoeRBT1ZcqBdAUHVcY1SeNtsmR
        oPNaJ9z7zUK2voNcjSrDvYZXVdnaliZaNmHvhjD2jsnY27wlJxiUc8FpyGmpL1LqotRmxX
        HpjDoj9ZTFD4NSKC43h0yIZPmy+suoY=
From:   Michael Walle <michael@walle.cc>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v2 0/5] clk: add fsl-flexspi driver
Date:   Thu,  5 Nov 2020 20:35:07 +0100
Message-Id: <20201105193512.22388-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Layerscape SoCs which feature the FlexSPI controller there is
a single register which can control the divider value. The base
frequency is the platform PLL.

Right now the LS1028A and the LX2160A aren't able to switch the
SCK frequency on the FlexSPI interface. Add a new clock driver
which operate on said register.

Michael Walle (5):
  clk: divider: add devm_clk_hw_register_divider_table()
  dt-bindings: clock: document the fsl-flexspi-clk driver
  clk: fsl-flexspi: new driver
  arm64: dts: ls1028a: fix FlexSPI clock
  arm64: dts: lx2160a: fix FlexSPI clock

 .../bindings/clock/fsl,flexspi-clock.yaml     |  55 +++++++++
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  15 ++-
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi |  15 ++-
 drivers/clk/Kconfig                           |   8 ++
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-divider.c                     |  34 ++++++
 drivers/clk/clk-fsl-flexspi.c                 | 106 ++++++++++++++++++
 include/linux/clk-provider.h                  |  27 +++++
 8 files changed, 257 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,flexspi-clock.yaml
 create mode 100644 drivers/clk/clk-fsl-flexspi.c

-- 
2.20.1

