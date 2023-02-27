Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BFAC64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 18:40:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjB0SkC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 13:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjB0SkB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 13:40:01 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897E121A3F
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 10:40:00 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id i4so4529371ils.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 10:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgE9qSydDheMGrlJYkywgbek+AYCNeYBDtX4hsvjRoM=;
        b=r9U+kkmdAAMTzyGiw0WfIn3mFX8/Fv6eu/sCzY0s2HgqKd2Oh/QJl83amEs/YCFEoU
         tDUMa1KBu+Thu/4Bityga9xGL1ESNCUAmuFJslh61bRO6qSes/+FSakwFLbgoIl85iI6
         j/cHqyVn8+aSC9Mn2TNDR26CFLJJpeMlGSsCm98Qtvailm0k6CrSAxyvjQa7LPUDg0Pg
         TTI6q1rHL+VVEaaLKIZFUbgUnppI69Jgw9kV93YWGGTmK8X9biG+LbfPASuqsLzIsiVS
         UqLTw2Xwmd+Z94zaxaP0ubLICqgL5XwBBPaSRPd5oEQq1JLBepEy5WVHiM4wtVlYP5Fl
         lrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgE9qSydDheMGrlJYkywgbek+AYCNeYBDtX4hsvjRoM=;
        b=5UTUGrJJBMSF/mXbqBXXgBHIng4JU7+dqfMNeVsRLtomveYKIxHzu/8XbuXVJX2fh3
         Iq5IH2063nJ+ytA1/HfjkIQMU/knIS5AJuTs1NI36oI54+i5vx3bnPhLsuhzn6wgSB3U
         Q10ffo/Licxm9NG9PG+5NHJeKCdIKF+R/qG12m30karQOhlFQd/IFqGJowBs4tv+DyOC
         C8nOY7yhLymBujh/3mx4KdfwLlG8XzSge+MEm58xW9SlFD0FeLHGgQKa32EVxTMBwzRK
         MrzUIIKc/yn9abUqpkyAIqFS1HDfV2heg+DFIhDCWPygcRl2NlG1ZaBJpmVw1SraD45g
         mfBg==
X-Gm-Message-State: AO0yUKUYeW+bZILgNFkeEVKLATQyt2O89JNu7at3j0RA5BpSWQKeprgJ
        k/c2uazOaU1expzTwexOE7arWQ==
X-Google-Smtp-Source: AK7set+j6wPqEfZtDGucRfe92F3iAh+zNqa2TtXxaHNg67XyTY2jvlX3zhMZqbce6bPnkc4hhdI3mQ==
X-Received: by 2002:a05:6e02:1b89:b0:315:7911:748a with SMTP id h9-20020a056e021b8900b003157911748amr9306938ili.1.1677523199742;
        Mon, 27 Feb 2023 10:39:59 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id t5-20020a02ab85000000b003ab21c8fa84sm2331202jan.121.2023.02.27.10.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:39:59 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 0/4] Renesas r9a06g032 clock table improvements
Date:   Mon, 27 Feb 2023 13:39:32 -0500
Message-Id: <20230227183937.377612-1-ralph.siemsen@linaro.org>
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

Ralph Siemsen (4):
  clk: renesas: r9a06g032: improve readability
  clk: renesas: r9a06g032: drop unused fields
  clk: renesas: r9a06g032: document structs
  clk: renesas: r9a06g032: improve clock tables

 drivers/clk/renesas/r9a06g032-clocks.c | 726 ++++++++++++++++++-------
 1 file changed, 530 insertions(+), 196 deletions(-)

-- 
2.25.1

