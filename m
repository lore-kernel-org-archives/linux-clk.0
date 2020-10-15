Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F88C433E7
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 11:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B56E52145D
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 11:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="m+/Q7YQo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgJOLtd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Oct 2020 07:49:33 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:29021 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728339AbgJOLrb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Oct 2020 07:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602762451; x=1634298451;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=NNO9wfBMjmJ6G+PyRIzbO5vvOG03eTWXRXtErSNf1U8=;
  b=m+/Q7YQovhB02H5xocDWVHNCyjaCuMFIEU+YJNLuGPdTRmNxDXdULQS0
   9JOI3IXmieiV8C3XsTWJVBotGOlqu1xplz/sJxpNBSRnYQm3gBlQGFQnK
   nJPcbX8fu9jEQ/7/QWifeav0lcRwKuA7Ru1h4B/Kn8vOejOf7rpUrjeHg
   MBU7yNct+qih89HMx15S1JQS2vmwJhJcxStyTk+bUDAreYmCewfftcZd2
   yiwtZVyMypagmKXD04XLLMGpG/dMAfNbUNtQovgzRBZMJzXHxzrIy6lB1
   Z2yLOA4eKjx4u0DdvZoJ6Jt3M0fJHGIP52HVOpOvBkFtWyn8TXnZm7NiX
   Q==;
IronPort-SDR: jPeAytXVQENt09QFbEBIAUhAEXKuTehRDlcMmr8CCww2eshEmh2ePiQgKleQ1TyLuHRNIbqUDG
 um/MGSxqvTvcKe7UIZiMu96XY8Mf2k5hWnGKltSTwZ7X80r6kF7/C4zGINa3bQ+/dpOI21pcUp
 eVgi7LpPFU44Kt7tCTtY6RN1fjWWA98EtFIEHFlt2OcK4cOqUoSXPKAEc1D/mYQ5brTTEO5lHk
 kmKW6seW6AruW9NF0ejEOj4PPDaI9haclHVweFpL/PtQwkQEPNzSg3s44GEAnoDzYbjlaQtW+s
 4Rc=
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; 
   d="scan'208";a="29988089"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Oct 2020 04:47:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 15 Oct 2020 04:47:30 -0700
Received: from ryzen.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 15 Oct 2020 04:47:28 -0700
From:   <daire.mcnamara@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <padmarao.begari@microchip.com>,
        <david.abdurachmanov@gmail.com>
CC:     Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 0/2] CLK: microchip: Add clkcfg driver for Microchip PolarFire SoC
Date:   Thu, 15 Oct 2020 12:47:23 +0100
Message-ID: <20201015114725.23137-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

This patchset adds support for the Microchip PolarFire clkcfg
hardware block.

Daire McNamara (2):
  dt-bindings: CLK: microchip: Add Microchip PolarFire host binding
  CLK: microchip: Add driver for Microchip PolarFire SoC

 .../bindings/clock/microchip,pfsoc.yaml       |  70 +++
 drivers/clk/Kconfig                           |   5 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/microchip/Makefile                |   1 +
 drivers/clk/microchip/clk-pfsoc.c             | 424 ++++++++++++++++++
 .../dt-bindings/clock/microchip,pfsoc-clock.h |  45 ++
 6 files changed, 546 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml
 create mode 100644 drivers/clk/microchip/clk-pfsoc.c
 create mode 100644 include/dt-bindings/clock/microchip,pfsoc-clock.h


base-commit: b5fc7a89e58bcc059a3d5e4db79c481fb437de59
prerequisite-patch-id: b98abc1ad412692a95e3eb3f7adfaff214750282
prerequisite-patch-id: b77f4eea4090304b5c113e4ccc29e64fc82cdc45
prerequisite-patch-id: 6237d2bb8bbd70d5f7023d07f4b3b2295097e85b
prerequisite-patch-id: 4b86709d0511137151e90710207805dad7b2d6f1
prerequisite-patch-id: 3c6331ab346c2cc212eddd1ecffd8c503e7a5cf1
-- 
2.25.1

