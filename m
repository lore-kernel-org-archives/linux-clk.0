Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7EAC433F5
	for <linux-clk@archiver.kernel.org>; Sun, 17 Oct 2021 16:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAA6D61040
	for <linux-clk@archiver.kernel.org>; Sun, 17 Oct 2021 16:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241649AbhJQQRo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Oct 2021 12:17:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:42150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229739AbhJQQRo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 17 Oct 2021 12:17:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A00B8611AF
        for <linux-clk@vger.kernel.org>; Sun, 17 Oct 2021 16:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634487334;
        bh=NR0i8xuyz21CIQ5+eMJSeLInFgmTs8TjqG5OtNwG/2c=;
        h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
        b=pfBleX46C2dXs7nhKTtkOxAY8rRC8Qolc/vNi3JFJtlJ0C4T5lwNG0EoEc/9n9qHh
         oWXqOCkHtt4NelHbXt4rb6LJ36tP4P0aus1aCT1Q1feFxSmYJaqleuebh0HdCfWOyF
         I//UVl3xxP7knwvcQwPOqaSwoEbqmHB+KxWnD46bk07VW/VGH3lWEgmdTw/bBPLNRa
         Cg7aBkeaFpgBjnvnT7/sEhqXzS1Bw36t4E5YnKbf8YtEcn9FWIdseEXmitL1Pr+BUD
         y8nAsc2TtK0FiO6Jy8UosxV/hG6ks2B6hbHdEPElEslUs/ZEUFAkkyFjDOSUDaa9vM
         ipFcClwYap95g==
Received: by mail-ua1-f52.google.com with SMTP id h19so2372452uax.5
        for <linux-clk@vger.kernel.org>; Sun, 17 Oct 2021 09:15:34 -0700 (PDT)
X-Gm-Message-State: AOAM533LH0ITRiT3WJc+sLrWPevUGQ5URgHpIHl1mXPqnE33OaOjLMwH
        J/7fFHhlV6Gz5y/Jg+auf+JkNsno+HoCUKsWw4E=
X-Google-Smtp-Source: ABdhPJw7jo41DrBPvwc6sU+NQKiYDlVifgGimi3V8dhfLLK78RDA5UW+pWXJIPjKPJKissQrMZXm7WlWc/AKHq2L/js=
X-Received: by 2002:a67:d38e:: with SMTP id b14mr24280823vsj.13.1634487333689;
 Sun, 17 Oct 2021 09:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211016105022.303413-1-martin.blumenstingl@googlemail.com> <128bdf6e-f613-048b-4397-88f9ba8fd023@gmail.com>
In-Reply-To: <128bdf6e-f613-048b-4397-88f9ba8fd023@gmail.com>
Reply-To: wens@kernel.org
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Mon, 18 Oct 2021 00:15:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BzCG2gK87m5paW-O7B7zjjP7d=jSCMS1gK8xOmPqgWQ@mail.gmail.com>
Message-ID: <CAGb2v64BzCG2gK87m5paW-O7B7zjjP7d=jSCMS1gK8xOmPqgWQ@mail.gmail.com>
Subject: Re: [PATCH clk-fixes v1 0/2] Fix clk-composite to support .determine_rate
To:     Alex Bee <knaerzche@gmail.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mike Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Oct 16, 2021 at 7:51 PM Alex Bee <knaerzche@gmail.com> wrote:
>
> Hi Martin, Hi Stephen,
>
> Am 16.10.21 um 12:50 schrieb Martin Blumenstingl:
> > Alex reports [0] that commit 69a00fb3d69706 ("clk: divider: Implement
> > and wire up .determine_rate by default") breaks Rockchip platforms
> > because the parent is not considered anymore. This is because
> > clk-composite skips the "best parent" selection when
> > rate_ops.determine_rate is set. Above commit does this by adding
> > clk_divider_ops.determine_rate by default (then the Rockchip platform
> > drivers are using clk_divider_ops as rate_ops in clk-composite).
> >
> > With these two patches a revert of above commit is not needed anymore
> > (which would result in a revert of five follow-up commits as well).
> > Instead the first patch changes the order so clk_divider_ops which
> > has both, .determine_rate and .round_rate are supported by clk-divider
> > (again).
> > The second patch makes clk-composite use (and even prefer)
> > rate_ops.determine_rate when available.
> >
> > Special thanks to Alex for his patience and helping test these patches
> > off-list (since I don't have any board with Rockchip SoC).
> >
> > At least the first patch should go into -fixes.
> >
> >
> > [0] https://lore.kernel.org/linux-clk/4eb964ac-4fff-b59d-2660-2f84d8af5901@gmail.com/
>
> thanks for looking into this and fixing .determine_rate + mux as well
> for making this future-proof.
>
> Both [PATCH 1/2] as a standalone fix, as well as  [PATCH 1/2] and [PATCH
> 2/2] in combination are
>
>      Tested-by: Alex Bee <knaerzche@gmail.com>
>

Tested-by: Chen-Yu Tsai <wens@csie.org> # on NanoPi M4B and M4V2

showing SDIO back at around 150 MHz.
