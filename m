Return-Path: <SRS0=XLdV=EC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A881C4363A
	for <linux-clk@archiver.kernel.org>; Tue, 27 Oct 2020 18:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 303E3208B8
	for <linux-clk@archiver.kernel.org>; Tue, 27 Oct 2020 18:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WymB0rXz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371301AbgJ0S6J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Oct 2020 14:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57004 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S371274AbgJ0S6I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Oct 2020 14:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603825085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=/w7n3wo/ogMNJSBrl9q8TgkOqP0Cfiwxz1gfe/57UsA=;
        b=WymB0rXzUiXBR+OG2luMf5g0CDve48dfDjLaGNEaX0o1TPZT9V+RItECqIIXNTjpAjrstr
        jLIz4c6LNPzurW1AGlaqvKj4A8q6MlNH7Qig2hlPE9TFDZmw8r8GP2gHM3+hMbe5fIoPmt
        IKtGQR+0vB2Kw63ms6/n2M8iSnWLGnw=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-U-JsI0v_OsmT6yW4zz3rFw-1; Tue, 27 Oct 2020 14:58:03 -0400
X-MC-Unique: U-JsI0v_OsmT6yW4zz3rFw-1
Received: by mail-ot1-f72.google.com with SMTP id l8so746853ots.22
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2020 11:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/w7n3wo/ogMNJSBrl9q8TgkOqP0Cfiwxz1gfe/57UsA=;
        b=LWaZhqsXOe7vqpPXrzefRhHvt+vg1q9s+yLrrECf3CgxUJaPughiZTDYpxSsV5Szmh
         B3CUNKBm32rSBFcNugZrBsAxfRHltIqinKQlASSYWu5wQQFOd/OXsl6/i/HYg1Wuvqkd
         6dEGzOyjat9zTO7HQbVjBjqLYFQCc2n10rYm9OLJAf3C2TSoehPBSuXBSbv37U6MYt7c
         RVKXQ0ul+lAKEb7VRXtwhrBfRrSxiwoT2ZclgKQmykve84lCr0FeF8ZD18Uda/qdL8Ts
         TBsKaXIGGams3ZhN/JhMQ0l3Ih1+uelQ76qsZ2XC7nuPATLulGRp5S40KnUsgaF1Ogh5
         F04Q==
X-Gm-Message-State: AOAM533DrpomrAqURa7MvEwW6KdZH7oBZY/lFIjFC1u/Dmc1hnhUON4h
        HuPsf0gOdWjeRE30BTi96Vh8LL785h+tP6KGrXGRhYGHQcTao01eGO3RUHWftQKvX52lMez19Vu
        aj+uskN24ZdyMe2CzNn4P
X-Received: by 2002:a05:6830:10d2:: with SMTP id z18mr2320855oto.41.1603825082559;
        Tue, 27 Oct 2020 11:58:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYGhvIxX/WWpgZFdD22OWQEZoC9GCiKRCLyoHJyIbNVn7keqIqMsFXtqbWyOFnR+FdTTxhYA==
X-Received: by 2002:a05:6830:10d2:: with SMTP id z18mr2320838oto.41.1603825082332;
        Tue, 27 Oct 2020 11:58:02 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id j97sm1433795otj.37.2020.10.27.11.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 11:58:01 -0700 (PDT)
From:   trix@redhat.com
To:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Anson.Huang@nxp.com, abel.vesa@nxp.com,
        peng.fan@nxp.com, leonard.crestez@nxp.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: imx: remove unneeded semicolon
Date:   Tue, 27 Oct 2020 11:57:56 -0700
Message-Id: <20201027185756.1586607-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/imx/clk-pll14xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index aba36e4217d2..2b5ed86b9dbb 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -416,7 +416,7 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 		       __func__, name);
 		kfree(pll);
 		return ERR_PTR(-EINVAL);
-	};
+	}
 
 	pll->base = base;
 	pll->hw.init = &init;
-- 
2.18.1

