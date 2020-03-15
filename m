Return-Path: <SRS0=qW/6=5A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9987AC10DCE
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 13:50:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78D0B20637
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 13:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgCONuo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Mar 2020 09:50:44 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55262 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727149AbgCONun (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 15 Mar 2020 09:50:43 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7FCA41A04DF;
        Sun, 15 Mar 2020 14:50:41 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B1A2E1A04CE;
        Sun, 15 Mar 2020 14:50:36 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AB35C402D0;
        Sun, 15 Mar 2020 21:50:30 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V6 00/12] clk: imx8: add new clock binding for better pm support
Date:   Sun, 15 Mar 2020 21:43:44 +0800
Message-Id: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series is a preparation for the MX8 Architecture improvement.
As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
of a couple of SS(Subsystems) while most of them within the same SS
can be shared. e.g. Clocks, Devices and etc.

However, current clock binding is using SW IDs for device tree to use
which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
different SoCs.

This patch series aims to introduce a new binding which is more close to
hardware and platform independent and can makes us write a more general
drivers for different SCU based SoCs.

Another important thing is that on MX8, each Clock resource is associated
with a power domain. So we have to attach that clock device to the power
domain in order to make it work properly. Further more, the clock state
will be lost when its power domain is completely off during suspend/resume,
so we also introduce the clock state save&restore mechanism.

It's based on latest shanw/for-next branch.

The top commit is:
4559a11e48d5 Merge branch 'imx/defconfig' into for-next

ChangeLog:
v5->v6:
 * add scu clk unregister if add provider failed
v4->v5:
 * Address all comments from Stephen
v3->v4:
 * use clk-indices for LPCG to fetch each clks offset from dt
v2->v3:
 * change scu clk into two cells binding
 * add clk pm patches to ease the understand of the changes
v1->v2:
 * SCU clock changed to one cell clock binding inspired by arm,scpi.txt
   Documentation/devicetree/bindings/arm/arm,scpi.txt
 * Add required power domain property
 * Dropped PATCH 3&4 first, will send the updated version accordingly
   after the binding is finally determined,


Dong Aisheng (12):
  dt-bindings: firmware: imx-scu: new binding to parse clocks from
    device tree
  dt-bindings: clock: imx-lpcg: add support to parse clocks from device
    tree
  clk: imx: scu: add two cells binding support
  clk: imx: scu: bypass cpu power domains
  clk: imx: scu: allow scu clk to take device pointer
  clk: imx: scu: add runtime pm support
  clk: imx: scu: add suspend/resume support
  clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
  clk: imx: lpcg: allow lpcg clk to take device pointer
  clk: imx: clk-imx8qxp-lpcg: add runtime pm support
  clk: imx: lpcg: add suspend/resume support
  clk: imx: scu: unregister clocks if add provider failed

 .../bindings/arm/freescale/fsl,scu.txt        |  12 +-
 .../bindings/clock/imx8qxp-lpcg.txt           |  36 ++-
 drivers/clk/imx/clk-imx8qxp-lpcg.c            | 139 +++++++++++
 drivers/clk/imx/clk-imx8qxp.c                 | 136 ++++++-----
 drivers/clk/imx/clk-lpcg-scu.c                |  53 +++-
 drivers/clk/imx/clk-scu.c                     | 231 +++++++++++++++++-
 drivers/clk/imx/clk-scu.h                     |  56 ++++-
 include/dt-bindings/clock/imx8-lpcg.h         |  14 ++
 include/dt-bindings/firmware/imx/rsrc.h       |  23 ++
 9 files changed, 610 insertions(+), 90 deletions(-)
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h

-- 
2.23.0

