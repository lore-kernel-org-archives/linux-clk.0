Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D46AC25B06
	for <linux-clk@archiver.kernel.org>; Sun, 14 Aug 2022 21:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240597AbiHNV0q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Aug 2022 17:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240640AbiHNV01 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 Aug 2022 17:26:27 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A297639D
        for <linux-clk@vger.kernel.org>; Sun, 14 Aug 2022 14:25:36 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id s11so7468733edd.13
        for <linux-clk@vger.kernel.org>; Sun, 14 Aug 2022 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=xQQcsinkBD55XZnA3Rx8KZUstdukRPl8F+heSycPoHI=;
        b=Qe5DWC0r7rxYJhIfXceDeB8WPgaRF9tvqMILk+vpu0/C7UVQ4yMexOoyvKmOytyyJh
         n2EqCZLZhM5cJMhiLA8KIc+uWmJjlTQ4U05VuGBJuRdPcLUkxohdEzHPQPl0buauL3FQ
         IYpanbKgaHIpDVgpnH2PuaTgexmRLRFw9aNGwL7fXqy5j0IlBCo0+QvVbplkStzs1PZo
         ilDFlW6KoBmmdpk8DDRE5gl/a7/AlGGRNwt+/jmC9r+p5JG1OWGUWf84p9Jf/IO7+zMD
         tkWHe+X/Et2rnlzJgxv4c/CEZoqapq9lZKMK5J/PeVZfHrAURMUJNR9CN/s3UUggGef7
         U6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=xQQcsinkBD55XZnA3Rx8KZUstdukRPl8F+heSycPoHI=;
        b=NwWeDkJH897NLmdLU5MB5OBSWWnrCYKIKdbPJBGJ7nc36QK88ny6LjAQzFThBebtAZ
         vWp1sgPlh8Bvpl1ztdpzPVoaVvNkxs2KnZ1nv47ZO8sFkytqqyhuC4v798RNl8q5a9ce
         n00UsEKVLT/8PQ1ee8th9ChDfPpGMz419+aUd9FDIF6YL10VXmya3B46hRchu4459eeM
         K8TH9FfjGkATfCAKic4vmXdr/tGFojMTPt8jcQ3kEZJBgzRLHi1/rgWgPN8VCq5kdYvT
         gy5TRrJe4TAnUxxXfvWCnD9SHtsCg8cDUJ7eTJjFDIrmTmG6Ob4HLzXv3KZuAXOnI1XG
         6K5w==
X-Gm-Message-State: ACgBeo3Kl23OPkEb4ApqQkX4U2fAUJSUuaSfmCSqylgCLtHpCLkphDmU
        PhXwKnUWIgJz5WOq+1eKyLY=
X-Google-Smtp-Source: AA6agR5yCvVRH21XQkQPF1Wfk2uvfyUNgSVB2S64Y12RTxJ0Qdq+0H838y2Ax7VnyAyrPfaKKoxjHw==
X-Received: by 2002:a05:6402:26c5:b0:43e:2f1b:31c2 with SMTP id x5-20020a05640226c500b0043e2f1b31c2mr11769063edd.424.1660512334996;
        Sun, 14 Aug 2022 14:25:34 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c1a2:1a00:2049:10ba:dbb:6620? (dynamic-2a01-0c23-c1a2-1a00-2049-10ba-0dbb-6620.c23.pool.telefonica.de. [2a01:c23:c1a2:1a00:2049:10ba:dbb:6620])
        by smtp.googlemail.com with ESMTPSA id o10-20020a056402038a00b0043a7134b381sm5357856edv.11.2022.08.14.14.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 14:25:34 -0700 (PDT)
Message-ID: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
Date:   Sun, 14 Aug 2022 23:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RESEND] clk: meson: pll: copy retry workaround from vendor
 driver
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

On a S905X4-based system this call fails randomly.
The vendor driver has a retry mechanism and on my system
the second attempt is successful always.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/meson/clk-pll.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 9e55617bc..daa025b6d 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 
 static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
 {
-	meson_clk_pll_init(hw);
+	int retries = 10;
 
-	if (meson_clk_pll_wait_lock(hw))
-		return -EIO;
+	do {
+		meson_clk_pll_init(hw);
+		if (!meson_clk_pll_wait_lock(hw))
+			return 0;
+		pr_info("Retry enabling PCIe PLL clock\n");
+	} while (--retries);
 
-	return 0;
+	return -EIO;
 }
 
 static int meson_clk_pll_enable(struct clk_hw *hw)
-- 
2.37.2

