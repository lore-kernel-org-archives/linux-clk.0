Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ED4C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 17 Nov 2022 11:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239307AbiKQLC2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:02:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239595AbiKQLBZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 06:01:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E198205F0
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 02:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668682767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=NHqZVSUZPL4fN7KKyUIajXaGhTjFsMLtpxufRffoPO0=;
        b=fvFFVmmlugG7DofSMJJ312fMWRtPwDoGgMCGOuOE51+Gy6b8c1q/H1rdPRjNvlX/8F3QWW
        Eg5JOk+dhObWpjlwILe4mLtgvZGKMDQrknIFtQHPklfrqYTEq3A/oP7CrDPvGbjtXbDkKd
        ZuDSNS7KaXNtOvj5z1YbvdF2WgrBCcA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-Bf9NGeJIM8iU40sXu611qg-1; Thu, 17 Nov 2022 05:59:25 -0500
X-MC-Unique: Bf9NGeJIM8iU40sXu611qg-1
Received: by mail-qv1-f69.google.com with SMTP id d8-20020a0cfe88000000b004bb65193fdcso1268710qvs.12
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 02:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHqZVSUZPL4fN7KKyUIajXaGhTjFsMLtpxufRffoPO0=;
        b=zt/T4OrY/VYL6RsSQWKoMFJFfaZ5qxEqZ+hTL21Z1IiJnAS19ji70m3Un3N2vorOvW
         dd7EDbbRjPEmQBKwY/M5eXOQXir0VKqw9aB9DJmkdLS/PIFWlDbjqLSQEL5YWXPrHWb0
         Wv2q73HEYJyj33/qeu9GtYEVML9KRmdcexY1VALgmyl56k9gD9kRtHVvTGMkrS7CPiaa
         oDjbM4O2wMEggLWgi68XWHmuDFJdu2bEoa4OjObLlLQYPGXASnvVxtNNPR4L7oE8X4ry
         bgsxBhkony2+/v28VxOHVvFiKkt6TjlPqk+Fpentxamp9STY21TKK3eK2lYHy3HXkCwK
         S3MQ==
X-Gm-Message-State: ANoB5pk2bJbzECz2hLP3J1Vx/HI6Xwgl8zC0lZYxGCrVfKdaPLYwoBM0
        kjUF58f3QOF1/wHl40crJaJ8knT0SP1G8sKE4XZdOH/mkvy5sY4DozjFqcnez9ow2RFMIc/9CpM
        eTV1q3zZpznVLeMKnjem5
X-Received: by 2002:a05:622a:1c1b:b0:39c:d5cd:848e with SMTP id bq27-20020a05622a1c1b00b0039cd5cd848emr1598589qtb.294.1668682765185;
        Thu, 17 Nov 2022 02:59:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4tEcsbNaCntauYyT3prVUMPVvxQYyD+D9GBgxd8uTGR7ZKequMv/3F6KVAscjxQWvnFW7ULw==
X-Received: by 2002:a05:622a:1c1b:b0:39c:d5cd:848e with SMTP id bq27-20020a05622a1c1b00b0039cd5cd848emr1598583qtb.294.1668682764977;
        Thu, 17 Nov 2022 02:59:24 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id d7-20020ac86147000000b003a5c60686b0sm202843qtm.22.2022.11.17.02.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 02:59:24 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: add debug message showing which unused clocks are disabled on boot
Date:   Thu, 17 Nov 2022 05:58:29 -0500
Message-Id: <20221117105829.256717-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk framework on bootup will automatically disable all unused clocks
on bootup unless the clk_ignore_unused kernel parameter is present.
Let's add a basic debugging log statement here that shows which clocks
are disabled. There is already tracepoint present here as well, but
there's nothing like a simple, good ol' fashioned printk for simplicity.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 57b83665e5c3..ddf5a48e72b6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1352,6 +1352,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	 * back to .disable
 	 */
 	if (clk_core_is_enabled(core)) {
+		dev_dbg(core->dev, "Powering off unused clock %s\n", core->name);
 		trace_clk_disable(core);
 		if (core->ops->disable_unused)
 			core->ops->disable_unused(core->hw);
-- 
2.38.1

