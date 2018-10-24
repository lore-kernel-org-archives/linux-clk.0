Return-Path: <SRS0=W7GY=NE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47831C004D3
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 10:20:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8A822075D
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 10:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FueVGAQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8A822075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbeJXSrm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Oct 2018 14:47:42 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:35133 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbeJXSrm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Oct 2018 14:47:42 -0400
Received: by mail-it1-f193.google.com with SMTP id p64-v6so5889919itp.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Oct 2018 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=btM71ehVGal9Uwy0bcAIS+1picF6E2BQ3XMYNDA1xDc=;
        b=FueVGAQtGS5amZR1XIy1e1uDgAOFO2EfNwLGsTIQ2IEsDxvtpY8KBFdfdavXQxLLVz
         s0OQB5fWXoeaA6xoD7tJzRedpR397YC1kFmOt8MQm+kI/xG0+alyIGHbYBfW5GFBwSGV
         VaDvE8m8OGtKOgyb3FsMHOr6Yw30sSIckydT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=btM71ehVGal9Uwy0bcAIS+1picF6E2BQ3XMYNDA1xDc=;
        b=Y533wl3Gc+gIHPQq0AacTGWYNHZCrleJR6sSchfiHvdXOwIvCybuf3LnOAl9bmsV9M
         psiwHog0lzujI9m/Fw5a/yA85YM1sQDxtW1lmMG23JnSydpUeglIJlJ59nRBNpCsZ/w/
         88rVdXMyWQKPcvabVM1yazY2EMLci5tUqPjWf/P8nDMIqqNGVEPT1/SBH6/3PsaDAF5F
         Zp+l+g5osN97MQjKUxyUcvXyz5pkz5wPu2pcYIiyRgwdb+xFvA7+9zchGPZ7G7VAhJB7
         oI2ksoOQZy9n6xfA24KI4fhzk0CJlQuKe7e8jzIGETg5DoMScxxXba5jAYbCqS+hir8y
         F2Vw==
X-Gm-Message-State: AGRZ1gLRemAF1HXS2y9/WJ07ufyIK+r5uVxl6J7z7xJTbIwPFeHauqjX
        oAqwd4VcGQYZpFlMduXGyLv7+W2VS9/0Y8CGfToFvQ==
X-Google-Smtp-Source: AJdET5eKjD6GC2j0sDN/VM4n8ENlQmkKDmWNA1J9FnSF40BiBp+hzvx+/9fbH02alvJv5WQnQeVtOVimRgQ/KXfV1po=
X-Received: by 2002:a02:5f96:: with SMTP id x22-v6mr1256594jad.43.1540376411249;
 Wed, 24 Oct 2018 03:20:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:3941:0:0:0:0:0 with HTTP; Wed, 24 Oct 2018 03:19:30
 -0700 (PDT)
In-Reply-To: <TY1PR01MB1562238AE99ADCB39C05C67A8AF50@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181012122924.5543-1-chris.brandt@renesas.com>
 <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com> <TY1PR01MB1562238AE99ADCB39C05C67A8AF50@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 24 Oct 2018 12:19:30 +0200
Message-ID: <CAPDyKFox-UPeAeWn8GnGyHibrUk-dp-aWhWMFy1X1GwddebNLg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mmc: tmio_mmc: Add support for RZ/A2
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24 October 2018 at 00:28, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, October 23, 2018, Ulf Hansson wrote:
>> On 12 October 2018 at 14:29, Chris Brandt <chris.brandt@renesas.com>
>> wrote:
>> > Basically the same HW block that was used in R-Car Gen 3 is used in
>> > RZ/A2 (with only a couple small differences).
>> >
>> > Not sure if you're going to like the Kconfig change or not.
>> >
>> > Chris Brandt (3):
>> >   clk: renesas: r7s9210: Add SDHI clocks
>> >   mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
>> >   dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
>> >
>> >  Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  3 ++-
>> >  drivers/clk/renesas/r7s9210-cpg-mssr.c             |  5 ++++
>> >  drivers/mmc/host/Kconfig                           |  5 ++--
>> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 28
>> ++++++++++++++++++++--
>> >  4 files changed, 36 insertions(+), 5 deletions(-)
>> >
>> > --
>> > 2.16.1
>>
>> This looks good to me. So unless someone objects I intend to queue
>> this up for 4.21, once 4.20 rc1 is out. Or perhaps the clock patch
>> should go via the clock tree?
>>
>> Thanks!
>> Uffe
>
> FYI,
>
> I just tried to apply my patches to what is in -next.
> It looks likes Fabrizio beat me to it (RZ/G1C has the same controller),
> so there will be conflicts because we were both be modifying the same
> lines in Kconfig and in the driver (adding the compatible strings).
>
> It also looks like Fabrizio started using the name
> "renesas,sdhi-mmc-xxxx" (as in, added the '-mmc'), but I'll probably
> just keep mine the way it is (no '-mmc').
>
>
> So if you don't feel like fixing it up, let me know and I'll send an update.

Please send an update.

Kind regards
Uffe
