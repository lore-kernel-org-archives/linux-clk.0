Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49395C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 01:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344629AbiETB6v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 21:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344602AbiETB6u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 21:58:50 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB65EBEB2
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 18:58:48 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id e4so7597185ljb.13
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 18:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rI7Y4P9SCkMcqvtK5Rv4N2uvGcPonNFOcit2B7JJbwg=;
        b=bCrGTseHMnu40q7z4FTSUPlil5+yLztnKlgGkTZTRiNTQGRiOogYiZhAGBDhIwyN+u
         I2Aw71dgFZ/v32Mak0VE48W0XB07yf6yDzzCkhXlunndeSqX0bU7p6Y/pUros4PpBAgW
         NVeOokZUHXUkjqoKfUzGBnsHx/CQ4TsamPwKhX9o7GDPypXF2CJyEqgfCMHw11LIW429
         v1TS3WU6LDBPqjmpGLUzA427+sVpNPJ0MiMXV3gBGEFq4ZKXrj+W5DkL64WEZHodbjnv
         /j9l8rh5+oq/BWq7ibeCKkUB0emFqsm/kBUlhL+Nvio3XI44ajuE11bhPTKL3USOSMrB
         qT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rI7Y4P9SCkMcqvtK5Rv4N2uvGcPonNFOcit2B7JJbwg=;
        b=FPLl12udTjhHq2P7NCjJDUVkORMjAfCTy78+T2jLlsuWo9k7LV+y+bMALwDAaHj3XR
         u+LUx96NXCSJsp1EKbv+wG3+jWWFJY+Q5vgUUE9gCzgRWruY38POJ+V1fFlcnaQ3tqZ/
         ZTA2Hh1j4iRYFAkfc+1jFYHfxcf+9Q42EQcCNxwIR6NCX8n6+iz2A3vJS7Y80Dy871bl
         j+cWhQC8SXKIYM23PbCGvFuVUiZiUe5yAtXcdpUQ6Q+U+rxiEBtlwfflJX7/e8wanpLT
         P++djHtcBbpEddpPlF6RRU91B9aOy8jSBpqR691hqk1Kkp57Htn6N/I1hWuXNYQXK5TS
         8qHQ==
X-Gm-Message-State: AOAM5330kOumwADI9EXmylp5f1um61qcA/9Kr/hW02zsWqD+OxeMB1kw
        LCsRwHFSLf8jQNJssInF6PA6Lg==
X-Google-Smtp-Source: ABdhPJwz10pUK4fM57T//QKpNJQzy9Obh6zw03R3lVoB6SGuKxxbmYxwHQi/xkle2R0Ioda8PrGqxA==
X-Received: by 2002:a2e:9159:0:b0:253:a141:4cd1 with SMTP id q25-20020a2e9159000000b00253a1414cd1mr4313093ljg.145.1653011927067;
        Thu, 19 May 2022 18:58:47 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id u28-20020ac24c3c000000b0047255d21192sm467370lfq.193.2022.05.19.18.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 18:58:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v7 0/6] PCI: qcom: Rework pipe_clk/pipe_clk_src handling
Date:   Fri, 20 May 2022 04:58:38 +0300
Message-Id: <20220520015844.1190511-1-dmitry.baryshkov@linaro.org>
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

Changes since v6:
 - Switched the ops to use GENMASK/FIELD_GET/FIELD_PUT (Stephen),
 - As all pipe/symbol clock source clocks have the same register (and
   parents) layout, hardcode all the values. If the need arises, this
   can be changed later (Stephen),
 - Fixed commit messages and comments (suggested by Johan),
 - Added revert for the clk_regmap_mux_safe that have been already
   picked up by Bjorn.

Changes since v5:
 - Rename the clock to clk-regmap-phy-mux and the enable/disable values
   to phy_src_val and ref_src_val respectively (as recommended by
   Johan).

Changes since v4:
 - Renamed the clock to clk-regmap-pipe-src,
 - Added mention of PCIe2 PHY to the commit message,
 - Expanded commit messages to mention additional pipe clock details.

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

Dmitry Baryshkov (6):
  PCI: qcom: Remove unnecessary pipe_clk handling
  clk: qcom: regmap: add PHY clock source implementation
  clk: qcom: gcc-sm8450: use new clk_regmap_phy_mux_ops for PCIe pipe
    clocks
  clk: qcom: gcc-sc7280: use new clk_regmap_phy_mux_ops for PCIe pipe
    clocks
  Revert "clk: qcom: regmap-mux: add pipe clk implementation"
  PCI: qcom: Drop manual pipe_clk_src handling

 drivers/clk/qcom/Makefile              |  1 +
 drivers/clk/qcom/clk-regmap-mux.c      | 78 -------------------------
 drivers/clk/qcom/clk-regmap-mux.h      |  3 -
 drivers/clk/qcom/clk-regmap-phy-mux.c  | 53 +++++++++++++++++
 drivers/clk/qcom/clk-regmap.h          | 17 ++++++
 drivers/clk/qcom/gcc-sc7280.c          | 70 +++++++---------------
 drivers/clk/qcom/gcc-sm8450.c          | 72 +++++++----------------
 drivers/pci/controller/dwc/pcie-qcom.c | 81 +-------------------------
 8 files changed, 118 insertions(+), 257 deletions(-)
 create mode 100644 drivers/clk/qcom/clk-regmap-phy-mux.c

-- 
2.35.1

