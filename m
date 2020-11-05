Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C75C00A89
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 10:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CF6620A8B
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 10:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z41gi7TH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbgKEKsb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 05:48:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgKEKsb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 05:48:31 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324CBC0613CF
        for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2020 02:48:31 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id z3so1183123pfz.6
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2020 02:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6UTxDIKXxyRwcmDvCCD7p0lN1/IZKHgNHQd2xiazqvs=;
        b=z41gi7THOrUs3aQ3BdEIIfV8WUwK5jngqY+PX6LUzKAq3813/qURswMUsO0TtQvugP
         XHw/Jjn3a8MA9qo674YP8AaeqT6JV6zuMvxj+pQVZrlge8r4cypSKryORqVRb0m2Csae
         m6Q0PREA1co9BMbr6E6lUPD4ULAYvVqxmbtQ/WXWqITmoog5cAM1nUx6IQYPZkBrjd8m
         xHb5rb0xpfmIvRchTJQzpL+1yctGy1BwPZkSHdEMnZnkikvdW0DCq/CtxvB/2lEYkEkM
         Ho2XHtBaRZ25xn/6EC/510aMTgFlJz7ovi/5wj0fNrfwpEbe9SVVVsIIiwsT7Ok1CRtv
         fgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6UTxDIKXxyRwcmDvCCD7p0lN1/IZKHgNHQd2xiazqvs=;
        b=bh5jgBueJ2SGi1itq0twGjI5sUgofW8tEBnYxmHqa6Drov1h2RjTmM7eHHe6pFStrx
         L3Qwkve613DPg0dev9iBhiqYNOF1vZ6KlSFuqX9/Tpkg64DKzyNmtncti3+6uza6nCEQ
         OuMuOB2fYV6ZP7s76akb4lqk1sI2LQAkTU1t/O86VCMRneLGvUl50GyXQZKYsaSiaUMu
         dSXNhpq4ovoUVIniE9YOd4Ef5/HQxNzhTnkxSBF7r4v1wgqP+sjvzNTW4vlnI5weDP6W
         kPfOqXaYAd+Yn/cBjI/NKLUEXzZleVxVV0OLNhlShyy5X9arPCflG+XqgYMO+bd9KJp6
         nXKw==
X-Gm-Message-State: AOAM530HYFSefvUo0j4A+8msJp7optyJzao904NWveRG3NyzpZoTR3Zd
        rHRkjf1Yxh74z3Vw03N//Un5
X-Google-Smtp-Source: ABdhPJxg1ieI0h8HHygGrJMeO83B+M9Uo6vJlJsBy0DBqxuLWhCMXtaRCRVT+6irvthNcL2Ajk2fWA==
X-Received: by 2002:a63:34c:: with SMTP id 73mr1830048pgd.172.1604573310690;
        Thu, 05 Nov 2020 02:48:30 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id a84sm2131234pfa.53.2020.11.05.02.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 02:48:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/4] Add GCC and RPMh clock support for SDX55
Date:   Thu,  5 Nov 2020 16:18:13 +0530
Message-Id: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This series adds Global Clock Controller (GCC) and RPMh clock support
for SDX55 SoC from Qualcomm with relevant DT bindings.

This series has been tested on SDX55 MTP board. The dts patches for this
SoC/board will be posted later.

Thanks,
Mani

Changes in v2:

* Modified the GCC Kconfig symbol from GCC_SDX55 to SDX_GCC_55
* Added S-o-b tag to bindings patch
* Incorporated review comments from Stephen on the gcc driver
* Added review tag from Bjorn on RPMh patch

Manivannan Sadhasivam (1):
  clk: qcom: Add support for SDX55 RPMh clocks

Naveen Yadav (1):
  clk: qcom: Add SDX55 GCC support

Vinod Koul (2):
  dt-bindings: clock: Add SDX55 GCC clock bindings
  dt-bindings: clock: Introduce RPMHCC bindings for SDX55

 .../bindings/clock/qcom,gcc-sdx55.yaml        |   71 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   20 +
 drivers/clk/qcom/gcc-sdx55.c                  | 1626 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx55.h    |  112 ++
 include/dt-bindings/clock/qcom,rpmh.h         |    1 +
 8 files changed, 1839 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx55.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h

-- 
2.17.1

