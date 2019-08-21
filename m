Return-Path: <SRS0=LMZy=WR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9164C3A589
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 02:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3C422082F
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 02:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLmzYvt+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfHUCkg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Aug 2019 22:40:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45233 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfHUCkg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Aug 2019 22:40:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so400516pgp.12
        for <linux-clk@vger.kernel.org>; Tue, 20 Aug 2019 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=iJCb2jYcjAZrWMcIGd74mhhKeBUwaoco72itfmXHkXU=;
        b=uLmzYvt+8q5lCGFEJf+cc/YIDJS/0OUOkILXlnIdRn/MSLRth0wC/axZCeDNGc6QeW
         sQ/0xQwWvPuiUO3+28Jt+Xp/uY9xQAVH6+wkF5fxSeV7IVEY8qgYf7W6vSDKBngbpFM5
         1yXKxa+tuI/TlVQvY/dFse4A0txEUhQ1KLXNQXOsstZbNxNWm6fJwbiHlyn8HVoShL3x
         B5RYJ/E0j+QR3aDpPiSB9o8T/KX0n07axHeG/mRD9ie0FKyy+Tcbj8Z6FlNHmtGlV8oo
         zv62CpiQvXLVAHQcFSCOV36ilQ86GvipwJasv7OeGg6lNvoMYU1wH76S605qtFscdgh2
         SW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iJCb2jYcjAZrWMcIGd74mhhKeBUwaoco72itfmXHkXU=;
        b=Mhu97j2ivoyRcVINVrzAFwdhdgqYwugE8iuGwuZb9TJYKX5ec4L4K6OIz9mjE/4+pm
         9KeGjACQaEVFQ9kToHvbjWU9WkvLgkrAx0PD/l/4/MTwFOTeV8HtD2iUmI+Wf9GdD1Gu
         7vtaq/g/DOSAoQvZURtcUzeeAFEJdZUPq4MTNmbER5rkRsI3MTLj679IahviVWjVaOcn
         x/Ufli9YtJWAd+VjVU5hPn4MnHUEyTleuW51Mm7B8+NvDfiJDaKPZ5IsAwTVTqe9kemn
         JKDVT1FxXpX8x+gFMrxIWbwyujWxJp5uj3iAIp1D9MPXPVOxRJ49tMqf16RLv+s8eMgb
         xbtg==
X-Gm-Message-State: APjAAAUKSCswFs56tRVSzU8xAsGlDkLFo+SbJ8H7T5PZdYGg+gT/4SaE
        umxZdLiDg97xJlXW3mjR01Le
X-Google-Smtp-Source: APXvYqzzM6VVCdeDhLfClbl67RJU+kMvUC92BBd3zncGW+nNyta244Glp50GWPHm6oVlBwvlY04uXA==
X-Received: by 2002:a17:90a:a105:: with SMTP id s5mr3047784pjp.51.1566355235323;
        Tue, 20 Aug 2019 19:40:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7101:175:ddd7:6c31:ebc7:37e8])
        by smtp.gmail.com with ESMTPSA id b126sm26091608pfa.177.2019.08.20.19.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 19:40:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/7] Add SD/MMC driver for Actions Semi S900 SoC
Date:   Wed, 21 Aug 2019 08:10:07 +0530
Message-Id: <20190821024014.14070-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This patchset adds SD/MMC driver for Actions Semi S900 SoC from Owl
family SoCs. There are 4 SD/MMC controller present in this SoC but
only 2 are enabled currently for Bubblegum96 board to access uSD and
onboard eMMC. SDIO support for this driver is not currently implemented.

Note: Currently, driver uses 2 completion mechanisms for maintaining
the coherency between SDC and DMA interrupts and I know that it is not
efficient. Hence, I'd like to hear any suggestions for reimplementing
the logic if anyone has.

With this driver, this patchset also fixes one clk driver issue and enables
the Actions Semi platform in ARM64 defconfig.

Thanks,
Mani

Changes in v2:

* Converted the devicetree bindings to YAML
* Misc changes to bubblegum devicetree as per the review from Andreas
* Dropped the read/write wrappers and renamed all functions to use owl-
  prefix as per the review from Ulf
* Renamed clk_val_best to owl_clk_val_best and added Reviewed-by tag
  from Stephen

Manivannan Sadhasivam (7):
  clk: actions: Fix factor clk struct member access
  dt-bindings: mmc: Add Actions Semi SD/MMC/SDIO controller binding
  arm64: dts: actions: Add MMC controller support for S900
  arm64: dts: actions: Add uSD and eMMC support for Bubblegum96
  mmc: Add Actions Semi Owl SoCs SD/MMC driver
  MAINTAINERS: Add entry for Actions Semi SD/MMC driver and binding
  arm64: configs: Enable Actions Semi platform in defconfig

 .../devicetree/bindings/mmc/owl-mmc.yaml      |  62 ++
 MAINTAINERS                                   |   2 +
 .../boot/dts/actions/s900-bubblegum-96.dts    |  60 ++
 arch/arm64/boot/dts/actions/s900.dtsi         |  45 ++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/actions/owl-factor.c              |   7 +-
 drivers/mmc/host/Kconfig                      |   8 +
 drivers/mmc/host/Makefile                     |   1 +
 drivers/mmc/host/owl-mmc.c                    | 696 ++++++++++++++++++
 9 files changed, 878 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/owl-mmc.yaml
 create mode 100644 drivers/mmc/host/owl-mmc.c

-- 
2.17.1

