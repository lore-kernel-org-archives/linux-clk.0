Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41782C636CC
	for <linux-clk@archiver.kernel.org>; Sat, 11 Feb 2023 09:20:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjBKJUI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 11 Feb 2023 04:20:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBKJUH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 11 Feb 2023 04:20:07 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CBF2FCC8
        for <linux-clk@vger.kernel.org>; Sat, 11 Feb 2023 01:20:04 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id qw12so21345896ejc.2
        for <linux-clk@vger.kernel.org>; Sat, 11 Feb 2023 01:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ay7GopDhxpUWXvFU/Desi3ncPwaICJKEa+mMLgmlAI=;
        b=O7wHkho8aDQgo94UfFVY9X+XG/U+2SPSmWJ435T0PJxK0wOCnONbmuwo8viMsiCcuO
         buC/rLfDgF+j3xQ2VEwC1njKqtZTtDbzXNbVE3KUkhlgYxpdXWNLq62thnYyW0bTgI3V
         KJRwLI6WpGbUbgf2gxyHIO5uEXXwlSuiYb23U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ay7GopDhxpUWXvFU/Desi3ncPwaICJKEa+mMLgmlAI=;
        b=W2gMISldnwoiURJA25YItCJFsxun9ivRnih79iVHyYuo5QEzE9yTGvPGJhdZ4WeAyT
         e7RgtNNtyuu/GmMtnqp5YtK7RaZVQp7/v3m4hh1vK71ZqzE39Lc7UxKnRqMNY+HMKG1N
         cwDlc2jmS31+JHi5CLBXunfgnBM1KECrs8s9NW8LLvBtz19M/zqHSciFAISB9b8tDnit
         btVHGRM00SvlsVHQvZZFpihr0sxmdvalDX/vid8dPOqbdKg0A9hZhObdpeVVifUln+JJ
         GtzYJ1BMINr5tOx8OJEswdP2Agol8MnziI7WBOWa7wl10OyYaNFiKj8sXX7dvzk4s6Bw
         Ipew==
X-Gm-Message-State: AO0yUKWHhJKHA7zF2XiVkHoVGy6PR3PvfIR7jrD7MGj+LX3BdBLrmY1k
        3PB3ZYUNUef3/ibkVRejDS7pjM2qOGhiPpyrrW3sUA==
X-Google-Smtp-Source: AK7set+jZ705IMIDjL87PKlafwfn4leLVjN6W0uPB/ZG04XFihgIOINn7gMrXMHNl3mnPgeREDPQ8Or/gVMTa8GMDfY=
X-Received: by 2002:a17:906:69d1:b0:886:4fe9:1d51 with SMTP id
 g17-20020a17090669d100b008864fe91d51mr2131922ejs.12.1676107203273; Sat, 11
 Feb 2023 01:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com>
 <1fc8686b0b66c3b3ff80c044ecf1add6.sboyd@kernel.org> <CAOf5uwkMRSc7q1xUv4D=hc4w0HL=+x1_J60yyru_hGSuf5m0bA@mail.gmail.com>
 <83a3c8d0abf217369f045df0217b1f64.sboyd@kernel.org>
In-Reply-To: <83a3c8d0abf217369f045df0217b1f64.sboyd@kernel.org>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Sat, 11 Feb 2023 10:19:52 +0100
Message-ID: <CAOf5uwk_ZtmuzUv9GNxOo0zmMnYVskBKfzm+9n3XO2U7j7C0Sw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] clk: imx8mn: setup clocks from the device tree
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-kernel@vger.kernel.org, angelo@amarulasolutions.com,
        tommaso.merciai@amarulasolutions.com,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-amarula@amarulasolutions.com, anthony@amarulasolutions.com,
        jagan@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Li Jun <jun.li@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi

On Fri, Feb 10, 2023 at 11:49 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Michael Nazzareno Trimarchi (2023-01-26 02:49:54)
> > Hi
> >
> > On Wed, Jan 25, 2023 at 10:11 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dario Binacchi (2023-01-01 09:57:29)
> > > > The idea for this series was born back from Dublin (ELCE 2022) after
> > > > having attended the talk entitled "Updating and Modernizing Clock
> > > > Drivers" held by Chen-Yu Tsai and the availability of a board with
> > > > imx8mn SOC.
> > >
> > > Interesting. I didn't see any mention of putting clks into DT in that
> > > presentation.
> > >
> > > >
> > > > This series aims to setup all imx8mn's clocks from the device tree and
> > > > remove the legacy setup code with hardwired parameters.
> > >
> > > Please, no! We don't want one node per clk style of bindings.
> >
> > I think the idea behind is:
> > - create a way from silicon vendor to export their clock mapping with
> > automatic exportation
>
> I suspect silicon vendors automatically generate their clk drivers
> today.
>

Was easy to think that creating tools for dts generation was easy to
have because
they don't depend on the internal linux kernel and they are formally
described. Export
clk drivers considering kernel internal change I don't think that can work.

> > - reduce the copy and paste code across the drivers
> > - avoid code duplication
>
> Code duplication should be avoided. Surely the clk_ops is shared? Data
> duplication is the real problem here. The status quo has been to have

The idea to have in dts was to have much less code by the end to handle
different SoC vendors but as you pointed me seems that you are more
concerned about data duplication.

> data descriptions of clks in drivers so that drivers can turn them on.
> If we're trying to avoid bloat then we only enable the drivers that we
> care about, or make them modular so they don't waste kernel memory.
>

I'm not an expert of the dtc compiler but, is that possible that some
optimization
can happen there in the feature?

> If you have ideas on how to avoid duplication there then by all means
> implement them. Don't move the data duplication problem to devicetree
> though.
>

We will sit together again ;) after your comments here

> I've been wondering if we can tag drivers that are compiled into the
> kernel as freeable if they aren't ever going to probe because they're
> for some SoC that isn't present. That would allow us to shed various
> builtin clk drivers on systems instead of forcing us to make everything
> a module.

This is general on the driver level but sounds like a good idea.

Michael

>
> >
> > Is the binding a way to solve this problem?
>
> Don't think so.
>
> > If you don't want one node
> > per clk style bindings, did you still think that the way
> > to go is totally wrong?
>
> Yes.



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
