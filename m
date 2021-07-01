Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2980C11F64
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 16:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 741C561414
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 16:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbhGAQKD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jul 2021 12:10:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:59012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229744AbhGAQKD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 1 Jul 2021 12:10:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A52346141C;
        Thu,  1 Jul 2021 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625155652;
        bh=GO2gkofuHyA0dpUUtLSHYIYsS4kckkjB+NImkgZ6mHE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n0l/v46hp4Iho/x+ZskCl+dlt2jOAly278mTYZ+Avxi2mvDH4fZcKyVnvgWGmwUxE
         kc0ycsHxGVJuUgvYVRP0fKRX9LbpTufqLIDhWKRXin6DvxV+Rm81TNUyN0SnD9a+rm
         maJ2ovTwGrou9F73d79/WustH9LA1vDvvlVArb31/lApyzcRdGkSYk7k2pBxksioIs
         QeCbHQ7lLKTTu9myPJCbB4rm7jkKTjuku27ViT75jAJYENWNFB1X/bzoc/dzrCOd/N
         brf1Gp4HuNQ8w5egJYXNK6NEXw6z0bv4zOvJADVftXUiZWUH6VUbS0uRabXVji6NL8
         jWYT9oL9MLM1Q==
Received: by mail-ej1-f46.google.com with SMTP id v20so11242712eji.10;
        Thu, 01 Jul 2021 09:07:32 -0700 (PDT)
X-Gm-Message-State: AOAM532ZSrGWvspt7OQgNzHL1z08lXUVrW4rJEX3HhLuGTrztl7MlHM2
        5S8xY/IU1PMDECm6MV/cx/QcBfHe6bgOpqy+dw==
X-Google-Smtp-Source: ABdhPJzOylyVnY2lCU5AQmYuo0z2lxjEOUFSvFta6YmbnwycNAscr4yIw8XRlrHvRaImRfYJ4cUcOZvYOZsMR6J5ZqY=
X-Received: by 2002:a17:906:9419:: with SMTP id q25mr588619ejx.341.1625155651213;
 Thu, 01 Jul 2021 09:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190912.262809-1-daniel@zonque.org> <20210617190912.262809-4-daniel@zonque.org>
 <20210624213317.GA2020700@robh.at.kernel.org> <963c50c4-6adc-e437-dd12-08e75c2dbc84@zonque.org>
In-Reply-To: <963c50c4-6adc-e437-dd12-08e75c2dbc84@zonque.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 1 Jul 2021 10:07:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJagK4a57enCvLeyCNujxTphYsh=Mc+=A5Zz=5z37_FSA@mail.gmail.com>
Message-ID: <CAL_JsqJagK4a57enCvLeyCNujxTphYsh=Mc+=A5Zz=5z37_FSA@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: clock: cs2000-cp: make clk_in optional
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 28, 2021 at 10:03 AM Daniel Mack <daniel@zonque.org> wrote:
>
> On 6/24/21 11:33 PM, Rob Herring wrote:
> > On Thu, Jun 17, 2021 at 09:09:06PM +0200, Daniel Mack wrote:
> >> CLK_IN is only used in dynamic mode and is hence optional.
> >>
> >> Re-order the clocks so REF_CLK is specified first.
> >
> > It's not a compatible change. You can't do that unless you can explain
> > why it doesn't matter.
>
> Hmm okay. And that rule also applies even if I patch all mainline users?

Explaining why you are doing something and the implications of the
change, yes that's required for every commit. Whether you can make
incompatible changes, that's up to platform maintainers. I only ask
that doing that is documented clearly.

Do you know that every user of affected h/w is okay with you requiring
them update their dtb?

Rob
