Return-Path: <SRS0=btre=VA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC8BC06513
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jul 2019 12:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EF1C218B8
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jul 2019 12:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gNa86D9p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfGCM0Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Jul 2019 08:26:24 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44279 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfGCM0Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jul 2019 08:26:24 -0400
Received: by mail-wr1-f65.google.com with SMTP id b2so1342336wrx.11
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2019 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fqRlKVNruC97TKfS68sR9FKZBA0FRnpxLwfr/fXEA2s=;
        b=gNa86D9pGZJ5sdLRnW2ukNzqCVR5k6+Da2hEivCl62/mYUQYGg/amqyl0D+c4nCzuI
         2LXQn3sqxDBW/+yHMGMcpLF+i6+IazKtkgrxKZv6ryTJKduLQe0kDCYo1zCqe7D8OkAl
         asxi9z0OkpUZ8jpkuI27yKLUiOdhmYzCvxsKmRWzibuV14Sjh4GZ1RGMIuHx3LexGMhV
         G+d/aXOIMhokQRx4fcF013uGI0+Do6/gNgaye0nEGt6NYVBuWWd93DKnWDbt2KCmhKxf
         pzYOeDXwLHam/t5zs0IZGmnKRzgkgW7LOOQ8ZuXTa8SFe/4xNvDx90v3VnpVaSeWsdJy
         EG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fqRlKVNruC97TKfS68sR9FKZBA0FRnpxLwfr/fXEA2s=;
        b=CAdq2F+c1DpJPrHzX9C0V7Gm1JyXMXeW6vbWd7mz4GejhaX4Vc7Ob2dnDmYdkHxKAF
         el9X+lWYxE9n/CcX9xfzqq/GcU8VksH4ZUTD68vuyBFYQd+rrRovkG9nBtENAf21BBFu
         KVJ3fN37Aehgbn+WKrvrDmjEMuPp4VkpNs2KQiwZyyVUQyCsfX0mrSuacQGtJYv3t1pH
         9XJ6IkdrYntIEgeWLFCOwUQAq3w50GQ8CfmpdkIzS1Obh0Qwl15QCE1FIOCjbbCXBOvS
         OfOe95qEhqm86Pr9FqMhvgm2XqujtQkN5Z9NSXxx9JKq7pGI1fbfaV9J7YIrtcozq1G4
         pYoQ==
X-Gm-Message-State: APjAAAVee3H1fJRmJRHgFshdjm7tp4y1gv2FtbSfoEnvV6/Ldy3CfPbz
        QTMQHp8w3PDJzsOigKalTJxAmw==
X-Google-Smtp-Source: APXvYqyzZFKUhirNmVYzoxkyGXKg/pBa0jfrzsPgw0VJQHASHTlsxPSCVkavu9zNjfP6kzDjMMS85g==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr19293000wrw.64.1562156782290;
        Wed, 03 Jul 2019 05:26:22 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v67sm2868132wme.24.2019.07.03.05.26.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 05:26:21 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: meson: axg-audio: add reset support
Date:   Wed,  3 Jul 2019 14:26:12 +0200
Message-Id: <20190703122614.3579-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds support for the reset provided in the register space
of the g12a audio clock controller

Jerome Brunet (2):
  dt-bindings: clock: meson: add resets to the audio clock controller
  clk: meson: axg-audio: add g12a reset support

 .../bindings/clock/amlogic,axg-audio-clkc.txt |   1 +
 drivers/clk/meson/axg-audio.c                 | 107 +++++++++++++++++-
 drivers/clk/meson/axg-audio.h                 |   1 +
 .../reset/amlogic,meson-g12a-audio-reset.h    |  38 +++++++
 4 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h

-- 
2.21.0

