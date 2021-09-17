Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475FAC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 03:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B665610E5
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 03:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243703AbhIQDSK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Sep 2021 23:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241970AbhIQDSJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Sep 2021 23:18:09 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD2DC061574
        for <linux-clk@vger.kernel.org>; Thu, 16 Sep 2021 20:16:48 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id h3so8231672pgb.7
        for <linux-clk@vger.kernel.org>; Thu, 16 Sep 2021 20:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7BY6GAW+QciQRv2f0PndNLV4rTDCdK0pMSIc7MDy+1U=;
        b=xTa7Jf08C4/Fhfwu4paWj6ejKNIvaG2KLo3IaWuzwCouqzwWvd55Ur8T+A7ROIv0s2
         SBVRCVv9JFH3rpmWeXDG+MW0Py6JQusNx9+PPiBs1LMotsBw5+BLCSEJdiWKdL8sibuf
         ecUxGZaesZBoJEtTphdBET6qone5x8brEwb3imImTrAwiaSUq1MBCY6KQ1s1tMVfmWCW
         M4ar6VnEDVohrkz75URrWDY0B2c2AFHyakswobf8ZLkras6OpYHd4el+AF07Hvq9vDnK
         CbztDBWe22kOLBF330+cTqOu05RmdZxGaEG/HyWXxrWviNocyttUghZYWZ6TNYcFpsza
         09bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7BY6GAW+QciQRv2f0PndNLV4rTDCdK0pMSIc7MDy+1U=;
        b=8IYMcopzW8PMzfKRgnsKJgTFpiKAtE1E4+GYHLydxDVMBeKJM3hRgdjOmksbs6SERy
         5A9YfB9gUj0NSHFihDoaWa7YOglSi31EBdpFi9NWqc1CHoVQpf1N+ZWsjX8RVl2s/JPp
         +wrzhvVlZvwKUBHl/xdWoa5GXaIDUIBnwNSpS5yEaGMP/zDGbQMM126EhMatkn1mXpwL
         RF8WXCri70O7xKK+ziL8G5WvoCHlQCAXZX/x2MZagSAuGsVmCJ3VHWjT/pAsD7zmzTUS
         IuBW20OpfXAVVRuCQ2W0BbpSHxp3s95y5xloXqYW+GVF+mwpyHv5Ds5GVgKPI8DJlJ8H
         R9YA==
X-Gm-Message-State: AOAM533j4QV+h8jKnv925lHaE3FzIiVfDogJFLd+GPZh/8luWFR02SEi
        jQUgDCuou8X4qV+T8gM9225E/Q==
X-Google-Smtp-Source: ABdhPJz3X/v/JRKl5BN4Gi5XjV/JLEJnPdNMRsUKVZ3hrSTCplvZZjs2oNZUzJHewNb2Qs7KM6SUuA==
X-Received: by 2002:a62:55c2:0:b0:438:f9ea:ac46 with SMTP id j185-20020a6255c2000000b00438f9eaac46mr8836747pfb.25.1631848608108;
        Thu, 16 Sep 2021 20:16:48 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k3sm8823034pjg.43.2021.09.16.20.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 20:16:47 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add QCM2290 Global Clock Controller driver
Date:   Fri, 17 Sep 2021 11:16:36 +0800
Message-Id: <20210917031638.27679-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The series adds QCM2290 Global Clock Controller driver support.

Changes for v2:
- Drop unused gcc_parent_map and gcc_parents to avoid clang
  unused-const-variable warnings.

Shawn Guo (2):
  dt-bindings: clk: qcom: Add QCM2290 Global Clock Controller bindings
  clk: qcom: Add Global Clock Controller driver for QCM2290

 .../bindings/clock/qcom,gcc-qcm2290.yaml      |   72 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-qcm2290.c                | 2965 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-qcm2290.h  |  178 +
 5 files changed, 3223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
 create mode 100644 drivers/clk/qcom/gcc-qcm2290.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-qcm2290.h

-- 
2.17.1

