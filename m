Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95874C3A5A7
	for <linux-clk@archiver.kernel.org>; Thu,  8 Dec 2022 14:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiLHOTR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 09:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiLHOTQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 09:19:16 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EA483E8E
        for <linux-clk@vger.kernel.org>; Thu,  8 Dec 2022 06:19:15 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id q7so1692479ljp.9
        for <linux-clk@vger.kernel.org>; Thu, 08 Dec 2022 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zee3YNW88hhZh1L7P1Y/lqj8Rf3TbJlBPbbl5HQ00WQ=;
        b=KmZ6nQNBkZV4OK5WS9FnD+qMCvPHHmybYxMD1fGYiDZDi+5B6NtbBY8b/CzrGuvMDH
         eKoqGSM/9KdF4l9QeWUfNgDi/IPhqZEtJNBNWQvMVh0bAO/2ZFhSV2l8a3dC6S/QKdQy
         qXnztYeRpmfqQS4DFwqVh6/xtSbBlg+QRpUxlXNr+D++Mi/LUQQfgeq4WBUvI1ULsJCq
         FbtQ3HRgtf5j1ZRyw0Jrcrc7k/DbKFNxwijRxNGc70VyucSBKxVyZeIQRbClhXeXOnls
         lchaLs4HJ2ck3jtksxU5GI+s10VM56sEbOcomN6p0Irg5eTXevrwqMsx5IR47Pape2o3
         3F4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zee3YNW88hhZh1L7P1Y/lqj8Rf3TbJlBPbbl5HQ00WQ=;
        b=ULcpwK9HClzR0/K5zz5Py2KUDSwxL/zixtveopKR1nLYuvqbfHWqRTtUnu/WHSt46d
         9wSKmbs18hjWJDcUKj0SSK4jYBvI4RJ7PrJeb5OrP03b5kyXwTLNiO7u6Wil/ji2CBZ/
         GQigalWaLpuyRDZgGtv3roFcsHzxDHr8k3xCVa5q0oWYNdn7BrtJ8Ef0sy5nAKFgD+MO
         RIbr5iqCNGTFWj6W07QpmC3gIoGOR4CPp1Dl/ft7AGQpxQkMZgb+R+5FK8NqMj1ecsR8
         y1LzIYWvXi5VW+53BEljGJ/+M1dopZKw7gx3vqa6X73f8nPF48BBo09uwQhBkE+ykJAn
         tCww==
X-Gm-Message-State: ANoB5pmzc95MJpl5n5DvhvR5Yi/2vZXdRKTFCPaqvuH9LVAceGLbXbFa
        BWcWFQvLV4q2eJMiSiBsQ7QuFw==
X-Google-Smtp-Source: AA0mqf5EZ2ebcJ+J2+Q8WnkiDedlhZOJxuYOVR2/nsY20/svgIxR+ihixwWD28oGtlnkBcDKl7w0IA==
X-Received: by 2002:a2e:9eca:0:b0:279:c410:958a with SMTP id h10-20020a2e9eca000000b00279c410958amr11256395ljk.327.1670509153834;
        Thu, 08 Dec 2022 06:19:13 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512203100b004b578e52d81sm1514692lfs.176.2022.12.08.06.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 06:19:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/3] clk: qcom: dispcc-sm6115: use parent_hws for disp_cc_mdss_rot_clk
Date:   Thu,  8 Dec 2022 17:19:10 +0300
Message-Id: <20221208141912.47262-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rework disp_cc_mdss_rot_clk to use parent_hws isntead of parent_names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm6115.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 818bb8f4637c..1937edf23f21 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -466,8 +466,8 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rot_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_rot_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_rot_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

