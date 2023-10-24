Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A332C25B47
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 05:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjJXFBE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 01:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJXFBD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 01:01:03 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F9DB0
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 22:00:59 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32daeed7771so2709172f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 22:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698123658; x=1698728458; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfAUTnXWgmubMD55oBXowoonH5R6qeZ5OH5Z0vIY35g=;
        b=NwkvYPetnhu5uYsBtd+1JCbNl3mKIMrTxAMZfjauZYCy72aQa0/GcaeXbQpasjjt5r
         6d77CURcn0a55mCdhFnZlZzw7039a0e2DnyQ4bQ3X6RTYPGCojhYWrOQD2Kh/qryrKsb
         SuksJbBlJ3wIwYTdfEx/6HpljuMYrUI3rIaV+T/01od9W7lDF4ek7acYrP6Bu1pDX7Cc
         qvH4qTAQzZl2wU2MprYZjCE4SzpHShYE9UaRf9kYMJjaSQR+eBXIyUs9eIQTCUvYUEUh
         Rdupo1laMo9oFbSztbtMOMewz10EIhglzzr8/Q8N/RqsRJkidLvbKK4UFi4OUgZb/OcU
         uykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698123658; x=1698728458;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfAUTnXWgmubMD55oBXowoonH5R6qeZ5OH5Z0vIY35g=;
        b=Wpje2vWCMXe/h2qwUUEBw1rnBgFFP0gJVSYu7SXxv6Xu1effyGkFTwNY1nWz569/x9
         ZHKE5cSVGxJl5kZh7dttkPkM4sz9ANoJYVU5vtKp2TOp7rO5Hc5EXEi4A+mZSiMWENAX
         JRUVtFSguKnWuEb/DDXoVw5A6rfzJHLL8KgB6/uQDVeSEgRLEdFNWV730BDGQo7/uwdw
         0Yzcfjpd0MswUVvYUsf1KpnYWHb/LiGW+vQ3UFfTLX4MIshUzoPzPj2G5knoYxlngtvE
         SN6duwuGyoIvk3zsKkHc2pzvYb5+D7/6nyUAkW0DPUAew4DmMn8P41PbwEXIaXmm/spp
         x9Fg==
X-Gm-Message-State: AOJu0YywEFaTatoHesWyc+hvbXRjRz3KsPyhl57f0vypKaoc4WwwmcIN
        8RigK9afmkBr175zvZvYAYDXHg==
X-Google-Smtp-Source: AGHT+IGCxa8zVvugVsfJkL9J6ZS+nuttr3UC3F3P4N8AKS3AC9nbGPTuSL5sW9pl6CVyGpEEPy2M/A==
X-Received: by 2002:a5d:44c8:0:b0:32d:83b7:bdb3 with SMTP id z8-20020a5d44c8000000b0032d83b7bdb3mr8294329wrr.70.1698123658157;
        Mon, 23 Oct 2023 22:00:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6451000000b0032da022855fsm9020793wrw.111.2023.10.23.22.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 22:00:57 -0700 (PDT)
Date:   Tue, 24 Oct 2023 08:00:53 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Johnson Wang <johnson.wang@mediatek.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: mediatek: fix double free in mtk_clk_register_pllfh()
Message-ID: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The mtk_clk_register_pll_ops() currently frees the "pll" parameter.
The function has two callers, mtk_clk_register_pll() and
mtk_clk_register_pllfh().  The first one, the _pll() function relies on
the free, but for the second _pllfh() function it causes a double free
bug.

Really the frees should be done in the caller because that's where
the allocation is.

Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mediatek/clk-pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index a4eca5fd539c..513ab6b1b322 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -321,10 +321,8 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 
 	ret = clk_hw_register(NULL, &pll->hw);
 
-	if (ret) {
-		kfree(pll);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	return &pll->hw;
 }
@@ -340,6 +338,8 @@ struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
 		return ERR_PTR(-ENOMEM);
 
 	hw = mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
+	if (IS_ERR(hw))
+		kfree(pll);
 
 	return hw;
 }
-- 
2.42.0

