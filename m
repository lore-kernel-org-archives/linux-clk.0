Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA2CC432BE
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 20:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAF8860FD8
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 20:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbhG0UUc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 16:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbhG0UU0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 16:20:26 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DF3C06179E
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 13:20:24 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d17so23974331lfv.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 13:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nvC4be67S2hWmOAqpL0RQZJnOtBBOz8i5k3BFovEr8E=;
        b=TZiGViw063SCv+BkE5QIu7B1fC35B25RgVA+O01OE/gLyIdjZEobY2lBgSrEh+dGe3
         g74N04pUX+Sep56PeAJMGHp4ADoFjj5iXf7MOPa/N5HOFz73rEH4gh3TU1st24wMqYRP
         AxBPDgCnNrVg8tphtxXpYpO1KTJxWICh3yColj1TMimGY/ws4hs+xkW4X03QouW6R1v8
         GoeftC2RyoMipFZ6Aoqjqp0Zw7Y9PbFgOD0qWlGJotsGPlTK4F+YeS0Stv8p23nMdwLf
         3+YS9ySMU45JfNjfyxk0/+DrNlE8LvJXretcix6rVkUSQd7LiPNPKW5dPNwvTAVRrWPN
         5p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nvC4be67S2hWmOAqpL0RQZJnOtBBOz8i5k3BFovEr8E=;
        b=O/O09eoTgiU7QA/l0NAJhBpidtsap7yUB8IYXRpNRVCT0hHHlAEDwn5fLq5QN547e+
         RR6dEGRayZcPHti1BK0T4OXkypmkqIcdg1iOmGYgUf3arTaF0DWF6kCgedgOJ6yn7mIM
         7E/CV8Qbbb8wEVUuSyqB4utbnv2LSkItmHZKM/FOCpeb5vOUYh7NfMh/4y6y2TLCb6mZ
         RoUt0rVZqWBPpifzBTxWzETFPrnyXTTFfQlf9BAnnVYohZi6ZK55XsTBaF7+YhAIVHYS
         yfsLTeKTpjDt3pn9cS2urzbWZAGAplYZKslkBzJhdcVDfMUulNGYzOmsdYkdD99yK6l/
         5VSg==
X-Gm-Message-State: AOAM530UhHAbddyloea3RlFRVWJkNe6tysQ4CwzrGvnOFZ2z4PoYv9Ub
        5/FVcbvipfYj0PCNj9IaVetQSg==
X-Google-Smtp-Source: ABdhPJyucdxgoer/nXODmqByCWP2M9wwYCuy3JweYjsTTcfW1c9pFHcw8q3GeHZPX3rx/POvze1U8A==
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr11295514lfd.529.1627417222819;
        Tue, 27 Jul 2021 13:20:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i11sm376502lfe.215.2021.07.27.13.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:20:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Tue, 27 Jul 2021 23:20:03 +0300
Message-Id: <20210727202004.712665-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdsc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 108dd1249b6a..cf0bb12eb6e1 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1129,7 +1129,6 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.30.2

