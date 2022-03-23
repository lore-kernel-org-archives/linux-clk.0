Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6595C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 23 Mar 2022 08:26:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242672AbiCWI2I convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Mar 2022 04:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbiCWI1q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Mar 2022 04:27:46 -0400
X-Greylist: delayed 306 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 23 Mar 2022 01:26:16 PDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2106E7BE
        for <linux-clk@vger.kernel.org>; Wed, 23 Mar 2022 01:26:16 -0700 (PDT)
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N1M4p-1oCHeB1LRL-012mDR; Wed, 23 Mar 2022 09:21:08 +0100
Received: by mail-wm1-f46.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so480665wmp.5;
        Wed, 23 Mar 2022 01:21:08 -0700 (PDT)
X-Gm-Message-State: AOAM533GJ09L3LVWERS8Y48wrgahB+HbdO4fkNbMYx8hFRPs96NdXn8z
        /wqApL5m66evneso+dKoS8dRj2oVZ+gHHo76QUk=
X-Google-Smtp-Source: ABdhPJzZaEXlOkd+esyGRakeaMwED9DToYdSxV9NNtJQVS/LaQNhwvFQWaJyk53MNgkII5DhV1C2fpJBh5AycjwaHOQ=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr7911838wmc.94.1648023667977; Wed, 23
 Mar 2022 01:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647928315.git.qinjian@cqplus1.com> <8372ee2fcf361a3af7233450c4403178052ceee2.1647928316.git.qinjian@cqplus1.com>
 <CAK8P3a1H2xM1PdDwKPWHD0fqZ0q_o-KZTLvSXdm9jjqTWcX-hA@mail.gmail.com> <d79dd7655c964f88a58d8bf403da39be@cqplus1.com>
In-Reply-To: <d79dd7655c964f88a58d8bf403da39be@cqplus1.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 23 Mar 2022 09:20:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a10rsxpzd4eJbSJmRUDEMbOO+=6+=6Eu-7EY86+xw8V6g@mail.gmail.com>
Message-ID: <CAK8P3a10rsxpzd4eJbSJmRUDEMbOO+=6+=6Eu-7EY86+xw8V6g@mail.gmail.com>
Subject: Re: [PATCH v11 9/9] ARM: sp7021_defconfig: Add Sunplus SP7021 defconfig
To:     =?UTF-8?B?cWluamlhblvopoPlgaVd?= <qinjian@cqplus1.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:lTtBG+5RV6V1/aOEk688MfNsHWHJcRo+jtzt1jC19bNgxRCv/gr
 MZZYe8oKi6FYe4/rTIRXGsMK2jKafA5gMzeYS1VHuH0tILr7l+1qr5UwkEevDMhAjS4eZjP
 +cVZAP5r1KjtMEhFlJ8B2Ji5lcv9Ha/J4qhDvkaA+kHqzbwmostd4AX9OV9hh6o/xZFegPV
 fOdGWpknF/hs4DfDtRzbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dI8mdQKaTME=:P9cX/wBsUnayEHy7w0LTVu
 QNu9zNnv7z+ijl6zOS7les34cIJX1OYKH8xOW/SfagJUjRRa77oKa0/dH624ySRo4L6tTcAn0
 a5OVmqqJPB+fs27v03IFY/QT+PLpcc/841bknHDSY9Uo2Tpl6fj7Te6pddv8gi6NP6zjViEdj
 li2AdlZj9ubsR4e0N5SyU5I0+enWCGVtst3q3+GO6AxhOiMQKfpb1vGf04QDLAlTgvcJmDY9q
 EZD+WeWVoU0YIq2INleogXzrmga4cMgF8MGFSm/tPZqITxaq+hOJ4ciLAV4j4xsZDb6nmn++o
 UkrZm0nnDWSCOLMJN+pUGEozH5kOmwxqSaR5TDfsAzG7vVlGS+1lpLiHDs0jVSTtqzgKsatul
 fn4jJ6LczPkFjCQcKpb0B8qArRQRt8qsm/m7EmSwvThURpaVyFc9UbRBOnhZmXhAxLH9zzkLw
 I6gvP0fvVhUDzg/MIHZVIXU6BePhVbRWLczKdZX/N0LR7xH5JutJArtz4AtCqDSqPV/nJOV+w
 8XKbeQCzxYuWr1UK+f7wL5+IjmyElo9tLrAelz0ElSJ++FBvYTZ2a+FlHA75UOMrBSd6F2k0j
 3HZc26vPg4d5hGYu0E0JABhiI2jKc/Gcw/0TTG/SojH0gRH4rQACuLcw90jvuKnAH/HJzhDty
 O5beXS4v/f7VSpsrzYVwSoO4dKbOzWhOfGYb3eGvlsn9tHxldhJi0H8m8PVhjxR9rMEI=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 23, 2022 at 2:41 AM qinjian[覃健] <qinjian@cqplus1.com> wrote:
> > On Tue, Mar 22, 2022 at 7:17 AM Qin Jian <qinjian@cqplus1.com> wrote:
> >
> > It was a while ago though, so I don't remember the details, if we did
> > conclude the review, can you link to the lore.kernel.org thread in
> > the next version? Please also check the other patches on which
> > you added a 'Reviewed-by' tag from someone to ensure that they
> > actually provided that tag, rather than just providing review comments.
>
> In patch 6, I fixed all your comments.
>
> I got a reply from you: https://lore.kernel.org/all/CAK8P3a1Doh8GY9iFZsvmd6wASHoPqyR+roXx0G5XidnmHNkGaA@mail.gmail.com/
> > This looks all good to me now, it just needs a review for the clk,
> > reset  and irqchip drivers. ...
>
> If these not means you reviewed, I'll remove your review-tag.

You can only add Reviewed-by tags that have been explicitly given,
see the documentation at [1] for details. What I wrote was a less
formal acknowledgement that does not have the specific meaning.

      Arnd

[1] https://www.kernel.org/doc/html/latest/translations/zh_TW/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
