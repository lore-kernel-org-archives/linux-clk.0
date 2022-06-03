Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76B7CCA47F
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jun 2022 08:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242690AbiFCIBJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jun 2022 04:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237349AbiFCIBH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jun 2022 04:01:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4197D35DCC
        for <linux-clk@vger.kernel.org>; Fri,  3 Jun 2022 01:01:00 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h23so11408009lfe.4
        for <linux-clk@vger.kernel.org>; Fri, 03 Jun 2022 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JiYleTyeT3vin8aQzQcv1Z3/WUW4OTlXhZCaL51JbYg=;
        b=SW591eRwM2xLfV33wcNBBDcNTBXeFGYsAxNZXbwzunh9l5epRUNtbk+Y/24YsKhKjK
         u2/kLNR1JghCXWg5QORHq2dxPCd05Ac2CiOY25VHXi2JMgZi/41rhNfT8WCcqxG2vKja
         T8dATJ43fJ3jAM4xm3vNZvRuzWyxM1aoWgcpH0/QpZz8F//iB/Sc73htuXcLX4ITQPlK
         ytMcfvMRLHL4qnunOTJ6zs5QHX6xabyXfREM7XmNAnSWbPJIJobQdyj96XbfPG/H3Orb
         UwcsgiHsnEL7inBJ4mC+h0IgqJt7zI79teQC/3LxkbyMw1reyXoiinSEh/29HB4KcyQ7
         QPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JiYleTyeT3vin8aQzQcv1Z3/WUW4OTlXhZCaL51JbYg=;
        b=QIB6I5VUsnFQhqQLlGlLc1R6cYZofP2S/0gFseP2gqA1Flj9nClueN0JIVj4ozbaQh
         LYMkjbtDpR8wESi/KXWZuVkuWgIyQiY1uWb01VdK1S9ZdTKKdSITr7ugn2gaCDlpnBCK
         cM5K/8D5W/1W9YBKdiz6YTByKgjCSD8ClCAbGOdkeuIIrLjoZktpAh6n2S9i66v4n2RZ
         pr0dmGLHN7KmclYqeGx3NALRq4J3DCO2i0ftNU1nHq/z0j76ao+DGbsbosj0wr1LqA4e
         u8BJ1Y0a0Gor8Hc7vKRBEp/7oVa644BttPG0j0diVCgi0CwKmcQowb8LdzOIKMmZGri4
         /Xbg==
X-Gm-Message-State: AOAM533DddEfyECCr7Wdq84SXy1NOowdFWB3MLo96W3hdFh3UK2+FV5g
        4IBlkNk8Nm6WqiET2mdZizsxSw==
X-Google-Smtp-Source: ABdhPJydbRNhY3L/E4uT0Br0atxtdxukrEuuuoCo0o7+9RT7CnHkICu66QpBLAAVGlHyzJKB2WhfOw==
X-Received: by 2002:ac2:43c3:0:b0:479:1630:c6ed with SMTP id u3-20020ac243c3000000b004791630c6edmr2707327lfl.406.1654243258563;
        Fri, 03 Jun 2022 01:00:58 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id g23-20020ac25397000000b00479025bafb5sm1435501lfh.301.2022.06.03.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:00:58 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v6 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Fri,  3 Jun 2022 11:00:55 +0300
Message-Id: <20220603080055.2251789-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
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
Changes from v1 to v6:
* none.

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

