Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AC5C433ED
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 05:29:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE5E7613BA
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 05:29:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbhEDFaE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 May 2021 01:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhEDFaE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 May 2021 01:30:04 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C020C06174A
        for <linux-clk@vger.kernel.org>; Mon,  3 May 2021 22:29:09 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id b15so6305476pfl.4
        for <linux-clk@vger.kernel.org>; Mon, 03 May 2021 22:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aNWYHyF10Ocv0rGRJlTBLbyA6sxWZ+weiafnUhBtEKk=;
        b=H16lLhHBiZ9W/Un4AkE6jMkWBw2frgqbf7Eg/+/OqK0hiBEKl4VgMUPRdXXJH1KIT/
         p7N2P75kCYNBGS4+kG259a+H/Q207cyygXepskuVu/jHb7QXptY8Irnr3720q2qI8SE7
         4SRPDC1HdmfAMkgO1QjxSrYDiqNXJGGHlgqFfepy3q8kdgNZgL8Tl38Fq7D0fdadyg4Z
         KVgGWxmNY1A6537b+G1tUHWUXGAziNpeDDwtq3InYmY4lCCKHFixy4Yp7ntqVoHw2WwB
         jU+5UkeFfwIwNKYVwyTH6T3UWJ3zIzizk8WW2LqRdHXpZg/8FJn1/NQlNsosF4KzDZzn
         LYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aNWYHyF10Ocv0rGRJlTBLbyA6sxWZ+weiafnUhBtEKk=;
        b=aALGExdqLvqqknlNnnuwNYwpgsb9QEjM6ToLQKPXH3kJG4k9x1uKgztyBiBFZ+mP0S
         pK5knr+3O5gtddjST1MA8whriW7lMPFLEseXj64LYHG62nGhenw3t4rKq8Tyt3dPVnaD
         Da6587ZWPlLMPxgJ91YjLSrrRmQDJGZM7FyCG6a1MK3uJNtB2AWuKQ5zSWohNMQMdCfl
         zqg8l/dEDzU5N20t//j/+MQGfnKX7LQQ7r8FbFJHyYKJRBCJ0ekmFhZ7+nv4xyDHSXoq
         TAiNfEslKFDH17QS8EbIIlN3kXjV8FFM0Is6dh4bIRZ2BH+bR/gExYIEwBV8WkmXS+io
         h2Mw==
X-Gm-Message-State: AOAM531D/y1MeDW6mkWLZTZ0mFCcbEny7O6faM5U/ax3qrKg1jA2TLu4
        k15ep3hdbVBN/e/RsLX3R72sMw==
X-Google-Smtp-Source: ABdhPJw6gk+A/ek8Ww3yAM10K+9EaBpiqvwqGmfhQYxlE90ziBHkIsISurjqFpCvB0me3kWn6Hj5vw==
X-Received: by 2002:a05:6a00:138b:b029:27f:179f:2c20 with SMTP id t11-20020a056a00138bb029027f179f2c20mr21803788pfg.37.1620106148803;
        Mon, 03 May 2021 22:29:08 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 145sm5933229pfv.196.2021.05.03.22.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:29:08 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 5/5] clk: qcom: a53-pll: Add MSM8939 a53pll clocks
Date:   Tue,  4 May 2021 13:28:44 +0800
Message-Id: <20210504052844.21096-6-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504052844.21096-1-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It adds support for MSM8939 a53pll clock of Cluster0, Cluster1 and CCI
(Cache Coherent Interconnect).  The frequency data comes from vendor
kernel.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/a53-pll.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index bfa048dc01ec..8c6f8bcc6128 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -26,6 +26,45 @@ static const struct pll_freq_tbl msm8916_freq[] = {
 	{ }
 };
 
+static const struct pll_freq_tbl msm8939_c0_freq[] = {
+	{  998400000,  52, 0x0, 0x1, 0 },
+	{ 1113600000,  58, 0x0, 0x1, 0 },
+	{ 1209600000,  63, 0x0, 0x1, 0 },
+};
+
+static const struct pll_freq_tbl msm8939_c1_freq[] = {
+	{  652800000, 34, 0x0, 0x1, 0 },
+	{  691200000, 36, 0x0, 0x1, 0 },
+	{  729600000, 38, 0x0, 0x1, 0 },
+	{  806400000, 42, 0x0, 0x1, 0 },
+	{  844800000, 44, 0x0, 0x1, 0 },
+	{  883200000, 46, 0x0, 0x1, 0 },
+	{  960000000, 50, 0x0, 0x1, 0 },
+	{  998400000, 52, 0x0, 0x1, 0 },
+	{ 1036800000, 54, 0x0, 0x1, 0 },
+	{ 1113600000, 58, 0x0, 0x1, 0 },
+	{ 1209600000, 63, 0x0, 0x1, 0 },
+	{ 1190400000, 62, 0x0, 0x1, 0 },
+	{ 1267200000, 66, 0x0, 0x1, 0 },
+	{ 1344000000, 70, 0x0, 0x1, 0 },
+	{ 1363200000, 71, 0x0, 0x1, 0 },
+	{ 1420800000, 74, 0x0, 0x1, 0 },
+	{ 1459200000, 76, 0x0, 0x1, 0 },
+	{ 1497600000, 78, 0x0, 0x1, 0 },
+	{ 1536000000, 80, 0x0, 0x1, 0 },
+	{ 1574400000, 82, 0x0, 0x1, 0 },
+	{ 1612800000, 84, 0x0, 0x1, 0 },
+	{ 1632000000, 85, 0x0, 0x1, 0 },
+	{ 1651200000, 86, 0x0, 0x1, 0 },
+	{ 1689600000, 88, 0x0, 0x1, 0 },
+	{ 1708800000, 89, 0x0, 0x1, 0 },
+};
+
+static const struct pll_freq_tbl msm8939_cci_freq[] = {
+	{ 403200000, 21, 0x0, 0x1, 0 },
+	{ 595200000, 31, 0x0, 0x1, 0 },
+};
+
 static const struct regmap_config a53pll_regmap_config = {
 	.reg_bits		= 32,
 	.reg_stride		= 4,
@@ -98,6 +137,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_a53pll_match_table[] = {
 	{ .compatible = "qcom,msm8916-a53pll", .data = msm8916_freq },
+	{ .compatible = "qcom,msm8939-a53pll-c0", .data = &msm8939_c0_freq },
+	{ .compatible = "qcom,msm8939-a53pll-c1", .data = &msm8939_c1_freq },
+	{ .compatible = "qcom,msm8939-a53pll-cci", .data = &msm8939_cci_freq },
 	{ }
 };
 
-- 
2.17.1

