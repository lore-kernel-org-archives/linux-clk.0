Return-Path: <SRS0=LMZy=WR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D47C3A589
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 02:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83B9922DD6
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 02:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uK44JlaR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbfHUC5h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Aug 2019 22:57:37 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43239 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfHUC5g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Aug 2019 22:57:36 -0400
Received: by mail-pl1-f196.google.com with SMTP id 4so481678pld.10
        for <linux-clk@vger.kernel.org>; Tue, 20 Aug 2019 19:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0YPh4ZPworY3ZEjE24wMYeyXg9KZRbq3tqWyWWQ8XlQ=;
        b=uK44JlaR1k3uAS4AX3pTDEr/vTzJzlJG3h0cfLeudtdjt2eTHBjAcnUQl+nX8E2LhN
         qCLGyyMqNg23YESt9V6DoY3pHFBGGmRlYuDnqyYX+iShevZAV/Dn4G6IDT9lBXJAHj3m
         9nBp91YmOaxbaS1aW6IK2JuDZchAGjlCHl478vqdoYAm9UMDunVKLDVy/V3v899zP9Qi
         pvMu4EarvlbOHOzVJgP1hSfPL7LSJGBbhSmY1nMwmX9s3cTwlV+fc+8tAmc+OP4bZ1lz
         lyQ0oP9/J9EAAVm8Ir1EoxS8w8tmPI2dkAjFZC8t9BGt/ILxUKrdiBnGWy4sib1utZNq
         BqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0YPh4ZPworY3ZEjE24wMYeyXg9KZRbq3tqWyWWQ8XlQ=;
        b=FyFYcDubxlGwxfMXvpPFw5UYi3tEAPE+zaHY9j/VvSPlY+g6jdVaBmguNGlK6rVeAv
         a6UnmLUEdBBfoXi5piwdRDUz3LIcZtJ7v9dtao5xs4dLfWHHderLO4OfOw6k2f2aXFEv
         4K+4eElpVLVbj/kqjWPRoGlx/cQ6GELf5ef8v1Z7R9cZKwWmKNVGIpswN4ONjW7Fa2+n
         Y9iP5wnexNkuUHAdEjL2n8N9A5LNqMBW8aBc2Irh5vQOkRAdsho17t8f1s8fRXgmdj7y
         lZxGsvznVb7aqGEJ7jRSb4Ftz8S6tCxNijYCjjCs56sHUv6EvHjfaGpwtLHLBiXrw6+4
         Y5eg==
X-Gm-Message-State: APjAAAW5PGsBBcbCxOtRjR/Um72SlHimmkiZYoHbJiLkWppt99xR0FGx
        4oPOX2rf1d6sUAUe8ShWYvMR
X-Google-Smtp-Source: APXvYqxWX41fVvpAy5mDzcBY4knA0x++pNqIAFAUMif6+qT59dLNFyls0cGJowbkdKkvLw/bLqAyCw==
X-Received: by 2002:a17:902:b710:: with SMTP id d16mr25772303pls.165.1566356255979;
        Tue, 20 Aug 2019 19:57:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7101:175:ddd7:6c31:ebc7:37e8])
        by smtp.gmail.com with ESMTPSA id d16sm13251682pfd.81.2019.08.20.19.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 19:57:35 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 7/7] arm64: configs: Enable Actions Semi platform in defconfig
Date:   Wed, 21 Aug 2019 08:26:29 +0530
Message-Id: <20190821025629.15470-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821025629.15470-1-manivannan.sadhasivam@linaro.org>
References: <20190821025629.15470-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since the Actions Semi platform can now boot a distro, enable it in
ARM64 defconfig.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0e58ef02880c..8e27777d6687 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
+CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_AGILEX=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
-- 
2.17.1

