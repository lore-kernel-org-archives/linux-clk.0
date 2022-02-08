Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7B5C43219
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243524AbiBHNQu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358779AbiBHMlj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:39 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45363C03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:39 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id r19so2896750pfh.6
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ga+gjzrzR/LMbGVHXMahoAG4teobfaMr0L0SPMOkFuM=;
        b=RZ9aNJj6d+PjwBnU0ZJr9mX0nqK+z2KPKSE1hVDOXS6VR7K79uaqtUSEcm7xi/csiT
         PWkXmSg1lDYbXRJVyBHvI8LGnEa9ps7DiMTFIno+JyB6kH8xzJ+339+ev6Rsm53OTn79
         B3I6j48uRr2+5wLm760I9Q9pCw2Z3sZkrOEYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ga+gjzrzR/LMbGVHXMahoAG4teobfaMr0L0SPMOkFuM=;
        b=i8o3Km74y7e7QtB/ge0VFOjfpfPwiEJZQA2jTx6l37YW8FEqeKuf3jcV5TjE+gJCBv
         mh6DPDAtoJbIOMp8ve1jw9RflIrz9IhhgknA1FnAepBAs+XVyohNocnXknambsMKCzyv
         z+2aC1yvjW2U64LIf+D3W8ORogHskDwctc6zs+36JJd2fNcGw2ap/mhktWCWhFxFYCUO
         XB4U5NbWPQ1I6xLCBp3MTg2bIW7JiqOmCBGlNgVEPhJCYX7PA0nPBqrcQYU1bOVlamc5
         rsuMhU3o+cpK36HfyTPSVAX88MyGDUaE67KSHaMOlhz40vqnEj7yV4mxKVSkN6lbXt4Q
         saLw==
X-Gm-Message-State: AOAM53338RSwp1UxWWRsdquyfSz4tK/bzM0yXhxGwlwFnbMPouuzKGw8
        HGemEHlQFe3IEsVsraBbTXf2+Q==
X-Google-Smtp-Source: ABdhPJw8d0noYcaqrmuUm0oYUt6VCRIRuANK5szIhgF5+nvEpUNbWJNicRVw/Rm/sTOyay6sR7vcPA==
X-Received: by 2002:a63:2a86:: with SMTP id q128mr3374314pgq.53.1644324098777;
        Tue, 08 Feb 2022 04:41:38 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:38 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/31] clk: mediatek: mux: Reverse check for existing clk to reduce nesting level
Date:   Tue,  8 Feb 2022 20:40:26 +0800
Message-Id: <20220208124034.414635-24-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk registration code here currently does:

    if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
            ... do clk registration ...
    }

This extra level of nesting wastes screen real estate.

Reduce the nesting level by reversing the conditional shown above.
Other than that, functionality is not changed.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 01af6a52711a..70aa42144632 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -208,16 +208,17 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 	for (i = 0; i < num; i++) {
 		const struct mtk_mux *mux = &muxes[i];
 
-		if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
-			clk = mtk_clk_register_mux(mux, regmap, lock);
+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
 
-			if (IS_ERR(clk)) {
-				pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-				continue;
-			}
+		clk = mtk_clk_register_mux(mux, regmap, lock);
 
-			clk_data->clks[mux->id] = clk;
+		if (IS_ERR(clk)) {
+			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
+			continue;
 		}
+
+		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
-- 
2.35.0.263.gb82422642f-goog

