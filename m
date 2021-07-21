Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DD9C6377C
	for <linux-clk@archiver.kernel.org>; Wed, 21 Jul 2021 22:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C781961244
	for <linux-clk@archiver.kernel.org>; Wed, 21 Jul 2021 22:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhGUWCF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Jul 2021 18:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbhGUWCE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jul 2021 18:02:04 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87F6C0613C1
        for <linux-clk@vger.kernel.org>; Wed, 21 Jul 2021 15:42:39 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id u11so4622401oiv.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Jul 2021 15:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+LgJYfusI5YMGYPMF7cuC+Cq9HtcH15BzfhaRWAMPw=;
        b=fsUKMEBheNnp9SKgGqK4T9dpmFOcdhpECJI7i+Xu9IOVLc38AT8UGMOHwsrsniOj6/
         31EN3k9VrUWwibSlt6hGI/vpAhB4TcHE74KonoGmExtcYqFF/eT3K5b1E5OQ94yjqaVd
         J28MNjwsWZQnPQMlhKTQ12eRUNfqiBMUHr+ryacLQ2BycjYZXhWs4vSX3muLQYUs9bbo
         IQG+6FR7UIsR5gS3P8JXAQ9Ai5DAK+TpyoOmoXkn/VdEugR8TSLqNPezTra4SWlXeIlf
         +9auSoMbKspsio3Isf2aKwlE9pAmt8uZrnZ3/ObBJpj1UOihEwqG1EcFickrVwpQzLDk
         0mLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+LgJYfusI5YMGYPMF7cuC+Cq9HtcH15BzfhaRWAMPw=;
        b=ku4r+PufFJ+NU5hgaPTO5EgBcIU5EhlDYrKDixahpTx9kTWKOwdcLOK57gAMAZZwv/
         BKqRfZB9L+JNpvWRdv4dkzfZL/OKEj7LCX1TOWp+iGz4AYay9oybLyr3amA+1h3XrFRm
         qqhTbZx2C9B9OPM+hc1qciavTlUhEi7E88soGvPfY3/Q+Gb83JQKe3FbdQkYGFVY73zi
         4Asw417WXwE7hYPKgGApbGDjEx0FC2qgOSag87BNJU2Qa0PKZ4Yu43yklT1AqlkcgZG4
         B8E97zoN5XzqOLRVGaIatoJEKdVZm8GcqjKwGi+mT4GOsPTqZLuHORTYYxOQqQlm6ck4
         lq7g==
X-Gm-Message-State: AOAM531UntFDyMMWZF72JeSfrH4kC6lynINvhN5ebf7LPRsRE26Yoamb
        ATZtpcCBCxxwbMNGqhARfV69wQ==
X-Google-Smtp-Source: ABdhPJyFtVg8a68ZAb06ris9iMEnze3GgxlE59WKwT6UQRQhOSncl+Vd0JPjbnKBTL8/zJy7i4kWtw==
X-Received: by 2002:a05:6808:8e5:: with SMTP id d5mr17741046oic.51.1626907359037;
        Wed, 21 Jul 2021 15:42:39 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a193sm3870712oob.45.2021.07.21.15.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 15:42:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2] clk: qcom: gdsc: Ensure regulator init state matches GDSC state
Date:   Wed, 21 Jul 2021 15:40:56 -0700
Message-Id: <20210721224056.3035016-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As GDSCs are registered and found to be already enabled gdsc_init()
ensures that 1) the kernel state matches the hardware state, and 2)
votable GDSCs are properly enabled from this master as well.

But as the (optional) supply regulator is enabled deep into
gdsc_toggle_logic(), which is only executed for votable GDSCs the
kernel's state of the regulator might not match the hardware. The
regulator might be automatically turned off if no other users are
present or the next call to gdsc_disable() would cause an unbalanced
regulator_disable().

But as the votable case deals with an already enabled GDSC, most of
gdsc_enable() and gdsc_toggle_logic() can be skipped. Reducing it to
just clearing the SW_COLLAPSE_MASK and enabling hardware control allow
us to simply call regulator_enable() in both cases.

The enablement of hardware control seems to be an independent property
from the GDSC being enabled, so this is moved outside that conditional
segment.

Lastly, as the propagation of ALWAY_ON to GENPD_FLAG_ALWAYS_ON needs to
happen regardless of the initial state this is grouped together with the
other sc->pd updates at the end of the function.

Cc: stable@vger.kernel.org
Fixes: 37416e554961 ("clk: qcom: gdsc: Handle GDSC regulator supplies")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Refactored into if (on) else if (ALWAYS_ON) style
- Extracted relevant parts of gdsc_enable() to call under VOTABLE
- Turn on hwctrl if requested for non-votable gdscs

 drivers/clk/qcom/gdsc.c | 54 +++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 51ed640e527b..4ece326ea233 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -357,27 +357,43 @@ static int gdsc_init(struct gdsc *sc)
 	if (on < 0)
 		return on;
 
-	/*
-	 * Votable GDSCs can be ON due to Vote from other masters.
-	 * If a Votable GDSC is ON, make sure we have a Vote.
-	 */
-	if ((sc->flags & VOTABLE) && on)
-		gdsc_enable(&sc->pd);
+	if (on) {
+		/* The regulator must be on, sync the kernel state */
+		if (sc->rsupply) {
+			ret = regulator_enable(sc->rsupply);
+			if (ret < 0)
+				return ret;
+		}
 
-	/*
-	 * Make sure the retain bit is set if the GDSC is already on, otherwise
-	 * we end up turning off the GDSC and destroying all the register
-	 * contents that we thought we were saving.
-	 */
-	if ((sc->flags & RETAIN_FF_ENABLE) && on)
-		gdsc_retain_ff_on(sc);
+		/*
+		 * Votable GDSCs can be ON due to Vote from other masters.
+		 * If a Votable GDSC is ON, make sure we have a Vote.
+		 */
+		if (sc->flags & VOTABLE) {
+			ret = regmap_update_bits(sc->regmap, sc->gdscr,
+						 SW_COLLAPSE_MASK, val);
+			if (ret)
+				return ret;
+		}
+
+		/* Turn on HW trigger mode if supported */
+		if (sc->flags & HW_CTRL) {
+			ret = gdsc_hwctrl(sc, true);
+			if (ret < 0)
+				return ret;
+		}
 
-	/* If ALWAYS_ON GDSCs are not ON, turn them ON */
-	if (sc->flags & ALWAYS_ON) {
-		if (!on)
-			gdsc_enable(&sc->pd);
+		/*
+		 * Make sure the retain bit is set if the GDSC is already on,
+		 * otherwise we end up turning off the GDSC and destroying all
+		 * the register contents that we thought we were saving.
+		 */
+		if (sc->flags & RETAIN_FF_ENABLE)
+			gdsc_retain_ff_on(sc);
+	} else if (sc->flags & ALWAYS_ON) {
+		/* If ALWAYS_ON GDSCs are not ON, turn them ON */
+		gdsc_enable(&sc->pd);
 		on = true;
-		sc->pd.flags |= GENPD_FLAG_ALWAYS_ON;
 	}
 
 	if (on || (sc->pwrsts & PWRSTS_RET))
@@ -385,6 +401,8 @@ static int gdsc_init(struct gdsc *sc)
 	else
 		gdsc_clear_mem_on(sc);
 
+	if (sc->flags & ALWAYS_ON)
+		sc->pd.flags |= GENPD_FLAG_ALWAYS_ON;
 	if (!sc->pd.power_off)
 		sc->pd.power_off = gdsc_disable;
 	if (!sc->pd.power_on)
-- 
2.29.2

