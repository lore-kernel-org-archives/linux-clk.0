Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7515C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 16:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiGKQ1W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 12:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiGKQ1U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 12:27:20 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2177AB0F
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 09:27:19 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id k21-20020aa78215000000b005283ff3d0c3so1164622pfi.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 09:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=AI9VSSKfUAJq0F0wpBlSk+XMmmCJHlZ66YlR5SdU9/E=;
        b=XJOCF2hjgEIcyyljemwSCUCMLBCUcdXfpNhAGEaRJo4ZkAyIVFf/3TmKTSjcaSXMok
         /7FQb3FItAL26+kPYU57KJI9K3JSENx6e3ZEJW5u1Xqfyu0cuh4xyB08qXcDxmugdRam
         Igto/4zjQPVWFynrSOICpblUhiSxo1O32ZoyZd8F0sg6pm/NSHjMwKtH7DNlVptQT+xQ
         UP6dg8fGoQr/5u4FK9I4OBeZaTWr8M6hG0dldMhS7s7VrPWjX0Rolspmvh/KF1I86aVU
         j21VKFmEaTf2O94gvBl3Be0w73GLkfS/+aAd/hd1J19oJGK0Fwwutq1hdIQiDGXW6cI5
         dF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=AI9VSSKfUAJq0F0wpBlSk+XMmmCJHlZ66YlR5SdU9/E=;
        b=kYQnqw/A5v0nhOc535e0AtHd6kYfMOBMaCXQLkSRCmpDSIQul586uXikJjUcn2btle
         CnUF2qsoQpCaiez9ZoHncYdc/acASc0YVVPCYp0nwgGdecyXKoMmEOH31WU/6fNQ99Vh
         tp/pULn0CPliD89aM8oemaFAPhY5tyDxBAR4v8ECCL9hUbC7QIEGBJLQEt2SxBFud8jb
         DER87p7c8vI3FYmHQfZZGFaMOfmRhlqBsY5tEDSgr7NLgmfO5tmMDlOG30cHBxd86zxW
         WtW55BsgMKTowR/b8PIHsV8SVLdhd8MdL3WXb7DDI6Qfcc1mMIWxbk6CfduEen31+V/T
         tGWQ==
X-Gm-Message-State: AJIora/Myk9w62x5YovskVP7bdYTT02kx73wQ4cIIe0ckaGbCcPOuEJG
        W/lQ47hgI2mbp1i/s5e47wn9dT9p85GedA==
X-Google-Smtp-Source: AGRyM1tD/j9WRxYgHSoH/KZQ2O2qiduJtYWHUlyPQqPUyiNDItqwNNw9mPuBMggDC3CUfbX0jWbh5rwoHyUIUA==
X-Received: from dlatypov-spec.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3f35])
 (user=dlatypov job=sendgmr) by 2002:a63:710c:0:b0:40c:adcf:ce72 with SMTP id
 m12-20020a63710c000000b0040cadcfce72mr17092957pgc.310.1657556839298; Mon, 11
 Jul 2022 09:27:19 -0700 (PDT)
Date:   Mon, 11 Jul 2022 16:27:13 +0000
Message-Id: <20220711162713.2467476-1-dlatypov@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] clk: explicitly disable CONFIG_UML_PCI_OVER_VIRTIO in .kunitconfig
From:   Daniel Latypov <dlatypov@google.com>
To:     brendanhiggins@google.com, davidgow@google.com
Cc:     linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        Daniel Latypov <dlatypov@google.com>,
        Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CONFIG_UML_PCI_OVER_VIRTIO=y is needed to enable CONFIG_PCI=y on UML.
However, this causes test failures when running the clk tests, i.e.
$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk

A snippet of the particular error is:
>     ok 1 - clk_gate_test_parent_rate
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 45 at lib/logic_iomem.c:141 __raw_readl+0x9f/0xd0

This is triggered by this cast in the test:
   143          ctx->fake_mem = (void __force __iomem *)&ctx->fake_reg;
this seems to work except when logic iomem is enabled, i.e.
CONFIG_INDIRECT_IOMEM=y.

As a short-term fix, explicitly disable CONFIG_UML_PCI_OVER_VIRTIO in
drivers/clk/.kunitconfig so we can enable it for everyone else by
default in kunit.py.

The long-term fix probably requires something more complicated, like
  #ifdef CONFIG_INDIRECT_IOMEM
    logic_iomem_add_region(...);
  #endif

Signed-off-by: Daniel Latypov <dlatypov@google.com>
Reported-by: Maxime Ripard <maxime@cerno.tech>
Tested-by: Maxime Ripard <maxime@cerno.tech>
---
Note: this targeting the -kselftest kunit branch.
There's a commit that triggers this by enabling logic iomem by default
[1] and there's also a commit that lets disable it via kunitconfig file
[2], which this fix relies on.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit&id=6fc3a8636a7b0f7dbd6d0a4e450e765dc17518d4
[2] https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit&id=8a7c6f859a20ca36a9e3ce71662de697898c9ef5
---
 drivers/clk/.kunitconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
index cdbc7d7deba9..2fbeb71316f8 100644
--- a/drivers/clk/.kunitconfig
+++ b/drivers/clk/.kunitconfig
@@ -2,3 +2,4 @@ CONFIG_KUNIT=y
 CONFIG_COMMON_CLK=y
 CONFIG_CLK_KUNIT_TEST=y
 CONFIG_CLK_GATE_KUNIT_TEST=y
+CONFIG_UML_PCI_OVER_VIRTIO=n

base-commit: 7635778bac7e46458392c1261e3916e8e9e86860
-- 
2.37.0.rc0.161.g10f37bed90-goog

