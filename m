Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8177DC61DA4
	for <linux-clk@archiver.kernel.org>; Sat, 18 Feb 2023 22:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjBRW7H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Feb 2023 17:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjBRW7H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Feb 2023 17:59:07 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FB713503
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 14:59:05 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id bh24-20020a05600c3d1800b003e00c739ce4so1043808wmb.5
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 14:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTtgJ59N6itz1m4NV60RmlpVLeIrVGaG77XPqapX9nA=;
        b=gAgq9URA1V4NnsrgAGmKlJL8i8DYVCotlCDZhm+0UJDpk8vBA7s4ie2Rxql0Hp1YKa
         nMAeq1y3lS1OfnKpqN6UlqbV+PdtdATKUYCDW0inc2texTqehV4C6ofG2Ql41rMZFczi
         GkZbW5+rAaUaEhKzxoxr/fcAwbOqIaTf/M0X8ktCmynojcrEfGLheFfp4jpXpf3TEpNv
         dpxHwDeRGjVhD+ewFOXDSNB4vUJO5XyOogne2VhMhohgyokNhuE5n5Q3u2XOGxxYvo/I
         WUuj6da2H1kzGbJ8N861e1OLlGKREdcbIe8Tf0inw6NSvzJocntQOOA7EylP1KD7/vLM
         E8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTtgJ59N6itz1m4NV60RmlpVLeIrVGaG77XPqapX9nA=;
        b=DaMAd+1mN3F+gfJdwDcgFgH8yFNo8o76wry/GNxLUNoCGOPKhIHiJ4XwOMXo/3SkS1
         NnX/WNl/VCwqV37d4xpL/99RyJNL06XYYxcN5eVss+9m/+qk2PRwO0u3by2nbQOVREZ6
         JXCuCPpMlaNkOsZ2SmT+M7ISAvRFHLRs/z14CqXn819fzz9fS6KiLc6tUVSVptK0LtdJ
         LJYGeE6nh1EhaaM+DYe4cEkju+MRYBi6OoB55dxS1nce49ca8UGW9IR8ycGctAm0RDUi
         E+Mr1JV40bOXDB3RGntIyrs9sDYCkv9sV/GCt88w5R0dsk6QZ/oIsMpIewVLePr0HzRU
         i1Ug==
X-Gm-Message-State: AO0yUKXFXtn5r1ZonKqbf4f5Oo8gImtpVSSSf2qTx06c7V94/RJ6kw8/
        P2umkj2IJWqjUJFxGknmohk=
X-Google-Smtp-Source: AK7set/AgQt6FCR1waBlPC/gYYghZ0+fn3R+jYJaWftIjV6Z6rAUTmfMCTbKhRKkOWX3tllDFkOgGA==
X-Received: by 2002:a05:600c:1615:b0:3e2:662:ade6 with SMTP id m21-20020a05600c161500b003e20662ade6mr4807706wmn.26.1676761143694;
        Sat, 18 Feb 2023 14:59:03 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b82:af00:2955:cfd1:cf55:9ea? (dynamic-2a01-0c22-7b82-af00-2955-cfd1-cf55-09ea.c22.pool.telefonica.de. [2a01:c22:7b82:af00:2955:cfd1:cf55:9ea])
        by smtp.googlemail.com with ESMTPSA id k26-20020a05600c0b5a00b003e11f280b8bsm4594724wmr.44.2023.02.18.14.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 14:59:03 -0800 (PST)
Message-ID: <e5d7afd3-2e1a-ad5a-a455-8882fae9cc47@gmail.com>
Date:   Sat, 18 Feb 2023 23:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     linux-clk@vger.kernel.org
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] clk: add devm_add_clk_disable_unprepare
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I'm aware that there have been numerous rejected attempts to add a
devm_clk_prepare_enable(). The advice I've seen was:
If you need this functionality, use devm_add_action_or_reset().
As a result lots of callers implemented their own action wrapper for
clk_disable_unprepare(). Just one example: dw8250_clk_disable_unprepare
This can be avoided with a little bit of cast magic, as used by few
drivers already.
Helper devm_add_clk_disable_unprepare() is supposed to reduce the
code duplication caused by all these individual wrappers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/clk-devres.c |  6 ++++++
 include/linux/clk.h      | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 4fb4fd4b0..97e7c33b6 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -222,3 +222,9 @@ struct clk *devm_get_clk_from_child(struct device *dev,
 	return clk;
 }
 EXPORT_SYMBOL(devm_get_clk_from_child);
+
+int devm_add_clk_disable_unprepare(struct device *dev, struct clk *clk)
+{
+	return devm_add_action_or_reset(dev, (void (*)(void *))clk_disable_unprepare, clk);
+}
+EXPORT_SYMBOL_GPL(devm_add_clk_disable_unprepare);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 1ef013324..c4d3b1cc0 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -732,6 +732,17 @@ void clk_bulk_put_all(int num_clks, struct clk_bulk_data *clks);
  */
 void devm_clk_put(struct device *dev, struct clk *clk);
 
+/**
+ * devm_add_clk_disable_unprepare - device-managed call to clk_disable_unprepare
+ * @dev: device used to acquire the clock
+ * @clk: clock source acquired with devm_clk_get() et al
+ *
+ * Notes:
+ * - should only be called if clock was acquired device-managed
+ * - should not be called from within interrupt context
+ */
+int devm_add_clk_disable_unprepare(struct device *dev, struct clk *clk);
+
 /*
  * The remaining APIs are optional for machine class support.
  */
-- 
2.39.2

