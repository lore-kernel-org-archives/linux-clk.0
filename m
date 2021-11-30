Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA7CC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 09:03:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235015AbhK3JHB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 04:07:01 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:54924 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233648AbhK3JHA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 04:07:00 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3GJ65Dmgz9vCFn
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 08:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tuqo3q59VqLH for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 02:55:02 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3GJ63DWgz9vCFp
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 02:55:02 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3GJ63DWgz9vCFp
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3GJ63DWgz9vCFp
Received: by mail-pl1-f200.google.com with SMTP id l14-20020a170903120e00b00143cc292bc3so7925837plh.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 00:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JwkYqyhX5smeL+L/r125AuKqmjcCfxTAw1WF1G/WgUo=;
        b=qStNVhS9s5xxEQjiT7/N1C0yco9IimARTtUel0RW79VmbmaqIDeUZxIOZ4qRbiCLzp
         JTjLuzCVsb9gCo20eVWkSin+Hykeec6Wl/yzLiv251iBuMwsOZdw3dcCSVKVtPdQzdRN
         a7z1Akh3RsfthmSHhC6WelA+HwY5p28vGLrzIw98rvHrQbAPQj24oEy5EZWcHOo21dOz
         hRTAm8nc/oUI7BTQ5QQMuLokd8GpE+c2xvjrRtmXLDB6CxpsYA3BA4AMj9kn4Lq8hXr7
         HYzPPuKArjH809WyANHlez0j0WfpAYI/8zJwNrTXIhvwS1Xdug8TXkmvVyLD2kiFcFzY
         z0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JwkYqyhX5smeL+L/r125AuKqmjcCfxTAw1WF1G/WgUo=;
        b=JLDGWVKmsNiuK2BjAyZ7KAoHQFw5BkQ88zJRpsANXBKDVEcT2Mk/L+AD5/yXhmz6xo
         ORF5fyib0Rkoa7aW/vhx/GcErESZdz2qTJMdx6/RLAs7s0nBBWnbtFC7MsCopSe+OdIP
         m0HBfcgcv9rUJIk+GFKOP+rICJ9LRZQqhTnCwyrIFxU1MrjJfK8MGiV0Bfz7rWsV+qC4
         U1+MqcgepfW5K75zFMb/3yMeSJ2hw9HSNMcIm/4w2Tde+73f0y/tZ1x9+WUNljvcP2VL
         bLFEMeftoskO8lf+64ICTiCoJrD5Fp+YczjV7TQa0UMkRbGmjnqm4hj4CzZHGAPSDrnl
         QbKw==
X-Gm-Message-State: AOAM532MxRDfvr1T3JSNRcFR626owJ72qRmTUYKq7kjyJooxDMxYizba
        /Ebx9sHh/h5DnfpMlPJaJhRT1sNhWuSD5+F4kLXl3enLLnKeRUWlnuIpfxJFIFVQ0xhRLEbA04T
        0kTVaaZI+F575sdvlaGpc9ucl
X-Received: by 2002:a17:902:aa43:b0:142:6919:73da with SMTP id c3-20020a170902aa4300b00142691973damr65882686plr.39.1638262501501;
        Tue, 30 Nov 2021 00:55:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxt84MXmo7Ca8vyZxDhDjFTkMtVX+MNijU4eYMPkHKjS5V/seglj6amrRunpcPVSJcRS2e72A==
X-Received: by 2002:a17:902:aa43:b0:142:6919:73da with SMTP id c3-20020a170902aa4300b00142691973damr65882664plr.39.1638262501288;
        Tue, 30 Nov 2021 00:55:01 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id l6sm1934745pfu.129.2021.11.30.00.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 00:55:00 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Shunli Wang <shunli.wang@mediatek.com>,
        Erin Lo <erin.lo@mediatek.com>,
        James Liao <jamesjj.liao@mediatek.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt2701: Fix a NULL pointer dereference in mtk_infrasys_init_early()
Date:   Tue, 30 Nov 2021 16:54:54 +0800
Message-Id: <20211130085455.75537-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In mtk_infrasys_init_early(), the return value of mtk_alloc_clk_data()
is assigned to infra_clk_data and there is a dereference of it in
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

Builds with CONFIG_COMMON_CLK_MT2701=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt2701.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 695be0f77427..9ba30089cb9a 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -742,6 +742,11 @@ static void __init mtk_infrasys_init_early(struct device_node *node)
 
 	if (!infra_clk_data) {
 		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
+		if (!infra_clk_data) {
+			pr_err("%s(): could not register clock provider: %d\n",
+					__func__, -ENOMEM);
+			return;
+		}
 
 		for (i = 0; i < CLK_INFRA_NR; i++)
 			infra_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
-- 
2.25.1

