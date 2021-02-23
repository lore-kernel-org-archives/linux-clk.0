Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0044DC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 19:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A22D364E7A
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 19:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234029AbhBWT5a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Feb 2021 14:57:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:39404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232812AbhBWT53 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Feb 2021 14:57:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EFCF64DA1;
        Tue, 23 Feb 2021 19:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614110208;
        bh=jnaowvblzkFVedEmqXENoibtvZ/prZM4tJokMQaiz6k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ii9MufWXpX1DGlG/gkJMP4QvFFDQqcCzF6wRiCumPtuF13xA5zhngBxm4q2btulEV
         ap0RUseG5jZG2cEv7B9Z81pnN8ifKCzgaABUFZOBuHF2qcdu2Yns+sZ78O8j8EZb4d
         XjNOEL8eqw1pBjjQzO5o0DkiJG2orFedhlol+flLZDNNYhTRW3k9cQ4AOajwd0ra22
         tATLL0K5vL8/w95RAiYY7vFxh7LtFofNy/uUnoaQm5+q8NpC6xRH6dKSUeoq38Gk/U
         itFCJEmPyP1jV/e0Yg9tq8JxzO5+yvciOvqe0sygGdoonxmHkdDrO1BHJGJ7LgeR3A
         zyuDASSgxPTcQ==
Received: by mail-ot1-f51.google.com with SMTP id s6so16861401otk.4;
        Tue, 23 Feb 2021 11:56:48 -0800 (PST)
X-Gm-Message-State: AOAM5325BFx0Lzm5QnMajGdEba6eKX6NcsQUlGMjidie6NEddAX7KTu5
        In3+9tfdPrtlIbPtJrOGgbf31tOMStyhCdFG7p0=
X-Google-Smtp-Source: ABdhPJwLGnNsdpR0pNQXd8bGAoyvv4sECVmhfJu7doeBj9GJ655fYbpzHUgRmVn6VFTETi9lGa6N5Fs+HnSD/QUdPd4=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr21502180otb.305.1614110207527;
 Tue, 23 Feb 2021 11:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20210211052206.2955988-1-daniel@0x0f.com> <CAFr9PXkvJN2AwTFTXLoTFj988LD+53eW4Y28nJ2M+7YygBJ58g@mail.gmail.com>
In-Reply-To: <CAFr9PXkvJN2AwTFTXLoTFj988LD+53eW4Y28nJ2M+7YygBJ58g@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 23 Feb 2021 20:56:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Wgx=aq1bO+jfedBVh_690ZDq_gXoM_H3s9fZ+g5H8_g@mail.gmail.com>
Message-ID: <CAK8P3a1Wgx=aq1bO+jfedBVh_690ZDq_gXoM_H3s9fZ+g5H8_g@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] ARM: mstar: Basic MPLL support
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     Olof Johansson <olof@lixom.net>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        DTML <devicetree@vger.kernel.org>, Willy Tarreau <w@1wt.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 23, 2021 at 2:44 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> On Thu, 11 Feb 2021 at 14:22, Daniel Palmer <daniel@0x0f.com> wrote:
> > Daniel Palmer (7):
> >   dt-bindings: clk: mstar msc313 mpll binding header
> >   dt-bindings: clk: mstar msc313 mpll binding description
> >   clk: fixed: add devm helper for clk_hw_register_fixed_factor()
> >   clk: mstar: MStar/SigmaStar MPLL driver
> >   ARM: mstar: Select MSTAR_MSC313_MPLL
> >   ARM: mstar: Add the external clocks to the base dsti
> >   ARM: mstar: Add mpll to base dtsi
>
> The first four patches have now been merged.
> I forgot to send these to the soc patchwork so I think the last 3
> didn't show up on your radar..
> What do I need to do to get the last 3 merged?

Let's merge them for the next merge window, please send them after
-rc1 is out.

        Arnd
