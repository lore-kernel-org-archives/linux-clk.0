Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D569EB64D9
	for <linux-clk@archiver.kernel.org>; Sat, 17 Jun 2023 08:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346275AbjFQIJz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Jun 2023 04:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346295AbjFQIJy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Jun 2023 04:09:54 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B401FD7
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 01:09:53 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-57059626276so18977007b3.3
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 01:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686989392; x=1689581392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iO7yYZHdApPLayvlEq96oV4J2Y5un4PdapCLJrNW4Uo=;
        b=NoD8C8BVIiciXMn2EjslqtsdVtrK3ecA1gC8tOPLR/c0iJOSaaAilbSxUznSxPVnry
         Hf1nLe4Wno8ZjBYPTtiptNdAjBt48QyjXi18yYVqNvNSSgF1fqLCuKWfj9sHlFKv0VsL
         +7VvP6uqMk5IVXslMyiQXzmVXR6b2aSIKoM0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686989392; x=1689581392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iO7yYZHdApPLayvlEq96oV4J2Y5un4PdapCLJrNW4Uo=;
        b=Nv1pWWV65kgsh5vIvVk76x5D3f3PjymjZYOIrFWD4obhgO8INFk5pSl9bW8tV2CG6x
         2qJDZ0bFIoACo+ufoi4z4DrmOIvt55J38hsoH5fiEXlMLXWXnAO4Mi3237CFE1iBaVbW
         EhzPNNPjBlnakiZpn5gHjGphoTJs1VCW80fa09W9bsn/kXMTgwPB1mZ9df0Vzi9krNoz
         ruqphr90lhCm2hUC0a4PjykDGiw8ACZjFUjVhg/OOzGHWRqC+ktrFRe0Nsf7FncWU7lW
         U/NT9T1B9K8gE5ZSsQ9BQiLHk3kRAORWLmTsBqWhlv2uoM2t1Wf5LGtQOL3FNvo70MCe
         eELg==
X-Gm-Message-State: AC+VfDxkMvx9eVEHs6z/Yl/2wbMKQ73/S7lgSQTzPpv8SpAMXWzvRZNT
        arcGCrFghFkFcFkAoT5FKiYwMkiq9L2/UHtWmA8=
X-Google-Smtp-Source: ACHHUZ45EzJEURRjW9tyst7zDQWL4xDWtCn2NjObo0iROo22obHy5cJ5ETkNX32sCKD4Uqofs7aAqw==
X-Received: by 2002:a0d:d8c2:0:b0:565:8c16:a0e1 with SMTP id a185-20020a0dd8c2000000b005658c16a0e1mr5223821ywe.13.1686989392392;
        Sat, 17 Jun 2023 01:09:52 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:f83b:769f:1443:112])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902c2c400b001aaf536b1e3sm8476488pla.123.2023.06.17.01.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 01:09:51 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fei Shao <fshao@chromium.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: Fix memory leak in devm_clk_notifier_register()
Date:   Sat, 17 Jun 2023 16:09:01 +0800
Message-ID: <20230617160901.1.I2b151cdf7a72d9e3ecc7ab2ff38409ebe6d65d6b@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

devm_clk_notifier_register() allocates a devres resource for clk
notifier but didn't register that to the device, so the notifier didn't
get unregistered on device detach and the allocated resource was leaked.

This fixes the issue.

Fixes: 6d30d50d037d ("clk: add devm variant of clk_notifier_register")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7ac9f7a8cb84..c249f9791ae8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4741,6 +4741,7 @@ int devm_clk_notifier_register(struct device *dev, struct clk *clk,
 	if (!ret) {
 		devres->clk = clk;
 		devres->nb = nb;
+		devres_add(dev, devres);
 	} else {
 		devres_free(devres);
 	}
-- 
2.41.0.162.gfafddb0af9-goog

