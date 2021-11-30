Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72946C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 09:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240158AbhK3Ja5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 04:30:57 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:52648 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbhK3Ja5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 04:30:57 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3H1k2ls2z9vBt2
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 09:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kpM2WAfqL2JE for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 03:27:38 -0600 (CST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3H1k0XQlz9vBtK
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 03:27:38 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3H1k0XQlz9vBtK
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3H1k0XQlz9vBtK
Received: by mail-pj1-f72.google.com with SMTP id hg9-20020a17090b300900b001a6aa0b7d8cso9487059pjb.2
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 01:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmVL6Owf91KrAVSVN4T/a2Zm/TSDiHMyV8vSNTqLEAI=;
        b=crRhkDRObsvIF6ohNtNmm/daP2G/5tvHmMBSCSNq8BRwTiWU3q1tVKg/SsO4nghCBM
         1MxPVU5HQOkhLvzYnDrF66p7fprRhHdJzXpIXcfNshGvUPaAHB92waRxBIrDtQLsFTFs
         O+UeUdEQ9puMjaR9V9o2O9h5dZX8/kxD+NlCib48py/kl5FUf8IS07jl/r1bByVipMog
         dsOT3gpJKjyaFrgkwuWYqosYPaOGApQCBKeWtSp4LfGTIuw8Hev67zxt5yLaR4ZaH2jY
         38nCHCyaJa4Q84HkjzPFwpSjpEwu3qhfn839JGSJgjBeeGBpQQA77mWECS5mbhMdUkj3
         wccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmVL6Owf91KrAVSVN4T/a2Zm/TSDiHMyV8vSNTqLEAI=;
        b=RzxVyvTnIcfCRsdN2zi98+F1hcDQH/9pdLrTJDJe34eu3bxbcUlGTyjngwJXZykke6
         Gj1jV2EKbHL3L2fyTEwk2jAZ2tdTA1WyYXYAwMJGaMEV/d6r7IhDJE4VVsbSFtOhUrRP
         WqjpIfF1MwzlTEanzoXwZuRW8fwKXVk7UbE7Mwcuuezj2XnReXlZAes8ak/2NqinUlJI
         ugtiLAIv7oAWEeRQy7DnJAQHQOuxNMIiJXxVTkwbPvKH5GoZkR6MEA1j6hObgE9MA21R
         8xRpHFHWyn27DhOSQbTad92XgzTAjsKehLIc1uRcx4EpJ3nRDQLJSloWXL3HDmjr68zD
         S+7w==
X-Gm-Message-State: AOAM531qc8WzRIe5VTBl10Rvpen8zA7TZSkIbRKQjMJfrG0NeEHsyyXT
        rU8Xw/as0nHpO5FSr5SjoS+Fg1fFqXIBSB1fkFuT0H0CpLPZbgWSW0nKUZti5xzYzg3zTCaNlBz
        wqRO4A7cyoP8cvvgqdEwzgoK8
X-Received: by 2002:a63:7c03:: with SMTP id x3mr38833932pgc.394.1638264457386;
        Tue, 30 Nov 2021 01:27:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcUS2Pm5qOUBh9nDN92KPHRcDmY3kWaqLBZdVVTaBBj/oCqWJ6lcYyk7AkcWuoMj+QeBfDtg==
X-Received: by 2002:a63:7c03:: with SMTP id x3mr38833914pgc.394.1638264457136;
        Tue, 30 Nov 2021 01:27:37 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id e6sm14397203pgr.24.2021.11.30.01.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:27:36 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin-CW Chen <kevin-cw.chen@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt6797: Fix a NULL pointer dereference in mtk_infrasys_init_early()
Date:   Tue, 30 Nov 2021 17:27:30 +0800
Message-Id: <20211130092731.83763-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In mtk_infrasys_init_early(), mtk_alloc_clk_data() is assigned to
clk_data, and there is a dereference of it in
mtk_infrasys_init_early(), which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of infra_clk_data.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT6796=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 96596aa06628 ("clk: mediatek: add clk support for MT6797")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt6797.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
index 428eb24ffec5..184b283b6926 100644
--- a/drivers/clk/mediatek/clk-mt6797.c
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -563,6 +563,11 @@ static void mtk_infrasys_init_early(struct device_node *node)
 
 	if (!infra_clk_data) {
 		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
+		if (!infra_clk_data) {
+			pr_err("%s(): could not register clock provider: %d\n",
+				__func__, -ENOMEM);
+			return;
+		}
 
 		for (i = 0; i < CLK_INFRA_NR; i++)
 			infra_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
-- 
2.25.1

