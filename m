Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B09C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jul 2022 21:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbiGMVZ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jul 2022 17:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237449AbiGMVZy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jul 2022 17:25:54 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752201FCE7
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 14:25:53 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w184so170708oie.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 14:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahCcsqdWm37TmcPFIUtqpK14hIGNNZH3jmW8LtZtMN8=;
        b=NESHtn59Pikhwx2KrwGd+gSFuwVBsotcrOTVxXYCbQMMmCPtTqw2BsQiJUHHwhM+Ft
         7wApkkxKaRrTgAe/JMjQyHxtdcGnIj/gVUZn9R0mqMuNyOeHYar/zMnfBFQmQlzXo+wL
         rYinUkRdSeMp5P4q59cHeOkpWzvpCPxTy2XvizKZq3jtoRfWqOvSs1bjXyRG8DTI4X8O
         JPZ1IF2SH8AnZJuj6tghmPHFNT0irgIKR7HagvV9gvVDbkMYVFXl3Ehl9BVA9yWPzNuq
         wGGl63VseOdTBAc3MmFGkioly/NLNjsLIvi5IxhdTauvnsZP/nYyRTvpe2K/3uQW14nl
         iJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahCcsqdWm37TmcPFIUtqpK14hIGNNZH3jmW8LtZtMN8=;
        b=O6R8ArBw+lEBCpzUstWeVFt2GwJzyqNFke89MVTWceStDe5nOEzglzFQ2siP/o5xwx
         61BXe70uEMbt/Xu8vB4RIoItClc5pLq0tFDijIj16uZ0TJouVUjcNQ9xqJI3BrouvYGV
         hJfN5Sh34VXWfpcDa7BXjhKUFqHcGXiRMoZ6xgOeMFhR0zil41Kpdrdcz3U/cGF1rq4L
         1hu6qYmzCeO0mcufYTlvW+8yqHPi0vEiyFkW+Ol3AqCuw73RfzWOqRRwCCXPSompoT6T
         hUiGZcjo+sFTY1FxFrb6CnRM1ZzEtwidHC0y0DFMt0ZYrVYcxyhLfsPP0f+SU2KaxuUx
         etPw==
X-Gm-Message-State: AJIora/A6HVyM5N+iaEIVpKsDgb+Dt5X3IezIVk3e61cn3CR+L3kLp4g
        oX5wRpaT28Tx044aqPNDb3aa0Q==
X-Google-Smtp-Source: AGRyM1t2yHge3yTrtqRyoN4FGuWqSLwDfqF+kw0lyP4FH/bXEbtKTyOGVcHH5ftV7kPTKr0+RWJ9qw==
X-Received: by 2002:a05:6808:1a19:b0:33a:1514:507b with SMTP id bk25-20020a0568081a1900b0033a1514507bmr3036628oib.58.1657747552837;
        Wed, 13 Jul 2022 14:25:52 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z14-20020a056870e30e00b000f33b23a030sm6719965oad.57.2022.07.13.14.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 14:25:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: qcom: gdsc: Bump parent usage count when GDSC is found enabled
Date:   Wed, 13 Jul 2022 14:28:18 -0700
Message-Id: <20220713212818.130277-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When a GDSC is found to be enabled at boot the pm_runtime state will
be unbalanced as the GDSC is later turned off. Fix this by increasing
the usage counter on the power-domain, in line with how we handled the
regulator state.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Added error handling

 drivers/clk/qcom/gdsc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 6f746158d28f..d3244006c661 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -437,6 +437,14 @@ static int gdsc_init(struct gdsc *sc)
 				return ret;
 		}
 
+		/* ...and the power-domain */
+		ret = gdsc_pm_runtime_get(sc);
+		if (ret) {
+			if (sc->rsupply)
+				regulator_disable(sc->rsupply);
+			return ret;
+		}
+
 		/*
 		 * Votable GDSCs can be ON due to Vote from other masters.
 		 * If a Votable GDSC is ON, make sure we have a Vote.
-- 
2.35.1

