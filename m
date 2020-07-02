Return-Path: <SRS0=CvJ6=AN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B17CC433E1
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jul 2020 10:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0CB12073E
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jul 2020 10:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="re8VOrqx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgGBKcD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jul 2020 06:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgGBKcC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jul 2020 06:32:02 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD16C08C5DC
        for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2020 03:32:02 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id p25so7200204vsg.4
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2020 03:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SxebolldoXIY07hiP/fBq2bV8EcWEeEf+lOF/qw89Cc=;
        b=re8VOrqxLFYqfzLqLrwM603/8Yv8jQJVF8hwvWbp8Rn1vhMj7MBa2m4+tuxhVgb/qG
         218MDG6HHuK6J3ayf3tXJuUs+zkv9ZsUx9D5XX6a0zBUAbAaorN7KExH4psa1oUvKhbK
         +VopOgZucpODThIr4p6qZ51kLPErDuptb9c0p9Xafs3O9Bl741j/k94pWmlCIvH0S/iX
         lDPvfo4CW+Np/cXaWwBCi/6lFdqXL+6ENU8h85MEMhoKvFzXhkr0D2nR+YIZc3rfnrgm
         9MP6z4wCBu4Kr7XYRFOlGq8aERz5hy6LjT7aeJmR8cYw+DEqEqS36Kv0HS9oY0zhvbxM
         W8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SxebolldoXIY07hiP/fBq2bV8EcWEeEf+lOF/qw89Cc=;
        b=etCfalUdKn8HxODqsTBJe0ZNccltY52SYFdk08b78pi6XJteB+FkJ27CE79JuqIbFf
         4Zay709IccqcGDff33740q85kFE4VA2UOfTy0HPeXsSRmhi0y7w+plt8O+5kONJXU2Nm
         Q22Jh8gwj2KDZ/Fn9Ad+zxN3/4g6Vgd1s++FKO+9UTMSRfpi8JUyxDOSBWlzUT/aII7P
         43KziavQ3VvV4BBI/7EC05HEsZVhF1cw2i6IOuRhGq0gjimX1cI67DNXRgB5xYBDc8R6
         gtwbbCoUrYE5yDj15l41UlwwEj52U1m0jircMPa4Jyka1J6w+Sor8GtUf390ei8z8jit
         rDGA==
X-Gm-Message-State: AOAM532ZoER8ct3rU+ejLZcVELqKSaCUoQWYukzGmpbQ9em50A5sdPq1
        XBAW+4tS4gdAH6SE8KxUrDhkpROwIUGbC5OjIoWxyQ==
X-Google-Smtp-Source: ABdhPJwdbwsyVyU+ccN+b0j3aRMcv1lilU0Aa1R9bCfApn2B9JkpZsMeLAjtXFfG7zuCCgOd6p5HOsSMNTUAsu5j9Tw=
X-Received: by 2002:a67:c009:: with SMTP id v9mr11539095vsi.182.1593685921227;
 Thu, 02 Jul 2020 03:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <1593682763-31368-1-git-send-email-loic.poulain@linaro.org>
 <1593682763-31368-5-git-send-email-loic.poulain@linaro.org> <CAHLCerMra_a1CKRC=tZmC2OLEvp_AOdOqxSDf7QzDZC8fOjR9A@mail.gmail.com>
In-Reply-To: <CAHLCerMra_a1CKRC=tZmC2OLEvp_AOdOqxSDf7QzDZC8fOjR9A@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 2 Jul 2020 16:01:50 +0530
Message-ID: <CAHLCerN+fHzmgyjms8mJX3ZTxT-v+BuQj+VyGfBVUDC4jiMrcw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arch: arm64: dts: msm8996: Add opp and thermal
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 2, 2020 at 3:31 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> On Thu, Jul 2, 2020 at 3:04 PM Loic Poulain <loic.poulain@linaro.org> wrote:
> >

> > +
> >         thermal-zones {
> >                 cpu0-thermal {
> >                         polling-delay-passive = <250>;
> > @@ -2180,18 +2429,33 @@
> >                         thermal-sensors = <&tsens0 3>;
> >
> >                         trips {
> > -                               cpu0_alert0: trip-point@0 {
> > +                               cpu_alert0: cpu_alert0 {
>
> Please use the node name pattern we're using in some of the other dtsi
> filenames for consistency. See sdm845.dtsi for an example.
>
> This also fixes dtsi warnings about address units, I suspect. So the
> name change may be a separate patch just to fix the warnings, if you
> want.

Turns out I did fix these names and the change got merge in the 5.8
merge window. What version of the kernel are these patches against?

> >                                         temperature = <75000>;
> >                                         hysteresis = <2000>;
> > +                                       type = "active";
