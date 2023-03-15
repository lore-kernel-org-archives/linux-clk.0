Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EA0C7618A
	for <linux-clk@archiver.kernel.org>; Wed, 15 Mar 2023 13:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbjCONXm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Mar 2023 09:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbjCONXl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 09:23:41 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4791BD1
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 06:23:39 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id fd5so41604487edb.7
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678886617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQtrWDCM+22cQpzRRbVDJZjtR/eFtKTL53q6CUnjVrA=;
        b=kcCmlMd948KTeFaT82iddBgwWZPmI85qhyHyJAJKzspk0SsOyGqNByNvBE+bAMsClo
         fiFyE57RAgHFWGTtx0x6MMBEZbVVWGTbmc5kIMsBNu60iCBvcRghGHAaJ7BFtc87EdA4
         gQIsAiC51MpVQSrv61X7jG93H+kGWQ3fc9BenKW5Kzi2S870BrFMviIX0b1INPVah++M
         3WTlJCeJcP5wH/B62iolL3NhCGoDdPmtecKFbZ5qkFujaQJxgLzaNpCR+mLxefhwaoy0
         m8E24qya4KdhgUG3MeW999hZMIAzUmzBGnlWzix4N893xlvhnGBj61IcTG8H96l9XN+v
         C7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQtrWDCM+22cQpzRRbVDJZjtR/eFtKTL53q6CUnjVrA=;
        b=OfnrL6vMion//7WPw+plSzNdEZNXDUDOWXXeiDhb2ogNhhvCCssgTtn7M2tpxLmUgA
         nIol5EREY9tgZog/g51urHiuWn6917lXOsvFWO5Jr5hgJGmuUINJFF+LfykcSJ+RUzh/
         u00seEqGMppUA1RA/lCnsOd9OeGvJLFppe1mtXkd7GV7bbKvxCVFBwJXeTOOZLSMwlbM
         e2MMwOYDG3S+0j1Ke6RjFqPVm+xsmt0lDRZB8aGC6S2TGDUyfo1AKoYELTEJ0xi4nCfB
         v54LK1yfDNhZGpcDV0jpLZMbow4+5B4yAIAZ/8V6qan62b6evcttNezk7PClxyUNSFH/
         oEQw==
X-Gm-Message-State: AO0yUKU8TWOzrER7JwvLjoC0L/vFLvP6/gmSg8eZQ01LSIEaoQ0UCZik
        kiheJBCBDoe9IW5qU97/cXCvsQ==
X-Google-Smtp-Source: AK7set+aEpLN7DIU+ICSDUHqoC29NPehGqibZ+dEU/3SKCMWs0P9gQyG0fxkTGoZVcpIiVf9y8OyVQ==
X-Received: by 2002:a17:907:9708:b0:878:711d:9310 with SMTP id jg8-20020a170907970800b00878711d9310mr7626418ejc.1.1678886617534;
        Wed, 15 Mar 2023 06:23:37 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id pj18-20020a170906d79200b008b133f9b33dsm2497365ejb.169.2023.03.15.06.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:23:36 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [RFC PATCH 2/5] soc: qcom: rpmhpd: Do proper power off when state synced
Date:   Wed, 15 Mar 2023 15:23:27 +0200
Message-Id: <20230315132330.450877-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315132330.450877-1-abel.vesa@linaro.org>
References: <20230315132330.450877-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Instead of aggregating different corner values on sync state callback,
call the genpd API for queuing up the power off. This will also mark the
domain as powered off in the debugfs genpd summary. Also, until sync
state has been reached, return busy on power off request, in order to
allow genpd core to know that the actual domain hasn't been powered of
from the "disable unused" late initcall.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index f20e2a49a669..abd999c74783 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -649,8 +649,12 @@ static int rpmhpd_power_off(struct generic_pm_domain *domain)
 	mutex_lock(&rpmhpd_lock);
 
 	ret = rpmhpd_aggregate_corner(pd, 0);
-	if (!ret)
-		pd->enabled = false;
+	if (!ret) {
+		if (!pd->state_synced)
+			ret = -EBUSY;
+		else
+			pd->enabled = false;
+	}
 
 	mutex_unlock(&rpmhpd_lock);
 
@@ -810,10 +814,8 @@ static void rpmhpd_sync_state(struct device *dev)
 {
 	const struct rpmhpd_desc *desc = of_device_get_match_data(dev);
 	struct rpmhpd **rpmhpds = desc->rpmhpds;
-	unsigned int corner;
 	struct rpmhpd *pd;
 	unsigned int i;
-	int ret;
 
 	mutex_lock(&rpmhpd_lock);
 	for (i = 0; i < desc->num_pds; i++) {
@@ -822,14 +824,7 @@ static void rpmhpd_sync_state(struct device *dev)
 			continue;
 
 		pd->state_synced = true;
-		if (pd->enabled)
-			corner = max(pd->corner, pd->enable_corner);
-		else
-			corner = 0;
-
-		ret = rpmhpd_aggregate_corner(pd, corner);
-		if (ret)
-			dev_err(dev, "failed to sync %s\n", pd->res_name);
+		genpd_queue_power_off_work(&pd->pd);
 	}
 	mutex_unlock(&rpmhpd_lock);
 }
-- 
2.34.1

