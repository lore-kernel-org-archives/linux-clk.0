Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6417C4332B
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5D2264E58
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbhBWGUy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Feb 2021 01:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbhBWGUg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Feb 2021 01:20:36 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B853DC0617A9
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:20 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d11so4257689plo.8
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 22:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WvzkCjZyptzDnW1uepsiXb6ybrsE6A8U5lzjXZF4NH4=;
        b=DeXXljYGddSCbpsw5yQZDdWWq/dbOTy0CmpXadmiPDNqrp0kPHRgRzwK11zwiGd6AO
         BY+r+BrMSNGMhKk+KRhiTLh2ke5g/iRd1c0XY2bJIWXOC/JSLO4AUt9qWVD5qNlZIcOE
         vlc8lAkWXzdwQkm1q3G4APE7sDzXfl4MycAic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WvzkCjZyptzDnW1uepsiXb6ybrsE6A8U5lzjXZF4NH4=;
        b=ATzjmQguaD5Brta0Mss/DdOru4NBY8xKVoozkCPL5ozClPem2+LATSVZelz++IzbCg
         lhR89AxIpvE5M5oGn0/iQrn2f7NGW2qfVOZfBXihXa2orWnIc4lPgc6VkLy7qNf6cgJk
         ceBEGMmq4bSQqnpjhhiYz1HELQFQBUMVKMF81pi7+GBdQFhYgLDQvI/KVnjRm3+S85+6
         eKyuFNBJFGRJpRxWmelp0UffHReuvx4ek0KBPNYFchz9xq6ALZww57gVYE59JdxKOOoP
         T1ECE5W+U631fvlsr2wF8fVgyOp/wp/zQ2Nhjt78mShriL5Af7vHPJ5/wZs/yFXSllfh
         9u8g==
X-Gm-Message-State: AOAM532iXpPJchzk8Eh/WLsyE+Z1wvLaN5SfNEIJGeyCaki3hgu+F9aF
        GI9ftLBxNRU/u6oyXVZcKLEWlQ==
X-Google-Smtp-Source: ABdhPJzUFcIDoQ53XoBGFCZHB+j9nJd4ObgYI5HbP5VqqkuvxkGhU56VmEE/a/ZFZLF7fjsQVyhI2Q==
X-Received: by 2002:a17:90a:ea88:: with SMTP id h8mr27156943pjz.154.1614061160369;
        Mon, 22 Feb 2021 22:19:20 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:20 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        soc@kernel.org, sboyd@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/8] ARM: mstar: Add cpupll to base dtsi
Date:   Tue, 23 Feb 2021 15:18:25 +0900
Message-Id: <20210223061830.1913700-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All MStar/SigmaStar ARMv7 SoCs have the CPU PLL at the same
place so add it to the base dtsi.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 075d583d6f40..d323c1a3f3c2 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -132,6 +132,13 @@ mpll: mpll@206000 {
 				clocks = <&xtal>;
 			};
 
+			cpupll: cpupll@206400 {
+				compatible = "mstar,msc313-cpupll";
+				reg = <0x206400 0x200>;
+				#clock-cells = <0>;
+				clocks = <&mpll MSTAR_MSC313_MPLL_DIV2>;
+			};
+
 			gpio: gpio@207800 {
 				#gpio-cells = <2>;
 				reg = <0x207800 0x200>;
-- 
2.30.0.rc2

