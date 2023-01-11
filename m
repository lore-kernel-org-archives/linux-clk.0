Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7C6C54EBC
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:20:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbjAKTUS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234237AbjAKTUK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:20:10 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB5C167D9
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:09 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id e13so17107113ljn.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw/nftZkBpYy5/CKpZ6ADRGZbB0kdGeQLhoDqoX3D5Y=;
        b=At0iGjNwCeKyoIWJgfWJg1xJndtVDb0ib0fymno2wrkwLckZoIyRirJh59zdp42qi8
         h5GKdiXR4HdW6Z6ZN46VABArx2nj55z9ddt1cDau9QuTp+kCBw388BEWzGQVFcw7oAH3
         XeOEdHQolRQQgYuYpR/tEhJpmwLXBh1brUjUdmt77OPAacFuR7V/yol1AarjSSLSPBLv
         ldTJeJvVbjHz0QJRbopjnL6y/4w7cZWWrOXvLEHbK1jcdoRuZIUSKyR1PFYZVYvV9nwt
         WII+J5GamBQnw2J6NYs0oJQD6T4ODJZ8/0+TN8hD6A2tF1WmWhmnUe1Oq8LSEQbiY0lL
         /4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw/nftZkBpYy5/CKpZ6ADRGZbB0kdGeQLhoDqoX3D5Y=;
        b=rGNRKY6J6VXkQkypUTTDAMOGacsp+9sc17VC6R78OZZu3Ue8/elqUe41yNXlrik3UR
         JFSS+s+KXF1sIWQj2TEhqagE5iDGKFbxbJRAIIdTvFD5cJwAwpiNW6RPsE+ppM20v0oR
         yFJ62bwHbOeXCOFoeioIevHSMKnVmb1i6tDp/aN2MHq6bZpy2hQjxAYKM/IC6Om4W3hu
         zG1VXNjcS8EVEyZ1NPjh3/qJjAr8HlPjoBUUlWonFF8J/65KgQKIJY6LVOsMB0NoVHtS
         wukqNt6hYlgIW3TD8Xz5gmJrXSr4383W0Nn2+pHicXB5NJjAwUP8jWylAgrILkqYvp02
         7HzQ==
X-Gm-Message-State: AFqh2krjwNo3UEGbkoyUDCVwWRBH2+O+W4EuiSnkKsreWAxtRVX78aQl
        Uc59JINdS691ITMlcrdNpUZS6A==
X-Google-Smtp-Source: AMrXdXsD1tgE7i1IfIh/AaVUSHKkgZJq/MnvP5Q3Bi+B/qnOlkg9J1eAPNC2qQnMAw/wYVbC31ndxw==
X-Received: by 2002:a2e:b169:0:b0:283:da38:427d with SMTP id a9-20020a2eb169000000b00283da38427dmr3618149ljm.49.1673464807523;
        Wed, 11 Jan 2023 11:20:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:06 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH 03/13] clk: qcom: cpu-8996: fix the init clock rate
Date:   Wed, 11 Jan 2023 22:19:54 +0300
Message-Id: <20230111192004.2509750-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change PLL programming to let both power and performance cluster clocks
to start from the maximum common frequency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index ed8cb558e1aa..d51965fda56d 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -102,7 +102,7 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
 /* PLLs */
 
 static const struct alpha_pll_config hfpll_config = {
-	.l = 60,
+	.l = 54,
 	.config_ctl_val = 0x200d4828,
 	.config_ctl_hi_val = 0x006,
 	.test_ctl_val = 0x1c000000,
-- 
2.30.2

