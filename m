Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF794C77B6F
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 11:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjDNLHC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 07:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbjDNLG4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 07:06:56 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4C85FEC
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 04:06:45 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u12so5168231lfu.5
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681470404; x=1684062404;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pbVMYUFkp/wWpVPBgYNzrX3UCSwtdckmQwLwtFjCGg=;
        b=Ecs0U6Fl0zwn2WiDyoyDh684jJKFZ+b9Z9kwZ/Y5S1MyDes1UYONXRjwIZDahTP0Mr
         EY/JvXuPfibFAiKulbDs/AeLzBmh7Ql+T1Tr+bWkVkIvEiLVkNYWPOII7nMWmbKK79DM
         XDmhkmHTaaa7rh9Z2HzVITeWeu7hJ8SXC48KT67Qk09uw2LgAK/cR4LeeRN4zlCaGl5Z
         I+Rg4kTsxmZgISi4dddmFIeJYVipg4tOLON7FfjDhtmZu1B79d1Z79icFLXPrn/tHnTY
         YpSxmg1JY6aPYca28GJZJKODf7n91rEBePiehC93k3zy4q7xEhUJgJENaLtxsQFIXaiW
         ABBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681470404; x=1684062404;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pbVMYUFkp/wWpVPBgYNzrX3UCSwtdckmQwLwtFjCGg=;
        b=QCn+tpoOA5BOuSEgSoutC1eseJJhQmeE/qlAmUHDwM3+N5zXNYg786LKGZ+AONVvTT
         jR/azulW7CDGfLBjMmqkK4Z/Ingx6IopF6tTGCxdwfYB+gOtJ4TaIBIAYR2H2lQcg+A/
         q6W5ZM8CnGepProzdT2lRP3+fVhVi+UVIS29IjqQqV6S0VV8BI6a5vWE9CmCWUs8KI70
         +CC4TvcD0tYZO8unNqBfffy2YXSfq9ys6dIzXg6jwuDWYVIIJNFNgHAR80yjrvvZAsr5
         VpUCGtmnbb9K0CbNqG8uxS4JmvKlKrlnIMGezAJMc9I6EbdNzfHSrTpSPpLey+NjegvP
         AEvQ==
X-Gm-Message-State: AAQBX9eL7zlM91gl62tH4TohB1npMA0ImYy6OHrkMqnSBGwsBCPUOB+F
        7KkXeVnwymAeSPjP37hvm/R9V0X0ij5P/xA/W84=
X-Google-Smtp-Source: AKy350YmEO0YJUXjQplRF1p2roVwVla0URGrh5PSaNMg7df5LsTT6qI1HTe2XSbdb+O5u95JFZzKeQ==
X-Received: by 2002:ac2:46ce:0:b0:4d7:807:4eaa with SMTP id p14-20020ac246ce000000b004d708074eaamr1780082lfo.43.1681470403880;
        Fri, 14 Apr 2023 04:06:43 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
        by smtp.gmail.com with ESMTPSA id j18-20020ac24552000000b004eae672e96bsm751398lfm.255.2023.04.14.04.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:06:43 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] QCM2290 dispcc fixups
Date:   Fri, 14 Apr 2023 13:06:34 +0200
Message-Id: <20230412-topic-qcm_dispcc-v2-0-bce7dd512fe4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALozOWQC/32NWw6CMBAAr0L22zWl4gO+vIchZlsW2ARbbJFoC
 He3cgA/Z5LJLBA5CEeosgUCzxLFuwR6l4HtyXWM0iQGrfRBFbnGyY9i8Wkf90biaC22xcmahol
 NqSBlhiKjCeRsn0L3GoYkx8CtvLfPrU7cS5x8+GzbOf/ZP4c5R4Wm1eWlpPORuLgO4ij4vQ8d1
 Ou6fgFfVVdQxgAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681470402; l=851;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UDEB64Xz5IE9VTGP1A7X45x+eMP2+g5GQeAWrjLQ9yE=;
 b=oq7Xp8Mp5CyZKf2wzpqCcAfJXAw6g+8os24YM0RZ/hVDvtOL+oPBmphIm840NRT3vwjSL73+c1sX
 7bhWrgb4AIStU+kW3Rh0A1O0u+ZVLbLref/InbfTMe9J/6m0bSsx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v1 -> v2:
- Drop the merged "remove inexistent dsi1phy clk"
- Reword the commit messages to hopefully make them clearer

Rebased on qcom/for-next (see base-commit) for ease of merging

v1: https://lore.kernel.org/r/20230412-topic-qcm_dispcc-v1-0-bf2989a75ae4@linaro.org

I noticed some very msm-downstream-y bugs in the QCM2290 dispcc..
Let's fix them up..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: dispcc-qcm2290: Fix BI_TCXO_AO handling
      clk: qcom: dispcc-qcm2290: Fix GPLL0_OUT_DIV handling

 drivers/clk/qcom/dispcc-qcm2290.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
---
base-commit: 8358703a007eacc48b007284f29c0df2b694b513
change-id: 20230412-topic-qcm_dispcc-f46cbdeaeb90

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

