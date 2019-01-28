Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8252CC282CD
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:33:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51EF820855
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="kI8S6Adu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfA1Sd0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:33:26 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37699 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfA1Sd0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:33:26 -0500
Received: by mail-wm1-f68.google.com with SMTP id g67so15021474wmd.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0hHd3izZjkE/zbr93sjgSJI16UQMbc5YRiXdFWOT/jk=;
        b=kI8S6AduKzz9wxl/MDzKM3malF+7UGzYK1zbeBoG8GSNdFgohonCQflEcSHdoTPASw
         lzFxi7YYPRdbm7u9A4i4mwfq7Z9NQoDBZcCOmUfxZcA5EEpZPKd7qZL7D3Y4XG/dCscu
         it9CLMygETIGCMm0PJbLFRg787N1t84tffxIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0hHd3izZjkE/zbr93sjgSJI16UQMbc5YRiXdFWOT/jk=;
        b=rDQUQCFfTUxw5HoqTYytpwQvUlZinxhS8e8x1NTkTTevN1y+E64hq3Rw30N+AWG6KA
         5KfXqQnAcHlTsi24r3bDGeBdk7Jxuouh29FPiCkdMHAHi83aUm9ilQOYqyNswIy8XW6w
         ovWtnD7VGVfq9yhSDwn3ezK16jY8v58X58eNRJXOooA4br3Fmm1r2NUUuaz7G5PLrtMS
         QdBdIXtN8hrguZsZ4JbSKtSHAAwyHvsN4e1SPl1FFl810ncB72OogoUml50szxkGy1VG
         etf3WrzqbsJc214xnpihb7WSfHbsCOHKuuvr1vfLsM+wToQMbl+72Sc6AeseXP0+jABV
         ehJA==
X-Gm-Message-State: AJcUukdb0143gEkRcspTfBSjJ4VfNUCRyw6uCbr212Chw7RjAwH5BHhM
        KOu49cTtbRdveyWuil2Hz6x89Q==
X-Google-Smtp-Source: ALg8bN6t+0vjlFUpTvlcpNaeEM5rLYmpagl1jx/x0bgSvlVKSQhUx/xwm1tGzvEU9vC4IEKq6yUb/g==
X-Received: by 2002:a1c:968a:: with SMTP id y132mr17912179wmd.107.1548700405028;
        Mon, 28 Jan 2019 10:33:25 -0800 (PST)
Received: from localhost.localdomain (233.red-81-47-145.staticip.rima-tde.net. [81.47.145.233])
        by smtp.gmail.com with ESMTPSA id l19sm270082wme.21.2019.01.28.10.33.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 10:33:24 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v2 05/14] clk: qcom: apcs-msm8916: get parent clock names from DT
Date:   Mon, 28 Jan 2019 19:32:52 +0100
Message-Id: <1548700381-22376-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allow accessing the parent clock names required for the driver
operation by using the device tree node.

This permits extending the driver to other platforms without having to
modify its source code.

For backwards compatibility leave previous values as default.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/clk/qcom/apcs-msm8916.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index a6c89a3..987ee00 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -19,7 +19,7 @@
 
 static const u32 gpll0_a53cc_map[] = { 4, 5 };
 
-static const char * const gpll0_a53cc[] = {
+static const char *gpll0_a53cc[] = {
 	"gpll0_vote",
 	"a53pll",
 };
@@ -50,6 +50,10 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct clk_init_data init = { };
 	int ret = -ENODEV;
+	struct clk_bulk_data pclks[] = {
+		[0] = { .id = "aux", .clk = NULL },
+		[1] = { .id = "pll", .clk = NULL },
+	};
 
 	regmap = dev_get_regmap(parent, NULL);
 	if (!regmap) {
@@ -61,6 +65,25 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	if (!a53cc)
 		return -ENOMEM;
 
+	/* check if the parent names are present in the device tree */
+	ret = devm_clk_bulk_get(parent, ARRAY_SIZE(pclks), pclks);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+
+	if (!ret) {
+		gpll0_a53cc[0] = __clk_get_name(pclks[0].clk);
+		gpll0_a53cc[1] = __clk_get_name(pclks[1].clk);
+		a53cc->pclk = pclks[1].clk;
+	} else {
+		/* support old binding where only pll was explicitily defined */
+		a53cc->pclk = devm_clk_get(parent, NULL);
+		if (IS_ERR(a53cc->pclk)) {
+			ret = PTR_ERR(a53cc->pclk);
+			dev_err(dev, "failed to get clk: %d\n", ret);
+			return ret;
+		}
+	}
+
 	init.name = "a53mux";
 	init.parent_names = gpll0_a53cc;
 	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
@@ -76,13 +99,6 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	a53cc->src_shift = 8;
 	a53cc->parent_map = gpll0_a53cc_map;
 
-	a53cc->pclk = devm_clk_get(parent, NULL);
-	if (IS_ERR(a53cc->pclk)) {
-		ret = PTR_ERR(a53cc->pclk);
-		dev_err(dev, "failed to get clk: %d\n", ret);
-		return ret;
-	}
-
 	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
 	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
 	if (ret) {
-- 
2.7.4

