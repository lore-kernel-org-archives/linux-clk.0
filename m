Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7929CC433FE
	for <linux-clk@archiver.kernel.org>; Wed,  9 Nov 2022 08:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiKIIi0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Nov 2022 03:38:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbiKIIiV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Nov 2022 03:38:21 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21D613F86
        for <linux-clk@vger.kernel.org>; Wed,  9 Nov 2022 00:38:19 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id kt23so44708745ejc.7
        for <linux-clk@vger.kernel.org>; Wed, 09 Nov 2022 00:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mSqik3rxjfUwFIPuwdL2bfvmWkPZxeeN66JvCGTMZuI=;
        b=IdTK6q0AI/+gRQ29/pvGAHr9D2TdJpwFSpm3gknaIg2EDBMeKy7D2Hj0IE+nZV+GRX
         wRBVEmw0+LmdXSX/1lDbushStSCIAQDtVCJINug5iOtCU5kEmsgC7PfjXQEKqlxxwxoK
         1khdhOiOoDFle8XDOcjugvvGrf6ddp2GeuDP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSqik3rxjfUwFIPuwdL2bfvmWkPZxeeN66JvCGTMZuI=;
        b=H++Mh7deOHI888R+2FKjP5DrsuMnjpVcK8S4Fy5KbVVB8vA2RTqyCoTJFXC47Pdusb
         xEi1f5t4mEaVK+zkNahp4vkpgV7HTKa0+4+WJjXwJUPxxW3x0f0pjd7EfYW0LFvkxmt2
         x/oYxZ/Rl5VzqX0eO7slk2YCkZiJ8z2RQ7iTRe4Y01HHQXPJLHrkXBOvY3nwptV0A0v2
         191ChSyKzXoSYmiAjzhsIufArBgoRCUbrLZwd5rUM96xeMlnuiNi1eq9AGMhYXeUjlrD
         d4t2yt4EOyI15fQZNqLkHTs0X0kSD2i2r4grBsRCQ0pTQwON+lZiWtboQuDC58Z68dN/
         us0Q==
X-Gm-Message-State: ACrzQf359xTrrs1+TOgSwHR5oVtkY+eBaq3IDJaFDKQNQpL6Pf1GXynF
        NmD1y1i0rE0h3b+YedjNv9UvBfbCANuNyR8KLlDlxg==
X-Google-Smtp-Source: AMsMyM66uNQ6nvWE+msNF+dvlf/6F4BeteTJztdeUq/qPmCufp4nXFQATR3FREnJuWKqQugU6bs5rSKSpQx9ihgiMrs=
X-Received: by 2002:a17:907:6d82:b0:7ad:dfb1:bcc with SMTP id
 sb2-20020a1709076d8200b007addfb10bccmr45568424ejc.766.1667983098310; Wed, 09
 Nov 2022 00:38:18 -0800 (PST)
MIME-Version: 1.0
References: <20221106154612.3474940-1-dario.binacchi@amarulasolutions.com>
 <Y2thuiR3UVEeLCQO@atomide.com> <Y2tiHNLPiAwV6oEn@atomide.com>
In-Reply-To: <Y2tiHNLPiAwV6oEn@atomide.com>
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date:   Wed, 9 Nov 2022 09:38:07 +0100
Message-ID: <CABGWkvrEGKTrwMgedzE1Oj0F+Fgpmzm6sB4hs7wcNn3xKPUupQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: ti: add of_ti_clk_register() helper
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
        Amarula patchwork <linux-amarula@amarulasolutions.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Tony,

On Wed, Nov 9, 2022 at 9:17 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Tony Lindgren <tony@atomide.com> [221109 08:06]:
> > * Dario Binacchi <dario.binacchi@amarulasolutions.com> [221106 17:36]:
> > > The ti_clk_register() function is always called with the parameter of
> > > type struct device set to NULL, since the functions from which it is
> > > called always have a parameter of type struct device_node. Adding this
> > > helper will allow you to register a TI clock to the common clock
> > > framework by taking advantage of the facilities provided by the
> > > struct device_node type.
> >
> > Makes sense to me.
> >
> > Do you have a patch to make use of this I can test with?
>
> I mean a patch to convert the ti_clk_register() callers to use this or
> what's your plan?

The first patch that calls this function is the second one in this
series "clk: ti: dra7-atl: don't allocate` parent_names' variable ".
Since I don't have the dra7 hardware, I have indirectly tested it on a
beaglebone (gate clock driver) board. To do this I also
had to add the of_ti_clk_register_omap_hw() helper. In the case of the
dra7-atl driver it was not necessary because the setup
function calls the ti_clk_register() directly.
If you think it makes sense, I can do 1 or more patches that replace
ti_clk_register() and ti_clk_register_omap_hw() with their
counterparts of_ti_clk_register[_omap_hw]. And I could test this
further series on the beaglebone board.

Thanks and regards,
Dario

>
> Regards,
>
> Tony



-- 

Dario Binacchi

Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
