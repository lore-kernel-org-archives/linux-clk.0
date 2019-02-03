Return-Path: <SRS0=IJxv=QK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA42C169C4
	for <linux-clk@archiver.kernel.org>; Sun,  3 Feb 2019 10:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3298D217D6
	for <linux-clk@archiver.kernel.org>; Sun,  3 Feb 2019 10:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gj8RW6Jv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfBCKrn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 3 Feb 2019 05:47:43 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46584 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfBCKrn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 3 Feb 2019 05:47:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id l9so11417559wrt.13
        for <linux-clk@vger.kernel.org>; Sun, 03 Feb 2019 02:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2oFjeI0j/c0fWIH9q7P4tOfETnpU6mMj5SgV/gv7eMo=;
        b=gj8RW6JvjXlGZA2nMGj95MdTDvvmvdBAEBBpxo9omiQhsMvRSSX4/3E1RV6tAfk8Zs
         ldUTXNEiEIdu3SeNgFOiILkixmSVKWvCAsHwf0Ja7JJAMcj2d8eNHCx8/sMOd1Vq/+Ow
         YmYd8MKH4tcLRge7rLpjS3RAkqsoRLwtZshjLAKfX1gwc6l75JMYAvOSH6I8pV4BphuA
         +r7gOJBkYC+jk2eUjBFYRyonGP374zLFdNf4Vgiu5Vf9mtV3BCmvLyaB8jFhXwjJ1laP
         qEs5LCgg+y51cbPJImNkXW6ZhL4wEp9iv7qQ8SeUVP0kTGnxsyEGCYjHovM7TzmeCHVz
         dzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2oFjeI0j/c0fWIH9q7P4tOfETnpU6mMj5SgV/gv7eMo=;
        b=G6Nyl/p+5dgKA4O1b/4LflNuH08VCOfrM8aZWk9VgZ7WcKfkbqtDbg/Bf9UTvKOHHh
         RdyG0N5Bz6jg0q8kuzz/fdMjUCUCusWecPSScQ9WWDPJcDftEtU1HyP5040rFZmiLdZJ
         qDUxLG6b0lHqMALMR/a+NUSz0JyxfbDZRfKRc1rUh0jVRKa2ed08F60KgMKRljXUzlOZ
         KjwNXPfFUmA5j9UTbgRMUXrZ58aWj1K2bOypFeki/ynZK2rD1Ijy/jqTwEr+IpHeD69U
         YFQSjlFerGzdBa7SIR3B68Qom5CUsu4tfFwIWiJjScugWFUvkpJLvURALgd/I15Ivzrz
         C80A==
X-Gm-Message-State: AHQUAuYBzfz4ePqtgQbtjYKpNQLsjGNj5Yc8b3u0vBHXZa1ZckZyJgo0
        8NO6WTvhLr9cNWWC7kEjW2u7SA==
X-Google-Smtp-Source: AHgI3IbOYPIibgyvxsOaUIEAVVMLabHQW5SKNW6m1FuLtW1EswHYkuyRKw3+j/ckYgithODTJMs2Bw==
X-Received: by 2002:a5d:6803:: with SMTP id w3mr7005601wru.272.1549190861330;
        Sun, 03 Feb 2019 02:47:41 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id q12sm4702470wmf.2.2019.02.03.02.47.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Feb 2019 02:47:40 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: meson: fix pll settings calculation with arm32
Date:   Sun,  3 Feb 2019 11:47:16 +0100
Message-Id: <20190203104716.10479-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

fix undefined reference to `__aeabi_uldivmod' when dividing
u64 on arm32.

Fixes: 496c0462b46f ("clk: meson: pll: update driver for the g12a")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Neil,

 Feel free to squash this with the offending change. If you prefer,
 I can submit a v7.

 Cheers
 Jerome

 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 7946d21a4ff4..41e16dd7272a 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -151,7 +151,7 @@ static unsigned int meson_clk_get_pll_range_m(unsigned long rate,
 	if (__pll_round_closest_mult(pll))
 		return DIV_ROUND_CLOSEST_ULL(val, parent_rate);
 
-	return val / parent_rate;
+	return div_u64(val,  parent_rate);
 }
 
 static int meson_clk_get_pll_range_index(unsigned long rate,
-- 
2.20.1

