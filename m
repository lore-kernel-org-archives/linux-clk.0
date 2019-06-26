Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3B6C48BD6
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 09:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34A5C20659
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 09:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0dQvF2Y3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfFZJGl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jun 2019 05:06:41 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34611 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbfFZJGl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 05:06:41 -0400
Received: by mail-wr1-f65.google.com with SMTP id k11so1809507wrl.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2019 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3PBhHywaKoqeEXor4qGKKEbTn6ANfeSg4ls1LrAVLLs=;
        b=0dQvF2Y37cH6qhAVKYSNd6wABJorxdelAViXz4ofOHPaWbEl0G4K+YJkciOphm7wCj
         Yqg0PEZzw/3DDwW4RH+HZVs7miXIE4EGM0Z450dN9YOu+OZxfvRyYoaEQQhmNAlIFPQm
         uhKfWMtUTzbaw8aOM99khqpNMqeOnkVVHhBYJbhUNhrmfRYpzkXNebTF+0fqCHkJH7r7
         OXif0OQ13z7qvVprUKI2oREU5H5PqDHYT9+NXF9T0nPgGxU71WAs4fXbbQmBtPmtJkVr
         0bwDZDsF88vzy3fHx8tQ2UY6ZZqnh+vslTNeoxd+/RoZFqPBfcVhY/btLgVIcNSIAxt/
         CPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3PBhHywaKoqeEXor4qGKKEbTn6ANfeSg4ls1LrAVLLs=;
        b=UEOWyGOCDUAKgmG2vfWHNbDod3ujbLHsaeSlglrgekF1dJNTyLhz0EPe0gsFkB3kFB
         E1F5P27+0kCCLXPAcRxs9QDTdd3pCE1Gl49tVhuCvG8SqHN1y4T4uy+Lk4zjKImbeFzo
         xcoY5/U/2Bt7TX9ExIDmKSmPcyxjcvucKCMOSiXso6b2pQRiMBAbShvq+qzzX5a404Xi
         g6zXzDaoze3Vv2AM5IJHG2szLZboxeNoKKJdU5lTRa2sRaMIzcUXgWAIb0W98jnOUi5R
         ihP9LrnYG+YuOO5JGY4nXIL0j3dfA7rr/lM3Zm+HW2qlxgzZ3u3ZQ7xqwPMyStLFvqbK
         louQ==
X-Gm-Message-State: APjAAAWvrEvgMd1YjjdSVqjms2kd+VnC3tRzwJKePulDt1eP3G1uLCcm
        JOD0hgBlFJ5JjXAkouK89aAwzA==
X-Google-Smtp-Source: APXvYqxvUFmJny+jMH1kZs7aju+I59XRIseKcpXP0X5SnQQR7xSg23DSD/lqG4I9aJxmcv8Xe0QucA==
X-Received: by 2002:adf:b605:: with SMTP id f5mr1726864wre.305.1561539999021;
        Wed, 26 Jun 2019 02:06:39 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:38 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 02/14] clk: core: introduce clk_hw_set_parent()
Date:   Wed, 26 Jun 2019 11:06:20 +0200
Message-Id: <20190626090632.7540-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
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

