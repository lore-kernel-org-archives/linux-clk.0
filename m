Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF3EC7EE2A
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 00:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239673AbjELAcm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 20:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239655AbjELAcl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 20:32:41 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E787F5FE5
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:37 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f14f266b72so8251178e87.1
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851556; x=1686443556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jRSMDMTdVsO/Mdr/Nh2wzZ9KeAk9092DrEdnm9Eu+w=;
        b=mzpZTt79Kk1TVhOKCzu8CO08OvcUJ7dwuU/OZOIZz3wKTyIJ3zuZjjRQhH5yDUdX+1
         U0QAD/CxfcGODVp743rv+ErlJyj/6i3S+h8w67pp+2deuIPODIPfrdElx7wDo8buos0M
         vBu+DKrH6+u6/iLWoJlLcIn7PiWtdVlCTmBJdsF2jo0Z0oYnyC3+5FhtjUuC2Kn6xFzc
         oPCiXtVWYONJMmFMRhbDMXuq6hzn5mVelpFrwx/8DWJd1rBza8cctL/sSap3DInRwWgr
         YgrXCiAp3UIFczxTwgKeC34oD+HB5+utR6brG5zJv/d2ZxX5TugH58yf0i+ZfhA+XsmZ
         qCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851556; x=1686443556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jRSMDMTdVsO/Mdr/Nh2wzZ9KeAk9092DrEdnm9Eu+w=;
        b=h6iO+Mcu8DjOHRGwxJYuEVUQkX4vA175py70zgy2FCMRwfZ6enTMEcr76uIdFXz3/f
         EAx96HsD1OlUxmb3aeBQ2+uGBIju2I8DTPW0HsIl3acMOTmBl/EdZPsDK9s4n0l6G/tw
         w6ck78EBhHduy55ypF5eam7YRvrEunhEry7EkZq3yBkQuCxRaiemgfAGiFPps+obBqbq
         6JMxWcdGBwNcJm4TccprnTEphlCcJliRgM4AAmlRz4lG8F+nQZ+xXYQOZ+5y/7q8kczx
         jvUFOBtft1r4loB3hnGR55nurpCRQM9t3iaCcwOM3x1Y9busn1v8K9bgkn9P3AYdNsql
         ufyw==
X-Gm-Message-State: AC+VfDzUvHMAkEpkrUaoWrqoTOEwcgSwWh+6OT390HHf1Nloy/LffQRl
        s2wfOMo87DWdnHApXqbF82fVwQ==
X-Google-Smtp-Source: ACHHUZ7VOAFMAPGE2Bdop27K9F3qrc8g2XmJoSRMPQPjISZRgAevSnZNJytnxckylmhnVNuqNg1blA==
X-Received: by 2002:a05:6512:21af:b0:4db:4fe8:fd0f with SMTP id c15-20020a05651221af00b004db4fe8fd0fmr3096821lft.25.1683851556238;
        Thu, 11 May 2023 17:32:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, stable@kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 06/10] clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
Date:   Fri, 12 May 2023 03:32:26 +0300
Message-Id: <20230512003230.3043284-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pll0_vote clock definitely should have pll0 as a parent (instead of
pll8).

Fixes: 7792a8d6713c ("clk: mdm9615: Add support for MDM9615 Clock Controllers")
Cc: stable@kernel.org
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index fb5c1244fb97..2f921891008d 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -58,7 +58,7 @@ static struct clk_regmap pll0_vote = {
 	.enable_mask = BIT(0),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll0_vote",
-		.parent_names = (const char *[]){ "pll8" },
+		.parent_names = (const char *[]){ "pll0" },
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
-- 
2.39.2

