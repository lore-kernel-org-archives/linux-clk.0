Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2175C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 01:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjCABZS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 20:25:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjCABZQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 20:25:16 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB5034F45
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 17:25:10 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536c525d470so251173407b3.18
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 17:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677633910;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZpTjGf5rdoQrgqg7m4j1olf7isTwZLPPEo4N4KGMcEs=;
        b=hnTdUjyTCG1DL6zERdTUrA97PhKyOaq0DWq2c9TjFvgD03M+6Rz1RJ29eEhFtQ2K3x
         ynq9A0MtP8Gpzq2Df51cg/lFNDyOOtaBU0mLfjOHN4XM3YELSr6JP3MthxlcVPHim8Ps
         E5iZfA47Uk0nPAsBX3OeDyRXUuXnkdvPuhC2LchztHuptIc0238iaPA1EF/qGkZyV9sE
         LFYa9AtV6FRPqwp3N28F+BrM9ZYnU3pL0mbXQ0KOcp3sL3BDHKk0GOvuaB88+dc+bv81
         n5Nci47Cjga1UwbaLyH3vfE+EaYhv1VcuJ2GykLZvDUVHDazOLOtEXHUwzIeWbl1coR7
         bveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677633910;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpTjGf5rdoQrgqg7m4j1olf7isTwZLPPEo4N4KGMcEs=;
        b=rfTh9Zfs9YVTahqSEl9AU8gmTp40zSvhbLi5E9hL4zCf4Wa7EWXRXGmEgJwXNZ2B9x
         4D++sBY9JMWLWhVYmnl5Irpf1jNRApEu8hUK4qauXkj62wd82RtRZV1edgihUTw29190
         ScOYgXp1ROSPupV1Y3ZoQkJo/SN51+Lr4AVQXb7fk0g1uVi9SxDCBVtxCH3Wgq+XUwEN
         Gdjx5YpoV9rHn/i/37mQQuwZAU5u47nEqawg7XBh72RdTljhhrIIhKcMfUztxV8FKu+a
         cFI1UgtIHEsom738CTn32VSESSB14sWEavVKuxmLAkCGxN3tGJeaMezdvsLvtuvo+OJO
         izKQ==
X-Gm-Message-State: AO0yUKV8mdSeWZkjCwucnopjK+3RBwpmdJEHW8smcwTsP/7NROceCckc
        Z6mgUDr39Dc0Poq3G46n+SY6Buv2s/gfUnM=
X-Google-Smtp-Source: AK7set8XzvTlY3Lelpk8wWvtM+smDcvIiIuFVaO7S/PpYpjk8CTakqtZKPi9Od/tLawpoxrRPPIDOdt1aEYwb+w=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:debf:1aed:5c45:c92])
 (user=saravanak job=sendgmr) by 2002:a5b:50:0:b0:ab8:1ed9:cfc5 with SMTP id
 e16-20020a5b0050000000b00ab81ed9cfc5mr1566210ybp.6.1677633909687; Tue, 28 Feb
 2023 17:25:09 -0800 (PST)
Date:   Tue, 28 Feb 2023 17:25:06 -0800
Message-Id: <20230301012506.1401883-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Subject: [PATCH v1] clk: Mark a fwnode as initialized when using
 CLK_OF_DECLARE* macros
From:   Saravana Kannan <saravanak@google.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, kernel-team@android.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CLK_OF_DECLARE macros sometimes prevent the creation of struct
devices for the device node being handled. It does this by
setting/clearing OF_POPULATED flag. This can block the probing of some
devices because fw_devlink will block the consumers of this node till a
struct device is created and probed.

Set the appropriate fwnode flags when these device nodes are initialized
by the clock framework and when OF_POPULATED flag is set/cleared. This
will allow fw_devlink to handle the dependencies correctly.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reported-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/lkml/CACRpkdamxDX6EBVjKX5=D3rkHp17f5pwGdBVhzFU90-0MHY6dQ@mail.gmail.com/
Fixes: 4a032827daa8 ("of: property: Simplify of_link_to_phandle()")
Signed-off-by: Saravana Kannan <saravanak@google.com>
---

This is fixing a patch that landed through driver core. So, should Greg
be pulling in this fix?

-Saravana

 drivers/clk/clk.c            | 4 ++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ae07685c7588..8bd5b9841993 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5361,6 +5361,10 @@ void __init of_clk_init(const struct of_device_id *matches)
 				clk_provider->clk_init_cb(clk_provider->np);
 				of_clk_set_defaults(clk_provider->np, true);
 
+				fwnode_dev_initialized(
+					of_fwnode_handle(clk_provider->np),
+					true);
+
 				list_del(&clk_provider->node);
 				of_node_put(clk_provider->np);
 				kfree(clk_provider);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 842e72a5348f..93c0b06a0f2b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1373,6 +1373,7 @@ struct clk_hw_onecell_data {
 	static void __init name##_of_clk_init_driver(struct device_node *np) \
 	{								\
 		of_node_clear_flag(np, OF_POPULATED);			\
+		fwnode_dev_initialized(of_fwnode_handle(np), false);	\
 		fn(np);							\
 	}								\
 	OF_DECLARE_1(clk, name, compat, name##_of_clk_init_driver)
-- 
2.39.2.722.g9855ee24e9-goog

