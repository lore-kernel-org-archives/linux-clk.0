Return-Path: <SRS0=xLj1=TE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561D6C43219
	for <linux-clk@archiver.kernel.org>; Sat,  4 May 2019 00:17:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D4B120652
	for <linux-clk@archiver.kernel.org>; Sat,  4 May 2019 00:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeQsoIXn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfEDARl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 May 2019 20:17:41 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:32950 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfEDARl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 May 2019 20:17:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id k19so3492301pgh.0
        for <linux-clk@vger.kernel.org>; Fri, 03 May 2019 17:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=T0GFsU5iTOyCwj8QNb5BtH0GpMGDHOczgY1Uj/CZHXk=;
        b=oeQsoIXnKAJoKnIszLlOgMj6J9duncW8mzUEey2yO4oNzCVnmVL0XX+8v9FM5pIy2s
         lj2aO3Aoo+Ij4241jr1fnMBi8z2hYk1KgQr7A2eOY8hTzfApsR4JhFNawomFUYNI1rzI
         8kKJt+eaMdWlosvTyjoMnPmu5jUASwgPiJ2D49QPZe5GVpAGEHSdgtJ2pp0tvNrK8/nP
         YD0IxCHRQojMDUkPcZQrUq/fYJcRrENPVAf7wOFaRMVYXyqZsqNu2kP0a1NL/B9+izSu
         WMuD+dGAQClX7s8+hSZr27NH9SDNlHuoEMnsc31/PEFQyzW5OUmzcrzHkI6/MnOawgA/
         VMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=T0GFsU5iTOyCwj8QNb5BtH0GpMGDHOczgY1Uj/CZHXk=;
        b=LKMFriD3n6/aGMzRbdJ/vmJ9QwoxPzz+IQ6HmUV8z+17XMUDaYyDchLXxLVVPvweNi
         2aUkiMi65UKBf9OM5S/4oiA8X3T60kJkXkHeQuehBbgYRrNBa2WoZFcGv6Ja2gBAupK+
         d31LWqIgb1Bw6D10YS048uGdiVJdvRsaoNb6ExZ7dANbzclhqmhXhIjgYH1jUG0EHapI
         1JZeF9O/6uy7Fb1JINkPSicNIe6pVdDcTTX6QdKryvn3A+ip4CGY+j0zld8Cr0U8WQKR
         +leMIaYCFyjxCz7aM70dV7dZfN+jDYEa8CQSx3fsK3iwPdLA/V/JL7KTaZn6VVuyZDXA
         LADQ==
X-Gm-Message-State: APjAAAVz7W1wFn0nNyxCnWCfWpRybOsP32xAP+MlGscif9Xj69ZvykE0
        qKvoVC0gQJp1jERSZMHwl6eu3ovQkLE=
X-Google-Smtp-Source: APXvYqyEjLXIJyLHnBMCT+wiJSfzdTRGABuxSLtEAXX8MsYrKBxK/Ma8r1oNRsXOlNMqaMEy5XECgw==
X-Received: by 2002:a62:4690:: with SMTP id o16mr15035772pfi.166.1556929060198;
        Fri, 03 May 2019 17:17:40 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 144sm4364785pfy.49.2019.05.03.17.17.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 17:17:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gdsc: WARN when failing to toggle
Date:   Fri,  3 May 2019 17:17:36 -0700
Message-Id: <20190504001736.8598-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Failing to toggle a GDSC as the driver core is attaching the
power-domain to a device will cause a silent probe deferral. Provide an
explicit warning to the developer, in order to reduce the amount of time
it take to debug this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index dd63aa36b092..6a8a4996dde3 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -149,7 +149,9 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 		udelay(1);
 	}
 
-	return gdsc_poll_status(sc, status);
+	ret = gdsc_poll_status(sc, status);
+	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
+	return ret;
 }
 
 static inline int gdsc_deassert_reset(struct gdsc *sc)
-- 
2.18.0

