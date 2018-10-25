Return-Path: <SRS0=7v9C=NF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EB6ECDE46
	for <linux-clk@archiver.kernel.org>; Thu, 25 Oct 2018 12:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 501FE20847
	for <linux-clk@archiver.kernel.org>; Thu, 25 Oct 2018 12:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LRUVPRSy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 501FE20847
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbeJYVZs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Oct 2018 17:25:48 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:37551 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbeJYVZn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Oct 2018 17:25:43 -0400
Received: by mail-it1-f193.google.com with SMTP id e74-v6so1564660ita.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Oct 2018 05:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ZyzwGu+LS+XKtGGrRFFX1CguiOMiZsOJFAC3pjAt5s=;
        b=LRUVPRSyJO+e1ARvDsZNwapCgsxiqzL8i2YxoRZ8FUUFVJnuTjDLHeqIDw3t7xKBKC
         B6VATVhvg+LIKU7PU1DLnkd5JcsVPZVXg2Dy2fdxyr7youJMjkvgswO+KcykZQOelmv7
         waB8nsv+kQYY1fKEn0gUwc0Fzn7A5xuugAOng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZyzwGu+LS+XKtGGrRFFX1CguiOMiZsOJFAC3pjAt5s=;
        b=HEn/FoZvZJEs9n6jFalXnwJ+OMLsQqoVIIH3vLHHihN6zvls4SDGqe/lRRVAYL06z9
         l4KrYxU3oAM+yJZtVPTWr3NqNqA5pryghhJGVnqRocOLZ6BBVPjlW2BsdXSN6lkyw2vR
         4mRkKdLTo6FAwHFANWr18brr4sH6H6ZQFlJJI41JD0ulzW9dz+m1AOUFnNS9OMpyl/xT
         UX2ehKvDOEaAPxIt8avzUzt8mD5dtlzvGzmhpiQkDIkAomtUIdZHJuCEqRWQEharJtGk
         G2RPrnGOKv5A0rBxno+jQvMYK0lNOX7UbouINYVcuPiu3sfWtjHAty93CBi4KxRsh62p
         L/cQ==
X-Gm-Message-State: AGRZ1gLLbt02ly5c98ITkCS0wR2cCGt3Uf1ft0Wisqf3oO3gSJdxHPth
        f/i8i7UoBS4gNZY3cCgUNy7o9/5RXThvbvfod1muPw==
X-Google-Smtp-Source: AJdET5du68Y097RdkIgB24CjB+GWxzAkbYoctQ6+9oLLsomLgRFC7mag8a9ArydcOaeg0/E3lIOxpc0JY1yAbITEH5U=
X-Received: by 2002:a24:7f06:: with SMTP id r6-v6mr873041itc.107.1540471983909;
 Thu, 25 Oct 2018 05:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-14-jagan@amarulasolutions.com> <20181024180927.ejt7odo23ebzjgfg@flea>
In-Reply-To: <20181024180927.ejt7odo23ebzjgfg@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 25 Oct 2018 18:22:51 +0530
Message-ID: <CAMty3ZC3jXKBVrrCSd0Un+ZNvNKPj4C0WpcpNOYJBK1=vehBQg@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] dt-bindings: sun6i-dsi: Add compatible for A64 DPHY
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 24, 2018 at 11:39 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Tue, Oct 23, 2018 at 09:20:33PM +0530, Jagan Teki wrote:
> > The MIPI DSI PHY HDMI controller on Allwinner A64 is similar
> > on the one on A31.
> >
> > Add A64 compatible and append A31 compatible as fallback.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v2:
> > - new patch
> >
> >  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > index 9fa6e7a758ad..704fb31962f2 100644
> > --- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > @@ -36,7 +36,7 @@ D-PHY
> >
> >  Required properties:
> >    - compatible: value must be one of:
> > -    * allwinner,sun6i-a31-mipi-dphy
> > +    * "allwinner,sun50i-a64-mipi-dphy", "allwinner,sun6i-a31-mipi-dphy"
>
> No. you need both. The A64 MIPI DPHY one needs to be always set with
> the A31 fallback, but the A31 is also usable on its own.

Why wouldn't be, because we don't have any difference dphy right?
