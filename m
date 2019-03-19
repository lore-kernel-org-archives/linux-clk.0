Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5455C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 21:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABB18213F2
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 21:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hhhy5vF1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfCSVlu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 17:41:50 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43890 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfCSVlu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 17:41:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id d17so475291wre.10;
        Tue, 19 Mar 2019 14:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rp0ONdgHeRnzpFSUPYt3Ohcl4LuEe8qUiPz/+1UdoOc=;
        b=hhhy5vF1y7t1KAW8tuGlfu0QWydwVNMERKGAk+Q8zKAHG/O03hNJErkzTI+laXSPi0
         xvMPp8QzBowkDFY7Y5Xpy/mNNqlOHHbztdPIqZK6VRibfRM1tGTOLK+uErbF7LKeEfF8
         dLqTBzpOM2v0sstGmNv/ZhLBHTm0lvWnsuhXEkNOkAWEE8f042JfxVyz5FWcXHJin1tt
         CoUu+fc1Lpv9GcmUOyP8drhQ+cbOy5lLD1n63VEl0zEDDyTVech5ha/jvHYTmcZRToe5
         hAh5ImLYEUZIRwJUd2UJX6kbQXbvfLMfySq8nmEIsbMNpA/G1JIA8n2qB6r4mTh9Y1z6
         h97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rp0ONdgHeRnzpFSUPYt3Ohcl4LuEe8qUiPz/+1UdoOc=;
        b=q77KSCdiIFFy5C/NjOcyyZ7TqrFe1xtvdmP/gbeYHp43idGAXCK3FT0n8Dy3i4jhFp
         CN5Tt3TFOMmGDCRqkHc9wTnIQM8LuUBpSyDRuH69vHFbRVGUTKgz0hgf2P+VYYK9g/cd
         FiZNg2H76rlGcGWTVp4E9IUCNgpvww9pp7CfwcCkkJPoLVbOuk48NdyWWmGVJO0DNaek
         ap/nkgWmpoky34ISzKaaXgprt6YsGUrF020tLbfQBhBpCZp9LpMttZ8n+/Qs8HfMi3mp
         +OZh7Z60hBSinBmv2J08WF9VOBreDUY+JpsK3qhEXU9Shmb4BkwtbkMz6frCknkSS0x9
         5l8g==
X-Gm-Message-State: APjAAAUU3dr05VewlZD5viw98MFdJ6ZEQq/qqFUlcG5il18sOgmnIZC6
        G1cmKfqiWKQG3icWLem//xQ=
X-Google-Smtp-Source: APXvYqy7w59zKCu+MyZEXXwI/CeImhYahd0GJ4pkt+2lewVJnrKRcF7r8k3rYWPGotQIXbBuoigNEA==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr7405823wrs.278.1553031708065;
        Tue, 19 Mar 2019 14:41:48 -0700 (PDT)
Received: from blackbox.darklights.net (p200300DCD739990039EE738515149D3E.dip0.t-ipconnect.de. [2003:dc:d739:9900:39ee:7385:1514:9d3e])
        by smtp.googlemail.com with ESMTPSA id n19sm139675wmk.35.2019.03.19.14.41.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 14:41:47 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     narmstrong@baylibre.com, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/1] clk: meson8b: remove CLKID with typo ("ABP" -> "APB")
Date:   Tue, 19 Mar 2019 22:41:22 +0100
Message-Id: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a follow-up of my previous series from [0]:
  clk: meson8b: fix typo "ABP" -> "APB"

The previous series introduced a fixed CLKID. Nothing uses the CLKID
with the typo anymore so it's removed with this patch.


[0] https://patchwork.kernel.org/cover/10804943/


Martin Blumenstingl (1):
  dt-bindings: clock: meson8b: drop the "ABP" clock definition

 include/dt-bindings/clock/meson8b-clkc.h | 1 -
 1 file changed, 1 deletion(-)

-- 
2.21.0

