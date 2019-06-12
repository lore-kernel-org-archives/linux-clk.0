Return-Path: <SRS0=Rxbn=UL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B996C31E46
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 12:15:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FA6720866
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 12:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iz8jnCnd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfFLMPD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jun 2019 08:15:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41422 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfFLMPD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jun 2019 08:15:03 -0400
Received: by mail-lf1-f68.google.com with SMTP id 136so11895870lfa.8
        for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2019 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FFYjM9wk0Lz17ea9speLpvagwR++tad6Xn0EKWjFYrA=;
        b=iz8jnCndeBkvP3p4bBUYrvrE0G6l+fnUrY4oU5MyfPxGojrx49R4TMU+njNn/7WkR1
         KudRDNq6DwntOfaunGUQ2Ggo7LykQcAuySfJlCxT5juyhc3dBfB+pQf/5I311Unb61Ak
         xDOd9SDmEBkAmthWSazEjw2aPFlUj9sFiYGMQb7c8R64IJKhJyDC763gJmHYUQHB2JEY
         ObuDuPWxggur9qaAQOWrQNqbA61Jj83r369UjaHpdkGB+xj6tC2Oo2lQDj2219vXZZjC
         WYTaixMFeNHwjcNo5OjrrHcq5pLGSx47JLd9HuGnPjcAo+4RnkSXgfEjH6OYMEiNgoEx
         ztdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FFYjM9wk0Lz17ea9speLpvagwR++tad6Xn0EKWjFYrA=;
        b=EpolWFb+jAkjMgYz/f5PEjIg7hQZIH2eCdGXwZaexbPy/ZIyj2Mh99Wckunx0Bx9ca
         WGvoUBpCxo8Dgs3z8y/tLA/U3SZJGxWaDUeLVjL+klv4mIOWrSL9YFi4sW2nk1tvxxqp
         5KUvP6ozBD5RAsaAEdzWcN0MBCxVwLLNFUEFqMEalYeYpzQAlftZpnOI6AQMG92eDkJM
         YoOuPH7tss32yqHdx0ZNyWFbYZqIMM6OeH82PBJopleSvoq2iewilQ43gjC0cvXEq7dN
         4KzVsfIPNy9TiM9J/QbCCrDXsB4SxdOVb318SuKbhS547+lm5sPv6OEEBusEK8sP5+gk
         IGoQ==
X-Gm-Message-State: APjAAAXxOGcuI5TrTntGhgyNrUXYMBqlTvPurbzLDtIzwZrPPJc+7xm6
        o43HzOlVQnriZccSF+V2OkK4qKEpfc+DoRVOkRezyg==
X-Google-Smtp-Source: APXvYqwy0mZMiBNpW/oi3ASfqSMigvHqJvRnpIQvSh4m+n3Y5mdNL+QhoJDfGK8Ag45DTi2N8BZsC58UGSuJHBOr+eI=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr27964836lfm.61.1560341701722;
 Wed, 12 Jun 2019 05:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190611140940.14357-1-icenowy@aosc.io>
In-Reply-To: <20190611140940.14357-1-icenowy@aosc.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 14:14:50 +0200
Message-ID: <CACRpkdbSo=oKh94GxmLX_FrhCuoZJyY27WeV8KJjBW6gTUrh=g@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Support for Allwinner V3/S3L and Sochip S3
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jun 11, 2019 at 4:10 PM Icenowy Zheng <icenowy@aosc.io> wrote:

>   dt-bindings: pinctrl: add missing compatible string for V3s
>   dt-bindings: pinctrl: add compatible string for Allwinner V3 pinctrl

I applied these two so we get down the depth of the patch stack.

Waiting for a v3 on the pinctrl patch.

Yours,
Linus Walleij
