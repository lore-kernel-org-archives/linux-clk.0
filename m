Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106A8C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 09:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240122AbhK3J1y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 04:27:54 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:52251 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240105AbhK3J1y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 04:27:54 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3GyC01XTz9vBtN
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 09:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3teWkVOOloOy for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 03:24:34 -0600 (CST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3GyB4yY0z9vBt2
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 03:24:34 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3GyB4yY0z9vBt2
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3GyB4yY0z9vBt2
Received: by mail-pf1-f199.google.com with SMTP id y68-20020a626447000000b004a2b2d0c39eso12505179pfb.14
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 01:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Kpv95WvUkW/Ud7pYJF6QRY1ECX/+UULSLWzxdPLIgk=;
        b=Fw5Z8AyCfUSIgxqiupoCR9sjMbdmQ29AFdnEjQPhopEri3nPVfkJbbGXd6nS/bLtFS
         zJ1IE20IzWpQ5+g4mkZh0efIGFxNISOolZx8KzAjvK62U2xWPwSELLRUFvMzGdRQgGjK
         3JSQdoGAolMpLrYM08uIBskshSCFQI0Ku+X4icBsRT1XAZDWFNO6iHcOvhMVfqpAP/gz
         Cu75DjY0gzdTU1ghoWOTAOwBmjSMMMYX0mmH+jO45HeRyCOYnPkSsBLqBwGPhZt5TLx5
         v1IMQ+rr7RXzh5BohSs3s98ln71POKNNZhxZbNolKcIT9KWiYqbbhtypq7744QDgI+pg
         RudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Kpv95WvUkW/Ud7pYJF6QRY1ECX/+UULSLWzxdPLIgk=;
        b=r1y1vJb7KZj163kD3ADTcQfC4CsqrktfhkUHZ/WNmBiagdRuCuvgfvNaSY29lrvl/i
         X3nFEg5b/KsbxxRAuXys7n6GhS69LhK8VVgnVVH/L+ADuQFXI+2HTOzc41/Zpanq2vw5
         02aCAF0mgxxXf+H10PnKG2YmW8TH3xMSKKFt4yLJTR3ghJAX4ee60LEq7L05utoHoxPn
         nVGTPNwq698L/7cGo/I5pPoxnc3PTzg9XN/WxSdWMnM68XH25PEmFqUl7eCX5WE5ovqa
         c2FzIstn36+8/sYvStbdyi1TNiEMJqB8PyVl1M0KV4cLpDfAaYXTMqUETPHsYfH247IR
         7HAA==
X-Gm-Message-State: AOAM533rNWaddVD9VFBqPM2Fe8mGfqYifP/Rq91TGg2ipT0rcCUcMN8a
        +SwVBKDla4PcbGraFimy2XL8HQpEUtq+niDb3Ot/AN2v9EW5z3b3nbrWaZROBreqNjZLKad1fjr
        yqlq2/5TY9LhCoaQ6SzbNiXZU
X-Received: by 2002:a17:90b:8d6:: with SMTP id ds22mr4588536pjb.194.1638264273963;
        Tue, 30 Nov 2021 01:24:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDBGO+aaLim+LpVySQCOJYODPf3ehU0UEx5GMCZAkK4vXF25CONHenek8Yf1aGNTHZ8rqCww==
X-Received: by 2002:a17:90b:8d6:: with SMTP id ds22mr4588512pjb.194.1638264273756;
        Tue, 30 Nov 2021 01:24:33 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id b8sm1921015pfr.213.2021.11.30.01.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:24:33 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt6779: Fix a NULL pointer dereference in clk_mt6779_apmixed_probe()
Date:   Tue, 30 Nov 2021 17:24:26 +0800
Message-Id: <20211130092428.82262-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In clk_mt6779_apmixed_probe(), the return value of
mtk_alloc_clk_data() is assigned to clk_data and used in
mtk_clk_register_plls(). There is a dereference of clk_data in
mtk_clk_register_plls(), which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_plls(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT6779=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support)
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt6779.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 9825385c9f94..f22bf4025f55 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1217,6 +1217,8 @@ static int clk_mt6779_apmixed_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-- 
2.25.1

