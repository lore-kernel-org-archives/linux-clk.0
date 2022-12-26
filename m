Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3D5C4708D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Dec 2022 04:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbiLZEWN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Dec 2022 23:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbiLZEWD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Dec 2022 23:22:03 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2995D2BEE
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:02 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bq39so6882957lfb.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BSMHD+c2gHpfQgRvnQWh7QBxsgW6TDMIYioeA0tiyU=;
        b=GSG/uPASW5MnAW2J6MoCurBK4kTDfD09wDZMETAMkR2BQDSJZLXgPBxuC7WpCIsXfa
         bhladb55cCu6v+AxHyDcUDrg6Vj/dYL98aez4hmlJUQfAcdc/Fww2Iu000YFNU6n6gB/
         Qfk6QMBHB+ttNsUOnEgK5cSXB+zDgyLQ6P4V8UQKsKM283wN8mX4TuL0N5obbTXUjCX2
         Od8mib1YgWK1Pu4zgR/Lfz9P7FVPLj3XsCbFmCmyvfMB5WND4V9yaWyE6DhdYvIt6fgm
         VSfMjgP+DWCNG+orVpYrp5eNViOuoOAVAQXFkrBksd6yembPg6LyNsgw0u5ZEdO0f50/
         ZXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BSMHD+c2gHpfQgRvnQWh7QBxsgW6TDMIYioeA0tiyU=;
        b=NBCisWtQcI/rnYJSuIHtiVH7SQtau6s76fo9WZ2v4bddMCTd/K4IYc0U06H3So9c7u
         3Y8STM7Yd3DsvZd5gMxGgc6ZkUFM2QBRoQLlLuXbtu4ixwVl+Q5+C7sr4T2nhVb+KwyO
         WNzgVM3Z+t67vYG0jH0gZQ9NVLAjVFXt0c3XeHP5JDmwqQzApOjERctC3rWf3s1Yrf5y
         SDAopfx2V7IrwB+C/2V7wPilDFRNMIavCObYJym8M2hcYdcb5KQ9ipj3hvy/w+cIoNXq
         Ymb7qEAtrOzBVNiizK02hS0MGgqmPQshbisuAaU0zpSQZT7rZdue3d6JnqcEV9noPabz
         1tFA==
X-Gm-Message-State: AFqh2koj4TofvyRSeY20lzwpXf/PnNKB5aufT+3hqfegcVsYeTSjJ5Tn
        DN+cBBGlCAJN8L0XemsBX9l9rg==
X-Google-Smtp-Source: AMrXdXtny0j8UKNsOeIfUn/TQ+czvRnUPd4+0U0IkWIjg7Y9RXoIwpyLFJNU1J0wXAn08wzdm7GOvg==
X-Received: by 2002:ac2:562d:0:b0:4b5:670e:b708 with SMTP id b13-20020ac2562d000000b004b5670eb708mr4155105lff.14.1672028520462;
        Sun, 25 Dec 2022 20:22:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:00 -0800 (PST)
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
Subject: [PATCH v2 07/16] clk: qcom: gcc-qcs404: fix the name of the HDMI PLL clock
Date:   Mon, 26 Dec 2022 06:21:45 +0200
Message-Id: <20221226042154.2666748-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The QCS404 uses 28nm HDMI PHY. The in-kernel driver doesn't provide the
PLL (yet), but the out of tree patches used the name "hdmi_pll" for it.
Other Qualcomm HDMI PHYs use either the name "hdmi_pll" (8960) or
"hdmipll" (8996). Thus change the expected HDMI PLL clock name to
"hdmi_pll".

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 67a180d688c3..241768da2263 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -152,7 +152,7 @@ static const struct parent_map gcc_parent_map_8[] = {
 
 static const char * const gcc_parent_names_8[] = {
 	"cxo",
-	"hdmi_phy_pll_clk",
+	"hdmi_pll",
 	"core_bi_pll_test_se",
 };
 
-- 
2.35.1

