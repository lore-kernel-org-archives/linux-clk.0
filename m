Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F225C433F5
	for <linux-clk@archiver.kernel.org>; Sun, 19 Sep 2021 02:25:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74E7E61100
	for <linux-clk@archiver.kernel.org>; Sun, 19 Sep 2021 02:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbhISC0p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Sep 2021 22:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233823AbhISC0p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Sep 2021 22:26:45 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCD2C06175F
        for <linux-clk@vger.kernel.org>; Sat, 18 Sep 2021 19:25:21 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d18so8746183pll.11
        for <linux-clk@vger.kernel.org>; Sat, 18 Sep 2021 19:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3gbl2yzkQu7L+icNkfJbGUqsLbJWtBfEFCodA9LbImA=;
        b=LpklsNse301jCHq/7B+k0jmtuEZNV0RM+ni0rexYRD+FSFrLkmUy5vjBV3AlnKCKev
         qqeRsw49XvZaV2zyziNXQZE9YT7fE/IZTsB5/GV8edCJWiJyDACsNNp5pYS8xMvjE3qK
         CQsrlXI5aI30fzdAXNaD0Nv2kbK0cKBAjzBKuXqERnjotPksaxvfstwjbiG19Lo/6A/e
         QWbjJpkD6lD78GkY0uXhYlDKfeBZAIRiaEqeUeiLzeG5FWTB8ZpW/v+wttD/LNQCxs0g
         WTEhjd9XD6Y226QfCndVK2l1Fdj4fyeqvg400jS1rF9ojkVcTfJ7hkCa2lb7vcsrH3H5
         AlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3gbl2yzkQu7L+icNkfJbGUqsLbJWtBfEFCodA9LbImA=;
        b=2IcuCYdAvI6+xNb7ObQPapZFz20sqedNtHw17R/o03ebYV4aIj5DvfSuJInvUYB/wL
         GK7Ta9cYJwwauBVnDEMy4+GXCp1cpvyTzPjOeNwcAumT+OlFSXdptvhhBXUlnMlFhmO1
         MGsbLSRf5Pu3419nl9XvurqUTo1XoPz/+9rRKX8a5r1y8kHkh9HkQ4MoPHvy5VU7m7UP
         DZeyYCi/9U6aATGDO/MhBPXUebTiyA5EY4SnvJqWFYSII/VYXMWotO+Q0OnlLA4eMQa+
         EYdgCVPY0jbv6JndJbET0D1gYfPKN/QyHTl2VsCHC4Xc5s17495VzQzLnyh3QIyE6+43
         H41w==
X-Gm-Message-State: AOAM530AZSfWY9FfYLuhRjsmTGsTaLKmxth/QmdFBi/AezeIduFgwJka
        2R5AY+6imlT69ENxf61SZW2G+g==
X-Google-Smtp-Source: ABdhPJylIOCCQPEMbvyIRzpDWWhmvq24HIRNAwNbsYaessTyp+YIh5fyLXEffBxESRHaPAIueZfKyQ==
X-Received: by 2002:a17:903:110c:b0:13b:7cb8:fbc4 with SMTP id n12-20020a170903110c00b0013b7cb8fbc4mr16653167plh.72.1632018320275;
        Sat, 18 Sep 2021 19:25:20 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z123sm3687554pfb.166.2021.09.18.19.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 19:25:19 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] clk: qcom: gcc-sm6115: Fix offset for hlos1_vote_turing_mmu_tbu0_gdsc
Date:   Sun, 19 Sep 2021 10:23:08 +0800
Message-Id: <20210919022308.24046-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It looks that the offset 0x7d060 is a copy & paste from above
hlos1_vote_turing_mmu_tbu1_gdsc.  Correct it to 0x7d07c as per
downstream kernel.

Fixes: cbe63bfdc54f ("clk: qcom: Add Global Clock controller (GCC) driver for SM6115")
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/gcc-sm6115.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index bc09736ece76..68fe9f6f0d2f 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3242,7 +3242,7 @@ static struct gdsc hlos1_vote_turing_mmu_tbu1_gdsc = {
 };
 
 static struct gdsc hlos1_vote_turing_mmu_tbu0_gdsc = {
-	.gdscr = 0x7d060,
+	.gdscr = 0x7d07c,
 	.pd = {
 		.name = "hlos1_vote_turing_mmu_tbu0",
 	},
-- 
2.17.1

