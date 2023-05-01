Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D50CC7EE24
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 20:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjEAUeM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 16:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbjEAUeL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 16:34:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95373594
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 13:34:09 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4efe8991bafso3986260e87.0
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973247; x=1685565247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALZEC/kNpWvG8KdR1XQrNRT194BntzyM9tGKrsmytsI=;
        b=NLcReg0fHMYz6BTYOSL/GsgoMFOpuk8Okl5nwBLFQic6YV1t1Gek81LXWeqpDAkSnv
         ylRQoxQwsr/gH9OXqnsDlLG4wreSMZw9h3bxkcBoceWcycj4drY7Y68FtcMUc4Pz1Pen
         j5shngSsN0rw8zw/gk2ZuTR9iXKmLmsZCknWOPiaoBrjE5h0LXo0C+ALXYGWOXJJYNit
         Kc2QM5Bt/A4KZP90UHfMkKZ0aI/KuP2ekTw2XlwIonvJbZ070rLwSz9gq0+hN0ELlUhU
         DcIH1WPeI6ZriFVGN832dn+XlPXBaAJCnR9ZhUcseOeBybbZjNJVWisd0Pl3A/lEW+wJ
         Scew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973247; x=1685565247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALZEC/kNpWvG8KdR1XQrNRT194BntzyM9tGKrsmytsI=;
        b=CUievcqLm9a0uieXXrwMh7xdceKyoehLARJfBHJvpmWBsjg0txx8ayI95eacnxBIVe
         YJ5dlXclHMv0rRu6XPLBxpKZS10pTt8t6wrDZ2wXCpjPvnCDGSPKDhrjYE0/MEzTEy+i
         o9l+ELU7ud/qqCvgUQvfC/JvlYvTHj3zGUnfx9hx9VHEvJuerbQTO7qRVFKv+E8F3R+R
         TrkrHM0MqP/HFIBw8Z9vJl/Zz1OQ1XOSJ5TTbnIDz3idkykmiK5E/nmjX4XxhEs5fQMn
         Ozq5LuT9KSM/lvhFDMtXkIEBDFagthqr2sU9i+8HOIpDCKFQ+8hqxSyHbiDoX1J0Ranx
         2uYw==
X-Gm-Message-State: AC+VfDyoiLNuI/FXf9paWEWuLmjANy8r0WWf2ys2WJukZRLU+YvwXtGt
        nb/F+17oSxNm5FbB/P7tiGAa/Q==
X-Google-Smtp-Source: ACHHUZ72gs/8p/aL+d7U97obJFvV90GWS5M8n+co3BCCo/Zn1Oz3s2Mbkfe71j23RV4OXETmHNjBwQ==
X-Received: by 2002:ac2:5481:0:b0:4eb:104b:bf61 with SMTP id t1-20020ac25481000000b004eb104bbf61mr4193341lfk.58.1682973247583;
        Mon, 01 May 2023 13:34:07 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:07 -0700 (PDT)
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
Subject: [PATCH 06/10] clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
Date:   Mon,  1 May 2023 23:33:57 +0300
Message-Id: <20230501203401.41393-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pll0_vote clock definitely should have pll0 as a parent (instead of
pll8).

Fixes: 7792a8d6713c ("clk: mdm9615: Add support for MDM9615 Clock Controllers")
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

