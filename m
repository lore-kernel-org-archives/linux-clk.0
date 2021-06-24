Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58503C48BC2
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 03:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40F17613C9
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 03:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhFXDqX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jun 2021 23:46:23 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:60518 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhFXDqW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Jun 2021 23:46:22 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 15O3hoZm008744; Thu, 24 Jun 2021 12:43:50 +0900
X-Iguazu-Qid: 34tKJKyAEIlkXGoIh2
X-Iguazu-QSIG: v=2; s=0; t=1624506229; q=34tKJKyAEIlkXGoIh2; m=J0MUdtpFRbncz17pRVSKtPU49zbXEpmBn7LFuWh9sw4=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1511) id 15O3hmUZ030804
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 24 Jun 2021 12:43:49 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 0B81F10010D;
        Thu, 24 Jun 2021 12:43:48 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 15O3hlsh012590;
        Thu, 24 Jun 2021 12:43:47 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 0/4] clk: visconti: Add support common clock driver and reset driver
Date:   Thu, 24 Jun 2021 12:43:33 +0900
X-TSB-HOP: ON
Message-Id: <20210624034337.282386-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This series is PLL, clock and reset driver for Toshiba's ARM SoC, Visconti[0].
Since the clock driver and reset driver are provided as one function, they are
provided in cooperation with the clock driver.

This provides DT binding documentation, device driver, MAINTAINER files.

Best regards,
  Nobuhiro

[0]:
https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

  clk: visconti: Add support common clock driver and reset driver
    v2 -> v3:
       - Fix return value in visconti_register_pll().
       - Remove initialization of flags used by spin_lock_irqsave().
       - Change function name from *7708* to *770x*.
       - Fix some coding style.
    v1 -> v2:
       - Fix warning with W=1

  dt-bindings: clock: Add DT bindings for PLL of Toshiba Visconti TMPV770x SoC
    v2 -> v3:
       - Change file name.
    v1 -> v2:
       - Update subject.

  dt-bindings: clock: Add DT bindings for SMU of Toshiba Visconti TMPV770x SoC
    v2 -> v3:
       - Change file name.
    v1 -> v2:
       - Update subject.

  MAINTAINERS: Add entries for Toshiba Visconti PLL and clock controller
    v2 -> v3:
       - Change path of DT binding files.
    v1 -> v2:
       - no update.

Nobuhiro Iwamatsu (4):
  clk: visconti: Add support common clock driver and reset driver
  dt-bindings: clock: Add DT bindings for PLL of Toshiba Visconti TMPV770x SoC
  dt-bindings: clock: Add DT bindings for SMU of Toshiba Visconti TMPV770x SoC
  MAINTAINERS: Add entries for Toshiba Visconti PLL and clock controller

 .../clock/toshiba,tmpv770x-pipllct.yaml       |  49 +++
 .../clock/toshiba,tmpv770x-pismu.yaml         |  50 +++
 MAINTAINERS                                   |   3 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/visconti/Makefile                 |   5 +
 drivers/clk/visconti/clkc-tmpv770x.c          | 246 ++++++++++++
 drivers/clk/visconti/clkc.c                   | 220 +++++++++++
 drivers/clk/visconti/clkc.h                   |  75 ++++
 drivers/clk/visconti/pll-tmpv770x.c           |  96 +++++
 drivers/clk/visconti/pll.c                    | 369 ++++++++++++++++++
 drivers/clk/visconti/pll.h                    |  63 +++
 drivers/clk/visconti/reset.c                  | 111 ++++++
 drivers/clk/visconti/reset.h                  |  35 ++
 include/dt-bindings/clock/toshiba,tmpv770x.h  | 181 +++++++++
 include/dt-bindings/reset/toshiba,tmpv770x.h  |  41 ++
 15 files changed, 1545 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pismu.yaml
 create mode 100644 drivers/clk/visconti/Makefile
 create mode 100644 drivers/clk/visconti/clkc-tmpv770x.c
 create mode 100644 drivers/clk/visconti/clkc.c
 create mode 100644 drivers/clk/visconti/clkc.h
 create mode 100644 drivers/clk/visconti/pll-tmpv770x.c
 create mode 100644 drivers/clk/visconti/pll.c
 create mode 100644 drivers/clk/visconti/pll.h
 create mode 100644 drivers/clk/visconti/reset.c
 create mode 100644 drivers/clk/visconti/reset.h
 create mode 100644 include/dt-bindings/clock/toshiba,tmpv770x.h
 create mode 100644 include/dt-bindings/reset/toshiba,tmpv770x.h

-- 
2.32.0
