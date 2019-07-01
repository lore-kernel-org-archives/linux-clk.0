Return-Path: <SRS0=aD5i=U6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35273C46478
	for <linux-clk@archiver.kernel.org>; Mon,  1 Jul 2019 09:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EBCE21851
	for <linux-clk@archiver.kernel.org>; Mon,  1 Jul 2019 09:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HsAPm2yL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbfGAJOR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Jul 2019 05:14:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55796 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbfGAJNP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Jul 2019 05:13:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id a15so15024944wmj.5
        for <linux-clk@vger.kernel.org>; Mon, 01 Jul 2019 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3PBhHywaKoqeEXor4qGKKEbTn6ANfeSg4ls1LrAVLLs=;
        b=HsAPm2yLJUTmVQ7VrhIS3c6633P/oVY1hyXWdRrTSY0DaJFH5bo3iwB4WDLzqoIjFb
         +ofZX4UV7FR6yYxUXONipQWUjI3LKOc/TveJvoc3qP8bVzL0lMb2xqRjT3Aj98RxHlB+
         GpNhcY2zmaGoJcTVbOliiJ6VXhUVfeSD7wO9C2/2prWgE9+Gdr833y2faMoNUxwUOhv4
         Ty6IF1dEIyHgu4lzo46tWct6hPdW3k3KdsfcG0Wy5bOHVMxjZgNe2KVsQXBtDH5beIQX
         zOrKkgH/T2TGdTUlj9ohM0pkt2w+MnhOGAblF+pefLHBIOfNrheg34r/1SMhDhjzwlLK
         yNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3PBhHywaKoqeEXor4qGKKEbTn6ANfeSg4ls1LrAVLLs=;
        b=gjO/9yh+U9GjANPlamEKE10qyIW9PwZIJfQiRFcTVds86MlbToXypZCCsKlKEut8de
         KMtyaFEh3RXu3F8V3WerqAfm0jQgz8fmw872G8altwbcg5dcUsSmWINdZZFp2fKeKtsx
         Yrsvddxw+9Km1Uim7hhpgwKGxHvauzR7ciTZRFDy2ROFFlIMSY8sb/tORiO2cqSGT1OZ
         vmmobjBnf/m5VPlPDAws6CStaJnN9CEFyrTIokuUrCUPmRd2mPkBFfkcr3wlPOQWUf5z
         6Zh8x0u8JqoQdZ5pc1pysBmQVpHhiDRC/GcYKmLJQd3YsZsh6UvR+1CjE4xUBSHDe/jT
         QQOA==
X-Gm-Message-State: APjAAAVcAOPkv6XT9X6HtW0XFjOUJXu4DDTL5PwDe3lNzuzu9MbjMrBg
        fTLkHGpyYHlhBM4gD/c6K6oicA==
X-Google-Smtp-Source: APXvYqwUZnbG+qavm8RsJY6F9HtxkvEbIBbdChezRZVD4NLmW5HAZs5R0eARFRcCFjxg92naHMdEkQ==
X-Received: by 2002:a1c:c14b:: with SMTP id r72mr16534969wmf.166.1561972392885;
        Mon, 01 Jul 2019 02:13:12 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:12 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 02/14] clk: core: introduce clk_hw_set_parent()
Date:   Mon,  1 Jul 2019 11:12:46 +0200
Message-Id: <20190701091258.3870-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Introduce the clk_hw_set_parent() provider call to change parent of
a clock by using the clk_hw pointers.

This eases the clock reparenting from clock rate notifiers and
implementing DVFS with simpler code avoiding the boilerplates
functions as __clk_lookup(clk_hw_get_name()) then clk_set_parent().

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index aa51756fd4d6..06e1abe3391c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2490,6 +2490,12 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	return ret;
 }
 
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
+{
+	return clk_core_set_parent_nolock(hw->core, parent->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_parent);
+
 /**
  * clk_set_parent - switch the parent of a mux clk
  * @clk: the mux clk whose input we are switching
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index bb6118f79784..8a453380f9a4 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -812,6 +812,7 @@ unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 					  unsigned int index);
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
-- 
2.21.0

