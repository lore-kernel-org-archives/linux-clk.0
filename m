Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66CEC4708C
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 11:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbiLELfz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 06:35:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbiLELfx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 06:35:53 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0511A061
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 03:35:52 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id c17so6794217edj.13
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 03:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9b59iFvofQpoKBEaYeQhFybU9NmyF7WlZBKIJce18E=;
        b=hbs+USPpFBZKRF/tug7MDLQSmfqVJbidEvpUgMVjKTYzJI+P7XcwTDngm7SahaSO0K
         iuQb3QeZi1ZOQPVCY4RNw2HabP89aKsWp5YylYgKiSrrYEIUANVuJ3lZdeFoepuKUPAl
         rpugTdctPHudbeVKnKvIfDTxgiSF309QLeAWd43944UlSOYsq+T/pURyZe04rnlZX4KZ
         NrevYRSFEvJM7S+Tr0Co7+XdUnidwDMtNCjN+bCG3Flys7Hrr109QkgnofeWDwt1a094
         G6hm8n3dOEMVzwnU08SjqU/faHT/oKuqyFe1FDAg5BeAFWN6hHmUt+uZtvqB1XFadCk6
         oBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9b59iFvofQpoKBEaYeQhFybU9NmyF7WlZBKIJce18E=;
        b=SN8Z2lmgZMf2nV9U5UILluE/x+Ox8Gyv9w94xOPV+dgY703Ha4hqRxQ0yoQxpn8C+i
         NHS1ymmJ1VaTUtH70+6IyzuoldL9hA4xccOkZ1pyLS4Rjyp799KG4MTiMkkjX2VxJa42
         PtX3iRu/k8/AeDLO6TjWl/rLJFVzFRGh/xZ+ewL15scuXNWBKHKaeIlhGaEUp4hZCi/h
         7ZsMRtTD99kRKhM8NBc9HkCJPa0WU07E11zPUoNHmKoyOMjmbkVbwXG02a+giTqe5H+8
         CQyhA9dWAYZhdfhHUd5iNG9oqpoaQ2f88egn3qjJ1NPbw6gE3XsVmNP2C1RE36T9DpHA
         GvAw==
X-Gm-Message-State: ANoB5pkG1OJ+fvgg9NEfO/nOk8l4sHIGmYySNY3NKDHI4fcoOTQwxMQe
        wi+7lVv363YHRtnuPawRuLJznw==
X-Google-Smtp-Source: AA0mqf4XBZBNLqDHPdHU/DC0N6f8lDzA5/GvMqXPm4ghYzrxzndI2QiAGJwitj6kTYfdthLLBTHHCg==
X-Received: by 2002:a05:6402:449b:b0:459:2b41:3922 with SMTP id er27-20020a056402449b00b004592b413922mr4788067edb.160.1670240150767;
        Mon, 05 Dec 2022 03:35:50 -0800 (PST)
Received: from fedora.. ([188.252.220.250])
        by smtp.googlemail.com with ESMTPSA id q26-20020a170906389a00b007bdc2de90e6sm6164189ejd.42.2022.12.05.03.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 03:35:50 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] clk: qcom: gcc-ipq4019: switch to devm_clk_notifier_register
Date:   Mon,  5 Dec 2022 12:35:45 +0100
Message-Id: <20221205113545.575702-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using devres-managed version of clk_notifier_register(). This
allows us to drop driver's remove() callback.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/clk/qcom/gcc-ipq4019.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 9102150d144a..e4cb9e240a72 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1795,19 +1795,12 @@ static int gcc_ipq4019_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	return clk_notifier_register(apps_clk_src.clkr.hw.clk,
-				     &gcc_ipq4019_cpu_clk_notifier);
-}
-
-static int gcc_ipq4019_remove(struct platform_device *pdev)
-{
-	return clk_notifier_unregister(apps_clk_src.clkr.hw.clk,
-				       &gcc_ipq4019_cpu_clk_notifier);
+	return devm_clk_notifier_register(&pdev->dev, apps_clk_src.clkr.hw.clk,
+					  &gcc_ipq4019_cpu_clk_notifier);
 }
 
 static struct platform_driver gcc_ipq4019_driver = {
 	.probe		= gcc_ipq4019_probe,
-	.remove		= gcc_ipq4019_remove,
 	.driver		= {
 		.name	= "qcom,gcc-ipq4019",
 		.of_match_table = gcc_ipq4019_match_table,
-- 
2.38.1

