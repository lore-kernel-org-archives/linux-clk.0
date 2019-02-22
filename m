Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF78C43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 01:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CC522080F
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 01:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aC/RqzGm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfBVBHk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 20:07:40 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42510 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbfBVBHk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Feb 2019 20:07:40 -0500
Received: by mail-ot1-f68.google.com with SMTP id i5so497035oto.9
        for <linux-clk@vger.kernel.org>; Thu, 21 Feb 2019 17:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=03UzzOJG6Qx0sa4ywpYSrI8fbPyjh8fLo5nF69UtJIU=;
        b=aC/RqzGmUSmWUbtY6ygP0yZYwbJ8WqqI6RBPmuEcCoOLz9DHHCJfjLy+StxkR/RwXY
         hpNVDBK1Qd1fSkZAR/8rwbIr1IsOVUolT/b9P4Icgxx6mt8vFGnwoNbEQyC37M1GfGAN
         E7THMALFx3QW7mynxmYZnXi0FpmeFOn6aRx3O0zNMGTRbIWnXICPGDgF/fd9BCKBHHXD
         yi1sxKsDn7peyFfd8wm7pCsIqe5mq4JmUEy8La67YGrjCSBCVoTnP4wUmG4lNWBQfJjM
         dHANOdPJqaCOBMOYyphWO4r9UMzAk69dkguH6cPrvsuz/XRA3N8TEiskSoxtcUEoad1e
         KVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03UzzOJG6Qx0sa4ywpYSrI8fbPyjh8fLo5nF69UtJIU=;
        b=WUm+w2BzmS1QTUZi1zJOc9qNf7HJjbIgV5/EztxlxUnhBYhvV5gCoSOmtLaZa9pkxW
         ct7MZOi/UyH2QROsl15wfDTL7EHyXVNXCzy7vc1fxmYxrHLhyZjWlN1N+1PUBsC6rwv8
         Dj0NTiUUSh0Dft+iyTAOzYMEPwuGSJbg5AmJ8QLqu9wU/7ujiSiUcygxRA175c4MVJyi
         VUY0lTqOkY6TI8LZDC6jHsWqFxUlLzvdAFtBDbMIA8Bxy8tzckQZnhW6EqT7BAkrEIbY
         WrJJm2PgvLK17Zx23nz7/k2oKVekT65W/Yn8WyScmKTG+AgBcX8ia1QxWzvK0rzaZyXS
         Ud4Q==
X-Gm-Message-State: AHQUAuaImW5upXJZAxZhvNn75YL8XitfRLhcA70+5ZLVhvdMOP1gg7ti
        wXB/zzCCVINEiM+nSknR3TfRXpZIuzSV1JuFIus=
X-Google-Smtp-Source: AHgI3Ia0mG+atwRQe1U/Ata/5jKFzwscHzMgga9btyDH5U+jbki/3d5Qa9D63l3eWmDG/rFJSrrGvJL0ChCjZmLSce4=
X-Received: by 2002:a05:6830:14d6:: with SMTP id t22mr1003101otq.255.1550797659539;
 Thu, 21 Feb 2019 17:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20190131002056.12024-1-festevam@gmail.com> <155078140414.77512.3157214123340597508@swboyd.mtv.corp.google.com>
In-Reply-To: <155078140414.77512.3157214123340597508@swboyd.mtv.corp.google.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 21 Feb 2019 22:07:28 -0300
Message-ID: <CAOMZO5Cu=+8bbbW9k0soihpr_xHDeivijQAn7aL1VHPSdy_faw@mail.gmail.com>
Subject: Re: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Abel Vesa <abel.vesa@nxp.com>, Bai Ping <ping.bai@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>,
        Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Thu, Feb 21, 2019 at 5:36 PM Stephen Boyd <sboyd@kernel.org> wrote:

> Applied to clk-next but I had to fix the whole DT binding number because
> I don't know what this patch is based on. In fact, please get everyone
> involved at NXP and whoever else is working on i.MX clk drivers to
> coordinate somehow. I just spent 20 minutes working through the set of
> imx patches in my inbox and I see approximately 6 different authors all
> sending out a few clks at a time for the same drivers with zero
> information about what the patches are based on or what order they're
> supposed to be applied in.

Sorry for the trouble!

> If someone wants to collect all the patches and indicate on the list
> they've picked them up and will be sending them as a pull request that's
> fine. Otherwise, I recommend working together to post a coherent patch
> series that adds the things that everyone wants or working from a stable
> baseline like an rc tag and letting me figure out how to do the merging.
> Either way, it looks like if I ever get a patch for imx clk drivers that
> doesn't have a cover letter or is just adding a few clks here and there
> I'll have to assume it's the same story as always and just toss them
> into a clk-imx branch without a topic.

Yes, let's try to make this better.

Thanks
