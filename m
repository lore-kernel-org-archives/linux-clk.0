Return-Path: <SRS0=O2Di=ZJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F31C43141
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E944F20855
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfKQM13 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:27:29 -0500
Received: from inva020.nxp.com ([92.121.34.13]:49218 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfKQM13 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 17 Nov 2019 07:27:29 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B4F881A07F0;
        Sun, 17 Nov 2019 13:27:25 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 72C1B1A0123;
        Sun, 17 Nov 2019 13:27:21 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id DEAAF4029F;
        Sun, 17 Nov 2019 20:27:15 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH RESEND V5 00/11] clk: imx8: add new clock binding for better pm support
Date:   Sun, 17 Nov 2019 20:25:08 +0800
Message-Id: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a follow up of this patch series.
https://patchwork.kernel.org/cover/10924029/
[V2,0/2] clk: imx: scu: add parsing clocks from device tree support

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

ChangeLog:
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

Dong Aisheng (11):
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

 .../bindings/arm/freescale/fsl,scu.txt        |  12 +-
 .../bindings/clock/imx8qxp-lpcg.txt           |  36 ++-
 drivers/clk/imx/clk-imx8qxp-lpcg.c            | 139 +++++++++++
 drivers/clk/imx/clk-imx8qxp.c                 | 129 ++++++-----
 drivers/clk/imx/clk-lpcg-scu.c                |  52 ++++-
 drivers/clk/imx/clk-scu.c                     | 218 +++++++++++++++++-
 drivers/clk/imx/clk-scu.h                     |  54 ++++-
 include/dt-bindings/clock/imx8-lpcg.h         |  14 ++
 include/dt-bindings/firmware/imx/rsrc.h       |  23 ++
 9 files changed, 587 insertions(+), 90 deletions(-)
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h

-- 
2.23.0

