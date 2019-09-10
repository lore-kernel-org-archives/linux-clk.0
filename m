Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DATE_IN_FUTURE_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92089C4740A
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 14:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 709042196E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 14:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405212AbfIIOL2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 10:11:28 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40506 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405209AbfIIOL1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 10:11:27 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 44FF9200890;
        Mon,  9 Sep 2019 16:11:25 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 179A02000FD;
        Mon,  9 Sep 2019 16:11:21 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A32E7402AF;
        Mon,  9 Sep 2019 22:11:15 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V5 00/11] clk: imx8: add new clock binding for better pm support
Date:   Mon,  9 Sep 2019 22:09:57 -0400
Message-Id: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
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
 * Address many comments from Stephen
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

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  12 +-
 .../devicetree/bindings/clock/imx8qxp-lpcg.txt     |  36 +++-
 drivers/clk/imx/clk-imx8qxp-lpcg.c                 | 124 ++++++++++++
 drivers/clk/imx/clk-imx8qxp.c                      |   9 +-
 drivers/clk/imx/clk-lpcg-scu.c                     |  45 ++++-
 drivers/clk/imx/clk-scu.c                          | 218 ++++++++++++++++++++-
 drivers/clk/imx/clk-scu.h                          |  50 ++++-
 include/dt-bindings/clock/imx8-lpcg.h              |  14 ++
 include/dt-bindings/firmware/imx/rsrc.h            |  23 +++
 9 files changed, 501 insertions(+), 30 deletions(-)
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h

-- 
2.7.4

