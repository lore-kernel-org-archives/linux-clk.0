Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BD3C433F5
	for <linux-clk@archiver.kernel.org>; Sun, 31 Oct 2021 02:07:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2E9E60F22
	for <linux-clk@archiver.kernel.org>; Sun, 31 Oct 2021 02:07:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhJaCJ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Oct 2021 22:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbhJaCJ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 30 Oct 2021 22:09:59 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0039C061714
        for <linux-clk@vger.kernel.org>; Sat, 30 Oct 2021 19:07:28 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id j9so5645031pgh.1
        for <linux-clk@vger.kernel.org>; Sat, 30 Oct 2021 19:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=FZws8a0NnRSfwKNA4DrXN6xO9IuC3RkTXLzHBaK74pk=;
        b=eDNKkWqtGF0RWMlK58QTj864wOzXAzCXSKL9KtcgTbTd2gMCLI98kC8pPmwD7DFf4/
         12qDdcW8DLjQfaztzlMBd5DRJMtX0YQi/zHDaIQDbDe0W+0dcxEUoF//deFOVdJiulgV
         iGIYyE7GmyEO0u9tHxUP62iczBXLTFdXdQyv3H3FClkFZpvF/8wRXlQpO5Avn0a+ka63
         ajIE6i2e5fhS40igGpxanW//H+xW5ypoLCqdzPzMtjVP3kKCw0XQS2fr6OohH1G7LIh4
         thv1nwuc0Lci5Suv97vvmPAo+fFm1M+q02nz48v49YwwFVqfRZ+L8WKpqxFAJQFyZQnJ
         YeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FZws8a0NnRSfwKNA4DrXN6xO9IuC3RkTXLzHBaK74pk=;
        b=op4uEfb4rthE84Qbgu7V0fqckueyfOwPw0T1W0Pd5NycyUX7fjV0lWopOIdxqBceCs
         VYFA2QeStJ+ye4XVOrXTbPzH7RfFlL24dlnRKZ1gnEF84aRe4EXVli4PgyjetEiSIsPL
         VABDvujlMZc5IL9Ickt/jnJZdMZTaroQIQyaHB62llHPWNzU0fSBZIwaHmuBBaAKLci8
         3lOvxx0biNHikXCoM9+oVvQX+rodyey0wqbP6FNcoEPxi+iFjYdc7OZvARGQfu8FN1Cb
         WvDXQFxU6OSHex5YoLBLB0R/JzkMKsc/FXXnOnawJvgR10xGve6r0cKQulmsvx8HFQqM
         jG4g==
X-Gm-Message-State: AOAM532Qryz4VD3iwOrYyUU6ToaJsxyM8TkIOt46tkvm+RzsSONVnqek
        3vPj9Y5t6dWXHd3yiP+15NLd/JqzgUjZ3A==
X-Google-Smtp-Source: ABdhPJxZRsL6oy18FF58BzLeRINGjp4Deyiv1s1R/0ulZXTTdGGk268zD341ubKIUG9CWFVgkQWqtw==
X-Received: by 2002:a65:6a54:: with SMTP id o20mr62852pgu.227.1635646048199;
        Sat, 30 Oct 2021 19:07:28 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p9sm10748986pfn.7.2021.10.30.19.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 19:07:27 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] A few smd-rpm clock driver cleanups
Date:   Sun, 31 Oct 2021 10:07:12 +0800
Message-Id: <20211031020715.21636-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Here are a few smd-rpm clock driver cleanups found in the code
inspection.

Shawn Guo (3):
  clk: qcom: smd-rpm: Drop MFD qcom-rpm reference
  clk: qcom: smd-rpm: Drop the use of struct rpm_cc
  clk: qcom: smd-rpm: Drop binary value handling for buffered clock

 drivers/clk/qcom/clk-smd-rpm.c | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

-- 
2.17.1

