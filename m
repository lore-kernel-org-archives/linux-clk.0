Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A19ECDE43
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 22:04:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 118832098A
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 22:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mMUAu1bu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118832098A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbeJSGHD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Oct 2018 02:07:03 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46481 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbeJSGHC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Oct 2018 02:07:02 -0400
Received: by mail-pg1-f196.google.com with SMTP id r190-v6so3191562pgr.13
        for <linux-clk@vger.kernel.org>; Thu, 18 Oct 2018 15:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=GSyPvMvShkXKVRvkoHDAMGcjwACF+61OfuINflV+ipk=;
        b=mMUAu1buFvaPUVvQ0PWO9I/IaekUtXBnAQVo9MHqj/E1HjwLPl94fXOKcK4u8BaoFj
         dA2+h8rI+2cmWWUBpxOF6PwFS2yPm/ulH9qTNg4qogEbjtHlMbEdRtOioyua6/m4S+Qj
         XFdniRjHZNlEaaqHfaJG5FetUteVM5VhyBiog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GSyPvMvShkXKVRvkoHDAMGcjwACF+61OfuINflV+ipk=;
        b=CO1IXu9/31x2hxI06JrEE6xy7hYpcWUt8ZWAm+vAGNQ5WI5m3UbRBmEjxyRYw1DHGZ
         btaTB1GzmhvY1dPyPjIJylYkzhuf04sVIAAadbNkYc06te1xOr0iCgb4dm+8QHeuasCx
         v7yGO3rAFcFUqfRIyTWc9CBQSxb9thIoeeHVVIla4B6uERzZshszuJrpjvNaz7eHZulg
         8lNitEt9lwFoW9gn9G2nshcQ7i7WdpBgnH4gV+rBjZDypX1s/EkdnDZ+eNPZegJBjtxS
         85jjpN3gOtZRP6/l7h8svvzUiWCu83X3aw4gcUs+608cobSeeDZA90FeaLk77NgIBz3L
         G2hg==
X-Gm-Message-State: ABuFfogXbY+EgvYgqsDak7V8azj0YPwmtBwGCfeIi9XAoEC9wdx6oG2z
        0dtlXoQmMoTBHvSTayh93p5dtg==
X-Google-Smtp-Source: ACcGV61JZeZwh1THinN1ykTUSVdk3IBezZwNYGmr1593957Q0DHjq7zF88tiHxaB5THoAyj6wI1FKg==
X-Received: by 2002:a62:583:: with SMTP id 125-v6mr19730976pff.186.1539900240974;
        Thu, 18 Oct 2018 15:04:00 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com ([2620:15c:202:201:e418:c825:76cf:5f64])
        by smtp.gmail.com with ESMTPSA id k71-v6sm31399727pge.44.2018.10.18.15.03.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 15:03:59 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Evan Green <evgreen@chromium.org>
Subject: [PATCH] clk: qcom: Remove unused arrays in SDM845 GCC
Date:   Thu, 18 Oct 2018 15:03:50 -0700
Message-Id: <20181018220350.220357-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.16.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This change removes a parent map and parent name array that
appear to be completely unreferenced.

Signed-off-by: Evan Green <evgreen@chromium.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index fa1a196350f1..a7e72ebb79ba 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -99,22 +99,6 @@ static const char * const gcc_parent_names_4[] = {
 	"core_bi_pll_test_se",
 };
 
-static const struct parent_map gcc_parent_map_5[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_GPLL4_OUT_MAIN, 5 },
-	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gcc_parent_names_5[] = {
-	"bi_tcxo",
-	"gpll0",
-	"gpll4",
-	"gpll0_out_even",
-	"core_bi_pll_test_se",
-};
-
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-- 
2.16.4

