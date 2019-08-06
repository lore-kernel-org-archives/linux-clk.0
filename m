Return-Path: <SRS0=W3Yt=WC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB49FC433FF
	for <linux-clk@archiver.kernel.org>; Tue,  6 Aug 2019 08:38:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEC0C206A2
	for <linux-clk@archiver.kernel.org>; Tue,  6 Aug 2019 08:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="k7i/S0Ul"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732068AbfHFIio (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Aug 2019 04:38:44 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51951 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbfHFIin (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Aug 2019 04:38:43 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so77316465wma.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Aug 2019 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=qSnv/+vT/SIYwYJQCT7nUDhLGYyBse0g569xwPymLuI=;
        b=k7i/S0Uly+lYudrLsi5NMZAiSdRC1hWmKyOsqGQviJPbYlaGo7X+7lvdEsQr4w6K18
         hqgrCW0P4CeRROJFb0KFnU3qONfUt/8Qksx76/dk933FkCBCUcUelsT/NGFwGpXciyvh
         dkkuIx2/3DK+T53BTbgxN1AXD3nKAlbBF2IGNCVu2K/Z/7dNVKpHX9rWytsDH1uIrMIV
         KNsraa3hrNqV7VoS7QuDjNWF2AC5tyCQlXQ2ESyY2LibCPZw0H7V6YV0WN2qO339IjJr
         QR8S+lfICoUcroG1XEt2uXKVULW0Q3TMBOFEd/Z6fxbp5BOzFU9YvP4RaL1ZT+1AhwOf
         lhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=qSnv/+vT/SIYwYJQCT7nUDhLGYyBse0g569xwPymLuI=;
        b=Sq6EzVw1gneN0m9rmLLMKL1OfhdpG/RRcOtZIc1tMsDRZVDvDyHqCGajGu93aM60L9
         DHD+8m6npmHU4eIAF7wWebZgUwGEFm3s1qFYEmdNurkvtkverIBgVYpXNruqjHmsQZ1d
         k1IkC4cd5ck7yRTmgL4x8GROZm/+rH6fT+i2226ILX+v8hb4WDYLcwkiN5ynyLG9cWyk
         1D2B4jA6s4M52C+gMLoCU8n7c2CYW7hHbxvjbjTCsTkjlZJtdC4kmzTJA/aMOW3DayXS
         h03O9EyQWKpg8gKPTvFL8SnDjwp+EK4rz2t0bKQiPLhP4uTr0wiK3cwpaVvSPiIHhMu8
         7Wbg==
X-Gm-Message-State: APjAAAVDRr6MWjxswTdeverJoJskfKzGyTYMJ43AFElomJ4N9nIXgJzE
        NCShwVZG+4RAXf27dslroYzGMg==
X-Google-Smtp-Source: APXvYqyNFcCjMT1EIr9SnBdj/3eb0N8J9r+MuFXedPFys0HGgjwjrbMnJn/62KpXxR8OMt0blyPHyg==
X-Received: by 2002:a1c:968c:: with SMTP id y134mr3179146wmd.122.1565080721469;
        Tue, 06 Aug 2019 01:38:41 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id k9sm61670274wmi.33.2019.08.06.01.38.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 01:38:40 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] clk: meson: g12a: add support for DVFS
In-Reply-To: <20190731084019.8451-1-narmstrong@baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com>
Date:   Tue, 06 Aug 2019 10:38:40 +0200
Message-ID: <1jzhkmvgbz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 31 Jul 2019 at 10:40, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Neil Armstrong (4):
>   clk: core: introduce clk_hw_set_parent()
>   clk: meson: add g12a cpu dynamic divider driver
>   clk: meson: g12a: add notifiers to handle cpu clock change
>   clk: meson: g12a: expose CPUB clock ID for G12B
>
>  drivers/clk/clk.c                     |   6 +
>  drivers/clk/meson/Kconfig             |   5 +
>  drivers/clk/meson/Makefile            |   1 +
>  drivers/clk/meson/clk-cpu-dyndiv.c    |  73 ++++
>  drivers/clk/meson/clk-cpu-dyndiv.h    |  20 +
>  drivers/clk/meson/g12a.c              | 535 +++++++++++++++++++++++---
>  drivers/clk/meson/g12a.h              |   1 -
>  include/dt-bindings/clock/g12a-clkc.h |   1 +
>  include/linux/clk-provider.h          |   1 +
>  9 files changed, 588 insertions(+), 55 deletions(-)
>  create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.c
>  create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.h

Patchset looks good to me.
Waiting for Stephen's ack on patch #1 to apply it.

>
> -- 
> 2.22.0
