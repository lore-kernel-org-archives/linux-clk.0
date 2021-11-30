Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55CFC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 17:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245201AbhK3SCC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 13:02:02 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:45626 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244511AbhK3SCB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 13:02:01 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3VMP60t4z9vqwF
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 17:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AWC55KJbRy_b for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 11:58:41 -0600 (CST)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3VMP3yv6z9vqvp
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 11:58:41 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3VMP3yv6z9vqvp
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3VMP3yv6z9vqvp
Received: by mail-pg1-f198.google.com with SMTP id x30-20020a637c1e000000b00324ab629735so10667265pgc.17
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 09:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2o1Btyvcr9zNiibD2X2zdtUwgMaC6zMAeCNuQYINlXc=;
        b=exUErgMJm46Up/Woex05GuY1DcDnk4KuYPQD8B43uD+enDb6f1ESNL3mYGbZJNW4QY
         F0tb0N2dKU7F5pCdCw6+2+PHxcVGth1zhB9V7wMZdwebhBW8ln88Vw/DmV1VQiTOa59R
         kytHEADQLTGjf2x+E2T1fQyh9v3Is5WOBkVAunq/xT8VBgHq/41Lr7b7L1S1v/060oBK
         YXC2/TuHvhb7ajz/0tFhSKQO66gO1tKvWgUjwayFTSCDZ3BXYgKsqHnlOcg4oScXf9iS
         7BvdUL13I2uoSks0PfhtsaGoHnBwNVtB8ALc+kDlSM4neSe4J65WFfEK6kiHzMY6ybcJ
         aLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2o1Btyvcr9zNiibD2X2zdtUwgMaC6zMAeCNuQYINlXc=;
        b=ty60rirAuVAQjBshk6C+sI/5G2DUYTaj9Y59SNlWJEFtnT+MHj7zNMf3gJkQRRC4AX
         Uq7aLx9yeyo7LVobZUPhK2ctoz90DTSGZDEBRfTBctwSlcv2mG8alrFWMQzI4iyUs9fy
         o9/mmscd+Hy/YedjEoORwbRnqEs7qKgay5gycbmh99tPkAtYpn3gl3c2UHp81xA2yqvV
         wuSfSC3RnRJSyM6bMXXQz+Q7kHnAihFqqgVpVo+a503Ob+9KlGJkf8IoP03gitmkgRfW
         teTl8DQ5ac6Nr382hRa7q9Jdq74N7EpVzEWwzU26HhTCm8yGLXewgz3bLmU8zxo6jz3Z
         qyfA==
X-Gm-Message-State: AOAM532rf5sCT3itl+e/0iMUi3L0QMiDeTBUpJi6h3vUG2TMZ2S2DYun
        fZlWoIFaMaGqzKQMR5zJ8D3ICnnUXPCmO3JY9YiZ+oirWTEuIydvd6WVtKIH/1w1w6NVNBNsgH/
        rOxCgxQnSU1BGAhK2TV0Zq9zY
X-Received: by 2002:a63:9c02:: with SMTP id f2mr515010pge.343.1638295120733;
        Tue, 30 Nov 2021 09:58:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgdIi4Z2ChYgEmtBuWk0KmMH/i4xL7D33ceP18LJD2zEwtDYMN3TYLP524WAMTgQe4/ok+Yw==
X-Received: by 2002:a63:9c02:: with SMTP id f2mr514986pge.343.1638295120504;
        Tue, 30 Nov 2021 09:58:40 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id v10sm22386110pfg.162.2021.11.30.09.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 09:58:40 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Chen Zhong <chen.zhong@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7622: Fix a NULL pointer dereference in  mtk_pericfg_init()
Date:   Wed,  1 Dec 2021 01:58:02 +0800
Message-Id: <20211130175803.215588-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In mtk_pericfg_init(), mtk_alloc_clk_data() is assigned to clk_data
and used in clk_prepare_enable(). There is dereference of clk_data
in clk_prepare_enable(), which could lead to a NULL pointer dereference
on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
clk_prepare_enable(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT7622=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 2fc0a509e4ee ("clk: mediatek: add clock support for MT7622 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7622.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 3a389fa915c1..e89acef5768f 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -702,6 +702,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks),
 			       clk_data);
-- 
2.25.1

