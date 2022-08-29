Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DB9ECAAD2
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 18:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiH2SxJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiH2SxI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 14:53:08 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114F615A3D
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 11:53:07 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id y3so17578232ejc.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 11:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=bilE99Eb8g6jOTqIlIz0GtHBknDbsLMQgwQJTTDAk+k=;
        b=qc6rrlx85JJlXnN4/QMcUIuqn7m7I+JuinUIdf7FLnhCZNgaGuA8PpHLqE0MZ63oix
         5Z0YI6iLfgkXEuo//Po6Mot5+EAh0Vbo/35DS4XL7B/28009T41XDe1UDcrh9ZCyrzbK
         TaZphlHbqZaOlc8lsBtCa1mPyc2CycGKK4hN3hwr8kYeBZ8IqTv3wqht8J29X4o4Y0SW
         qGX4OSP206+KW2hnol3z1gK7o2/rsOtmD8/0gVZmlfmkXdP1Har2ywnhSJf4kCKHV0Wq
         nciunIX/ejj5q5Li4/6f2BJSfYKHkek3e4+63Y1ThHXzZfbZoRqr7WRsIMWBBh+lkA6e
         gr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=bilE99Eb8g6jOTqIlIz0GtHBknDbsLMQgwQJTTDAk+k=;
        b=XdUAaIpLCIZ3qXZ0lkvRCMT0lg1XApfuCqGei8RjwRTG/G+OC8lIzCB4dZb4NwkuYQ
         HF0KOF5wBc09r7U12WvTu/n8DAXi2pTUdq+6y9WrS522sDc1w/N22Phh3cXwSjtO+vDp
         zDxPxLotblYPL9KPlH5TMdWkQlBOQGN76dPUJoRT/FO3jfXNM4UAQVKSLbyKIwkJ4XXI
         8jwNKSYqFbgAi5pQ4/B2+8RVZuKU3GHcf1mMs4nodZ+xy/pGl+W49fju4e25iqwDRdYt
         RmU4NIJX5B4dT1V8G1nxNWEt5MotxAEwFTbbZ2bMVjie0+596vNArCrc7W1tkTVIk5Lq
         eHnw==
X-Gm-Message-State: ACgBeo2TNcKoQd30er0YwZABf0z3zX9YPHuyKYmKxuhgffow92W6ZVki
        q1ochnx1YcHu0ktpSCcUOWE=
X-Google-Smtp-Source: AA6agR5mIoOyP3KHtsikmDLLgnbfSIOc8Wj4E+WeGpMCPSo/Yz/BsMARoy5kgZKhteqWbai5RFrBpA==
X-Received: by 2002:a17:907:3f88:b0:73e:484d:9d6c with SMTP id hr8-20020a1709073f8800b0073e484d9d6cmr11571943ejc.283.1661799185511;
        Mon, 29 Aug 2022 11:53:05 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd96:2400:287c:a714:9c3c:aa54? (dynamic-2a01-0c23-bd96-2400-287c-a714-9c3c-aa54.c23.pool.telefonica.de. [2a01:c23:bd96:2400:287c:a714:9c3c:aa54])
        by smtp.googlemail.com with ESMTPSA id t23-20020a05640203d700b00440ced0e117sm6048138edw.58.2022.08.29.11.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 11:53:04 -0700 (PDT)
Message-ID: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
Date:   Mon, 29 Aug 2022 20:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently we loop over meson_parm_read() up to 24mln times.
This results in a unpredictable timeout period. In my case
it's over 5s on a S905X4-based system. Make the timeout
period predictable and set it to 100ms.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove an unrelated change
---
 drivers/clk/meson/clk-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index daa025b6d..53b8e17e4 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -277,15 +277,15 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-	int delay = 24000000;
+	int delay = 5000;
 
 	do {
-		/* Is the clock locked now ? */
+		/* Is the clock locked now ? Time out after 100ms. */
 		if (meson_parm_read(clk->map, &pll->l))
 			return 0;
 
-		delay--;
-	} while (delay > 0);
+		udelay(20);
+	} while (--delay);
 
 	return -ETIMEDOUT;
 }
-- 
2.37.2

