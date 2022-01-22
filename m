Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE43C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbiAVJT5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbiAVJTN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:19:13 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59716C061401
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:38 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so10760331pju.2
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8YPN+1zbb0FLmeCLY1r05U9fmN1fkUgWhlHUKwR4SnA=;
        b=X/ZtK2SpDBNbC3Na1TLbE7R39jEjlYu+bOu8u+DNEurHjH1tbv0qDNcyqaLBDYGA1Q
         8VwLaJ/PNA2WR9RbNJ4eDR3BMD8BIyBuTAJ/WNHxn6wrfM3rexdndBFYfjpCNFiKNiqo
         E7c4AfXewebnkxmvND/e8oxCRJ21aYZY5EKFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8YPN+1zbb0FLmeCLY1r05U9fmN1fkUgWhlHUKwR4SnA=;
        b=NuryVVoJ3kG2q/FIDnoglVzd/TIAwU+pwUHfdpI2pmAE2GDBqhtNjn0QPB0BUrhBFa
         CDjqVDhCKtrjNzxe4mJAmNtW8aYYfTI6iL697xqfBj5mR578rh7E4tMXT4+xLrH7twmp
         TqRxP2VWx9oh6FkcnDCM9p1AvsanaoDdtTBHz/ThW/9S9rtBOdhLzD/rC61eR22mtQWp
         g/vFD9ZcSI5WQ7oKN7WoEEpoVuvVKPRUZmN9nPrbF5IMquM9EoXiWDF1egGWI/UPdCih
         vTEvJwHo4NrqtfDUcozBO9y+MGR4Nkyx/ITSu0dAI8MS++UsNHChRIBEbEvlPNmgfVRa
         xZ0g==
X-Gm-Message-State: AOAM533BtLBiiHbT4Ch3Pzeyw1K7QfjDXq2JuQuuR8ho91LpcNHrjrEc
        YQJ1eGGvTcPguxUjEhR6+2hXlw==
X-Google-Smtp-Source: ABdhPJxXOmZFL9go3UdVwQDSJBJ6fg68hKE0lBH0fAd3eIgttYowB4HFeZeVzoGLMe1c7TNtJJKpJw==
X-Received: by 2002:a17:902:6b02:b0:149:7c20:c15b with SMTP id o2-20020a1709026b0200b001497c20c15bmr7026790plk.173.1642843117953;
        Sat, 22 Jan 2022 01:18:37 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:37 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 24/31] clk: mediatek: mux: Implement error handling in register API
Date:   Sat, 22 Jan 2022 17:17:24 +0800
Message-Id: <20220122091731.283592-25-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The mux clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 70aa42144632..f51e67650f03 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -215,13 +215,26 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_mux *mux = &muxes[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
 
-- 
2.35.0.rc0.227.g00780c9af4-goog

