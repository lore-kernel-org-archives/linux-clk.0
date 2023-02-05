Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A23C636CC
	for <linux-clk@archiver.kernel.org>; Sun,  5 Feb 2023 03:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjBEDCp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Feb 2023 22:02:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjBEDCo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Feb 2023 22:02:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402904481
        for <linux-clk@vger.kernel.org>; Sat,  4 Feb 2023 19:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675566113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Rc1Rh+5JjEe0b8phxZCvxG2nnz2wqGygUGi1H3bm4Pk=;
        b=fpSAawGHXJ7BKDOstrTbQQT+MzsGjfACkJemozzrydZIJ3dVLT1jJjepNhLmuwDW78kwC9
        CHcUuRpbSUV8feofwpyIjGoShA/5HNsE8UZfMTxVyZiCvHMKLrzsXCI7/MZAnpqFI6h4AD
        uTeI5xQcYJZ/v7bpRyqxhNMd8PQCrto=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-450-7SzvpHWlN_uO186FrvIuOg-1; Sat, 04 Feb 2023 22:01:46 -0500
X-MC-Unique: 7SzvpHWlN_uO186FrvIuOg-1
Received: by mail-qv1-f70.google.com with SMTP id l6-20020ad44446000000b00537721bfd2dso4515855qvt.11
        for <linux-clk@vger.kernel.org>; Sat, 04 Feb 2023 19:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc1Rh+5JjEe0b8phxZCvxG2nnz2wqGygUGi1H3bm4Pk=;
        b=An4t+nk0/xIGYXj9gtBbsBO+9sQuhByCXFrOpflupDToNBHy/WRCAx0q/3Rsu1u9Ue
         yF+7fntxFsW5nwnmls7+ZMCDRfo+lNbzg6iDRxYhdPVllCk/f2a0Er/Ywjk+w8T/VV27
         QXnYtTTg5JaaVhfhdQhbo58oNvOtaNPZVqILDnOlRXv3oo5TBX+LDlqnp4/eYqDSosWU
         d/MYwx7NzzsmuF4Hi2ih7KOe36sCyAvDRjYtNSM3iGxzN7IO4W5iEG9qS7+tSnXrv5xV
         HumqifMpMFIVXN/lFYK579zKcslGPX/M/rbRWLx1tmUiplMo9t48oah14Y4vWy4yjE0b
         +ulQ==
X-Gm-Message-State: AO0yUKWziA2kxFhsNrypZsE52i1EsR5PiASKHBsdjYKsJ0wXUNeyo/g6
        Gi3vRvmywiE9Y8xKRnrW8bDMBq3aRirZWaFN0Scrx5COg1GAe2BORw8B1wrx8ojN0hPLZ7ulX7Y
        iSCnWoGzfJmEiY3GoXCXT
X-Received: by 2002:ad4:5191:0:b0:537:77b2:8aab with SMTP id b17-20020ad45191000000b0053777b28aabmr23430363qvp.27.1675566106438;
        Sat, 04 Feb 2023 19:01:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8bN7F7Fny2DRi/DyfvIZwdVQGkpozPBd6lorCA4FvWU8tSytLGnd4Yc7/ZDZ6JBiU3+JXWnw==
X-Received: by 2002:ad4:5191:0:b0:537:77b2:8aab with SMTP id b17-20020ad45191000000b0053777b28aabmr23430344qvp.27.1675566106180;
        Sat, 04 Feb 2023 19:01:46 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id b24-20020a05620a0f9800b0071ba3799334sm4791906qkn.58.2023.02.04.19.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 19:01:45 -0800 (PST)
From:   Tom Rix <trix@redhat.com>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: imx: set imx_clk_gpr_mux_ops storage-class-specifier to static
Date:   Sat,  4 Feb 2023 19:01:38 -0800
Message-Id: <20230205030138.1723614-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

smatch reports
drivers/clk/imx/clk-gpr-mux.c:73:22: warning: symbol 'imx_clk_gpr_mux_ops' was not declared. Should it be static?

imx_clk_gpr_mux_ops is only used in clk-gpr-mux.c, so it should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/imx/clk-gpr-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-gpr-mux.c b/drivers/clk/imx/clk-gpr-mux.c
index 47a3e3cdcc82..c8d6090f15d6 100644
--- a/drivers/clk/imx/clk-gpr-mux.c
+++ b/drivers/clk/imx/clk-gpr-mux.c
@@ -70,7 +70,7 @@ static int imx_clk_gpr_mux_determine_rate(struct clk_hw *hw,
 	return clk_mux_determine_rate_flags(hw, req, 0);
 }
 
-const struct clk_ops imx_clk_gpr_mux_ops = {
+static const struct clk_ops imx_clk_gpr_mux_ops = {
 	.get_parent = imx_clk_gpr_mux_get_parent,
 	.set_parent = imx_clk_gpr_mux_set_parent,
 	.determine_rate = imx_clk_gpr_mux_determine_rate,
-- 
2.26.3

