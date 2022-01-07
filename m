Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9901CC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jan 2022 20:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiAGUts (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jan 2022 15:49:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40184 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229452AbiAGUts (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jan 2022 15:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641588586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=rFO4WJY3j7pAXTu1RPPXXQTX/D3JtAjVln6pv17Se70=;
        b=fr4BjV9YAlPLtiR/YM39o8LC+bQqU5dR2YqshHCMYCoVOiJHYapnmIl2Dc0/8R7in2Cbj/
        RpOQLKM0TYO8u09+pYTWyJyFbGSY9cTms8SaofNJsSPBdP6hQFBugVvDoKedj8XhOluVux
        S+gSJ+XH2dmuBUfanWgFAQmuUqQ6Vfk=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-UZG1BwXKMN6q3PJh0_qf5A-1; Fri, 07 Jan 2022 15:49:45 -0500
X-MC-Unique: UZG1BwXKMN6q3PJh0_qf5A-1
Received: by mail-ot1-f69.google.com with SMTP id v22-20020a0568301bd600b00590a8d65e0fso241160ota.4
        for <linux-clk@vger.kernel.org>; Fri, 07 Jan 2022 12:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rFO4WJY3j7pAXTu1RPPXXQTX/D3JtAjVln6pv17Se70=;
        b=Jk1+Kl02KZuR1OAQfoB1bhAGUGicM2DxNylAsuC6IfrdcETLqtMUGOi9FGCcV732NO
         0UzJs73Ud56mS910WCw/dtZ79vj1ZVs2AcOsedqqf/UQH+Rjv5yuCncufAOmcvA58pvL
         4mVCzmWq6EDt87QzOb9hXSdKBR5+4b9fzGGaW2Iz+Ch+eoy8FNtNznKVmKtI1BIFKx/q
         ppI02z+9cc2JKHEmwDhjPS2Hp4XAeWoGHGJFWZN0QnOYUV+zQYIQvD+h5v0QKXjh/kZd
         mElReg7cWgkqG33qKPaOwhf+2jCCF2OgpJPwrjl+KHuQVO/LJShpSZHO/Frd30X3yZWe
         wTog==
X-Gm-Message-State: AOAM5304yCqiqfNCTqKHDwfRuVoJ7CeDKKo2Epe8zeYgqK2FN58trRIE
        BznSW3w5t+gq8w9qfpdVIhCqCCA5U4k/fpSnaueSdLgFHvUPqwXmBsGLbQp1OMRJpvF9wXq2z+2
        AMWeNgF6bHeecnKLl4N9u
X-Received: by 2002:a05:6830:2b14:: with SMTP id l20mr47451464otv.42.1641588585254;
        Fri, 07 Jan 2022 12:49:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoF/ZqeM2gXeI5h7MGTxjtgzAX2We+Kfkvc0DuwXwOA198L3Mc61AmDSUseGbyUBDzv34mkA==
X-Received: by 2002:a05:6830:2b14:: with SMTP id l20mr47451453otv.42.1641588585073;
        Fri, 07 Jan 2022 12:49:45 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id e4sm1133222oiy.12.2022.01.07.12.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 12:49:44 -0800 (PST)
From:   trix@redhat.com
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nobuhiro1.iwamatsu@toshiba.co.jp, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: visconti: fix array's data insert check
Date:   Fri,  7 Jan 2022 12:49:39 -0800
Message-Id: <20220107204939.3939151-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Clang build fails with
pll.c:292:20: error: address of array 'ctx->clk_data.hws' will
  always evaluate to 'true'
        if (ctx->clk_data.hws && id)
            ~~~~~~~~~~~~~~^~~ ~~

This check protects inserting into the clk_data.hws array.
clk_data is allocated a trailing element of the ctx struct.
If the ctx is ok, the ctx->clk_data.hws will be ok.

Change to checking if 'id' falls outside of the array
bounds.

Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and reset driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/visconti/pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/visconti/pll.c b/drivers/clk/visconti/pll.c
index 3b6e88bb73d5b..7f2e1016536ab 100644
--- a/drivers/clk/visconti/pll.c
+++ b/drivers/clk/visconti/pll.c
@@ -289,7 +289,7 @@ static void visconti_pll_add_lookup(struct visconti_pll_provider *ctx,
 				    struct clk_hw *hw_clk,
 				    unsigned int id)
 {
-	if (ctx->clk_data.hws && id)
+	if (id < ctx->clk_data.num)
 		ctx->clk_data.hws[id] = hw_clk;
 }
 
-- 
2.26.3

