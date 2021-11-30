Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A49C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 09:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235760AbhK3JF4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 04:05:56 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:54626 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235424AbhK3JF4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 04:05:56 -0500
X-Greylist: delayed 453 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Nov 2021 04:05:56 EST
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3GSs071Dz9vCGS
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 09:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WPU8HT2O_W23 for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 03:02:36 -0600 (CST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3GSr54w7z9vCFp
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 03:02:36 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3GSr54w7z9vCFp
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3GSr54w7z9vCFp
Received: by mail-pl1-f199.google.com with SMTP id v23-20020a170902bf9700b001421d86afc4so7912691pls.9
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 01:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JB/xnaYRERTHfThz3BeKOjYTQVcTowsU7QWWYd5kA3k=;
        b=OS2U0S97KdtYbru48E9PVinKaS8ajlz38Gs67N+WmxDHN5E7BtqqyV5aIK2NPvJQ7x
         JnMQ/apjMmGUkZ92r5R9HAojVBAZhdTKUh6DPCIMJNouHmuw1p9EJGxa0RcvhBle6/Kx
         m786DzGuNV2R4f4fbq/yI7qy7m4befRm+Q8j/QuytpySgeWe1rwPHQox2XB3lM7JXAB6
         zX8OGrkXmsbxg4lSPTuyHi0R1uEzWSlbeHJbaBszcw1K3NgSSbAP0cUln+bLUYSjBOsO
         93LxR8K4FvuTe0lJsLNRItn79ygLkvNyK6dxH/ZulD7Z9yhJOqhETWx97nB+lS33YKkw
         Pjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JB/xnaYRERTHfThz3BeKOjYTQVcTowsU7QWWYd5kA3k=;
        b=iBHiNLZkf8yNkrRA5i3azpZIdNGG5XTVTK9Nb+K0GmwLB+UIg+0OjwCBpI2ipy9rzC
         1058enndkYSUuxND3Ex/b/K+p2TmSaREg/qpQ/QUN2cPRmE1nn9hkyN7SPFQrFsf+L/7
         Mxm7vdDGDf8y7a2l/1SFSmqukU2SEeYKQeKFlVmfSM6ogYmosA+9i1U+9Z49gh2+QpHr
         6Eht2UrE++/hM0/AVwzQrG1dhLS69IaVu19E+46pB6JI+wTzo/I6CuLirSJ+Oxo03sb2
         tBzhVVNhBnQExb3jbWxBKOydiFdbTkQzz1DZUihZFNJsj0AC2Xr8Htrm8eUwa5cueYzA
         MVFg==
X-Gm-Message-State: AOAM533SPJKAl5hAasouPkp3dZ4ZXGKfCwZiS6J6gcoto5SE2V/2ix2R
        ubWGg6eoOQbFUqkSkC4Nd8Il9ma6WH4BbXXGCpr2lnfnoCIAnLo0rfIxHQSeUFFItE1Qx7Kagx7
        k60j1hZmGrIxYQP2qBwDM6D5B
X-Received: by 2002:a17:902:9349:b0:143:88c3:375e with SMTP id g9-20020a170902934900b0014388c3375emr66274423plp.16.1638262956004;
        Tue, 30 Nov 2021 01:02:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFrEQrsuwZ277titXaqT8fk1JaMbrMsWZ/xVKNYBxWfn8JVIFmUsszxNKjkAxJJjqUoJjMLA==
X-Received: by 2002:a17:902:9349:b0:143:88c3:375e with SMTP id g9-20020a170902934900b0014388c3375emr66274403plp.16.1638262955785;
        Tue, 30 Nov 2021 01:02:35 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id j38sm14209940pgb.84.2021.11.30.01.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:02:35 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "weiyi.lu@mediatek.com" <weiyi.lu@mediatek.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt2712: Fix a NULL pointer dereference in clk_mt2712_apmixed_probe()
Date:   Tue, 30 Nov 2021 17:02:28 +0800
Message-Id: <20211130090230.77618-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In clk_mt2712_apmixed_probe(), the return value of
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

Builds with CONFIG_COMMON_CLK_MT2712=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: e2f744a82d72 ("clk: mediatek: Add MT2712 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt2712.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index a3bd9a107209..08ef56f68c7a 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1266,6 +1266,8 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	if (!clk_data)
+		return -ENOMEM;
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 
-- 
2.25.1

