Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95270C2B9F4
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 21:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6494961241
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 21:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhFNVpT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 17:45:19 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:34457 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbhFNVpN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Jun 2021 17:45:13 -0400
Received: by mail-pl1-f182.google.com with SMTP id h1so7355544plt.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Jun 2021 14:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=a9M6mo9sDU4hGHATongOtufZwNr/kkG9DVDa4h0vW68=;
        b=GXE81N+ZLEn4j4X1QEZWtt6XuffzJcNorr4OtAT+9BC1/B025zrCzOhKMoDYcuTWoh
         oPSdI2RPlj/4AMDVLuxc5e793Y8NMiaEzLN2wAFnGriLgmM2KciNECNo6fSl4LcAdRsF
         vmVD/T7DPk2Gu4bgSeX6UuqKfX1zawPMB2Ua2lZWf5AEjruJZ7guASDRrXQ8cEHKU/6q
         jQGphH3ZZKFNML5BXMW3zhSRN1emnF70nWhVOGM2n3Qbe7z21S4nsSIlbmGx4MrswuYD
         0/IwsML0O+/w3zt9skH9HqB7exsawzNXRzLnuBBwbS9DIghItbj6DA99TgINW10NFQ65
         5kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=a9M6mo9sDU4hGHATongOtufZwNr/kkG9DVDa4h0vW68=;
        b=ljvaXJQmcily8iJEkdoTsUHwV3TxM/qX+yjKRQFqT50AoZZSfIHmYLtHBllQQ1N723
         ztacztdq+KJOz/ERUpp6pZrFL1OyyiJx75Xgq8tLqLvLA6gpyhBD84RIg73aVClbS6jM
         4Xn9XIZXfvcfGzHADNU34EGjm0ItPCAQpCzGApQw2ixt9N9qDJ9RoU6UvbaJ2WrmJOOh
         ZTr/fCcKto80oJvMINy1S7EgKfPWtv5uhS4nDlgf0Bq+dIBJu9sNSQ8N9BBurvpmAO0F
         Tqu8e93mofTKjAw4VDS5nLUp0nikNX9Ap7iqzlESukkjv9b5aic152ErIoteL5O9yGcB
         qO9Q==
X-Gm-Message-State: AOAM533b8swrIQcHRaVx6C3uMLsxBLSUg3mnZ9lKqASg0MDEaEYjQti6
        guEhZfqMCbVf0Ji+S7nyYRB48DS8zYGAPAESRB0sP37krQafAeQE
X-Google-Smtp-Source: ABdhPJy0duDonqXJZK/xZfo8Qci5IatJvcetpJki4vx6+695Sz9/26mLnJbmhxKhZd171wgo9Wj6g3LzBM2K97zz2Fo=
X-Received: by 2002:a17:90a:65c8:: with SMTP id i8mr1237244pjs.207.1623706929759;
 Mon, 14 Jun 2021 14:42:09 -0700 (PDT)
MIME-Version: 1.0
From:   Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 14 Jun 2021 14:41:40 -0700
Message-ID: <CAEG3pNAtsuQzeWxJUz0Zupmgbq35OuCtauxi1wOjYbtDVNuwUA@mail.gmail.com>
Subject: #linux-clk has moved to libera.chat
To:     linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Many of you will be aware of the on-going meltdown that is freenode.
Today the new admins on that network banned everyone using an irccloud
client. Sure, you can connect to the freenode bnc instance with
irccloud, but that avenue will probably be removed soon as well.

After doing some quick polling around OFTC vs Libera.chat, it seems
the latter has more adoption amongst the various #linux-* subsystem
channels. I've set up #linux-clk on Libera.chat now, so please join. I
also set up a channel on OFTC that points to Libera.chat in the topic.

Best regards,
Mike
