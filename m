Return-Path: <SRS0=O+9D=PA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E003C43387
	for <linux-clk@archiver.kernel.org>; Sun, 23 Dec 2018 23:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D1382184D
	for <linux-clk@archiver.kernel.org>; Sun, 23 Dec 2018 23:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sYl++GS1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbeLWX6w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Dec 2018 18:58:52 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36526 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbeLWX6w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Dec 2018 18:58:52 -0500
Received: by mail-wr1-f65.google.com with SMTP id u4so10289994wrp.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Dec 2018 15:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U40zO9GL4zD6yrX5xswqexEhgjRlLBW7ucik6uA1XG4=;
        b=sYl++GS1VpnALdJTnsPCgiMOVc7LoMtrq2PJ2q770gSvCNsy+thaxhDSUXKDX3fevs
         epkRgGRyKZqgdx8TgrBHxIRFjwvl5n7BYXUH+AETM9BU7Yfq+9Q95XC9lCgbEbuCg/0i
         ZL9RITzknuSWf7YKPVpt5js6m0KlV9QRlUJB5ER6FSf4xgwwpB3fG2BLalylGhd9ux84
         jWvUzYL23Dc0gjYG6Y9ojwbNPhZokFKe7c7w2IQRyNf7+KlsfpOqHz3c6y9F+DDjtedB
         jtz81r37qHLUXD/yVE9f1eL7pegihCAy+r3qXJmpIhZCj/u5voxpwOpFiz9Nmd53N5Ni
         QCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U40zO9GL4zD6yrX5xswqexEhgjRlLBW7ucik6uA1XG4=;
        b=M4wuknb83EQp0v5SEtRIM7DlatTNL8qdsreNVoSdVJnsuDpbQdKu2WjETgi4FFxOMB
         A2dQx8+oojgPFWJ6Bq3TBSCH1gqaiE+e4BvPTMvW3r1nrPIsA+uPVl/Fu3vOXtYPYc0e
         VJQN1xgEdIx9B/zTqkTgLyiqR0lHadvvKtc5K+smEd+eN+Qz4UCjAjoL41VBgM8WqgUh
         a9SSXVJ01/sD7o/uM4lRG5fEMJU+B94T2ySEsuKjzjS5KWUzlnObKbbOr0JRl31fbPBQ
         UxsAVJLbSx1TvhZsBInpQ8Ie3O292hshY+2D7SbF5glfIiyq7qiz2NddJNPlJLwrjV7M
         otAw==
X-Gm-Message-State: AJcUukeeqtHoQvBO1GmX4x+I6ODsgE7TGypbCr/jut23zdx/H1Mu2/tl
        FN3Um1evId6bUoRy/XogonM=
X-Google-Smtp-Source: ALg8bN5itQTecpIu57gojmWDKwJ2KhbmT4BF6CYSrtl66nXFXB+E4jF5k/oksj7wGCiXCgyfl9eeGA==
X-Received: by 2002:a5d:418b:: with SMTP id m11mr9229203wrp.8.1545609530614;
        Sun, 23 Dec 2018 15:58:50 -0800 (PST)
Received: from blackbox.darklights.net (p200300DCD711B0006842FD8F1E9F13DE.dip0.t-ipconnect.de. [2003:dc:d711:b000:6842:fd8f:1e9f:13de])
        by smtp.googlemail.com with ESMTPSA id s1sm28527174wro.9.2018.12.23.15.58.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Dec 2018 15:58:49 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     jbrunet@baylibre.com, narmstrong@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/1] clk: meson8b: fix typo "ABP" -> "APB"
Date:   Mon, 24 Dec 2018 00:58:35 +0100
Message-Id: <20181223235836.12466-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It turns out that I'm not good at spelling "APB".
Unfortunately a typo snug into the clk-next branch and will end up
in the 4.21 kernel.

Currently there are no users of that clock yet, so fix it now
before it's too late (meaning before it's used by <something>).


Martin Blumenstingl (1):
  clk: meson: meson8b: fix naming of the APB clocks

 drivers/clk/meson/meson8b.c              | 22 +++++++++++-----------
 drivers/clk/meson/meson8b.h              |  2 +-
 include/dt-bindings/clock/meson8b-clkc.h |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.20.1

