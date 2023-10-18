Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99018CDB47E
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 15:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbjJRPeP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 11:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjJRPeP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 11:34:15 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E53111;
        Wed, 18 Oct 2023 08:34:11 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-581e92f615fso838050eaf.2;
        Wed, 18 Oct 2023 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697643251; x=1698248051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6tQJZrmwh77q4KJG6d4/vwBiNQFUJwablon8OTMlyfA=;
        b=a8O67gN4R1090TEuHQEAADcW1YIy4CvfnSRlSoHHslvq4pJ3SilqrvR2UmUuc/RYXY
         KhSst6cMf77AVAnAk8p2qHePcXFLiPBjfhzezqZpZQd/fl/E6XgdeDx7qIgDByJBU+Gp
         vABEbB9CpdYn/xSGNTFwF2ECUEFr09jHfXETRGXZvyd5hOlQelddk31/AaVaD9pMKk0m
         yZPtToN/ky4w/xQZuLc3y4C79OvmL+v72MBtUvTow7+QstEQXoIDwavD0QMXUe5xhvuu
         e1HajBSpy3OD8aWlPQql08BUnoDlCRO7ITKAfgD5nLMN4zn9HFdqj42KbO+KHRLnCaBS
         WaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697643251; x=1698248051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tQJZrmwh77q4KJG6d4/vwBiNQFUJwablon8OTMlyfA=;
        b=JrM2m+hfw2JpUnrYPUYpCNvQ0IIZCMP3OPYJ14A81CL1qeQYpNK7g0Or+tRGxs7hZa
         maL/pcAKDWvfJLL7jD8qNJdbSMOiXKvbqONuUKEy04196POlDGRu65o1sGTPtsXV1zUf
         SaDAJht2N+BMOxi3ZVpprt35Xfwi2N1Sbh+i7ee6xL0Ugyqd9kAzY39vbP+FsaJxR5Xb
         KNPmvYLFzbQ1n2V+vWsj0CanFnByZfKCziR9BmOtFE4PZ/0FkzN1zVxMRErSpB71wTg1
         LNdrxervQWdGZxa3oDAKfk+Dfj/8uPVdkLBgSUDazb5FXlzy9Q38+kX7qzAQK0WZtmcD
         0vKQ==
X-Gm-Message-State: AOJu0YwEFGBuHX3eNRoEC3QMffNGeVT+mxjed5ELxsFi8nx5IQsxYDGs
        kxCp+bg9KRSleYdASQ/ZvxM=
X-Google-Smtp-Source: AGHT+IFTBAebvUI3C/PnjHyGd/EVx2sycdpXqSQObZD9ieoQ4sejU2vINPA6JY+WSFXYippZGc5xDg==
X-Received: by 2002:a4a:dc8f:0:b0:57b:6ab1:87c9 with SMTP id g15-20020a4adc8f000000b0057b6ab187c9mr5965150oou.0.1697643250979;
        Wed, 18 Oct 2023 08:34:10 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id h16-20020a4ad750000000b00581e090fd1fsm523782oot.8.2023.10.18.08.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:34:08 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, heiko@sntech.de,
        conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/3] Fixes for RGB30
Date:   Wed, 18 Oct 2023 10:33:54 -0500
Message-Id: <20231018153357.343142-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

After preliminary testing, a few users requested that I see if I can
make the panel run at precisely 60hz. As the device is typically used
for retro gaming, getting the panel to refresh as close to 60hz as
possible is important.

Additionally, I accidentially left the UART2 enabled, even though this
device does not have an exposed serial port on the board. Disable the
UART in the device tree.

This patch series applies on top of the already applied commit here:
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=for-next&id=1e9ac3e8a6a9d4da9efbad2d8e95cc1140e0e23f

Chris Morgan (3):
  clk: rockchip: rk3568: Add PLL rate for 292.5MHz
  arm64: dts: rockchip: Update VPLL Frequency for RGB30
  arm64: dts: rockchip: Remove UART2 from RGB30

 .../arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts | 11 ++++++++++-
 drivers/clk/rockchip/clk-rk3568.c                     |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.34.1

