Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA11AC001E0
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbjG0FdQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbjG0FdO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:33:14 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC12630DC
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:32:58 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-563643b2b4cso299829a12.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690435978; x=1691040778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOqReItDfaxB+nBJ9zQp2I4wwFvLbgDN9poIQ494Sec=;
        b=NB7doVVdgWMiRRp5hZkHS0QERPxUWcgaqil3/xOuD7rKNI9jl2wuxHFzDl7N5BBoOO
         sl3xJNyzvO0bfAnxkzIj7XB2TM9G9N9NB1i79wtoEmLx1OLdWCwh2Gmg9sMe+wQk8dev
         vYl9h2wmHjFe4B4v+EN50b/3agja8Xa6JRnolEgkoa+ZFEi3SYrtzKFs82tQLWW9ve6K
         tCwjxpBUGyULVV9R7jaM0IvUcbPPi1HNmwcvsH7MJlkCIaQNsi8mz7auF0JcChkn/Nyb
         ZQMym9LSeo1fv++udsWd9/YNECzzOjF7U1bFB4rjS1ZfZUhewLByo5ZcBnGnOBiZVtYA
         ZSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690435978; x=1691040778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOqReItDfaxB+nBJ9zQp2I4wwFvLbgDN9poIQ494Sec=;
        b=HgxEyQbtI+WNj2IWWtDhYNmlOW+l4I3VJDt6fu1gJ+M2TkLsdQbD9vwPu7/qO5bL2H
         iSird+Fw2+n+G83oy4WhIcwAcSahxzri4SzpwsjPtg3V3u10g1BeGDJFrmaRgcW+HEMI
         PBw8zetqgxPukZq5gn0wV81IAE2Yt1bRQkqqhSrpBn9ShRE44/O2vEDp7shOlDimpZKn
         4nH6u5bCqf33jJ2B4Xa+0b6ZbEHnJ7OOzXElS+1QEQrHO05yL7qClxBfc90DZhMfJcvV
         19bftpwesGJJx5W0tMUB6ALgZfWOFVGKRg172rlc6MTiqZDFNK+oCuZ82iJYwbXRI3DN
         31BA==
X-Gm-Message-State: ABy/qLbMgZLSTntciX0vfnSU2C/RA8nzZKMm9c5NMEg0zF3Z2V+tGGXy
        XwETCO0/+mjALo4RDsuGNtVqwA==
X-Google-Smtp-Source: APBJJlG4g+UU2DlFHesikVn7Ehf7tvYVZYciQ2xv6muWvezUiwf85V/bBVOrFE/TJKyCXDSRtpnwNQ==
X-Received: by 2002:a05:6a21:4985:b0:10f:52e2:49ec with SMTP id ax5-20020a056a21498500b0010f52e249ecmr3493892pzc.53.1690435978324;
        Wed, 26 Jul 2023 22:32:58 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:32:58 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 04/42] clk: at91: sam9x60: make checkpatch.pl happy
Date:   Thu, 27 Jul 2023 08:31:18 +0300
Message-Id: <20230727053156.13587-5-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove the following checkpatch.pl CHECK:
Please use a blank line after function/struct/union/enum declarations.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/sam9x60.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index c68cd969dd46..930b4515a1dd 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -379,5 +379,6 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 err_free:
 	kfree(sam9x60_pmc);
 }
+
 /* Some clks are used for a clocksource */
 CLK_OF_DECLARE(sam9x60_pmc, "microchip,sam9x60-pmc", sam9x60_pmc_setup);
-- 
2.39.2

