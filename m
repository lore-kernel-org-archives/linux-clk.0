Return-Path: <SRS0=Myif=3D=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E34C33CA9
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jan 2020 06:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3661C2187F
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jan 2020 06:15:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="VtlV23SB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgANGP4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Jan 2020 01:15:56 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41339 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgANGP4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Jan 2020 01:15:56 -0500
Received: by mail-qt1-f195.google.com with SMTP id k40so11479914qtk.8
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2020 22:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ch4JFaWZ+4hulVW/75xxG1rRsAkPE8hB8vp6jGgpbd4=;
        b=VtlV23SBZz6TEZdceHzpbWroE1C4NMpU13ieE1Bsl/va9EE9/lFhqmpRUeRPnIxQ3D
         5OA9uuF5pxcwG9SNt/GUdoZdSPxtL8wo3DBThSw8cL1vaPGnEzKmuK4lqQVO/u+12R+h
         IZksJ8HSFDxJlOgZJhCY0wvHN66LNhu5enBzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ch4JFaWZ+4hulVW/75xxG1rRsAkPE8hB8vp6jGgpbd4=;
        b=Vs2EN7z1u0WRdzqh92Xvjeg1CPvPLuIFbLRtX9ZRE98usPDhxeUkLGLQ5vgr5sq1Qv
         oXmutdmT4KcDxPRLieZkvDAdTxSSV+OgQPSyLP5DC/G4j8K3Ua3uoXQNtRbiXXKfPE8w
         ZT1Q33WmilefaeJdBmjdUFyswvpukxGaNY0glO18MXrl3HP73fjgdBDSDexKvSn10VCP
         zbAsJ9zmyXH400B61h0m0Rkv2c79oyUlsfR0KB28cUTZjiCFSjtddyOxwpVWZHb8Dzh0
         GP/JDTJgqWrcWY+FEb5N4QN2xn/mYXi6x/kBQUzhoKEQpKffz0W8bsA209PCUgt6dAoi
         B8EA==
X-Gm-Message-State: APjAAAVyYT88znt6vSeX2QgO7wpTTMYrB0l7Qj68lOSup7FM03giuo0r
        L0rR+zMTtbEcDl4ITuk2nN/ZttuVqEL1fFOoQFm+aoUr
X-Google-Smtp-Source: APXvYqxGOHfPgoNxBhydrYQjWY/pdNkxc8V8q5t4XPG2AnZ51P0xjiURnDVSATAJro+qmMalgYFzAyr8L81/7IC0eiM=
X-Received: by 2002:ac8:1aeb:: with SMTP id h40mr2277927qtk.269.1578982555458;
 Mon, 13 Jan 2020 22:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 14 Jan 2020 06:15:43 +0000
Message-ID: <CACPK8Xf0Oa62BsNOQ55rqAp_a=V-_9bm1c4nu_+Oo5zB=2+zpA@mail.gmail.com>
Subject: Re: [PATCH] clk: ast2600: enable BCLK for PCI/PCIe bus always
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 13 Jan 2020 at 21:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> BCLK for PCI/PCIe bus should be enabled always with having the
> CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
> initcall phase as an unused clock, and eventually it causes
> unexpected behavior on BMC features that are connected to the host
> through PCI/PCIe bus.

This is true for systems that have PCIe connected. There are systems
that do not, and in that case we don't want to have the clock enabled.

Are you doing this to support the case where the PCIe device not load
a BMC driver? (eg for host VGA use). If not, then you can have the
driver you're loading request the BCLK.

If this is for the host VGA device, then you will need to come up with
a mechanism that makes the enabling of this clock depend on the device
tree.

Cheers,

Joel

>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 392d01705b97..42bfdc16bf7a 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -64,7 +64,7 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
>         [ASPEED_CLK_GATE_GCLK]          = {  2,  7, "gclk-gate",        NULL,    0 },   /* 2D engine */
>         /* vclk parent - dclk/d1clk/hclk/mclk */
>         [ASPEED_CLK_GATE_VCLK]          = {  3,  6, "vclk-gate",        NULL,    0 },   /* Video Capture */
> -       [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  0 }, /* PCIe/PCI */
> +       [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  CLK_IS_CRITICAL }, /* PCIe/PCI */
>         /* From dpll */
>         [ASPEED_CLK_GATE_DCLK]          = {  5, -1, "dclk-gate",        NULL,    CLK_IS_CRITICAL }, /* DAC */
>         [ASPEED_CLK_GATE_REF0CLK]       = {  6, -1, "ref0clk-gate",     "clkin", CLK_IS_CRITICAL },
> --
> 2.17.1
>
