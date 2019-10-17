Return-Path: <SRS0=WJPE=YK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F579FA3739
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 12:28:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 517C72089C
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 12:28:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9hgU7NH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391360AbfJQM2E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Oct 2019 08:28:04 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32872 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406117AbfJQM2D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Oct 2019 08:28:03 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so1587325pfl.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2019 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=yAYxsDoF1xODxjQtRc8reB4aVCGjGyEgdApmFBnl6Wc=;
        b=k9hgU7NHph1qugDb4UYF1VcEpVVzTOUeZX+19VID6ZcwkAdvKbRfvm/jXaLFkFtFL7
         Z5LgfHWmMv+oA1SvgK8tZ095jKiFqZ63kU8dXbAXxEaplEIGfTO5Ef6VNW+jWzD+D4O2
         q1BqPUK3KoV2Sp87Ha4ePXWPvRky1jMljuordFeWKJagkqzLLWMf/85OmP7OVbG7mC/y
         bbL9jJj3+IUrcBN/OVP167HGInDbjXqZfoSqzXYiBn8OzM7aYgjriAkydjZ5xLGuHfCK
         T+mHRMhSUS98vkShSgrwXfs8KuSG4OzIiVLft2C9h+z6aqoWYko65JWjC4rvpjM6SJO4
         KIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=yAYxsDoF1xODxjQtRc8reB4aVCGjGyEgdApmFBnl6Wc=;
        b=dDZK50QCItqEfFGwyd9UdT5AfrH/IP+VC6ZW8VtH2/xKgLQYIJJcRaRDU/CCQgDvlf
         fWJDlJMft6jzDY0FOnWf+0ODLWvBpSQiG2WrTrIIw3BRxtWIe6gIOd8ZgCzp4gdtXQhu
         Gl7h2taAS6/0Dvs1BmDds6rWNb+G9Dcs2JPL5+y8oA7SfpCSDmYZBo93iI4AXJW/5cCv
         V440Wrc9OAK0kwqtBb7fTZ0td4wehdVEP3bEekSTxjBS0KfkT4cYsYMnUFvHIV674HXo
         l6RTPqQEPIFsSl8NC/VRa8l3zi2F/ItbMw9Rzx798gGXib9/e3hOxig3NomcodT5HIyu
         ci/A==
X-Gm-Message-State: APjAAAW3pkgmdGwkDju4s6mF5YY/yjEXV0CoIwj82g24x0PUaK5yozYV
        HyWj/YAUoR77ZznXuD44PB4nJg==
X-Google-Smtp-Source: APXvYqxaZh8/ei0rPhsoRdu1VBjPfaM2CXh2uqx/mMhcODGqPoZ2pD9tiWHEa37Y2f+Z63fPGhU8rw==
X-Received: by 2002:a63:2dc1:: with SMTP id t184mr3823889pgt.196.1571315282768;
        Thu, 17 Oct 2019 05:28:02 -0700 (PDT)
Received: from localhost ([49.248.54.231])
        by smtp.gmail.com with ESMTPSA id y7sm3033120pfn.142.2019.10.17.05.28.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 05:28:02 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-clk@vger.kernel.org
Subject: [PATCH v3 5/6] clk: qcom: Initialise clock drivers earlier
Date:   Thu, 17 Oct 2019 17:57:37 +0530
Message-Id: <5f1ca3bfc45e268f7f9f6e091ba13b8103fb4304.1571314830.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571314830.git.amit.kucheria@linaro.org>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571314830.git.amit.kucheria@linaro.org>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
can have earlier access to cpufreq during booting.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c   | 2 +-
 drivers/clk/qcom/gcc-qcs404.c | 2 +-
 drivers/clk/qcom/gcc-sdm845.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 96a36f6ff667..20d4258f125b 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -487,7 +487,7 @@ static int __init clk_rpmh_init(void)
 {
 	return platform_driver_register(&clk_rpmh_driver);
 }
-subsys_initcall(clk_rpmh_init);
+core_initcall(clk_rpmh_init);
 
 static void __exit clk_rpmh_exit(void)
 {
diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index bd32212f37e6..9b0c4ce2ef4e 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2855,7 +2855,7 @@ static int __init gcc_qcs404_init(void)
 {
 	return platform_driver_register(&gcc_qcs404_driver);
 }
-subsys_initcall(gcc_qcs404_init);
+core_initcall(gcc_qcs404_init);
 
 static void __exit gcc_qcs404_exit(void)
 {
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 95be125c3bdd..49dcff1af2db 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3628,7 +3628,7 @@ static int __init gcc_sdm845_init(void)
 {
 	return platform_driver_register(&gcc_sdm845_driver);
 }
-subsys_initcall(gcc_sdm845_init);
+core_initcall(gcc_sdm845_init);
 
 static void __exit gcc_sdm845_exit(void)
 {
-- 
2.17.1

