Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62999C433FE
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344574AbiBBNuO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344475AbiBBNuK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:10 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0126C06173B
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:50:10 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id c3so18296760pls.5
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Wqt8bANP5ifvGkIaVLK4/SfxJUiMOM5777d8fxcmLM=;
        b=m2ksXmN7GxvSJ/YH+L/9081yGbKbVptVViQ7mbt5uZRnW8oCM+USFPKAP+awj9+dFG
         jO235c+pDT2bEX4Nr7VfDXg1JwB+GOzcK6xg5uUworwikrQ4prvPI/CJ3qNxqaLTyMGD
         paUb6rV0mbYbYGkmOIZ+tDuDktrRvNfBZkToM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Wqt8bANP5ifvGkIaVLK4/SfxJUiMOM5777d8fxcmLM=;
        b=AXns9tqSndqAr2u6xWjuXBHs72QV8xdhdCjrvgwkLWWU7Sz3XRZR6410mh9gZxxB+E
         0v2f0gMpQcYkFMU19ee/5JEnG3/2BaxnLhyKZe7ZXsUq2p9D96oGy0K1UdYGXu/M7EQn
         aJjmLDJLg9wNMtVx2eIefnzsUc0M8G2msrVsQZKs/lncylWYa5ufx6amuqwL8qbaXw+N
         6l6lZEhIy1+BQiKoV0J8MrjNFgB9ix5xlsAc+qlb9ntdyjz6KLyZn5YZkjggaqzPc4Ks
         cr8lgonIvv0SDuxA7+qQvtNKe/7zJkz7U/nETk//DxBxtN9Dx3RS3/pBZfKY66O1QMKh
         iuxA==
X-Gm-Message-State: AOAM530HZ2aG5/NfYqV/MfminiCyXRmxTbd9qJbyTzLfhmyedI+95XQB
        6SxO5/+N7KFrge+g0MXDAzr+Lg==
X-Google-Smtp-Source: ABdhPJz8hyWt2PyEVsnlaUWVM4Es83yV7JTMjXR/JmTG23iFKVNdT73cJkCBQTXNY12fQ41KC/4EBg==
X-Received: by 2002:a17:90b:358e:: with SMTP id mm14mr8052020pjb.229.1643809810312;
        Wed, 02 Feb 2022 05:50:10 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:50:10 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/31] clk: mediatek: Implement mtk_clk_unregister_factors() API
Date:   Wed,  2 Feb 2022 21:48:19 +0800
Message-Id: <20220202134834.690675-17-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_register_factors(), as the name suggests, is used to register
a given list of fixed factor clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  6 ++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 7c0d5706eed7..b267b2f04b84 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -126,6 +126,26 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
 
+void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
+				struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_fixed_factor *ff = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[ff->id]))
+			continue;
+
+		clk_unregister_fixed_factor(clk_data->clks[ff->id]);
+		clk_data->clks[ff->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_factors);
+
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index cc7f920eabb4..4db1a97c1250 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -55,8 +55,10 @@ struct mtk_fixed_factor {
 		.div = _div,				\
 	}
 
-void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
-		int num, struct clk_onecell_data *clk_data);
+void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
+			      struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
+				struct clk_onecell_data *clk_data);
 
 struct mtk_composite {
 	int id;
-- 
2.35.0.rc2.247.g8bbb082509-goog

