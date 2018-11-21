Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F51C04EBA
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 11:19:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CA62214DA
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 11:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O5YgsCGN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA62214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728990AbeKUVx3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 16:53:29 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39104 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbeKUVx2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 16:53:28 -0500
Received: by mail-wr1-f65.google.com with SMTP id b13so5271431wrx.6
        for <linux-clk@vger.kernel.org>; Wed, 21 Nov 2018 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=osUMdjyiqZHaxg9ZCTFb55GNgDuiJBgZzn8UF7ivm7I=;
        b=O5YgsCGNL8cRP26lIoemeEArBDVVxsUEXr3LT/ypeiqltkHJs1u7pV638sE+eKZECL
         I5814vPtbn8Qily52oHUpmNgIpJEbsQJiOfyBVDjsApsgmt8QennIPPPIjeIl0QB/98u
         zFmHtgrH3xY3cFxvNUPWhnd+7Dm5/EEin15ozI3qpmy5S4UOkzdcV3aKmy1KYEQ4Ip9F
         1MIPVdMMaN3N6Rq+G67oZZD2KQ6E4ZXhj0T36C1sngdN0Pq6XgHB+qXLY8tiv3ohFhxy
         KqJaqcUZsiuVhim5z1blxajXQ0NGLAI8/S9DAO4s9VrysS+eDTjlpxy+LBlDfsdVbj6h
         BNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=osUMdjyiqZHaxg9ZCTFb55GNgDuiJBgZzn8UF7ivm7I=;
        b=ZK2f6TTN63l8IzdIyrNC/ROlR565vJuUN2jbjzMhyqXlYBF3lAQ68tiSltEjRka3d7
         5vOT22YNIjfAaS7S+xJVxyXdbkzis/Qno//mhPMTEjqI5gZha1WfNLvNqyW45FlRS4i9
         UDJ5W+iH0T1DQa73zh8rfkFYf1MYZg5PIJBywyQGfXU0crPzrg6zdSYtGYq81+JBBre+
         js9QX+Qv1fzaMLNqaaCk2/y09MF4TpygIAT7MWRUD3c97TV6CaNv0tul1MsF4T/1cVXQ
         9Tc2+EVYal8zViyACg1VXo+6QBiD0y/3F/3nHUhSRdbugMI9dT2f3frPM1qF+21Hm8DO
         naMA==
X-Gm-Message-State: AA+aEWZwKumOQ3MOe4GMImQOdRWxrut9NnDvoPZKvcf9159+8amZn8GP
        WYrls+lmJ34ttupectHeOJ7K8w==
X-Google-Smtp-Source: AFSGD/U4ToPWDhWMIVfrCWEO39Ct1Sv+O/F6p/hdz5gjgRQ12IjRK1mw/Zv8tw8qQdwMkZyfGaTTyQ==
X-Received: by 2002:adf:b453:: with SMTP id v19-v6mr5215814wrd.47.1542799166710;
        Wed, 21 Nov 2018 03:19:26 -0800 (PST)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f2sm4109201wru.14.2018.11.21.03.19.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 03:19:26 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: Fix GXL HDMI PLL fractional bits width
Date:   Wed, 21 Nov 2018 12:19:22 +0100
Message-Id: <20181121111922.1277-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GXL Documentation specifies 12 bits for the Fractional bit field,
bit the last bits have a different purpose that we cannot handle right
now, so update the bitwidth to have correct fractional calculations.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 30fbf8f1f190..aba59aa64d2b 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -219,7 +219,7 @@ static struct clk_regmap gxl_hdmi_pll_dco = {
 		.frac = {
 			.reg_off = HHI_HDMI_PLL_CNTL2,
 			.shift   = 0,
-			.width   = 12,
+			.width   = 10,
 		},
 		.l = {
 			.reg_off = HHI_HDMI_PLL_CNTL,
-- 
2.19.1

