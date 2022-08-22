Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93621C32772
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 18:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237871AbiHVSy1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 14:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237913AbiHVSyK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 14:54:10 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0ABA25F0
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 11:53:18 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id f21so11878853pjt.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 11:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=GA3c/GZjUQaaitae2gW9tKtCQv1+a7TEeayxV3K4Hgw=;
        b=nohrL7qgMauyN3H6qU/Pcb9Zj1rjUJ5KPJQDupWnvb5otZfv18t9cnG5SlPjIOzgyz
         jXSeYoyn48NLHmSHqWAC3+mvaC5vuEB5pp37DTBXtnfhaTAsa3JOhzNaKd0OP53npl9P
         4CBgE6nr9Rxbq7XHZ/Vf77HEDBIaCpRhCYoqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=GA3c/GZjUQaaitae2gW9tKtCQv1+a7TEeayxV3K4Hgw=;
        b=N80m+wYl70A4MAjpV6wmffeBBKuxzpoznwIDVB0FEairtBfWpLHFG3tdHO3ADFabDP
         FxqlUvzMlZsgAud74uRMvS9g6C2P0GTBaid4cWeOYIKHEdNgE9w2UkONxS+XUDa+5VIK
         K8tO7KjvzRs6NF6E49pmB9Av4NjQOLkgaSAJhb7c698xzDAM0C7aZUCfk0Pzd+sy6tEc
         GJNeB48ar8898FfmGRVLQ1PBRQGGS6rMBBECChcupmoadKeOb+3aTDuhx/jE5nnlq+cx
         QzU8r/zwArG8HIGS1aItSSOqcGK4wBXRCT/4NbwT0QnJs5lOyhftTxMozmKoeGDLaob5
         rBpg==
X-Gm-Message-State: ACgBeo1/dqYYdKDFPPBK7WH8hWGTeGxm9mkXtHpCgGC/ydBFOAbrFzbU
        aCHOzfUQ77hy8EoD7np++Ymobg==
X-Google-Smtp-Source: AA6agR6IgcQdruU28Yk2u5gkyWvHVyZ/g3OywX3bEvdNobN795P5crDloxA6vR8K5z1yVfd5tjxC1Q==
X-Received: by 2002:a17:903:24e:b0:172:6c9d:14e0 with SMTP id j14-20020a170903024e00b001726c9d14e0mr21534899plh.84.1661194398373;
        Mon, 22 Aug 2022 11:53:18 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:1969:d650:d765:53ef])
        by smtp.gmail.com with UTF8SMTPSA id f184-20020a6238c1000000b00536b3fe1300sm2244190pfa.13.2022.08.22.11.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 11:53:18 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] clk: qcom: gcc-sc7280: Keep USB GDSC power domains on when USB wakeup is enabled
Date:   Mon, 22 Aug 2022 11:53:11 -0700
Message-Id: <20220822115246.2.If09027f73daa6e1ed95f5eab02326b543c67132e@changeid>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220822115246.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
References: <20220822115246.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Set GENPD_FLAG_ACTIVE_WAKEUP for the USB GDSC power domains of SC7280.

Suggested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/clk/qcom/gcc-sc7280.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 7ff64d4d5920..4ff855269467 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3125,6 +3125,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.gdscr = 0xf004,
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
+		.flags = GENPD_FLAG_ACTIVE_WAKEUP,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = VOTABLE,
@@ -3134,6 +3135,7 @@ static struct gdsc gcc_usb30_sec_gdsc = {
 	.gdscr = 0x9e004,
 	.pd = {
 		.name = "gcc_usb30_sec_gdsc",
+		.flags = GENPD_FLAG_ACTIVE_WAKEUP,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = VOTABLE,
-- 
2.37.1.595.g718a3a8f04-goog

