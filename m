Return-Path: <SRS0=iGjC=EO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C89C388F9
	for <linux-clk@archiver.kernel.org>; Sun,  8 Nov 2020 18:51:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AA1820773
	for <linux-clk@archiver.kernel.org>; Sun,  8 Nov 2020 18:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="mkVPPTBV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgKHSv0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Nov 2020 13:51:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHSv0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Nov 2020 13:51:26 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FB0C0613CF;
        Sun,  8 Nov 2020 10:51:25 -0800 (PST)
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 8385422F99;
        Sun,  8 Nov 2020 19:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1604861484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=/I/CIuBByYHKkyIKlrDS4wUEwzh8MXwuUNWSe/E9rCU=;
        b=mkVPPTBVspEG6szazT+H8AnDI30RsbcyZikq2Ze1SUah+rUUuGHQwWuchxkrY9mS4qMQk/
        Etg2+SP+eVR+9hsNugI/YPw6a/r5qJmAs16k+rAwwNVgtx8uEBaaMQGSwCaZqxsQDodf3w
        lWNM1FCd3Vs9IkHYo/o629K1luaq8FE=
From:   Michael Walle <michael@walle.cc>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        "Y . b . Lu" <yangbo.lu@nxp.com>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Ashish Kumar <Ashish.Kumar@nxp.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v3 0/9] clk: qoriq fixes and new fsl-flexspi driver
Date:   Sun,  8 Nov 2020 19:51:04 +0100
Message-Id: <20201108185113.31377-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The first two patches fix clock references for the ENETC and the
FlexSPI on the LS1028A. These are intended to be picked up by the
stable branches.

To circumvent further mistakes, I new device tree constants for
the qoriq binding. This should make it far easier for humans to
read the clockgen nodes.

The 4th patch convert the LS1028A device tree include to use the
new constants.

The last five patches add a clock driver for the FlexSPI
controller on layerscape SoCs. There is a single register which
can control the divider value. Right now the LS1028A and the LX2160A
aren't able to switch the SCK frequency on the FlexSPI interface.

I've included the first four patches in this series, otherwise
there would be merge conflicts, because they depend on the new
qoriq device tree constants.

Michael Walle (9):
  arm64: dts: ls1028a: fix ENETC PTP clock input
  arm64: dts: ls1028a: fix FlexSPI clock input
  clk: qoriq: provide constants for the type
  arm64: dts: ls1028a: use constants in the clockgen phandle
  clk: divider: add devm_clk_hw_register_divider_table()
  dt-bindings: clock: document the fsl-flexspi-clk driver
  clk: fsl-flexspi: new driver
  arm64: dts: ls1028a: fix FlexSPI clock
  arm64: dts: lx2160a: fix FlexSPI clock

 .../bindings/clock/fsl,flexspi-clock.yaml     |  55 ++++++
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 174 +++++++++++++-----
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi |  15 +-
 drivers/clk/Kconfig                           |   8 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-divider.c                     |  34 ++++
 drivers/clk/clk-fsl-flexspi.c                 | 106 +++++++++++
 drivers/clk/clk-qoriq.c                       |  13 +-
 .../dt-bindings/clock/fsl,qoriq-clockgen.h    |  15 ++
 include/linux/clk-provider.h                  |  27 +++
 10 files changed, 393 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,flexspi-clock.yaml
 create mode 100644 drivers/clk/clk-fsl-flexspi.c
 create mode 100644 include/dt-bindings/clock/fsl,qoriq-clockgen.h

-- 
2.20.1

