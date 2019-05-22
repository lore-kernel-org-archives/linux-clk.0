Return-Path: <SRS0=a4ME=TW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16510C072B5
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 01:26:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF18E21773
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 01:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oFH7pGT1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbfEVB0s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 May 2019 21:26:48 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:38729 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728091AbfEVB0s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 21:26:48 -0400
Received: by mail-pf1-f177.google.com with SMTP id b76so392069pfb.5
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 18:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XzkZpLUXOKW7m6+mZ2WcIQDMuFvLDmkmvdyAaZy5wu0=;
        b=oFH7pGT17S+xMx8HG3afPL2D5gRK+wpsgupbtM9RSGc6A42rw+I+EDo+N8/CqTI7EZ
         uXpY0tObv9H7bswn4azKL+PSf9E5vgl5x5lMxN9fWIZognqP7NCHkyqnC5kdpCId6h6W
         X7/k0veibbbrV5Wl7/8Trcg+gOr87y0rBAP+FMOMMb6UOQhE78WJnNr3kQ4efJAMaRns
         JrUgDESLmKAbXV1h1hHhUo1QRVvq+tPUGOlGtw8mC+8OxhbK2wSIa1GYQ60h6H59DpMn
         0PPLGYuMyu5s0vxISfp6nsnb64I1eeRLMqcfx4E5pEM8tyd7GCkp69O9ozLnyeRM4PEb
         Qc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XzkZpLUXOKW7m6+mZ2WcIQDMuFvLDmkmvdyAaZy5wu0=;
        b=h9oRyUhhhQr9wquyeu849WIaZXL+8VQ5cbCBSq6No8yZjlY1b9SiGH4/bixEQ72NtB
         a+BWzYc0HibcJW0IwDHvsub0qsOEyqDNSmri7p8ByuKeetWTjvuy7S/VJ+/q3hZ3GaOZ
         LXfV9Un3xwR6gszOgk8+I8SjwBUDdPDSxYa4x+QxP6S61GT9SsPMygTyCbIJKpf2FpmE
         YTlO4QIKlOCS8PhVF3fVEvViiUbVu+03tUvBhGSFbyk3xOv8YyDNT1O3ZbjYY+r8JpO9
         i0IcK6/m6H7dggDlgxu7GzSjNByJ0Y5NpqxG6ZgnXSQrvADfuZr6n7PXxhzcIZFvB81j
         kMtA==
X-Gm-Message-State: APjAAAVI1RQARmcDI9GFrjRmmO2DHQe0ejqD6uqPLuq0Q5E4fpO6zEO3
        J7tVrMBngNZ25CiN1HlfGQ+NOA==
X-Google-Smtp-Source: APXvYqzdlFW/NK7EZH++8V24vCPikB705TpZHx+gJUVw9LaQBV4dYBXdDOh0OIbz1I96qLodf0EVhQ==
X-Received: by 2002:a65:41c6:: with SMTP id b6mr21977722pgq.399.1558488407887;
        Tue, 21 May 2019 18:26:47 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id g17sm14562071pfb.56.2019.05.21.18.26.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 18:26:47 -0700 (PDT)
From:   Chunyan Zhang <zhang.chunyan@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 0/3] Return immediately if sprd_clk_regmap_init() fails
Date:   Wed, 22 May 2019 09:26:40 +0800
Message-Id: <20190522012640.19910-1-zhang.chunyan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522011504.19342-1-zhang.chunyan@linaro.org>
References: <20190522011504.19342-1-zhang.chunyan@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The function sprd_clk_regmap_init() doesn't always return success,
drivers should return immediately when it fails rather than
continue the clock initialization.

The patch 1/3 in this set switchs to use devm_ioremap_resources()
instead of of_iomap(), that will make caller programs more simple.

Changes from V1:
- Split out the patch 2/3 from 1/2 of the first version;
- Added reviewed-by from Baolin.

Chunyan Zhang (3):
  clk: sprd: Switch from of_iomap() to devm_ioremap_resource()
  clk: sprd: Check error only for devm_regmap_init_mmio()
  clk: sprd: Add check the return value of sprd_clk_regmap_init()

 drivers/clk/sprd/common.c     | 9 +++++++--
 drivers/clk/sprd/sc9860-clk.c | 4 +++-
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.17.1

