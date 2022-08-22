Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E618C28D13
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 08:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233399AbiHVIOw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 04:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233750AbiHVIOt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 04:14:49 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E4C1A83F
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 01:14:47 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id w13so3650876pgq.7
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DRMOGZpV+QIISp4JRXmMjfwQlEf6dwNCOFyN0rcigzk=;
        b=SqWGfE6mo5mD0EZqSJ3GMcIwpU2eCmW5vM8lKGmwtj5eU0LzYYVKEUJJg5Nn2RvB6J
         zbhTyIZqVUR/AqgYJvNP1BWSrwNYzaCxTgJhI4LwgMo3bTLjYX0FKFUqivpNkvzo8a5u
         OLAt2cO3XchHdpwIHe1qBtoeW2LtksfKBHUZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DRMOGZpV+QIISp4JRXmMjfwQlEf6dwNCOFyN0rcigzk=;
        b=dppHxLkdx/naKn4+lMfXJwKPk2bHRy2s77IiRbwLn8b7k4YMT2EdvAvEbGM82MQ6GD
         FolWKCCs6/wiRJGzBAEEwA2h9ZvIGxfU9vXNWNWW/u19ps3XrVLwForr2+EtBgAmhCIm
         AmsXXmzYpm6ntqM1hhKKuIPqcOssGDc5efrULKYrCaxRD08v/bjflubQG4gUnNJfFQs4
         CoeZqeF14rk96asgikIhAQKTUyUDk5dJLmOhw05JAmQcAOnD2vKV3KfjpPJ5IAzs7Kqq
         A/j6NfXPK+kN9GdgebflFDggW+KVREiSrSHhpB1wAa4E5P6JPqGRuCRSyUHZkc2bfBS4
         0DxA==
X-Gm-Message-State: ACgBeo0XwmXuqlzUGa8M5GeFLqJw//jkwBlEUGNXMEmGs5MVtUsUrg2r
        i7nYJsnTexDDtmCytVHQJeruJQ==
X-Google-Smtp-Source: AA6agR7FUSE/XVfJ8Cj1cg1uhQsLHSg8Z9o+NFkZND6FLlZQjawGZ1icjFjdujCiYH2AxKCkBGSW1A==
X-Received: by 2002:a63:89c7:0:b0:429:fab3:96d7 with SMTP id v190-20020a6389c7000000b00429fab396d7mr16734118pgd.597.1661156086719;
        Mon, 22 Aug 2022 01:14:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d583:9d7d:3429:1b4b])
        by smtp.gmail.com with ESMTPSA id f184-20020a6238c1000000b00536b3fe1300sm1204858pfa.13.2022.08.22.01.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 01:14:46 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 2/2] clk: core: Fix runtime PM sequence in clk_core_unprepare()
Date:   Mon, 22 Aug 2022 16:14:24 +0800
Message-Id: <20220822081424.1310926-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220822081424.1310926-1-wenst@chromium.org>
References: <20220822081424.1310926-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In the original commit 9a34b45397e5 ("clk: Add support for runtime PM"),
the commit message mentioned that pm_runtime_put_sync() would be done
at the end of clk_core_unprepare(). This mirrors the operations in
clk_core_prepare() in the opposite order.

However, the actual code that was added wasn't in the order the commit
message described. Move clk_pm_runtime_put() to the end of
clk_core_unprepare() so that it is in the correct order.

Fixes: 9a34b45397e5 ("clk: Add support for runtime PM")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9b365cd6d14b..2e29a72c68e1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -859,13 +859,12 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (core->ops->unprepare)
 		core->ops->unprepare(core->hw);
 
-	clk_pm_runtime_put(core);
-
 	trace_clk_unprepare_complete(core);
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_disable_lock(core->parent);
 	clk_core_unprepare(core->parent);
+	clk_pm_runtime_put(core);
 }
 
 static void clk_core_unprepare_lock(struct clk_core *core)
-- 
2.37.1.595.g718a3a8f04-goog

