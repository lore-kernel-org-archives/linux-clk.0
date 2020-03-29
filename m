Return-Path: <SRS0=o1vG=5O=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A27DC43331
	for <linux-clk@archiver.kernel.org>; Sun, 29 Mar 2020 23:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38F9220784
	for <linux-clk@archiver.kernel.org>; Sun, 29 Mar 2020 23:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgC2X7E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Mar 2020 19:59:04 -0400
Received: from ip-78-45-52-129.net.upcbroadband.cz ([78.45.52.129]:56402 "EHLO
        ixit.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgC2X7E (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Mar 2020 19:59:04 -0400
X-Greylist: delayed 541 seconds by postgrey-1.27 at vger.kernel.org; Sun, 29 Mar 2020 19:59:03 EDT
Received: from [192.168.1.104] (227.146.230.94.awnet.cz [94.230.146.227])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 2B9D724975;
        Mon, 30 Mar 2020 01:50:00 +0200 (CEST)
Date:   Mon, 30 Mar 2020 01:49:54 +0200
From:   David Heidelberg <david@ixit.cz>
Reply-To: 20171004023006.31763-1-linus.walleij@linaro.org
Subject: RESEND: clk: Avoid sending high rates to downstream clocks during
 set_rate
To:     sboyd@codeaurora.org
Cc:     linux-clk@vger.kernel.org, linus.walleij@linaro.org,
        john.stultz@linaro.org, david@ixit.cz
Message-Id: <6JBZ7Q.14DEIXCJIIB22@ixit.cz>
X-Mailer: geary/3.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Stephen,

sorry for reopening this long time closed patch discussion, but it 
seems that this patch is still valid (today -next 5.6-rc).
Without your patch, Nexus 7 2013 isn't able to wake up screen and fails 
with:

[ 64.658305] dsi_link_clk_set_rate_v2: Failed to set rate pixel clk, -22
[ 64.658324] msm_dsi_host_power_on: failed to enable link clocks. 
ret=-22
[ 64.658373] dsi_mgr_bridge_pre_enable: power on host 0 failed, -22

complete dmesg: 
https://paste.sr.ht/%7Eokias/636375da6b1a16e90bd690d34b0f3ff4c79c71c6

with your patch [ 
https://github.com/okias/linux/commit/84438b2b2306d2e3032533d39cf2c0f46bf721fd 
]
screen wakes up and no clk related errors shows up.

Is it then possible that your patch "workarounds" issue in different 
place? Any idea what could be wrong?

If you'll have something in mind which could solve this issue,
I can try my best and provide all necessary debuging information to 
tackle this issue down.
Thank you
David Heidelberg


