Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37777C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 11:18:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3A4A64E70
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 11:18:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhBLLRx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Feb 2021 06:17:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhBLLRw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Feb 2021 06:17:52 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E1DC061574
        for <linux-clk@vger.kernel.org>; Fri, 12 Feb 2021 03:17:12 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id lw17so261668pjb.0
        for <linux-clk@vger.kernel.org>; Fri, 12 Feb 2021 03:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hv7MSJVHtHXztJBfrSH2Nz4awP2XcECwcmmy9ZhdyEc=;
        b=U7q1M4AUe1upYev75AvznpBzLqxHDrs6VH71WqHkutQDeQjhqE/ItVHv1YIo3kPjZx
         cxR2bl9eKMo4V+OqjQ4neNup/bok1cG0545eQg2BN6rK1oK9N84+NOwqklVTGm5s49vx
         PE37zK4yIEgoMfFYtFgZdjsW7yEwBSEYNC40M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hv7MSJVHtHXztJBfrSH2Nz4awP2XcECwcmmy9ZhdyEc=;
        b=rEhPer/aVbvfDJGDZZ+pFQ8FV2duTWLy94PSkdrCw5pJli+Ca9BryCGmApG7u37+8W
         l85P7aT18h0qnVrv3OFoCQMOYfEQzEWoNhwD8shQFSDR3zWvOJLTtt3/AYOZAzCWlQ/D
         YzEWIGmL8YgRnofF5fIC1URmglsKXGYkB7w4tCNe2Nt5uDKSucNNp/CXokvU5+Z8C4aP
         /g3pb5O0C5MpvSFB1qSPYB4IZNSuRsU06CBF4acxb+ePHg1RbLzhNduh7WZ873lKUfN0
         KCfECgEkqUcl37u48Kb304nPLUTIYDlS857R/QKFy3uySWzVO0SlsB4lbs+21bFFOFgB
         GTug==
X-Gm-Message-State: AOAM532ZslZHmG0x+wqCNXlUnfcFc9kjqH+O2ObyXv+za3X3rPbEVZin
        ZTwnPx/XXFE0BT6ejzv25KAt0O18bk4EFA==
X-Google-Smtp-Source: ABdhPJxEuXqr7x4iyj35D8dZS/g8HLKTsn1k/I7QIfJPLc3C7aTm8jXEWF05G1Q2LzoSD9+BCGi9mA==
X-Received: by 2002:a17:90a:fe89:: with SMTP id co9mr2334345pjb.83.1613128631779;
        Fri, 12 Feb 2021 03:17:11 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id h20sm5752662pfv.164.2021.02.12.03.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 03:17:11 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 0/1] Potential binding MStar clk muxes.
Date:   Fri, 12 Feb 2021 20:16:48 +0900
Message-Id: <20210212111649.3251306-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,

While getting this driver ready to send I realised the current
binding I have is pretty unwieldly. I'm thinking of refactoring
the driver to work like this binding desribes and would like
some feedback before I rework the driver.

Thanks,

Daniel

Daniel Palmer (1):
  dt-bindings: clk: Mstar msc313 clkgen mux

 .../clock/mstar,msc313-clkgen-mux.yaml        | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-clkgen-mux.yaml

-- 
2.30.0.rc2

