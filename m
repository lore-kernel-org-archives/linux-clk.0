Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44009 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbeGUVm4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Jul 2018 17:42:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id b15-v6so14245140wrv.10
        for <linux-clk@vger.kernel.org>; Sat, 21 Jul 2018 13:48:52 -0700 (PDT)
Message-ID: <1532206130.26720.86.camel@baylibre.com>
Subject: Re: [PATCH 0/3] clk: meson: clk-pll driver update
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Date: Sat, 21 Jul 2018 22:48:50 +0200
In-Reply-To: <CAFBinCC4CO_C_f9LLTnLmzVJ6-C-w8J0JQ0e6F9Jh_h61bGEKQ@mail.gmail.com>
References: <20180717095617.12240-1-jbrunet@baylibre.com>
         <CAFBinCC4CO_C_f9LLTnLmzVJ6-C-w8J0JQ0e6F9Jh_h61bGEKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2018-07-21 at 22:17 +0200, Martin Blumenstingl wrote:
> > This series has been tested on the gxl libretech cc and axg s400.
> > I did not test it on meson8b yet.
> 
> I had some comments on patch #2
> once that is fixed I can help testing on Meson8b (if you give me a few days...)

I don't intend to make another PR to clk in this cycle, unless something
critical comes up. No rush.
