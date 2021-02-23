Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A144C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:19:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4520561606
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhBWGTz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Feb 2021 01:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbhBWGTy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2021 01:19:54 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEE7C061574
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:14 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id q20so8139261pfu.8
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FL/F1gCFmBMP8+RfZ2tPc29BuH7DoO9TPApvWMpXrY=;
        b=sz3vP7AGKlQXyS2RDXmywvZUnQ5EhPaeq8Lu5rtj26+LhGxR0RMTZIe3o5BF05dO7F
         nKjGu3Dcm1sk1k1v9AxCeajyOq1w4y3qbGdQBJDI4VVqV4AHe1DiYMEB8Qmd4XU5kKr8
         V2pK2mJwNswP51/9JYngQraTpenSNLTD32PE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FL/F1gCFmBMP8+RfZ2tPc29BuH7DoO9TPApvWMpXrY=;
        b=V76yXUQKtZXvNRfFSLAO7iq+skv+/08lZO7qOneV7MEeNrI8X/PrKdIf3a2BDfBdoQ
         vhhjt1yMF8f9Fn/PjjWhM6khRZg4+X3jG3oQ/VGTUN6+ADHlxWrKb5oAETe/Toow6Ldv
         CRJng9nkyed9m26422We4/F0X96xAkD5TI3+5z/BqoF6ZUw8PrpkmzvzRlzioh1g8QzC
         EtF2cGeKtJbq1zrOg0shtbLaFsfkyRwXDTqmIHX+FyrkpDi3cDWXQF3XTeuBIFgMfBFC
         emPH0powGD7axRuY3SD84ZPzw8r4FzwYJL6U2oeCS0gX4pCzYClVOjpHvOskZfAQ6mku
         34dA==
X-Gm-Message-State: AOAM531HE9Iivfmkl7i2RymsRdruFhhRX+TFy5HjBLZ/RHdoTUNFgc7N
        Lt783Vc6LwJvmtd5kt6sksRsFw==
X-Google-Smtp-Source: ABdhPJwJaNbUqhV3I7tQ+drfo40Dil/MozZwGwWntn9HWDo9ZR71eAj9kODrgi7GuJUdcXT2cj5HBw==
X-Received: by 2002:a62:7bc5:0:b029:1ed:62d5:31f7 with SMTP id w188-20020a627bc50000b02901ed62d531f7mr968575pfc.24.1614061153493;
        Mon, 22 Feb 2021 22:19:13 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:13 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org, sboyd@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/8] ARM: mstar: cpupll
Date:   Tue, 23 Feb 2021 15:18:22 +0900
Message-Id: <20210223061830.1913700-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds a scrappy driver for the PLL that generates
the cpu clock on MStar/SigmaStar ARMv7 SoCs.

Unfortunately there isn't much documentation for this thing
so there are few magic values and guesses.

This needs to come after the MPLL DT changes.

Daniel Palmer (8):
  dt-bindings: clk: mstar msc313 cpupll binding description
  clk: mstar: msc313 cpupll clk driver
  ARM: mstar: Add cpupll to base dtsi
  ARM: mstar: Link cpupll to cpu
  ARM: mstar: Link cpupll to second core
  ARM: mstar: Add OPP table for infinity
  ARM: mstar: Add OPP table for infinity3
  ARM: mstar: Add OPP table for mercury5

 .../bindings/clock/mstar,msc313-cpupll.yaml   |  45 ++++
 arch/arm/boot/dts/mstar-infinity.dtsi         |  34 +++
 arch/arm/boot/dts/mstar-infinity2m.dtsi       |   2 +
 arch/arm/boot/dts/mstar-infinity3.dtsi        |  58 +++++
 arch/arm/boot/dts/mstar-mercury5.dtsi         |  36 +++
 arch/arm/boot/dts/mstar-v7.dtsi               |   9 +
 drivers/clk/mstar/Kconfig                     |   7 +
 drivers/clk/mstar/Makefile                    |   1 +
 drivers/clk/mstar/clk-msc313-cpupll.c         | 228 ++++++++++++++++++
 9 files changed, 420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
 create mode 100644 drivers/clk/mstar/clk-msc313-cpupll.c

-- 
2.30.0.rc2

