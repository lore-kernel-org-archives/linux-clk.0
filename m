Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3638C433FE
	for <linux-clk@archiver.kernel.org>; Sun, 19 Sep 2021 02:33:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7FAE61179
	for <linux-clk@archiver.kernel.org>; Sun, 19 Sep 2021 02:33:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235084AbhISCfO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Sep 2021 22:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235072AbhISCfN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Sep 2021 22:35:13 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC62C0613C1
        for <linux-clk@vger.kernel.org>; Sat, 18 Sep 2021 19:33:49 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id e16so12925935pfc.6
        for <linux-clk@vger.kernel.org>; Sat, 18 Sep 2021 19:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=knsQUtmuMiVfH/52E1/TKg3i9rf00ZFYDTvnm0LCoa0=;
        b=dRf9hgQcFAJke6SFE0yZ0siuVxorr9rS/19fqnqsdyzwOhkVMGBhh/Aag3Gq3VFyNZ
         i8fHak1fTj1/3uaUuGEndDZRSEzmMiqPfkfyueRVNNgAIGAjbOh4VRfK87gGqGKVxLXh
         z76I4GuUmnm5wfp+iypQkFhIjfmGxnbYsW2iRsbHugZOHwtgc6OgUm/paI88dMnnC9DT
         SI9AhmZ35J9usXKJ97QecIqIpKvQthaDEuEzQ7KAGxN/FwshIGtl2HZ00/PujNYNKYRN
         YoTVTvhgKy7eM9+oG3S8GrBcV+vO1X1e3aAOeSzeaqaYA1yjkIC9ZEZXk9LuzcgNFat7
         +NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=knsQUtmuMiVfH/52E1/TKg3i9rf00ZFYDTvnm0LCoa0=;
        b=woPw9PAOAh5LVral6/fszF5AbXKJMVQWSiRoXLcu6jsSNCl5RCzJDD6NO32LF3xHqZ
         z2IMKwzMoMv5z9R3YONFNlwyBS75Kmpb2ipkMHEGxha6DiUqxE7wNimgHnieSNdtm7PP
         1y6A5FxCBDRB+2StYac31spYxVwlwo72TOtQtlNGMY1lbe3YOj5DL8DtX4bptgnLz3+2
         RHkjz4g/2mdCo21yl/ucNIarOIRObv5ZK0LGrgj/d3hoskL2xyZz0zAkvllbWLw+EiRV
         +6zJp1MMMaBKqRRoEXvgiDA7GKXsnV+uFnxPyNDVTRRuWd5NdoOrJRX8igflIQsBujef
         03+Q==
X-Gm-Message-State: AOAM531zgw8XjAB7Ij0Y9A7ekK8yOtLGRKVnisuLDYVEtBFFRkHovmGr
        YPipbdq764cSnzsyPYBC9Bw+Yg==
X-Google-Smtp-Source: ABdhPJzIXEg7jU2ehSrl2QwVv+gf2CeyUrWuPz+OULqbByVY9R5oDx9Vab6jVYrt7TBKMB8ZBkO0TA==
X-Received: by 2002:a63:5947:: with SMTP id j7mr17217942pgm.193.1632018828853;
        Sat, 18 Sep 2021 19:33:48 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t13sm9316687pjg.25.2021.09.18.19.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 19:33:48 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/2] Add QCM2290 Global Clock Controller driver
Date:   Sun, 19 Sep 2021 10:33:06 +0800
Message-Id: <20210919023308.24498-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The series adds QCM2290 Global Clock Controller driver support.

Changes for v3:
- Include GDSC support.

Changes for v2:
- Drop unused gcc_parent_map and gcc_parents to avoid clang
  unused-const-variable warnings.

Shawn Guo (2):
  dt-bindings: clk: qcom: Add QCM2290 Global Clock Controller bindings
  clk: qcom: Add Global Clock Controller driver for QCM2290

 .../bindings/clock/qcom,gcc-qcm2290.yaml      |   72 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-qcm2290.c                | 3047 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-qcm2290.h  |  188 +
 5 files changed, 3315 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
 create mode 100644 drivers/clk/qcom/gcc-qcm2290.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-qcm2290.h

-- 
2.17.1

