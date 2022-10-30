Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DC2C38A02
	for <linux-clk@archiver.kernel.org>; Sun, 30 Oct 2022 13:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJ3NBB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Oct 2022 09:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiJ3NBA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 30 Oct 2022 09:01:00 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA32BB7EC
        for <linux-clk@vger.kernel.org>; Sun, 30 Oct 2022 06:00:58 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id y14so23377206ejd.9
        for <linux-clk@vger.kernel.org>; Sun, 30 Oct 2022 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cnm35rG8dnbniH3bAdsis2He6cISe2Pf5wrYV6j4Yuo=;
        b=cBXwkIsKoN24vWlka5PMTG3c035GP+NNP31VTvKk/ovhdAguA9PbpUp6uDFTpc+1c6
         3gnedIZ6l+tDi611G64eg4QQ5ceCfjHFuJAnoIllowDtcEyxO+RWGugtPxtISGjYjtpS
         FGySmk4Q6UXqEnpwpOsb6BNHeeoT8Hh6DNIvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnm35rG8dnbniH3bAdsis2He6cISe2Pf5wrYV6j4Yuo=;
        b=vYv+uhjotBHN+H1w0ewvSfdOnsmfvV2ytV0K6KcVs2LlEvfsu8XmAz8+W6Rsh79W9/
         EqrCQsp3zjGVAJjF6CMJ4wzct10EVqDNCRTwEag5JtJmGLb2k1LyHxp4+bf+DvHmzp2Y
         hYb1lvlesV8AjcnV4TxtHzcnxQLih6bfSFT5qO6ACWza9eSxIMcL5STIOBubV/8ppFPA
         kE1+hskOTBy07YiLZR9CxKN84t/FzGqHbb0OB6JgBR0WeRBaarGmr2/epDe3eRLpezjg
         lu8cO6UtflgTNW2d0hqnosNHlr36v95L01o+nI4M5OOBK7Pr6+3p2IOWHZPRWzd+89PM
         o2ww==
X-Gm-Message-State: ACrzQf3wBbrMAxRWnWmKf9JTRL8tCf+kWeeQWMfNkypEpDUyfFMQ9T+w
        P05k1ZAcPTdpzoUSdI9kVNB70wC3/R9CKkNoulmgeg==
X-Google-Smtp-Source: AMsMyM4NetBq4ut/QzVWMIts/JGh74r3MvWVZbbPWGZD2uBgHT+KD14ty4JVz9cs6pVTghOuapmPpBHAw0T1nDpVIoc=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr8190502ejw.203.1667134857432; Sun, 30
 Oct 2022 06:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221018160352.1591428-1-dario.binacchi@amarulasolutions.com> <20221028002710.89A81C43470@smtp.kernel.org>
In-Reply-To: <20221028002710.89A81C43470@smtp.kernel.org>
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date:   Sun, 30 Oct 2022 14:00:46 +0100
Message-ID: <CABGWkvp1iMN-4XDN_ifg6uyvQbpRzNyat_eDziWY75Cf_hCpQw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: ti: dra7-atl: don't allocate `parent_names' variable
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Amarula patchwork <linux-amarula@amarulasolutions.com>,
        michael@amarulasolutions.com, kernel test robot <lkp@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Miaoqian Lin <linmq006@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <kristo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Fri, Oct 28, 2022 at 2:27 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dario Binacchi (2022-10-18 09:03:52)
> > diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
> > index ff4d6a951681..78482d1a4a33 100644
> > --- a/drivers/clk/ti/clk-dra7-atl.c
> > +++ b/drivers/clk/ti/clk-dra7-atl.c
> > @@ -188,24 +188,17 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
> >                 goto cleanup;
> >         }
> >
> > -       parent_names = kzalloc(sizeof(char *), GFP_KERNEL);
> > -
> > -       if (!parent_names)
> > -               goto cleanup;
> > -
> >         parent_names[0] = of_clk_get_parent_name(node, 0);
>
> Can you use struct clk_parent_data instead and assign index to 0? Then
> we don't even need to use of_clk_get_parent_name() here.

I tried to test your suggestions on another platform (I don't have the
hw to test the driver change) but if I
don't add pdata.name = of_clk_get_parent_name () the board boot up fails.

As far I can see from the clk_core_populate_parent_map()

....
/* Copy everything over because it might be __initdata */
for (i = 0, parent = parents; i < num_parents; i++, parent++) {
    parent->index = -1;
    if (parent_names) {
        /* throw a WARN if any entries are NULL */
       WARN(!parent_names[i],
            "%s: invalid NULL in %s's .parent_names\n",
            __func__, core->name);
        ret = clk_cpy_name(&parent->name, parent_names[i],
                                        true);
    } else if (parent_data) {
        parent->hw = parent_data[i].hw;
        parent->index = parent_data[i].index;
        ret = clk_cpy_name(&parent->fw_name,
                                         parent_data[i].fw_name, false);
        if (!ret)
            ret = clk_cpy_name(&parent->name,
                                            parent_data[i].name,
                                            false);
...


The function clk_cpy_name() is called with the parameter "mus_exist"
to true in the path "parent_names" and false
in the path "parent_data". Therefore, in the path "parent_data" it is
allowed that parent-> name is not set.
In doing so, therefore, the change would not even be backward compatible.

So, IMHO, there are 2 possible options:
 1 okay to use parent_data, but we keep using of_clk_get_parent_name
() to set parent_data::name.
 2 okay to use the version v2 of the patch.

What do you think?

Thanks and regards,
Dario

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
