Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD86C38A02
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 05:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiJ1FxE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Oct 2022 01:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiJ1FxD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Oct 2022 01:53:03 -0400
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9B41B6C87;
        Thu, 27 Oct 2022 22:53:00 -0700 (PDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 87A0B1A0C51;
        Fri, 28 Oct 2022 07:52:59 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 49ED71A0BED;
        Fri, 28 Oct 2022 07:52:59 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5D603180327D;
        Fri, 28 Oct 2022 13:52:57 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     shengjiu.wang@gmail.com, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, marex@denx.de
Subject: [PATCH v4 0/2] clk: imx8mp: Add audio shared gate
Date:   Fri, 28 Oct 2022 13:32:22 +0800
Message-Id: <1666935144-7364-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

changes in v4:
- don't remove IMX8MP_CLK_AUDIO_ROOT, to avoid any break

changes in v3:
- remove IMX8MP_CLK_AUDIO_ROOT

changes in v2:
- split dt-binding to separate patch

Abel Vesa (2):
  dt-bindings: clock: imx8mp: Add ids for the audio shared gate
  clk: imx8mp: Add audio shared gate

 drivers/clk/imx/clk-imx8mp.c             | 17 ++++++++++++++++-
 include/dt-bindings/clock/imx8mp-clock.h | 11 ++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.34.1

