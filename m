Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC86C433B4
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 05:28:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C775E61186
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 05:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhEDF3u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 May 2021 01:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhEDF3t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 May 2021 01:29:49 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE56C06174A
        for <linux-clk@vger.kernel.org>; Mon,  3 May 2021 22:28:54 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id p4so6311737pfo.3
        for <linux-clk@vger.kernel.org>; Mon, 03 May 2021 22:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=d1/AzVVrNidYL1JjR1YC/Peao5Mw1ewmpCW6nzrTArc=;
        b=c5b+/FRo57MbHTEAez+tIFj/mbxJ/4TPCMLMKwqCj1QxrLBFwTpK57F4kMxLtQGXMt
         mc7iFXrws3C9/0+t9VmgFbSBgs2t4h9EU+fyLsJPks8kYl13VW0oUYsRTS++of+93ixc
         kAemPYkMm9g85Wigz1LOS9AEvABZmYQsJ0vR13prGzBfzTB8Unocu+YjUS/pioB7vHLF
         Yu4NSzzNdLswqoqn01CvWc3CuFr/BDC78spqKJgjz5Y0ebrRMg7Xnxpo9PkfhCBLgeVM
         Qp+C2ryA2xWsDsMsiAqMYQqZQ5kEZE9RMMKwo8lbRkCT8S4kDOI7fuSesaba+1SdIhDS
         956w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=d1/AzVVrNidYL1JjR1YC/Peao5Mw1ewmpCW6nzrTArc=;
        b=dYp+garZgAnyfCsVoEetFOvDx6ZlxWEXUSzBTUo9tZUHje75lM9s15ctOlO0mt3/j8
         Hy80OFT7tNILxKFajYTOj+fQatdTa+ssIOFtY6lWQtDdKFb26hlHtoJKzGRAwBSnrH3q
         MaDUKy6+8kJPO1MdNA+UVmhGyWM+OmR6BDHA9u7pfFGvbm2Zz1BUbHpkWF5X1+nFPbNz
         us5xJXCPX1BOkPei5/ubR11rpqT8SHxp+d54K0T6SIK2l3DjtH1ha6H3nAuqE8tKznZ5
         Wbc+KcyDftjC49r9lbxvJ9TknWwRt7H2HLHVn+EjGcOrW1vGw8oUqwRtDvBL2u3nHTkK
         z5zA==
X-Gm-Message-State: AOAM531MIN/iYZw0solwOycWZLMRMOFI+r1gnimUeo93dwNndgh2GS01
        FcHEVHMiNk8y4MBkJ13ppAAo8g==
X-Google-Smtp-Source: ABdhPJzdS4ViNq2A7okdWhYQ2+fzIzBEVaEgOXbmwhyYrZjKUPwp7RHhi6GILgShVLSSoTLLZuHlaA==
X-Received: by 2002:a63:f258:: with SMTP id d24mr21482075pgk.174.1620106133811;
        Mon, 03 May 2021 22:28:53 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 145sm5933229pfv.196.2021.05.03.22.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:28:53 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/5] Add MSM8939 APCS/A53PLL clock support
Date:   Tue,  4 May 2021 13:28:39 +0800
Message-Id: <20210504052844.21096-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds MSM8939 APCS/A53PLL clock support.  Most outstanding
thing about MSM8939 is that it integrates 3 APCS instances, for Cluster0
(little cores), Cluster1 (big cores) and CCI (Cache Coherent Interconnect)
respectively.

Note: the first one is a small improvement which is not specific to
MSM8939 support.


Shawn Guo (5):
  clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
  dt-bindings: clock: update qcom,a53pll bindings for MSM8939 support
  clk: qcom: apcs-msm8916: Retrieve clock name from DT
  clk: qcom: a53-pll: Pass freq_tbl via match data
  clk: qcom: a53-pll: Add MSM8939 a53pll clocks

 .../bindings/clock/qcom,a53pll.yaml           | 34 +++++++++++
 drivers/clk/qcom/a53-pll.c                    | 59 +++++++++++++++++--
 drivers/clk/qcom/apcs-msm8916.c               |  7 ++-
 3 files changed, 93 insertions(+), 7 deletions(-)

-- 
2.17.1

