Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6A5C433EF
	for <linux-clk@archiver.kernel.org>; Sun,  1 May 2022 19:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350986AbiEATZU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 May 2022 15:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243750AbiEATZT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 May 2022 15:25:19 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9728AE6A
        for <linux-clk@vger.kernel.org>; Sun,  1 May 2022 12:21:52 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id b18so3305929lfv.9
        for <linux-clk@vger.kernel.org>; Sun, 01 May 2022 12:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5c3fcS74OgfF8rzTlYv+evN/yAslcA6aj412ddW91kg=;
        b=qFTOH29tNE3uuyGpZYz7iY+oXNtPZnHL2kCWxRwcqrmxSYqV+lrH6kYgsiQQpvNYvC
         pDlwaDxwlLCOQj5PX9WxPByne4+TXi9/65/Rf9yvy3tKwZ5D8Yd7C5uV16Hq7bWHHin/
         2gX0UJ1LNMng6PnEDxyKj2qfApODxghRta6ohzMxyHJDMilegOxV9GdznkZRa6fDiiIp
         tpUieu7+7RpNC14KfhfClJNzz3phcqYIMnzRhDP47fxR69L8d73pTkL4rUvJVIjlKGK8
         6wrDDWl+fwFC033u8zNUsrb2SNzEhn0IY5FeM53t7cmzM0vfGPAt7LNkBO5GEojgS3Y7
         Zkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5c3fcS74OgfF8rzTlYv+evN/yAslcA6aj412ddW91kg=;
        b=GOrtMQ43lQ7CStj/Ooci1+ExZm+79LvxxfLwUSRrR3/8gu7gRVX/PuetPK2aRFru9H
         OGuoE5X7wlsk+cHF2h1b3uzPZTOwPhUJ+ZWix+jtf1i8K5wFIIW/eHPXe/XT+sKesF4z
         fU9ziLDyMQjjOkyW54dpXUxJCljPo15ZvLf8cBDq7LrQkPn8wbriOpapGumJK7EaQxne
         XNrs7mZHGiiBDqjw5xAyx70V7zbnuHvWWZvzbomJElXCc7fPp7NJG15NPMtyKSzK+QRg
         PMHakXgYqhBde0/T5nhfwiThKy1bNKmkwIB7wjF4AM+vyEcgeS71Ppb48ZeLiNuZ+dC2
         yLFQ==
X-Gm-Message-State: AOAM531bzBJ+HYdCYG0iCmp4EAHfjEVjM9cRBY8nwsHNxRG2UHNCI7bK
        z0vusxibXL3mQbtXOeaSFAm/mg==
X-Google-Smtp-Source: ABdhPJxrXUZ+ywY4gfduBXc3J4x0S29m10VzslWgHOwmYqkfLGoqgFhbrl8LYP79RbMPCD0x29ac+Q==
X-Received: by 2002:a05:6512:32c2:b0:471:902f:5bc5 with SMTP id f2-20020a05651232c200b00471902f5bc5mr6867055lfg.379.1651432911087;
        Sun, 01 May 2022 12:21:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q3-20020a2e8743000000b0024f3d1daee6sm865928ljj.110.2022.05.01.12.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 12:21:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v4 0/5] PCI: qcom: Rework pipe_clk/pipe_clk_src handling
Date:   Sun,  1 May 2022 22:21:44 +0300
Message-Id: <20220501192149.4128158-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PCIe pipe clk (and some other clocks) must be parked to the "safe"
source (bi_tcxo) when corresponding GDSC is turned off and on again.
Currently this is handcoded in the PCIe driver by reparenting the
gcc_pipe_N_clk_src clock.

Instead of doing it manually, follow the approach used by
clk_rcg2_shared_ops and implement this parking in the enable() and
disable() clock operations for respective pipe clocks.

PCIe part depends on [1].

Changes since v3:
 - Replaced the clock multiplexer implementation with branch-like clock.

Changes since v2:
 - Added is_enabled() callback
 - Added default parent to the pipe clock configuration

Changes since v1:
 - Rebased on top of [1].
 - Removed erroneous Fixes tag from the patch 4.

Changes since RFC:
 - Rework clk-regmap-mux fields. Specify safe parent as P_* value rather
   than specifying the register value directly
 - Expand commit message to the first patch to specially mention that
   it is required only on newer generations of Qualcomm chipsets.

[1]: https://lore.kernel.org/all/20220401133351.10113-1-johan+linaro@kernel.org/

Dmitry Baryshkov (5):
  PCI: qcom: Remove unnecessary pipe_clk handling
  clk: qcom: regmap: add pipe clk implementation
  clk: qcom: gcc-sm8450: use new clk_regmap_pipe_ops for PCIe pipe
    clocks
  clk: qcom: gcc-sc7280: use new clk_regmap_pipe_ops for PCIe pipe
    clocks
  PCI: qcom: Drop manual pipe_clk_src handling

 drivers/clk/qcom/Makefile              |  1 +
 drivers/clk/qcom/clk-regmap-pipe.c     | 62 ++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-pipe.h     | 24 ++++++++
 drivers/clk/qcom/gcc-sc7280.c          | 49 ++++++----------
 drivers/clk/qcom/gcc-sm8450.c          | 51 ++++++----------
 drivers/pci/controller/dwc/pcie-qcom.c | 81 +-------------------------
 6 files changed, 128 insertions(+), 140 deletions(-)
 create mode 100644 drivers/clk/qcom/clk-regmap-pipe.c
 create mode 100644 drivers/clk/qcom/clk-regmap-pipe.h

-- 
2.35.1

