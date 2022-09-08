Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E459DC38145
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 16:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbiIHQAY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 12:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiIHQAX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 12:00:23 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD0A7C189
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 09:00:22 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id u9-20020a17090a1f0900b001fde6477464so2763814pja.4
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 09:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uUAptloKXsUhc5RdRAer9UcXRS270T3TKnFTRNXj8IE=;
        b=VnRpsbSsELxB/oSot/2j6eMfU1heBpPQFSiokJNJsEWZBKYql0eypvaIz7fux1H30h
         QzFWu7cN+1JV/mlix7z8lnMHYZr/5e/gEPossmBKL0emMirrVmB3bXBvmDL73cPu0z53
         Pru5E/dNRV/NAi6Tw0yI/PqWmgogcEZPpba0j24fz+iBDcjTGQRR/7eI30j/VKnESigD
         mmHKtaIvtjUDKqQj+RqJijWLFKyADgguZbtG/MOLRnJRIWdJjz08mUE6eED6pMM/O1Oe
         yym8lYFktVwoxGdFGVagt1570kxrtVwQZ3non7YVMkoS6+ZXgbBCxGyVpqZ3dmet+HRr
         tvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uUAptloKXsUhc5RdRAer9UcXRS270T3TKnFTRNXj8IE=;
        b=wfy1ucVQ5zmKu/0erLdTwYJ+mH+wTzicXDBgtCQb+g/U/FPwYysWIukUJlw0heqnxX
         yE5oT3SVIEN6xt0Vsduk1oM+4+ixvVnCTRR3J82ulGbW2DDDR2rKIjopPPk9z8Gw7Nqk
         Rul2YQDUKJpQx8Q7+OF5+5tYJ0dtBEckN5OmAge65u8FEFFdfRE1540oO1dPpaqaCS8a
         av/DrGdwOBD4rWUZi7vAy2gbrES8otZhualTgbRPCwSxLKpEURlpxz1+1y4yAC0QdzW1
         ljnpe/4He31hmQKw9KKJNBdZo2hozyaj4BnzOc5ZUu89rrkmBcl6cQxbhA4uCVqoJZV2
         nbMg==
X-Gm-Message-State: ACgBeo0bSkhSAUzaAzmO/fe16/4JLINByFYWxCzVO4OyHcA5lwc/BNUw
        PqJzgr5f9t1bKqyHMQdyQHpUIh0GvPm7qbTFAdrrTg==
X-Google-Smtp-Source: AA6agR5madP3qGyz1BQfqw3nC2KML73nEGwhEuS5oVy2zsJA6zOqe6vCk5VeGmvO8XNL96AqFkx91ucSEd3mQ9kQCv4=
X-Received: by 2002:a17:902:9887:b0:172:7090:6485 with SMTP id
 s7-20020a170902988700b0017270906485mr9826023plp.63.1662652821976; Thu, 08 Sep
 2022 09:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1Za2CPGVX3q4HKufsxbL5zRrk1B5CWFpKritetrTs4dA@mail.gmail.com>
 <59b6dd0a-7cbb-5dbd-8da0-57baeba3327e@gmail.com>
In-Reply-To: <59b6dd0a-7cbb-5dbd-8da0-57baeba3327e@gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 8 Sep 2022 09:00:10 -0700
Message-ID: <CAJ+vNU2FVQRwCa3DnOwkFjaZg-ntFLZmetwDbSggDXDdwOOGTg@mail.gmail.com>
Subject: Re: BD71847 clk driver disables clk-32k-out causing RTC/WDT failure
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Marek Vasut <marex@denx.de>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 1, 2022 at 9:14 PM Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>
> Hi Tim,
>
> On 9/2/22 01:23, Tim Harvey wrote:
> > Greetings,
> >
> > I've found that the bd71847 clk driver (CONFIG_COMMON_CLK_BD718XX
> > drivers/clk/clk-bd718x7.c) disables clk-32k-out (the BD71847 C32K_OUT
> > pin) which is connected IMX8MM RTC_XTALI which ends up disabling the
> > IMX RTC as well as the IMX WDOG functionality.
>
> //snip
>
> > This happens via clk_unprepare_unused() as nothing is flagging the
> > clk-32k-out as being used. What should be added to the device-tree to
> > signify that this clk is indeed necessary and should not be disabled?
>
> I have seen following proposal from Marek Vasut:
>
> https://lore.kernel.org/all/20220517235919.200375-1-marex@denx.de/T/#m52d6d0831bf43d5f293e35cb27f3021f278d0564
>
> I am not sure if the discussion is completed though. I guess it was
> agreed this was needed/usefull and maybe the remaining thing to decide
> was just the property naming.
>
> Best Regards
>         -- Matti
>

Thanks Matti,

Marek - has there been any progress on determining how best to keep
certain clocks from being disabled?

Best Regards,

Tim
