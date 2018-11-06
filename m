Return-Path: <SRS0=mH3q=NR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F62C32789
	for <linux-clk@archiver.kernel.org>; Tue,  6 Nov 2018 18:09:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C68F12086B
	for <linux-clk@archiver.kernel.org>; Tue,  6 Nov 2018 18:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="koy3oD0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C68F12086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730606AbeKGDfm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Nov 2018 22:35:42 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:38946 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730421AbeKGDfl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Nov 2018 22:35:41 -0500
Received: by mail-it1-f193.google.com with SMTP id m15so18925803itl.4
        for <linux-clk@vger.kernel.org>; Tue, 06 Nov 2018 10:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=emX/m+n1+Yp7yE5ZvgTbYbo6lbFzoISXALZO0xGwjL0=;
        b=koy3oD0czVrp/QRyX1v9KXBJ9EWoXNAwjFkVUX90Utjzz+mMw3XMHfsfo3NLI1CS6o
         tTusowHJZLWaLU4ediGoIFinbwAqz92vwlDJaJU4FAlGBCV5gqq+c+jrx5wC/SvJNp1t
         jeHc5PwSTkXxvGPj8bXxJGA7gLhbpcbi49xZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=emX/m+n1+Yp7yE5ZvgTbYbo6lbFzoISXALZO0xGwjL0=;
        b=LOi5KpwZ/nZD2kpIs/UzvITj5DGSh7tcD2kjBx6yg4RJSbqBS1P1vX5jlc2uqKwQ6c
         eFfuJfkyeVXcu1gWVLry49KmxslR6Ca1IZzDAsuuoBDqrW/MyZqjv3TJ5ZslTLJsTBmx
         RVI8lsj9CJoKAe2moZpFdhNS9dUf0RPqlCzYDl+3IRiATAtHVcfrJnkV8A061l/KBXNG
         ESdN3/t1MB6DsIpgS7Qa/7BQORXs6gvFW8mLW/rpRrY+sgPdVVYuPrm1kk6ZxibZ8EJJ
         yVkHaEqVDougRiqZUnRVHfujSvV4Cr0iMPKFGe2fegPDu8i1BzWHvA5Ie5CSEQICC2yu
         5IXw==
X-Gm-Message-State: AGRZ1gJgZKPemAO8fqbtgLIRKfRo0eJopTGe77wFfPsBCJgNutGYoWQg
        8UTmTHswGW8GTYs19f49168TTGks98idRCaVVx0KuQ==
X-Google-Smtp-Source: AJdET5df5HQ13IxoFRpRK8DjEff2ds619HC8VQMjyw8+ZSNKCoYKXox8sVqOdxyWVzJX/74JVMxZ+J6EyTBovg5YvSw=
X-Received: by 2002:a02:966e:: with SMTP id c101-v6mr13228490jai.58.1541527755866;
 Tue, 06 Nov 2018 10:09:15 -0800 (PST)
MIME-Version: 1.0
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <CGME20181029111305epcas5p2ee0ca644470de4e036762e000afbb71b@epcas5p2.samsung.com>
 <20181026144344.27778-18-jagan@amarulasolutions.com> <3c4c8a08-8c1e-1ac6-2b53-81389d69c97b@samsung.com>
 <CAGb2v66ENhmNXPz4PfdRJjNUNdpDNZYX2a3SH8AD6SMe9g2zLA@mail.gmail.com> <bfe28e8d-3786-d35d-a589-abed9ee8e7d5@samsung.com>
In-Reply-To: <bfe28e8d-3786-d35d-a589-abed9ee8e7d5@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 6 Nov 2018 23:38:53 +0530
Message-ID: <CAMty3ZAWkX8YSRzFs_GS2O4+=pf68e4EuSMym+_XpCe3_4-2yw@mail.gmail.com>
Subject: Re: [PATCH v3 17/25] dt-bindings: panel: Add Bananapi S070WV20-CT16
 ICN6211 MIPI-DSI to RGB bridge
To:     a.hajda@samsung.com
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Icenowy Zheng <icenowy@aosc.io>,
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

On Wed, Oct 31, 2018 at 2:45 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> On 31.10.2018 09:58, Chen-Yu Tsai wrote:
> > On Wed, Oct 31, 2018 at 4:53 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >> On 26.10.2018 16:43, Jagan Teki wrote:
> >>> Bananapi S070WV20-CT16 ICN6211 is 800x480, 4-lane MIPI-DSI to RGB
> >>> bridge panel, which is available on same PCB with 24-bit RGB interface.
> >>>
> >>> So, this patch adds DSI specific binding details on existing
> >>> dt-bindings file.
> >>>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>> Changes for v3:
> >>> - Use existing binding doc and update dsi details
> >>> Changes for v2:
> >>> - none
> >>>
> >>>  .../display/panel/bananapi,s070wv20-ct16.txt  | 31 +++++++++++++++++--
> >>>  1 file changed, 29 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
> >>> index 35bc0c839f49..b7855dc7c66f 100644
> >>> --- a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
> >>> +++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
> >>> @@ -1,12 +1,39 @@
> >>>  Banana Pi 7" (S070WV20-CT16) TFT LCD Panel
> >>>
> >>> +S070WV20-CT16 is 7" 800x480 panel connected through a 24-bit RGB interface.
> >>> +
> >>> +Depending on the variant, the PCB attached to the panel module either
> >>> +supports DSI, or DSI + 24-bit RGB. DSI is converted to 24-bit RGB via
> >>> +an onboard ICN6211 MIPI DSI - RGB bridge chip, then fed to the panel
> >>> +itself
> >> As I understand this is display board, which contains 'pure' RGB panel
> >> S070WV20-CT16 and optionally ICN6211 DSI->RGB bridge.
> >> These are separate devices, just connected by vendor to simplify its
> >> assembly. Why don't you create then bridge driver for ICN6211 and RGB
> >> panel driver for S070WV20-CT16 - it looks more generic.
> >> Then you can describe both in dts and voila.
> >> Creating drivers for every combo of devices (panel + bridge), just
> >> because some vendor sells them together seems incorrect - we have
> >> devicetree for it.
> > Rob suggested this, and also the opposite: using the same
> > "bananapi,s070wv20-ct16"
> > compatible string for both types of connections, and have the driver deal with
> > detecting the bus type.
> >
> > The thing about the bridge chip is that there's no available datasheet that
> > describes all the parts of the init sequence, in fact none at all. I managed
> > to work out some bits, but the others remain a mystery and must be hard-coded
> > to match the panel. That would work against having a generic bridge driver.
>
>
> But it is common for many chips - 1st version of the driver is developed
> on one platform and it supports only one configuration, if next platform
> with the same cheap appears the driver is augmented if necessary.

At-least few of the commands from panel initialization code, the
respective opcode data values are based on panel timings and even
clock value is different in DSI. I think it look hard to try bridge
driver for these restrictions, do you have any suggestions?
