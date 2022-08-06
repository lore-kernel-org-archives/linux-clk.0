Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E12C25B08
	for <linux-clk@archiver.kernel.org>; Sat,  6 Aug 2022 04:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237545AbiHFEnp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 6 Aug 2022 00:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237883AbiHFEno (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 6 Aug 2022 00:43:44 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EAA19034
        for <linux-clk@vger.kernel.org>; Fri,  5 Aug 2022 21:43:42 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so3137414otb.5
        for <linux-clk@vger.kernel.org>; Fri, 05 Aug 2022 21:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Adh7Ypb7Bmy8isKMWTtzZFcBEH2hcOgccGX/JYLxyhY=;
        b=mQeR4p1ccfIZ2MF5ic3XoUcUw/s801es0iQrTJrc4FpnuGfRga+icLZfmBSFme8g9k
         bpgSx0fyeb8OEqbepbAz1HAgLt7QmAzg59AWyacvS3IFmTUSFOvHsKL80JQBTVFq0cMh
         LyWNdo1BNB/0j/onufu0Xzfuv+2fh4TPFURE6DsEvDrqb7kGO0vNuLWSv/VBvaq98RQx
         nzi5nJ2qiEGnvkEHHTwcesHOPQHue8Te3mkdJkl77/AjeKtLYoz6tTQitWwuNK7xrGUY
         /X4M+x7bFEUuHqYXEvAKc3xv906cO3aPoCRNzHtLkIqRwHeZp3Y40uxMBBL0SvhOCvvy
         Sn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Adh7Ypb7Bmy8isKMWTtzZFcBEH2hcOgccGX/JYLxyhY=;
        b=H3vxdW5ohJTgl3tm3rg23eglwpH3Cj78412m/M8DhKypszDZzlhYXBb6safboETd6R
         ybGlDf8nwKPcq5DoirzmHXhbLb9d6Ocjvws0Grpqv8QI8xx9wsLKIcf7IO6WPn38PNSN
         ErH+nHu0pLxuP27ak2nGxr0L4JBept0MROXDb+pX3UXR0GDlUGkXlDGvJ1BtxywLIvb1
         +DY8HLt5+g2ShTIWqjzPynasFfxvc9s3uVOEVUx2bX4Y9YLEJOqKg9ckChLC9l49HpDk
         SYxfdjaEpNjJlZOLx4aOVM39P6dB8D3RF2b5o3XAu4L+qjPA0FWg45o2bOWXCAqIO+BJ
         fN6Q==
X-Gm-Message-State: ACgBeo2nOMnfFaWh37kDWdahfqDEvJr9GPDh3CqXncsThWQ95JzdJrfq
        htwEjXIreas2xvtw/aP3XVVuKUEektZkQiYyzEf+yCrgSAQUaQ==
X-Google-Smtp-Source: AA6agR6yN3NgCkx/0jTPKa2ceXVArj9zjAtwy/GrlCnfLxfYblJodTc+tCUKfsv3lexjGrx+5CLOEM/ujyn/JnxrEGs=
X-Received: by 2002:a05:6830:3985:b0:636:aa59:ea1 with SMTP id
 bs5-20020a056830398500b00636aa590ea1mr2429045otb.44.1659761021916; Fri, 05
 Aug 2022 21:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220805074935.1158098-1-jun.nie@linaro.org> <YuzimmCqk2pA5sFZ@gerhold.net>
In-Reply-To: <YuzimmCqk2pA5sFZ@gerhold.net>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Sat, 6 Aug 2022 12:43:44 +0800
Message-ID: <CABymUCMJ0CL+aog-8PDvUiAb4ivhZRxidvUUKu6vO1453mN3qA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Support dynamic voltage frequency scaling inside
 clock controller
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Stephan Gerhold <stephan@gerhold.net> =E4=BA=8E2022=E5=B9=B48=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=BA=94 17:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Aug 05, 2022 at 03:49:31PM +0800, Jun Nie wrote:
> > Support dynamic voltage frequency scaling inside clock controller with
> > changes in clock framework. And added msm8916 as the first SoC to
> > support this feature.
> >
>
> As far as I understand it was decided to handle this on the consumer
> driver side in mainline, together with OPP tables and "required-opps" in
> the device tree. If you look at e.g. sc7180.dtsi you can see that this
> is heavily used there. Also see e.g. [1] for some links to related
> discussions.
>
> For MSM8916 at least the SDHCI and DSI driver should support this
> already. Some other older drivers (e.g. QUP, USB) would need some change
> similar to [2] (just like they still need changes for interconnects).
>
> I'm not entirely sure why it was decided to not do this as part of the
> clock core (maybe someone can explain or link a relevant mailing list
> post?), but we should try to keep it consistent in any case. :)
>
> Thanks,
> Stephan

Hi Stephan,
Thanks for the reminder! My work in clk framework was done 2 years ago actu=
ally.
I guess it is just before the decision to use consumer side opps for
this, because
I did not see any solution at the time.

I think the consumer side required-opps is better than my solution.
Because clock
is infrastructure to initialize other devices in most cases. If clock
device depends
on power domains, we have to initialize the power domain first. So adjustme=
nt in
initialization sequence of many devices is needed sometimes. The consumer s=
ide
operation avoid such inconvenience.

So let's forget this patch set.

Regards,
Jun

>
> [1]: https://lore.kernel.org/linux-arm-msm/20200910162610.GA7008@gerhold.=
net/
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3D0472f8d3c054a0ff58122fc9d2dbf84f197a284f
