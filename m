Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349A0EB64DB
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 13:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjFSNEq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 09:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjFSNEo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 09:04:44 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30B8E66
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 06:04:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f870247d6aso1416808e87.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 06:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687179880; x=1689771880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEM3N0iLIlvYLepw85JsPFibfyRzMkZ98OPjRwmkvbs=;
        b=JQYPORfHbv9SmUKbnugKlx/IdMjsAGpUKkorYX8aCg0JZh8iXMRprfWMEod0GITen0
         e/mt9aMfBgsCJQ8Tv5fpqXAV3cwcHW0I80UE7rYyO0PvOMnR0OAqtqL0jk7txSow4rR8
         EEEAIZxoOC+Fb21SKwhwoQfKHlKGYIsB47wqbXcHVYxKa09WLg+J/yHRJ7Ww/oJUYNnh
         FWZzHsaP/PsKGuBqrp92Z4TSGPBjYji6LtHqTM34DnrYwh3ek6F9wdexIU4Glfz5hXMI
         oDhTA5g0P3brDZ1KP+L1PxrLFjmcpMwPyS9swFv9dzSXkZxCOVc93dol+aAc7VHwyIT/
         IjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687179880; x=1689771880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEM3N0iLIlvYLepw85JsPFibfyRzMkZ98OPjRwmkvbs=;
        b=KbsxI1/x9dvoeVHOuPoVsgdBpCpSIi0mwaPybtoHt58bLa4+RxC3gep1v9bJAPtEwG
         EI1DRGfY83lMYjO0hgHUqm+/2E5uP4ammKbNuepgYonxFrWq0lGLXm1Pt9bKpCJBoh9o
         8Wdg5jBchkfu+4+oHiW8g+ysF8UQKLh5n/EcpycmUVA2UyLrL0TecHjgOybY8wV2cfab
         BzrvjLOUWRZq4RhniS4sreqINk3d++QSTX76o21M4Q9eLKY7khdF0765hj26MQTs+A50
         VX4PexgqV48iVYp+7bJVktsfh5AmXXa8yVOzexs6+X/z3CVeX81ytkOjj4G1CIWM7vAA
         tgJQ==
X-Gm-Message-State: AC+VfDybixfl4OpdUAsxt0jdo8PDK/98765Drxu+TzmSb3imRYfsDUG9
        RnJZvUiwK+g8td90a2YzFU6uLg==
X-Google-Smtp-Source: ACHHUZ4nVOehz2CyA7nTCnfhZgEdyqNVsl6V6eL2Xx7XrTHojkLoWWPwcZDNbx7Tvh4UmkKisz3YOg==
X-Received: by 2002:a05:6512:44a:b0:4f8:5b97:c74c with SMTP id y10-20020a056512044a00b004f85b97c74cmr3742365lfk.16.1687179880711;
        Mon, 19 Jun 2023 06:04:40 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id q28-20020ac25a1c000000b004f643664882sm4256489lfn.147.2023.06.19.06.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:04:40 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 19 Jun 2023 15:04:31 +0200
Subject: [PATCH v7 06/22] interconnect: qcom: icc-rpm: Introduce keep_alive
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v7-6-09c78c175546@linaro.org>
References: <20230526-topic-smd_icc-v7-0-09c78c175546@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v7-0-09c78c175546@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687179869; l=3661;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=g6kESh9vFn5cUExPwamnhleED6tFd+S7dtFe11cmEVE=;
 b=VzzHtmw9n83ugl/JcWQirSo4b5gpZPjUjKZaY/WHni7vmWQvzSgh0WPXUJ/mxVjfw7T/I0AjQ
 XSl8Rg7pBc2D22WhDa4ZGbYBcibY34uhvTiJrtV5w8h01Z7vYPKfsVb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The downstream kernel employs the concept of "keeping the bus alive"
by voting for the minimum (XO/19.2MHz) rate at all times on certain
(well, most) buses. This is a very important thing to have, as if we
either have a lackluster/wrong DT that doesn't specify a (high enough)
vote on a certain bus, we may lose access to the entire bus altogether.
This is very apparent when we only start introducing interconnect
support on a given platform and haven't yet introduced voting on all
peripherals.

The same can happen if we only have a single driver casting a vote on
a certain bus and that driver exits/crashes/suspends.

The keepalive vote is limited to the ACTIVE bucket, as keeping a
permanent vote on the SLEEP one could prevent the platform from properly
entering low power mode states.

Introduce the very same concept, with a slight twist: the vendor
kernel checks whether the rate is zero before setting the minimum
vote, but that's rather silly, as in doing so we're at the mercy
of CCF. Instead, explicitly clamp the rates to always be >= 19.2 MHz
for providers with keep_alive=true.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 10 ++++++++++
 drivers/interconnect/qcom/icc-rpm.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 6acc7686ed38..863e8ba1daa2 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -50,6 +50,8 @@
 #define NOC_QOS_MODE_FIXED_VAL		0x0
 #define NOC_QOS_MODE_BYPASS_VAL		0x2
 
+#define ICC_BUS_CLK_MIN_RATE		19200000ULL
+
 static int qcom_icc_set_qnoc_qos(struct icc_node *src)
 {
 	struct icc_provider *provider = src->provider;
@@ -380,6 +382,13 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 		do_div(rate, src_qn->buswidth);
 		rate = min_t(u64, rate, LONG_MAX);
 
+		/*
+		 * Downstream checks whether the requested rate is zero, but it makes little sense
+		 * to vote for a value that's below the lower threshold, so let's not do so.
+		 */
+		if (bucket == QCOM_ICC_BUCKET_WAKE && qp->keep_alive)
+			rate = max(ICC_BUS_CLK_MIN_RATE, rate);
+
 		if (qp->bus_clk_rate[i] == rate)
 			continue;
 
@@ -453,6 +462,7 @@ int qnoc_probe(struct platform_device *pdev)
 	for (i = 0; i < qp->num_bus_clks; i++)
 		qp->bus_clks[i].id = bus_clocks[i];
 
+	qp->keep_alive = desc->keep_alive;
 	qp->type = desc->type;
 	qp->qos_offset = desc->qos_offset;
 
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index ee705edf19dd..d2c04c400cad 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -33,6 +33,7 @@ enum qcom_icc_type {
  * @bus_clk_rate: bus clock rate in Hz
  * @bus_clks: the clk_bulk_data table of bus clocks
  * @intf_clks: a clk_bulk_data array of interface clocks
+ * @keep_alive: whether to always keep a minimum vote on the bus clocks
  * @is_on: whether the bus is powered on
  */
 struct qcom_icc_provider {
@@ -45,6 +46,7 @@ struct qcom_icc_provider {
 	u64 bus_clk_rate[NUM_BUS_CLKS];
 	struct clk_bulk_data bus_clks[NUM_BUS_CLKS];
 	struct clk_bulk_data *intf_clks;
+	bool keep_alive;
 	bool is_on;
 };
 
@@ -102,6 +104,7 @@ struct qcom_icc_desc {
 	const char * const *bus_clocks;
 	const char * const *intf_clocks;
 	size_t num_intf_clocks;
+	bool keep_alive;
 	bool no_clk_scaling;
 	enum qcom_icc_type type;
 	const struct regmap_config *regmap_cfg;

-- 
2.41.0

