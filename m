Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33200 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751216AbeEUJcx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 May 2018 05:32:53 -0400
Received: by mail-wm0-f67.google.com with SMTP id x12-v6so11347021wmc.0
        for <linux-clk@vger.kernel.org>; Mon, 21 May 2018 02:32:52 -0700 (PDT)
Message-ID: <1526895170.2822.3.camel@baylibre.com>
Subject: Re: [PATCH v2 1/2] clk: meson: mpll: add round closest support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date: Mon, 21 May 2018 11:32:50 +0200
In-Reply-To: <CAFBinCCdKgFOod=JimSnBVRvQ8Xmggpa0Uok3rgr3ixB7o+fnA@mail.gmail.com>
References: <20180515163652.19980-1-jbrunet@baylibre.com>
         <20180515163652.19980-2-jbrunet@baylibre.com>
         <CAFBinCCdKgFOod=JimSnBVRvQ8Xmggpa0Uok3rgr3ixB7o+fnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2018-05-21 at 11:18 +0200, Martin Blumenstingl wrote:
> On Tue, May 15, 2018 at 6:36 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > Allow the mpll driver to round the requested rate up if
> > CLK_MESON_MPLL_ROUND_CLOSEST is set and it provides a rate closer to the
> > requested rate.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Acked-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

Thx for the feedback Martin.
Applied.
