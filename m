Return-Path: <SRS0=O2Di=ZJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6FBC432C0
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:42:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A708F206DB
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH1RrbLd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfKQMmq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:42:46 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:34975 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfKQMmp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Nov 2019 07:42:45 -0500
Received: by mail-il1-f193.google.com with SMTP id z12so13434254ilp.2
        for <linux-clk@vger.kernel.org>; Sun, 17 Nov 2019 04:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ApUhfkWLXsiE5ipNrOg9nvjZff7lfGHQm/7BE1gXgAk=;
        b=GH1RrbLdXySK8/BmtcofgBiF1DmolDgC+MZGi6uL+u+jYV3vONIZyRUvdaN8lPFpvR
         dXTR43GhjRFIG12L4UnWGmcNch7FkXt2aqcE3LjZ8ifYgzQq7MI8RSMgsaUk0GGIFKtg
         34Qik24fcfbCqXa9DCFl+nEyxrdZvH2T7DV6UiguKk4vm15NAUUluUnDjNmgJhRbKUt9
         jaEV+3ej9EGcsaSm08CSUbFDa6oY8NOv4pa/W8C13qGOgYoAdrLF9yaj0XiBWo/s2DO9
         S7kRZI8qLy9lqhSj04ysdB+Lquv2mv1rORiBIu6R5kZP1SVLdCwjQxpjDnkc+pLz+gB7
         J16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ApUhfkWLXsiE5ipNrOg9nvjZff7lfGHQm/7BE1gXgAk=;
        b=p0q1o4bzopsHgvyajJGdKdf87NbOxif2YXih0MWzgEwfaavOVBck/LWttmqywHrImv
         A2BltLDPoF9xE+shIjnNOd8ECIwQb47J+HRk+cUCBXSTYnfttqkWJpcOeXm9cL8LN8uR
         kwVXoAKYi1dhOF+ZoBRyn70KOHMXLUp67Qni+lLHPka1sCEw8gS7hYrPw9VkgR9jxwbL
         lY9zWnR1lbwCp/1Y8kQZF3aXFCi//QttDc3Ff1umpF94vgxfXb0Z4tnMCGgTQ5UHiRrL
         yxvx26mtU5crLFoc3/ASGysyRxlbKVLJU4x3K1XfWrtxh9ksCmk6U7Yt9OwAMsanP8TG
         LAcA==
X-Gm-Message-State: APjAAAXlOcsHuJiwq9kvv+CxfwDtjjpoYTTVARDIlAmplXiT0MpAO788
        pxwMyyBJ5+7sgv+eCOGuQlXi44sUPRYMZ6+TpsU=
X-Google-Smtp-Source: APXvYqy3cQ3NGfwe6oEv94KxlSM9RkBL/JPl7Gv9l9OdJ8t8qboi3Dqzr7mEXKrTxXHVcP7jPihKpNT4KzdOe4hpTIE=
X-Received: by 2002:a92:8b4e:: with SMTP id i75mr10100379ild.5.1573994563780;
 Sun, 17 Nov 2019 04:42:43 -0800 (PST)
MIME-Version: 1.0
References: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com> <20190918060835.B93D420856@mail.kernel.org>
In-Reply-To: <20190918060835.B93D420856@mail.kernel.org>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Sun, 17 Nov 2019 20:31:43 +0800
Message-ID: <CAA+hA=Q+vcN1DQTc_E=ohcEz4b3oxcoYgGFsZYGuGH7h8hfCvQ@mail.gmail.com>
Subject: Re: [PATCH V5 00/11] clk: imx8: add new clock binding for better pm support
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Wed, Sep 18, 2019 at 2:21 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dong Aisheng (2019-09-09 19:09:57)
> > This is a follow up of this patch series.
> > https://patchwork.kernel.org/cover/10924029/
> > [V2,0/2] clk: imx: scu: add parsing clocks from device tree support
> >
> > This patch series is a preparation for the MX8 Architecture improvement.
> > As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
> > of a couple of SS(Subsystems) while most of them within the same SS
> > can be shared. e.g. Clocks, Devices and etc.
> >
> > However, current clock binding is using SW IDs for device tree to use
> > which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
> > different SoCs.
> >
> > This patch series aims to introduce a new binding which is more close to
> > hardware and platform independent and can makes us write a more general
> > drivers for different SCU based SoCs.
> >
> > Another important thing is that on MX8, each Clock resource is associated
> > with a power domain. So we have to attach that clock device to the power
> > domain in order to make it work properly. Further more, the clock state
> > will be lost when its power domain is completely off during suspend/resume,
> > so we also introduce the clock state save&restore mechanism.
>
> I had some more comments on v4. I'm going to wait for those to be
> addressed before reviewing this series.
>

Yes, i have addressed all your comments and resend v5.
Could you help have a look at it?
https://patchwork.kernel.org/cover/11248249/

Regards
Aisheng
