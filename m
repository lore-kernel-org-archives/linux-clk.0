Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8599C2B9F8
	for <linux-clk@archiver.kernel.org>; Tue, 25 May 2021 09:06:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DF3A6100B
	for <linux-clk@archiver.kernel.org>; Tue, 25 May 2021 09:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbhEYJHg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 May 2021 05:07:36 -0400
Received: from mo-csw-fb1116.securemx.jp ([210.130.202.175]:55740 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbhEYJHg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 May 2021 05:07:36 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1116) id 14P8lBih009038; Tue, 25 May 2021 17:47:11 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 14P8lAXZ028457; Tue, 25 May 2021 17:47:10 +0900
X-Iguazu-Qid: 2wGrbz1dNS3kDcbbOA
X-Iguazu-QSIG: v=2; s=0; t=1621932429; q=2wGrbz1dNS3kDcbbOA; m=W7NU6bfrWllMtBYPxNbpkplfXI1000j0jz18A/tORAg=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1110) id 14P8l9BF029713
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 25 May 2021 17:47:09 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 1B7AC10008C;
        Tue, 25 May 2021 17:47:09 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 14P8l8KL006921;
        Tue, 25 May 2021 17:47:08 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, punit1.agrawal@toshiba.co.jp,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 0/4] clk: visconti: Add support common clock driver and reset driver
Date:   Tue, 25 May 2021 17:46:51 +0900
X-TSB-HOP: ON
Message-Id: <20210525084655.138465-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This series is PLL, clock and reset driver for Toshiba's ARM SoC, Visconti[0].
This provides DT binding documentation, device driver, MAINTAINER files.

Best regards,
  Nobuhiro

[0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

Nobuhiro Iwamatsu (4):
  clk: visconti: Add support common clock driver and reset driver
  dt-bindings: clock: Add DT bindings for PLL of Toshiba Visconti
    TMPV7700 SoC
  dt-bindings: clock: Add DT bindings for SMU of Toshiba Visconti
    TMPV7700 SoC
  MAINTAINERS: Add entries for Toshiba Visconti PLL and clock controller

 .../clock/toshiba,tmpv7708-pipllct.yaml       |  49 +++
 .../clock/toshiba,tmpv7708-pismu.yaml         |  50 +++
 MAINTAINERS                                   |   3 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/visconti/Makefile                 |   5 +
 drivers/clk/visconti/clkc-tmpv770x.c          | 230 +++++++++++
 drivers/clk/visconti/clkc.c                   | 215 ++++++++++
 drivers/clk/visconti/clkc.h                   |  75 ++++
 drivers/clk/visconti/pll-tmpv770x.c           |  94 +++++
 drivers/clk/visconti/pll.c                    | 373 ++++++++++++++++++
 drivers/clk/visconti/pll.h                    |  62 +++
 drivers/clk/visconti/reset.c                  | 111 ++++++
 drivers/clk/visconti/reset.h                  |  35 ++
 include/dt-bindings/clock/toshiba,tmpv770x.h  | 181 +++++++++
 include/dt-bindings/reset/toshiba,tmpv770x.h  |  41 ++
 15 files changed, 1525 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pipllct.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tmpv7708-pismu.yaml
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
2.31.1
