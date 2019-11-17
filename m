Return-Path: <SRS0=O2Di=ZJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECF6C432C0
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C94212075C
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfKQMqD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:46:03 -0500
Received: from inva020.nxp.com ([92.121.34.13]:58728 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfKQMqD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 17 Nov 2019 07:46:03 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1A0F41A0991;
        Sun, 17 Nov 2019 13:46:00 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9D2FA1A07F0;
        Sun, 17 Nov 2019 13:45:55 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 164D14029F;
        Sun, 17 Nov 2019 20:45:50 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH RESEND v3 00/15] arm64: dts: imx8: architecture improvement and adding imx8qm support
Date:   Sun, 17 Nov 2019 20:43:40 +0800
Message-Id: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

IMX SCU based platforms (e.g. MX8QM/MX8QXP) are comprised of a number of SS
(Subsystems), those SS may be shared between different SoCs while most of them
can be reused like Devices Resources, Clocks, Power domains and etc.

This patch series aims to improve the MX8 architecture to comply with the HW
design to save a lot of duplicated codes and benefits us a better
maintainability and scalability in the future.

This patch series depends on another clk new binding series:
https://patchwork.kernel.org/cover/11046287/

NOTE: for the missing undocumented compatible strings for the new SoC IMX8QM
in this patch series. It will be sent in another patch series later.

ChangeLog:
v2->v3:
 * use clock-indices property instead of bit-offset property suggested by Shawn Guo
 * rebase to latest shawn/for-next
v1->v2:
 * change to the new two cells scu clock binding, so original adding scu clocks
   patches were removed.
 * Move scu pd node above clk node

Dong Aisheng (15):
  arm64: dts: imx8qxp: add fallback compatible string for scu pd
  arm64: dts: imx8qxp: move scu pd node before scu clock node
  arm64: dts: imx8qxp: orginize dts in subsystems
  arm64: dts: imx8: add lsio lpcg clocks
  arm64: dts: imx8: add conn lpcg clocks
  arm64: dts: imx8: add adma lpcg clocks
  arm64: dts: imx8: switch to two cell scu clock binding
  arm64: dts: imx8: switch to new lpcg clock binding
  arm64: dts: imx8qm: add lsio ss support
  arm64: dts: imx8qm: add conn ss support
  arm64: dts: imx8: split adma ss into dma and audio ss
  arm64: dts: imx8qm: add dma ss support
  arm64: dts: imx: add imx8qm common dts file
  arm64: dts: imx: add imx8qm mek support
  arm64: defconfig: add imx8qm mek support

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8-ss-adma.dtsi      |   8 +
 .../boot/dts/freescale/imx8-ss-audio.dtsi     |  68 +++
 .../boot/dts/freescale/imx8-ss-conn.dtsi      | 187 ++++++++
 .../arm64/boot/dts/freescale/imx8-ss-ddr.dtsi |  19 +
 .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 210 +++++++++
 .../boot/dts/freescale/imx8-ss-lsio.dtsi      | 311 +++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 144 ++++++
 .../boot/dts/freescale/imx8qm-ss-conn.dtsi    |  21 +
 .../boot/dts/freescale/imx8qm-ss-dma.dtsi     |  51 +++
 .../boot/dts/freescale/imx8qm-ss-lsio.dtsi    |  61 +++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     | 180 ++++++++
 .../boot/dts/freescale/imx8qxp-ai_ml.dts      |  20 +-
 .../freescale/imx8qxp-colibri-eval-v3.dtsi    |   8 +-
 .../boot/dts/freescale/imx8qxp-colibri.dtsi   |  12 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  12 +-
 .../boot/dts/freescale/imx8qxp-ss-adma.dtsi   |  37 ++
 .../boot/dts/freescale/imx8qxp-ss-conn.dtsi   |  21 +
 .../boot/dts/freescale/imx8qxp-ss-lsio.dtsi   |  61 +++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 425 ++----------------
 arch/arm64/configs/defconfig                  |   1 +
 21 files changed, 1432 insertions(+), 426 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-mek.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi

-- 
2.23.0

