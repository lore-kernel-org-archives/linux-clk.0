Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A075FC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 10 Dec 2022 19:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbiLJTHR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Dec 2022 14:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiLJTHQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Dec 2022 14:07:16 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA46D114
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:07:15 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id l8so8353719ljh.13
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rt87QwziOHZdtbJ1ao1dwblyqOKmgeduTTRhwjbbl/o=;
        b=pvG6T4UPslaseHi8Os6nLg62w/nrpVwWxTtKrVaZyE9+VEGAzAHczmCnj3ONGTMOo/
         2nPsJaxbWHstajBtqTMPNQ7nCFENCZ2bXDW1OSS2a3PzcSEqbCyOz98ByuCV7NnUMT7U
         K4IKFgzziIlZg5lq1J1TYjnI/E2dG+iszWc0E3BPCcuEz02eXchFQy8AIhSOJxdbuway
         kpuo74BKSzAPx5Mtd5wY6MFpKPJFNLRoqlq5+2chJVmHAk3klpe7niuY40wAGuMBnHF9
         ZV0/B1YgpkOoY86ARC6v20ZAlz9VEnKluuygzr84bZyVWLljBDpAovwRLxuqPpceYkAY
         KU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt87QwziOHZdtbJ1ao1dwblyqOKmgeduTTRhwjbbl/o=;
        b=d9DYRsO+JydxT5XLZ2MZKjaGwbq63EH5lJUVwOKp5I/OsLv2AQdlNQyfEgMBQC82M3
         GbWycV9aNeFOiiMVsAqhF0uhyuqqqKEoFyHoUvYXitO/Nzhyu+/K2ocPwEStx2KvBuYO
         8M55rl8M6YPDt/drA9eKcM9ZWXvgtiBAuWjX2PiHLKYlo72F71pB/I6FjPcQbAaTf570
         NFtr1yPUdp16uwPSCb9ZWQSOMFHrlrUpsUnJewRCSIdHU+/N3VfHOxErauG2Tnib6X3d
         IZQlfKaFOXkKcW6DtPG8FjsrAuFnyf0g8VIsPCVawWt8qh69wXdJJs7A4afXMmQ7Dez+
         50dQ==
X-Gm-Message-State: ANoB5pn254B0L8XfkfmwZq88iKXcdGgO0ArlzofmQY11m2GXM0003m7T
        mnXwOgI0FtoB5hWYjEkHD5okZg==
X-Google-Smtp-Source: AA0mqf5onjlj9KftX6EzEHDyUq7fYgEQKLRJKp0bfF7W1KI+oiNFwO9gU3yESbI8U/GSQ3Jdmeo3Fg==
X-Received: by 2002:a2e:be28:0:b0:26f:db35:2e96 with SMTP id z40-20020a2ebe28000000b0026fdb352e96mr5076618ljq.8.1670699233442;
        Sat, 10 Dec 2022 11:07:13 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v14-20020a2e7a0e000000b00279e93c9c25sm701622ljc.29.2022.12.10.11.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 11:07:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 1/3] clk: qcom: dispcc-sm6115: use parent_hws for disp_cc_mdss_rot_clk
Date:   Sat, 10 Dec 2022 22:07:10 +0300
Message-Id: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rework disp_cc_mdss_rot_clk to use parent_hws instead of parent_names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
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

