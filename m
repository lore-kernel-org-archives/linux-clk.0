Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1357C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Mar 2022 08:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242948AbiCWIv7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Mar 2022 04:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240539AbiCWIvr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Mar 2022 04:51:47 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B117523C
        for <linux-clk@vger.kernel.org>; Wed, 23 Mar 2022 01:50:13 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id r22so896882ljd.4
        for <linux-clk@vger.kernel.org>; Wed, 23 Mar 2022 01:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/s85OGqNXpkecnGselKWsKN2lTwYoyTplSl6MyjZK1Y=;
        b=Rv1EUItMANZppwyCr9Jl2CMrJmPC0C5EQ/mwQX4i9HwrH9gjUugekbESDuDoXXXdgw
         lM4vHt+/zzY8T2DfU/eSP+6kb9qV0uaH+EqQUO9cOmOKL+QM6DZza6yPtk4boMJYGQ4b
         pXscXdP/SF7CNI3VDCX5COa+YoOaf831fzok1D0fxUV7kL9vcX/kw89M4QtEQG/AjLPF
         FfSYO0Yui+BSak0K4c7d47o/QDMjToQYt12Kf6S80nk3KJnXWyPmfuobJTvUW7dBbNL3
         0XPmFCmoM/tY2EGrzUd8z6Dlz6lMl9nyDUl+w9ixuBz2mbFa2Xilg9gClILyCRkvFPMP
         a2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/s85OGqNXpkecnGselKWsKN2lTwYoyTplSl6MyjZK1Y=;
        b=e1k9Rnr6VCUKvJQyap2OoPubGi5is6IcIW6GFJCWV7hmASfCiML7wp7uQQ9LnKwhlL
         uLnGb9X6Y6k50/G5fGFilq86m5xX7x4YbKEtKku5Zll0XQOnEUBMGwY5EEkX/DqHSXOM
         3RLgQq/FScE3ecXInz03fHeijgazmzGZyOkiwa0gTpCMvBVOYYcw4cxtwJABpVSfpTUv
         RFASzmvjc7EdAFrB/m1zCHpSMuB72HCZJl5u/FTS8MBfZFinlxLWiDiO9/SZsnzOgY+D
         kPjiDYq0KSNsCY0BTqeX6LbRqbehfnwT/XWU0xAPoBCC3jmuS/hpA8T5nGUROOhjBuXm
         camQ==
X-Gm-Message-State: AOAM5338RwW5gD1o2L9SnNmbbEjh4uVjryDgfa34CqaSt667w3Ckj36N
        ZL/ePaI7AG4pfNBOjzeeY36pNQ==
X-Google-Smtp-Source: ABdhPJzZBjgziwAktuqj5IF3PvEcgzoqe5VUzz07rF9U+wnxqiPYUwlXvbKIw1wNahdhKbyS4/fXIQ==
X-Received: by 2002:a05:651c:506:b0:22d:b44b:113e with SMTP id o6-20020a05651c050600b0022db44b113emr22374179ljp.32.1648025411971;
        Wed, 23 Mar 2022 01:50:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c40-20020a05651223a800b0044a1edf823dsm1376140lfv.150.2022.03.23.01.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 01:50:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v1 0/5] PCI: qcom: rework pipe_clk/pipe_clk_src handling
Date:   Wed, 23 Mar 2022 11:50:05 +0300
Message-Id: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
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

Changes since RFC:
 - Rework clk-regmap-mux fields. Specify safe parent as P_* value rather
   than specifying the register value directly
 - Expand commit message to the first patch to specially mention that
   it is required only on newer generations of Qualcomm chipsets.

Dmitry Baryshkov (5):
  clk: qcom: regmap-mux: add pipe clk implementation
  clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe
    clocks
  clk: qcom: gcc-sc7280: use new clk_regmap_mux_safe_ops for PCIe pipe
    clocks
  PCI: qcom: Remove unnecessary pipe_clk handling
  PCI: qcom: Drop manual pipe_clk_src handling

 drivers/clk/qcom/clk-regmap-mux.c      | 78 +++++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux.h      |  3 +
 drivers/clk/qcom/gcc-sc7280.c          |  6 +-
 drivers/clk/qcom/gcc-sm8450.c          |  6 +-
 drivers/pci/controller/dwc/pcie-qcom.c | 87 +-------------------------
 5 files changed, 92 insertions(+), 88 deletions(-)

-- 
2.35.1

