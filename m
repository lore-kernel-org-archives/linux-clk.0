Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36017C48BD6
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 09:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11A9420B7C
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 09:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bi6GewvM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfFZJLA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jun 2019 05:11:00 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38492 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfFZJK7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 05:10:59 -0400
Received: by mail-io1-f67.google.com with SMTP id j6so1721275ioa.5
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2019 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sno8Ge+rHMIdDtzIc8dnl34qGNRf0feu0UyAZSnI4mg=;
        b=Bi6GewvMVw3/YibnpaewlUpeDadIoCMTgCZXgDZCC0T1ddx1CCk6oedQAwY+9Dqp2p
         rvjlH/huHtMUx7CvabwZ2TMZDTZdGg64iMT71dioEjyLeu4pq1o86RLLZCuMKmI/HJVA
         l0Aiuwyrdq1BqL5ZFBTMw/zuvSw2SZ3Trs0lK81iDFvQPcKoAKsMW9827XDmLCeCl2Ix
         zCY4eJ2Sq7crCzXcasod7zL9BycVXALQnXX95diymI0ol5tGwMICw7F+udWs9D671qJn
         QCSrL1H19PDQsg8pVd2qT/YRvu6h6ayjy0URcTYRMCgpUEZxHkWZ0hq1f58hVIdCSc7w
         Csrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sno8Ge+rHMIdDtzIc8dnl34qGNRf0feu0UyAZSnI4mg=;
        b=O87vCxL8mH9MyzM5UKEJZZS6an3Hxgqgwiae4ZpRN4WYyopDOzFc/bChUYGTp8YHHe
         ZkxbbqIDgNCYth9kuS2bE2qo0KuAU/YMmz9NBlwKpK3c2Hjv2y4KCZudnjotWTSpOeSI
         t1Cemqm9Sq6MteQMHRZJUJ86BaCG6KMMRsxJ+qBuM2enxM6ZP2p3595CaT1Av/liP8qp
         QvwwRPVlnLfV8Dtnhh+/HvnjmSOaQdXYygqbmIoY2dYbnzGa/dnCp9sOFxK36S4nbWb6
         a62c8rtr9ggzjJ21rj7pFDlVMuAy5Fv6QeFMWwjziznRkS6+KLDX+UHliqJWJSwfHgIw
         JI+g==
X-Gm-Message-State: APjAAAWN2o3YjnLCmx047aOTT5gImhtQ1V6AuSldpRP2/COiePHvQ49J
        faxOF/y3xAmcm7UsuZK+r8/AIDybPqjCnor7jjTTaw==
X-Google-Smtp-Source: APXvYqyp3VOv+KPURb+KoDDpojB8TjqXw4jTuOzIoV1yCakDUsaxF/3kVvaBFKPGrZ0qD06iylhlFA3tH5NcrgMZ65Y=
X-Received: by 2002:a5e:8518:: with SMTP id i24mr3690057ioj.149.1561540258934;
 Wed, 26 Jun 2019 02:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org> <CAHYWTt37Q1E_bggbKb8VdcHRj_YYubqaoVHNN7+1kcr8+XMX0g@mail.gmail.com>
In-Reply-To: <CAHYWTt37Q1E_bggbKb8VdcHRj_YYubqaoVHNN7+1kcr8+XMX0g@mail.gmail.com>
From:   Niklas Cassel <niklas.cassel@linaro.org>
Date:   Wed, 26 Jun 2019 11:10:47 +0200
Message-ID: <CAHYWTt2bHqR5aP4-zJ==txGvzuhAa=+q=5Qpag7ucMEEnM1dZg@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: qcs404: Add DVFS support
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>, jassisinghbrar@gmail.com,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will.deacon@arm.com>, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        Sibi Sankar <sibis@codeaurora.org>,
        enric.balletbo@collabora.com,
        Jagan Teki <jagan@amarulasolutions.com>, olof@lixom.net,
        Vinod Koul <vkoul@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Khasim Syed Mohammed <khasim.mohammed@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Perhaps I should look at the recipient list next time before posting :)

Kind regards,
Niklas

On Wed, 26 Jun 2019 at 11:08, Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> I actually think that it makes sense to squash this patch with the
> [PATCH v3 10/14] arm64: dts: qcom: qcs404: Add OPP table
> patch.
>
> But that might be a personal preference.
>
> Either way, I think this series in ready for the real mailing list.
>
>
>
>
> On Tue, 25 Jun 2019 at 18:48, Jorge Ramirez-Ortiz
> <jorge.ramirez-ortiz@linaro.org> wrote:
> >
> > Support dynamic voltage and frequency scaling on qcs404.
> >
> > Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index 9569686dbc41..4b4ce0b5df76 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -34,6 +34,9 @@
> >                         enable-method = "psci";
> >                         cpu-idle-states = <&CPU_SLEEP_0>;
> >                         next-level-cache = <&L2_0>;
> > +                       clocks = <&apcs_glb>;
> > +                       operating-points-v2 = <&cpu_opp_table>;
> > +                       cpu-supply = <&pms405_s3>;
> >                 };
> >
> >                 CPU1: cpu@101 {
> > @@ -43,6 +46,9 @@
> >                         enable-method = "psci";
> >                         cpu-idle-states = <&CPU_SLEEP_0>;
> >                         next-level-cache = <&L2_0>;
> > +                       clocks = <&apcs_glb>;
> > +                       operating-points-v2 = <&cpu_opp_table>;
> > +                       cpu-supply = <&pms405_s3>;
> >                 };
> >
> >                 CPU2: cpu@102 {
> > @@ -52,6 +58,9 @@
> >                         enable-method = "psci";
> >                         cpu-idle-states = <&CPU_SLEEP_0>;
> >                         next-level-cache = <&L2_0>;
> > +                       clocks = <&apcs_glb>;
> > +                       operating-points-v2 = <&cpu_opp_table>;
> > +                       cpu-supply = <&pms405_s3>;
> >                 };
> >
> >                 CPU3: cpu@103 {
> > @@ -61,6 +70,9 @@
> >                         enable-method = "psci";
> >                         cpu-idle-states = <&CPU_SLEEP_0>;
> >                         next-level-cache = <&L2_0>;
> > +                       clocks = <&apcs_glb>;
> > +                       operating-points-v2 = <&cpu_opp_table>;
> > +                       cpu-supply = <&pms405_s3>;
> >                 };
> >
> >                 L2_0: l2-cache {
> > --
> > 2.21.0
> >
