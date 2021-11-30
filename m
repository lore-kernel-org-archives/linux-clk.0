Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D045AC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 10:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234922AbhK3KKG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 05:10:06 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:42788 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240696AbhK3KKF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 05:10:05 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3Htt2Bwrz9vCDg
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 10:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aw_bpduE2mze for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 04:06:46 -0600 (CST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3Htt06Krz9vCDX
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 04:06:46 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3Htt06Krz9vCDX
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3Htt06Krz9vCDX
Received: by mail-pf1-f199.google.com with SMTP id 4-20020a621604000000b004a4ab765028so12583761pfw.13
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 02:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r7G1TmK41rnyV4TkIbbUQW1TkiKZi87yD3Zt7PBsc3c=;
        b=YCnUhEKkb/jOCfjUjRF0e27/qXa3DYamYPdLTGBf2SvomkMp/VQ0e4cwEBzp/oqLjR
         kx/zhyOcbMXkNiiHOQgaIWpELLwu6gX3QESWnU6z7qrhyNOlWPbm+MtiebPXxJo8eaXg
         zlgTm/4weBP3ORs721TMP06TyZRvhHVgXV3uGggl+4AInBwMfNtq2InBWs+EqEaijWEo
         ZqECz/st6OzilUmwocSLZFrNxBJw9G3Uih0nqqUXMPDisYneHJ9gWrrSGBWYrNY8j8UB
         pwmPNJRgxyKDGgrx3oHVhLKTxPUj74YQEGXS1n/i3ZKML89CpVhH+gIWo4w797PNjkDY
         ETAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r7G1TmK41rnyV4TkIbbUQW1TkiKZi87yD3Zt7PBsc3c=;
        b=hqD1iMqpoG+IiHIQzSECqeXdIUEkdyuUq6g5Z71/8nhrYW49v6TWzttzMHpfNevr15
         6E3ylpjIfrsYbvs2sov81U1YxwdTDwYLjuCSVVbNNqun9TAIN/fuM7oFo1+zgQKuxF2H
         iyt1fHvkJyxY2cENSGM+T9Ao0mpmNOHw7KnleErfW7SnGhbj/6lthIFwY3d4DRI73RHh
         ZTCl79Hk4fjOIGW46jMYcYuFRtvuyG/Lzi+BteXs5cR8J/4Vo+UrtjOKB8BDKoOJNO7W
         dy4QZwl8nobI88kkHQY2yf0xNKrfGx4Xy+JWwyPRmcuOwMTB2p6pXLaymepFc+mkBu3S
         ww6w==
X-Gm-Message-State: AOAM532Lowx4A/0qz7QVKoLya0dBUBzWQ/SZE6BuWVi0TXe3FFCuNFST
        K3PEGELh2B8/8PGQ2UZ3ngal8IfMwhyZXz24nI8qBCJn3u1UmKLvcRNetBdbEGp3qNn/G4c35PC
        lI4ctKsTYBEG2EOFeSeOfZhUD
X-Received: by 2002:a17:90b:3849:: with SMTP id nl9mr4853378pjb.145.1638266805309;
        Tue, 30 Nov 2021 02:06:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqlVi4gUEZnqMEVQTnjH2GvhflnCPZQmVNPYts+3MdwetGMoE49AEmyYr8Z+B8s90BXPoQRA==
X-Received: by 2002:a17:90b:3849:: with SMTP id nl9mr4853350pjb.145.1638266805060;
        Tue, 30 Nov 2021 02:06:45 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id j22sm21003399pfj.130.2021.11.30.02.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 02:06:44 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Pi-Cheng Chen <pi-cheng.chen@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8173: Fix a NULL pointer dereference in mtk_infrasys_init()
Date:   Tue, 30 Nov 2021 18:06:37 +0800
Message-Id: <20211130100639.100722-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In mtk_infrasys_init(),the return value of mtk_alloc_clk_data() is
assigned to clk_data and used in mtk_clk_register_cpumuxes(). There is a
dereference of clk_data in mtk_clk_register_cpumuxes(), which could lead
to a NULL pointer dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_cpumuxes(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT8173=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 567bf2ed86d1 ("clk: mediatek: export cpu multiplexer clock for MT8173 SoCs")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8173.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 8f898ac476c0..a350e5c637af 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -868,6 +868,11 @@ static void __init mtk_infrasys_init(struct device_node *node)
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
+	if (!clk_data) {
+		pr_err("%s(): could not register clock provider: %d\n",
+			__func__, -ENOMEM);
+		return;
+	}
 
 	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
 						clk_data);
-- 
2.25.1

