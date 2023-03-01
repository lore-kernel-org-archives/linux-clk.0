Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B21C7EE23
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 21:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjCAVzo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 16:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjCAVzf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 16:55:35 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C358311D6
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 13:55:26 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id g6so5970749iov.13
        for <linux-clk@vger.kernel.org>; Wed, 01 Mar 2023 13:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677707726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lG8sR2zrlTlvAovPadHdYghd1Y5ULssI2+Ll/R8Rio=;
        b=jdOGBhTnNOxEAP6g/g5bJfhRD4BRuHQZfQgAzjsSuZyhnxOtmkvR2VD39MpQ7jiq2s
         h4x8f8h01erxsyCCO1qM/mVUkB2xdCkYJKBT2grcZ0VUmOZTBz+Vl2CLkFuiCyreqzfo
         9wnl/NkmCHiXJWyniVl6jIBJEXAEE5bUUleGNS6CXS+rSK/1jL5nYVAayD6FV5PAi9Ug
         7QtrN+8MxkNGYT9iDiSpnkzuyOd2vUTAykbGbZzf7cI013WhvpuQymi4PzCQ0fFRh8tl
         GNlgp+hlWTsUpYHziPXn8cpdIxZcaPpjinrlhrnWR/KBk5Uvtp+2ObI8UNCIYgNoCO+s
         7z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677707726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lG8sR2zrlTlvAovPadHdYghd1Y5ULssI2+Ll/R8Rio=;
        b=oJp2Ce0nWfYHJ+0wXbhMBH0yjQzfwB+nMh0sX+T7Wa2UrzLtyWj9SWpFdljmMD0xXE
         d9IrhozeWunpldXMgs/nbC/vuLhgPjuXygFMH4WSSJx5KbAVY3q5TzB0FjeqvBt7TX2c
         eBgDmYyLDs7XExnkVt4ROQGnAGDNoNObCxlhbdpEZJ8yOzL4A5KG3oJosZtxf7W4o/Jx
         +Dhik+ipCUcQHmHC+4avkav5ecYJZpvJw1jcbBtpMuaOvcIuDdLiEY9zFOqOH3V+3Hfv
         2YmN72M00xTaQW85N9OdzW2FS+c/6IEKkqj5gAE9yN5dz08uy3n2mECO0e/tqPl1MBqU
         CfOA==
X-Gm-Message-State: AO0yUKVjPbKiAd2jv/ePYy5xPe+KbajtHVXpDGfnu01XKnzzww6E3Cic
        IzHBYqWj/A3KUZ5wunJW4xOBiw==
X-Google-Smtp-Source: AK7set+2lp8Fz67z5vy+bFHe8PVqWYA/4iE5cONp2shJ7qmNyfT50k1Yxotn3NCQWo8oWl4ukMSUSQ==
X-Received: by 2002:a6b:6e12:0:b0:74c:b436:4a9e with SMTP id d18-20020a6b6e12000000b0074cb4364a9emr5488198ioh.16.1677707725932;
        Wed, 01 Mar 2023 13:55:25 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a5ec10b000000b0074c9a4bb374sm4173479iol.11.2023.03.01.13.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 13:55:24 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH v2 0/4] Renesas r9a06g032 clock table improvements
Date:   Wed,  1 Mar 2023 16:55:16 -0500
Message-Id: <20230301215520.828455-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series makes several mostly-cosmetic changes to improve the clock
tables for the r9a06g032 (RZ/N1). They could all be squashed into a single
commit, though I kept them separate to make review easier.

The motivation for this change is to make the register/bit numbers more
explicit in the clock tables. With the existing format, these values are packed
into a u16 value, which is difficult to understand. After this patch, the
memory format remains the same, but the tables now list the register and bit
numbers explicitly. The logic which accesses these has also been made a
bit simpler to understand.

Changes in v2:
- Address reviewer comments
- Replace register shifts with multiply/divide
- Unify the reg access in clk_rdesc_{get,set}
- Restore the WARN_ON() check for clock gate
- Swap field order in struct regbit, to exactly match the u16 values

Ralph Siemsen (4):
  clk: renesas: r9a06g032: improve readability
  clk: renesas: r9a06g032: drop unused fields
  clk: renesas: r9a06g032: document structs
  clk: renesas: r9a06g032: improve clock tables

 drivers/clk/renesas/r9a06g032-clocks.c | 736 ++++++++++++++++++-------
 1 file changed, 541 insertions(+), 195 deletions(-)

-- 
2.25.1

