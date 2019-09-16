Return-Path: <SRS0=EXyH=XL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61CCC49ED7
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 16:15:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B752F20678
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 16:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCFJ+T5V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731418AbfIPQPC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Sep 2019 12:15:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46391 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbfIPQPC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Sep 2019 12:15:02 -0400
Received: by mail-pf1-f196.google.com with SMTP id q5so160445pfg.13
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=YqI202SP9Uvm6lQD97H4g3P2DuY2a7DQ+cgjEVc1iKE=;
        b=TCFJ+T5VQp/PBhYSSCAmY4rWCPO61OkcTmlcfwPeLEQxWoNSKi4+kdpTZ3KgLao1bP
         78YuAjmnc+fuu15yyj9WuXavFLo8vmEeWx9qRJzt2m4tH4E88ZFkNAIUws8SNjvV334h
         ZuPxKFcj8jmDVbVXdIPSxRMx/rCG8AD6PQ8BL784ZjC1LzJKMv4fCABTrrpjSBnufWpR
         ab8VVXa7At+aYgWye6PRjYBlah4HDNfLX/FlQRlnybwD/nSvKQB+0yTYJCVPvOACTUnJ
         Sjjwkj38yDCfOyKJfB+vFJuVLkxtLsVxSuLrzVyu4hFFuOkAkQM87YzArntp+bofj1Ef
         XhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YqI202SP9Uvm6lQD97H4g3P2DuY2a7DQ+cgjEVc1iKE=;
        b=eAiqOnpRfdwyo+LIoe/SOiWjX6lAHHMBK+VO499euPx4uK2mX0urvkvMgBdu/lUhPC
         M74c8FuPASWn+5zLJUFevTjs3AKs6e0Bky4b54csCAuu7FeiFKrUtjehD9xAGaV7VfZx
         PjJLtSKS1pEoSlwMYBxFf8CPhOww3YR7xg93wZcmXUr2dC8qHFL/ugIvjeE4QcW5aywE
         07BbHczvD9kMd8gwgCz/bkJcSbXGFOgFjIjOO0Kz6n07U9VtHvCSXl698G5DiMAP/Q2N
         L8ErPc25KA77QtacYjICtOORxJp8OkJxqxEnfVrWVY9gj+M+xbFAdtOMU+myFKSzyMLj
         Ntrw==
X-Gm-Message-State: APjAAAXI2SoxQKNm0dME5jDza/clBgzwC0LfL4ewY6Nsv4JgP3nwtUEk
        gZEsFnHXP0DZ746rohBzY3ef
X-Google-Smtp-Source: APXvYqz3wknvxuDQCjKwVjta//PKTOY6hHZ8/aiT+AGaASzY6TDIDhkjaGXnLFFiW8AbLhsQ+RIWlw==
X-Received: by 2002:a63:221f:: with SMTP id i31mr13278538pgi.251.1568650501307;
        Mon, 16 Sep 2019 09:15:01 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:90b:91ce:94c2:ef93:5bd:cfe8])
        by smtp.gmail.com with ESMTPSA id h66sm614134pjb.0.2019.09.16.09.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 09:15:00 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 0/8] Add Bitmain BM1880 clock driver
Date:   Mon, 16 Sep 2019 21:44:39 +0530
Message-Id: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This patchset adds common clock driver for Bitmain BM1880 SoC clock
controller. The clock controller consists of gate, divider, mux
and pll clocks with different compositions. Hence, the driver uses
composite clock structure in place where multiple clocking units are
combined together.

This patchset also removes UART fixed clock and sources clocks from clock
controller for Sophon Edge board where the driver has been validated.

Thanks,
Mani

Changes in v5:

* Incorporated review comments from Rob on dt binding

Changes in v4:

* Fixed devicetree binding issue
* Added ARCH_BITMAIN as the default for the clk driver

Changes in v3:

* Switched to clk_hw_{register/unregister} APIs
* Returned clk_hw from the in-driver registration helpers

Changes in v2:

* Converted the dt binding to YAML
* Incorporated review comments from Stephen (majority of change is switching
  to new way of specifying clk parents)


Manivannan Sadhasivam (8):
  clk: Zero init clk_init_data in helpers
  clk: Warn if clk_init_data is not zero initialized
  clk: Add clk_hw_unregister_composite helper function definition
  dt-bindings: clock: Add devicetree binding for BM1880 SoC
  arm64: dts: bitmain: Add clock controller support for BM1880 SoC
  arm64: dts: bitmain: Source common clock for UART controllers
  clk: Add common clock driver for BM1880 SoC
  MAINTAINERS: Add entry for BM1880 SoC clock driver

 .../bindings/clock/bitmain,bm1880-clk.yaml    |  76 ++
 MAINTAINERS                                   |   2 +
 .../boot/dts/bitmain/bm1880-sophon-edge.dts   |   9 -
 arch/arm64/boot/dts/bitmain/bm1880.dtsi       |  28 +
 drivers/clk/Kconfig                           |   7 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-bm1880.c                      | 966 ++++++++++++++++++
 drivers/clk/clk-composite.c                   |  13 +-
 drivers/clk/clk-divider.c                     |   2 +-
 drivers/clk/clk-fixed-rate.c                  |   2 +-
 drivers/clk/clk-gate.c                        |   2 +-
 drivers/clk/clk-mux.c                         |   2 +-
 drivers/clk/clk.c                             |   8 +
 include/dt-bindings/clock/bm1880-clock.h      |  82 ++
 14 files changed, 1186 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
 create mode 100644 drivers/clk/clk-bm1880.c
 create mode 100644 include/dt-bindings/clock/bm1880-clock.h

-- 
2.17.1

