Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A909C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 02:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 165A86112D
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 02:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238027AbhINC5S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 22:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237794AbhINC5S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 22:57:18 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF724C061760
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 19:56:01 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so1159280pjb.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ifupFMSTcCep9IzPKWCOumJWTmyjfV+oqZJWNKaxyUc=;
        b=MrNAqqOxdBSfb/yyeYBgn6IsQWbPhLA6UArwIqmWSYthjohfn65xqVTNjt94c5cG/x
         hwzYUJ+BOp60jjj0OAH0Ws9+HqU7Xs0ZwgNfY/L2jy3iv5wEv0NaUTpEpKKNWLUKoOyz
         rYV2B1Em7zvN/5cbwXSH//ANXFY0TtMBOo9YMAW2HXHERmqfhK+qtJzcaOYDzPyUf8aw
         ms08PutsOzAg7tEoXk/QmV5aiEp2NB1m+Sm4T3FStgnIMzHXVwGqB4U+ge1R3RzgsPH5
         U5Nx0sPX7dRtIHAPId7IZPMpOrAna5YFz4+q1KBnOXBe1dIKlfd5GDy9dS7A0pVm6vqi
         VhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ifupFMSTcCep9IzPKWCOumJWTmyjfV+oqZJWNKaxyUc=;
        b=ys0rlwC9ZnHPvlEdMLsfdvV/Rp5nN7u9izTjJB9WhHY4ZKYH+JUWJoV6qzw6L70yvq
         g6aDgQLnQP5p9zjTO5QNx3a4VCHS9SWVMaJ062ogBNxoxttqyOpLQaRAKnf7MeQtwSOp
         mWvI2kz46vBbKFeyTfBVhko5IAnmHfY6ZhamhDO9Ifw56q7KeOTwInrlb2RPtarMXkJa
         MvRboNk9N8I1+jhXC0su5OaK1eVJDXe1dqEEm7XBNHiVJ0X/DqVC5v15xTREZV8NVaaD
         InmUFxrryF/9s4BXT7xjAsW54xOtdpS+oRivMNWeMbh4MWf1BIQ7JsfC4StvGuiQrh69
         gfNA==
X-Gm-Message-State: AOAM532Yg59mTLQ7AwbN1doPcOB3BZ1eMEbRdrCFBYCtesBpGgfFYJi0
        it1Z7toXRm2diHv0ZKtGH1tI5A==
X-Google-Smtp-Source: ABdhPJxHTfsFXFxMo4QASlZPU5TovKzdFs4EZ+LLQFcRJpKgTwLTnWqKEeA1pC2yu+vD52N1DQjLuA==
X-Received: by 2002:a17:902:bc8a:b0:13b:78bc:9e18 with SMTP id bb10-20020a170902bc8a00b0013b78bc9e18mr13183205plb.53.1631588161357;
        Mon, 13 Sep 2021 19:56:01 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id r13sm9622654pgl.90.2021.09.13.19.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 19:56:00 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] Add QCM2290 RPM clocks support
Date:   Tue, 14 Sep 2021 10:55:51 +0800
Message-Id: <20210914025554.5686-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The series adds RPM clocks support for QCM2290.

Shawn Guo (3):
  clk: qcom: smd-rpm: Add rate hooks for clk_smd_rpm_branch_ops
  dt-bindings: clk: qcom,rpmcc: Document QCM2290 compatible
  clk: qcom: smd-rpm: Add QCM2290 RPM clock support

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 62 +++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h        |  6 ++
 include/linux/soc/qcom/smd-rpm.h              |  2 +
 4 files changed, 71 insertions(+)

-- 
2.17.1

