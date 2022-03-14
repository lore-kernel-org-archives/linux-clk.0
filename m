Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7527EC3527E
	for <linux-clk@archiver.kernel.org>; Mon, 14 Mar 2022 11:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239596AbiCNLpE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Mar 2022 07:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240488AbiCNLn7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Mar 2022 07:43:59 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F202A9
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:49 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s29so5178604lfb.13
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=JtXVjONRC3KWeyA0W9y8pWGFjBZ5GEsiaEFFzOsQn8i6PTUuIhLGRJNysZMbp85BuF
         otR+wnAbJO23yfbxkndOgSpU5xugVid4dzHtpz6WLQqNzFEkagp70tWGRsMFHLspFoK6
         50kKsMuiL9Tyqfx0zX1LkCzl8Jk98Cvc4W/ogZE8n0XzGw2Trtlkg/FqrKeNzknC5XxR
         G7xsIUHxanp6SeQklUhXlRucuSAsMQjR4ZaQobCZR8U2ZLOFpFlAkoopAv2lRIH++Vkh
         UmV6+mMjaWdwbco+6pPmcdLgiFviIHUzbpIOHBzftbdcQyyLE6VwhBK/TqZ2TVDrqTsK
         UEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=012phDggDn/Z3BN2feFJJu9y5H6Ts94wvVcU6qWUDWViZVrTx1nnZ0P6mFSrYlv4gy
         vEOSUnWRXcy/6M75LhAxCfwyJWwqSgdUISE6H55RoFGoZn9A5iKqwZXVZEGbuvD7Vbp5
         tvmWUXZ0Jpn/7rjd8ojJReg0fFbuEIAvVQPH6CRt5qQlG1bRPjQPqG4OntZ+fSp2BlkG
         GXOyNqfaduioeVWA00fdtFCJac167kMY7Os92KCNewqIabNHnzajPbhwN8OM5pnCBL23
         XC4Wo6rqEjVAIIiqdkWtUqE69wnFokAE1Nq31Zhk3mVUOca4hX0Wl9v1mF8ilqgI7YbS
         tnpg==
X-Gm-Message-State: AOAM531qh0NmLgKfkbBnRCmrB4MBjj5vlKQvUqARmrJlvt+bhRHkn3wa
        XIocQah0zO5OBhHP/IJT0UqZWA==
X-Google-Smtp-Source: ABdhPJwVPaWVMTBDDDnp5V2iERwGSt2Sw4zrXJxtxFL5MEXzqBDY7g48kqEKUVTkI7RaaEofuQajBg==
X-Received: by 2002:a05:6512:104f:b0:447:f9b6:9217 with SMTP id c15-20020a056512104f00b00447f9b69217mr13523387lfb.575.1647258167838;
        Mon, 14 Mar 2022 04:42:47 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id b21-20020a196715000000b00448777c07a1sm1964323lfc.134.2022.03.14.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:42:47 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Mon, 14 Mar 2022 13:42:45 +0200
Message-Id: <20220314114245.1636599-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After merging lucid and trion pll functions in commit 0b01489475c6
("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
the function clk_trion_pll_configure() is left with an old description
header, which results in a W=2 compile time warning, fix it.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4406cf609aae..288692f0ea39 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.33.0

