Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338A5C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  8 Nov 2022 18:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234053AbiKHSEJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Nov 2022 13:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbiKHSEI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Nov 2022 13:04:08 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1566439
        for <linux-clk@vger.kernel.org>; Tue,  8 Nov 2022 10:04:06 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id v1so22209352wrt.11
        for <linux-clk@vger.kernel.org>; Tue, 08 Nov 2022 10:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iSN6UqyB7C5Cu1h1xzquSUVfnrfUY5yfizu2eB3hf+k=;
        b=jYWntqPR99Ho0m/ioIbeJVnpCks/3M4bNsSOGr88h+tpsa81t1hNlFOmPPB6Y9rVOH
         L/4kDh9R0JSEpCiO3lXmeaLkLs7voBm2USUKU9H2eMvMos6Xxkegdy1x1MSKaWxKNTE9
         N9F1w9ru+uu5Ursw0bN8WOCSt4yX9LRaJhry1y8S8nBTwTDcoxyAPXBK7Fwpm+8y3RUC
         yeY53v0mlFqpXWkG9LC93IHNYi9joqneHvcMenlzw5RYgSvSi3BivwAEWxLrZuBEmRPt
         7H47cHurxKZC7zaMhr8XWvxcinsKalY2w9jhGrU4ll/Wmx3YYBTndiZSOflFoKG/4IIQ
         +U+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSN6UqyB7C5Cu1h1xzquSUVfnrfUY5yfizu2eB3hf+k=;
        b=G6sFRDd64q+BvvQzn54wdAkCw/Qwgog4ue170cUJLVPaQguQpAONZOUC/xCtSf71pD
         bV3uNl7tkCFQ1KSGkIRVhoERy6M/EnuddvUcW+zRceOsOkkdxpmbOH99f48uqz0qHqcl
         +KAGpKzJPmdW47/tp8hsE0IiT3O6xPJa6LEF0tF4j4q9kwNJULkk10dKjmPtMMK4hgJZ
         0gZxY6cH12YVA91EnZzRVdKVxTZISkpvTES5q2iz3q95nzokkfgCo/KHqP0wn24CpJL9
         pvMODIb4HoTgecD8FcT1w7Ja3HngvhQfI2vGkdgUmhcdbbwx0EpaiTitSfRSe1Udm9nY
         2caw==
X-Gm-Message-State: ACrzQf3qqNmTJZ7CbcK++XoNfsuAb/aX3O9Xa3vAIWhevPX5ztxj/V79
        uvbRF7fgEXUTHYCupmtHv24YJFM1NpP5wQ==
X-Google-Smtp-Source: AMsMyM5srUN7LgOKVByHbfcvEea1+HhebiTNCmHDdYR4QWajUt3lhjmINX2joydGtEzsld+Do7ujiQ==
X-Received: by 2002:a5d:4cd2:0:b0:236:ca9e:79d8 with SMTP id c18-20020a5d4cd2000000b00236ca9e79d8mr31097307wrt.234.1667930644884;
        Tue, 08 Nov 2022 10:04:04 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bca41000000b003c6c3fb3cf6sm11960077wml.18.2022.11.08.10.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:04:04 -0800 (PST)
User-agent: mu4e 1.8.10; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-amlogic <linux-amlogic-bounces@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.2
Date:   Tue, 08 Nov 2022 18:59:18 +0100
Message-ID: <1j1qqd1fxo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen,

Here are the amlogic clock updates for v6.2.
There is just 2 PLL driver fixes.

These are actually the same I sent for v6.1 but it seems something was
off with the mail and it got lost.

Cheers
Jerome

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.2-1

for you to fetch changes up to d73406ed2dcfab7d25493ff3a62dd57f0d9c2bf2:

  clk: meson: pll: add pcie lock retry workaround (2022-11-08 17:05:02 +0100)

----------------------------------------------------------------
Amlogic clock updates for v6.1

* Adds 2 PLL driver fixups

----------------------------------------------------------------
Heiner Kallweit (2):
      clk: meson: pll: adjust timeout in meson_clk_pll_wait_lock()
      clk: meson: pll: add pcie lock retry workaround

 drivers/clk/meson/clk-pll.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)
 
