Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:37245 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751464AbeCUJbd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Mar 2018 05:31:33 -0400
Received: by mail-wr0-f174.google.com with SMTP id z12so4448546wrg.4
        for <linux-clk@vger.kernel.org>; Wed, 21 Mar 2018 02:31:33 -0700 (PDT)
Message-ID: <1521624690.3753.0.camel@baylibre.com>
Subject: Re: [PATCH v2 1/1] clk: meson: meson8b: add support for the NAND
 clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>, carlo@caione.org,
        khilman@baylibre.com, linux-clk@vger.kernel.org
Date: Wed, 21 Mar 2018 10:31:30 +0100
In-Reply-To: <CAFBinCAVZcws9-r9EET8o7TXWnGJmcTA517WTn0srXAMHtMHWw@mail.gmail.com>
References: <20180101210139.29808-1-martin.blumenstingl@googlemail.com>
         <20180101210139.29808-2-martin.blumenstingl@googlemail.com>
         <152121876042.70929.5606827507365233258@swboyd.mtv.corp.google.com>
         <1521219591.6569.82.camel@baylibre.com>
         <CAFBinCAVZcws9-r9EET8o7TXWnGJmcTA517WTn0srXAMHtMHWw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, 2018-03-18 at 23:54 +0100, Martin Blumenstingl wrote:
> > Hi Stephen,
> > 
> > I guess we missed it after new year's day :(
> > 
> > The patch looks fine to me but, following the rework of meson clocks, we'll need
> > to migrate the clocks inserted to our clk_regmap and change the IDs (96-98 are
> > used now)
> > 
> > Martin, I can do this rebase if you want ? As you prefer
> 
> Jerome, if you have time to rebase it then feel free
> otherwise I'll do it once v4.17-rc1 is out (no need to hurry with
> these clocks, they are unused until the mainline NAND driver is
> finished - which will probably not happen anytime soon)
> 

Ok, no rush. Let's leave this for the next cycle
Thanks Martin

> 
> Regards
> Martin

