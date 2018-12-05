Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFA5C04EB9
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 19:48:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E92020892
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 19:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E92020892
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbeLETru (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Dec 2018 14:47:50 -0500
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:55910 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728648AbeLETrt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Dec 2018 14:47:49 -0500
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wB5JHHE7013007;
        Wed, 5 Dec 2018 21:17:17 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id E89F362DA6; Wed,  5 Dec 2018 21:47:15 +0200 (IST)
From:   Tali Perry <tali.perry1@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
        yuenn@google.com, brendanhiggins@google.com,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
        Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v1 0/1] clk: npcm7xx: get fixed clocks from DT
Date:   Wed,  5 Dec 2018 21:47:01 +0200
Message-Id: <20181205194702.257430-2-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181205194702.257430-1-tali.perry1@gmail.com>
References: <20181205194702.257430-1-tali.perry1@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Nuvoton NPCM7XX Clock Controller



The npcm7xx clock module includes 4 PLLs and then a tree of muxes and dividers. 
All muxes and dividers are preset before Linux boots. The presetting can change
according to the board. 
Linux drivers need to know what the frequencies are, but they cannot change it, 
so this whole driver is intended as read only mechanism for clocks. 

Before this change PLLs input clk value was defined inside the driver.
With this fix clock will be on the DT.


Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

---

Tali Perry (1):
  clk: npcm: get fixed input clks from DT

 drivers/clk/clk-npcm7xx.c | 64 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 11 deletions(-)

-- 
2.14.1

