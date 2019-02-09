Return-Path: <SRS0=pb9R=QQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B57C282CB
	for <linux-clk@archiver.kernel.org>; Sat,  9 Feb 2019 00:24:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 815C1217D8
	for <linux-clk@archiver.kernel.org>; Sat,  9 Feb 2019 00:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="W2ZWk+Ru"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfBIAYP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Feb 2019 19:24:15 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34370 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbfBIAYP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Feb 2019 19:24:15 -0500
Received: by mail-ot1-f68.google.com with SMTP id t5so8967119otk.1;
        Fri, 08 Feb 2019 16:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXRUY7ybCBbZhdhaceE/5bf76J7vkdyjiSyqUD4tjJ0=;
        b=W2ZWk+Ruz1Y2gbGtcnlKu1QU8wyjw33hruBtxHR0d3vzqYDybIfaKtoi6NvVsAh/2i
         ZWzozPgeUBgsRiEfypWNkgrmeJZ0KPbrq2488Ll6f/HTQ0P7RMwPSdJ5TnuazK9Cq48b
         OMSUO3Fm3V4gdX9d81zpH8imYpSNAv2Dj6FHeHeLGvM12L5HKD3WhprWld4YmDfNj/l4
         EKKnuytIhPacviaufMvECW7mYiqkT0P0m4ZuyI8ytWFtmmAmWDki3t8KqzkU5/3uwzDH
         X7BHC3XPjaV5EEoBNQ14rjU/o+32ei52wX1t/x/vcAFsH+zUjVz72NLQhGDSXmguAfuO
         te2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXRUY7ybCBbZhdhaceE/5bf76J7vkdyjiSyqUD4tjJ0=;
        b=Vgs4gLAC0lchdi39ozF2XHvjrwaGqSPooDRjGQY0HimTlxDvN2FFKKMI1GyIAYDK6x
         in9m+5JjaFABMWfLEQxjTcBU+vtfKnylNmhyriEyshjCUZvrFlM86OD4nuw3sIFJ2QVO
         55MWT6EP9RWvab75MoRjbkXTBmq7QmmUVKbPYBIfphsZiT3IGnisclHVy8lLdtr9kSyL
         uKKzJtio/9SLUW15qKdGqrQS79GJXEMIhCVW6aEqLWRXs0pJnaqr2p7leBWfFerX6IFl
         TAXl0YEWEkhAKAFtGJiPRsgmNgKVeUjqpu4I117jHOtaUQWfOnvoVXluAzPOBeCEa4yf
         PO8w==
X-Gm-Message-State: AHQUAuZTkdACf4j4K3gOc0DfLKPeevBzJLuSefJo0JYxKZdGbzbH5XiI
        wPkZPJxic53cigoJVyW27hIdxG0dL+eTyDbhAJk=
X-Google-Smtp-Source: AHgI3IYcbWPRLTikDj12GzHm+1A5fNYMQKFWw19TmuAfv8iELLNvooOBFzKZzeXRdXDOOecEZnO10EINdSBosb2LxRk=
X-Received: by 2002:a9d:6314:: with SMTP id q20mr4468640otk.348.1549671854006;
 Fri, 08 Feb 2019 16:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20190119205121.9621-1-martin.blumenstingl@googlemail.com> <095d0dca-f8d5-df7c-dbd0-7c2c50fcab82@baylibre.com>
In-Reply-To: <095d0dca-f8d5-df7c-dbd0-7c2c50fcab82@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 9 Feb 2019 01:24:03 +0100
Message-ID: <CAFBinCCrYrxnb6Dk-0kGwbk0ttwe+je+wKZqxe6GUASnNdAckQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Neil,

On Mon, Jan 21, 2019 at 11:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 19/01/2019 21:51, Martin Blumenstingl wrote:
> > It turns out that I'm not good at spelling "APB". Unfortunately an ABP
> > (instead of APB) typo snug into two clocks in v5.0.
> >
> > Currently there are no users of that clock yet, so fix it now
> > before it's too late (meaning before it's used by <something>).
> >
> > I decided to go the "normal" route where we can have separate
> > branches for the dt-bindings and the drivers in the clk-meson
> > repo. This means:
> > - new (typo-free) clock #define
> > - change the clock controller to use the new #define
> > - (next development cycle) drop the old #define
> >
> >
> > Changes since v1 at [0]:
> > - split into a dt-bindings and clock controller driver patch
> >
> >
> > [0] https://patchwork.kernel.org/cover/10742001/
> >
> >
> > Martin Blumenstingl (2):
> >   dt-bindings: clock: meson8b: add APB clock definition
> >   clk: meson: meson8b: fix the naming of the APB clocks
> >
> >  drivers/clk/meson/meson8b.c              | 26 ++++++++++++------------
> >  drivers/clk/meson/meson8b.h              |  2 +-
> >  include/dt-bindings/clock/meson8b-clkc.h |  1 +
> >  3 files changed, 15 insertions(+), 14 deletions(-)
> >
>
> Once rob acks it, I'll apply both to next/drivers since it's not used (yet ?)
> and not a critical fix.
I have just noticed that I forgot to CC Rob and devicetree@vger.kernel.org.
do you want me to re-send this series?

as you already noticed this is not critical, so taking this through
next/drivers is fine for me.


Regards
Martin
