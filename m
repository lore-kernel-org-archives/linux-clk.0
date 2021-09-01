Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EB8C432BE
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 16:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B8BD610C8
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 16:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244229AbhIAQKy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Sep 2021 12:10:54 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:46508 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243950AbhIAQKx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Sep 2021 12:10:53 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B64E92255B;
        Wed,  1 Sep 2021 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1630512595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lhHDaTRo6QSIlk2kzI7mu6rbEdF/wT2v0tFyNBX3czM=;
        b=ZftyB+6wqWnBN8SzmlyUBDpKFH4AstsbputI+srhsQcFYE4u5kua7985YspK5pKZrOOJq8
        aIX7138G/DrJhwG/3HLjf56N08RHcLd4ZGq77x6xZylL48rCqU2t+799Ruqd7FkTLjhsrH
        dK1dpjlL70Mh7RPhjeEgsS6Y+qGdhnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1630512595;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lhHDaTRo6QSIlk2kzI7mu6rbEdF/wT2v0tFyNBX3czM=;
        b=kcBSAp+UQ2B2gL0xbv2VXdKWWO0S705eqX/wlxPO0Oax/c8PyuguV/uaaGhKeQTvnoc+Bd
        +ODx3tQw0QvQcrCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6D71913AE1;
        Wed,  1 Sep 2021 16:09:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id 4cBlGNOlL2EhDQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Wed, 01 Sep 2021 16:09:55 +0000
Date:   Wed, 1 Sep 2021 18:09:53 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     linux-clk@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 2/2] clk: versatile: hide clock drivers from non-ARM users
Message-ID: <20210901180953.5bd2a994@endymion>
In-Reply-To: <20210901180833.4558932d@endymion>
References: <20210901180833.4558932d@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 419b3ab6987f ("clk: versatile: remove dependency on ARCH_*")
made the whole menu of ARM reference clock drivers visible on all
architectures. I can't see how this is an improvement for non-ARM
users. Unless build-testing, there is no point on presenting
ARM-only clock drivers on other architectures.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Peter Collingbourne <pcc@google.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/versatile/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-5.14.orig/drivers/clk/versatile/Kconfig	2021-09-01 17:28:15.853037684 +0200
+++ linux-5.14/drivers/clk/versatile/Kconfig	2021-09-01 17:32:58.498817653 +0200
@@ -2,6 +2,7 @@
 
 menu "Clock driver for ARM Reference designs"
 	depends on HAS_IOMEM
+	depends on ARM || ARM64 || COMPILE_TEST
 
 config CLK_ICST
 	bool "Clock driver for ARM Reference designs ICST"

-- 
Jean Delvare
SUSE L3 Support
