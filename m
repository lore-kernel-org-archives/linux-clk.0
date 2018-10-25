Return-Path: <SRS0=7v9C=NF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CA7C46475
	for <linux-clk@archiver.kernel.org>; Thu, 25 Oct 2018 13:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FF7720831
	for <linux-clk@archiver.kernel.org>; Thu, 25 Oct 2018 13:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Qf3MX/oB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FF7720831
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbeJYVyS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Oct 2018 17:54:18 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:53860 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbeJYVyL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Oct 2018 17:54:11 -0400
Received: by mail-it1-f194.google.com with SMTP id q70-v6so1594204itb.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Oct 2018 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+3Pr8Azj5r/pI/vbTSs4zjZ/yuzS5RwX1G1t8Tl5W2M=;
        b=Qf3MX/oB0IGyH3oCDsG10VwJb4T4oz/U1wwn4EA+ZQtk4/j5qnTvwgrC1S6oek8Tau
         /IhlgDhmagy3YJ33vEPk8MwPdxhYtbo7Tt/HzcEDC30SPSwD2Jn8GUYdEwtj6n2It8Si
         5OPe7gADLM/EJ4MhNVV4VHoYEvHwIJWtre/qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+3Pr8Azj5r/pI/vbTSs4zjZ/yuzS5RwX1G1t8Tl5W2M=;
        b=tSzWQSyqslpgGEGwsTBorYBH4henyId7ebAuK0/kwvtJp6YxizYDFGdfKsv/nAmS3Q
         x2BZzUWyG/7iL3DuCql8bbvw4LsDgNiIYxmOQHPavg98epvHDoVz/+ZhGrN9YQM/Ele2
         X7Z9myKHWW9GODqwrdlGHCzz7AHNqpwfrF0Re7LNW1nyRKz/DX/fxo9AF2c4fY2dPasE
         AqTEnFmt+WekRCsCcqCAFIRaPCFjpNiolM/DQ2gUddJPNtVJyTsAtgjNQ9XXa7SyvDsH
         GQAA8QhGLYzhxa+AI+klopOho+ovdw45g3dLQgxrFpjeh/NKT0PJG5bkDnRQ9ITGYP4L
         N2nA==
X-Gm-Message-State: AGRZ1gIml+KKkC9O32+U+6wUwu5HSWu7H9AWAOkeNMXB2Y0zvLa1R3Q6
        kO/1PPeDBR3ISthqb8ZCcRakNUeSco8tn/+rGi8APmWUBa0=
X-Google-Smtp-Source: AJdET5cysqjMYmkkQx0ddTWAM9DK/YmVZL9cxII5nWg2cBRWg0pr8BJVR+StE4m6JQiHRJ8wUl+OAwZxwksR0AEENfg=
X-Received: by 2002:a24:8a44:: with SMTP id v65-v6mr952325itd.173.1540473687071;
 Thu, 25 Oct 2018 06:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-15-jagan@amarulasolutions.com> <20181024181048.w4iwebtac6wzmgt4@flea>
In-Reply-To: <20181024181048.w4iwebtac6wzmgt4@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 25 Oct 2018 18:51:14 +0530
Message-ID: <CAMty3ZC1jCfuP8tFKvgcdJ5R_Ou0ejAT_VYv=fV1Kh4UanLWcg@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] arm64: dts: allwinner: a64: Add DSI pipeline
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

On Wed, Oct 24, 2018 at 11:40 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Tue, Oct 23, 2018 at 09:20:34PM +0530, Jagan Teki wrote:
> > The A64 has a MIPI-DSI block which is similar to A31
> > without mod clock.
> >
> > So, add dsi node with A64 compatible, dphy node with
> > A31 compatible and finally connect dsi to tcon0 to
> > make proper DSI pipeline.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v2:
> > - use A64 dphy compatible
> >
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > index f3a66f888205..f82e6b165d57 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -320,6 +320,11 @@
> >                                       #address-cells = <1>;
> >                                       #size-cells = <0>;
> >                                       reg = <1>;
> > +
> > +                                     tcon0_out_dsi: endpoint@1 {
> > +                                             reg = <1>;
> > +                                             remote-endpoint = <&dsi_in_tcon0>;
>
> You need to set the allwinner,channel property there.

Are you referring to allwinner,tcon-channel = <1> ?
