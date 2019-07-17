Return-Path: <SRS0=TUvV=VO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D601C76186
	for <linux-clk@archiver.kernel.org>; Wed, 17 Jul 2019 08:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 258822173E
	for <linux-clk@archiver.kernel.org>; Wed, 17 Jul 2019 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563352795;
	bh=3AsfA0apHgKPHqSErY1FFUic2G0ulq9KKXmKDllcBcQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=CEMOxhpiYJKtvlGGbFrRPjpAvtC9fqX5QctNocT0BgrPJZ4efk+qYJ+XCLnbpBBKJ
	 aPL0zTKS07DZSdwz+dSwI0ZShIHw2rDL0rEuFiyErGZRKdV4PtjMFqTKy2PKkbAjcS
	 RMvW8gn3UC11Ec6u9rf9UCTIDgb2likvaTdV25H4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfGQIju (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Jul 2019 04:39:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:42382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbfGQIju (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Jul 2019 04:39:50 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E642D217F9;
        Wed, 17 Jul 2019 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563352789;
        bh=3AsfA0apHgKPHqSErY1FFUic2G0ulq9KKXmKDllcBcQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SgAXPRs6GJZnZ4dXfaI5y+fqWmAL7vSP8DcilTZOMiaFiRuMkriRkV2D7uDUMRsHD
         LuOrCUBJADNdyG96KBNIcHBVXxPWwdvnZB7W23YzPXUGsU2DRyL7pCEuvDEI7FPSaG
         8V0w+33PvRBAUq9VEUGaunN4tWBv4nQIt0r5tjnM=
Received: by mail-lj1-f170.google.com with SMTP id z28so22819895ljn.4;
        Wed, 17 Jul 2019 01:39:48 -0700 (PDT)
X-Gm-Message-State: APjAAAXXS45LH6tK+Aqz9v+dMPbEeTJo2ZrzMQgFnF0tvW8RtvaRCsyF
        LXevqW2P3Mn3ZpS3RdHuicSPORuUdVpDIXxXn4k=
X-Google-Smtp-Source: APXvYqyRN0A/GOrnI+2UBk5Z9rTURP+hHTiKsonTWMcGbY1Ffif3bsCYCsun+URUyB4xBf4ku2h81Gn6CSsFtvv1zzo=
X-Received: by 2002:a2e:124b:: with SMTP id t72mr20492141lje.143.1563352787197;
 Wed, 17 Jul 2019 01:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190715124450eucas1p189043d196375aa6adacf898de81bfa9b@eucas1p1.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-21-l.luba@partner.samsung.com>
In-Reply-To: <20190715124417.4787-21-l.luba@partner.samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 17 Jul 2019 10:39:36 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfHgmBo9NX6jO8qSqXjN1pFmnKkQEWbou+q7-BDq2XKQg@mail.gmail.com>
Message-ID: <CAJKOXPfHgmBo9NX6jO8qSqXjN1pFmnKkQEWbou+q7-BDq2XKQg@mail.gmail.com>
Subject: Re: [PATCH v1 20/50] ARM: dts: exynos: change and rename FSYS OPP
 table in Exynos5420
To:     Lukasz Luba <l.luba@partner.samsung.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= 
        <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        s.nawrocki@samsung.com, myungjoo.ham@samsung.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 15 Jul 2019 at 14:44, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> The FSYS and FSYS2 buses have similar characteristics and both have max
> frequency 240MHz. The old OPP table bus_fsys_apb_opp_table should be used
> only to FSYS APB bus because APB max frequency is 200MHz.
> The new OPPs for FSYS should increase its performance and related devices.

I do not understand the explanation. You say that there are two buses
- FSYS and FSYS2 - and old OPP table should be used for FSYS APB but
you remove the old one (by renaming). Or which one is the 'old one'
here? The reason is speed... wait, what? Usually DTS should describe
the HW so I imagine that proper opp table should be used for proper
bus. It surprised me that we switch a bus to different OPP table just
because of speed concerns. It should be correctness concern.

Please clarify and reword all this.

I am also not sure how this relates with previous patch - whether you
are fixing independent issues. Maybe because I do not see the issue
fixed... change the commit title and adjust the messages to focus WHY
you are doing it. For small fixes WHAT you are doing is rather obvious
so commit msg (and title) should not focus on it.

Best regards,
Krzysztof

>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 941c58bdd809..c7fc4b829b2a 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -995,7 +995,7 @@
>                         compatible = "samsung,exynos-bus";
>                         clocks = <&clock CLK_DOUT_ACLK200_FSYS>;
>                         clock-names = "bus";
> -                       operating-points-v2 = <&bus_fsys_apb_opp_table>;
> +                       operating-points-v2 = <&bus_fsys_opp_table>;
>                         status = "disabled";
>                 };
>
> @@ -1003,7 +1003,7 @@
>                         compatible = "samsung,exynos-bus";
>                         clocks = <&clock CLK_DOUT_ACLK200_FSYS2>;
>                         clock-names = "bus";
> -                       operating-points-v2 = <&bus_fsys2_opp_table>;
> +                       operating-points-v2 = <&bus_fsys_opp_table>;
>                         status = "disabled";
>                 };
>
> @@ -1157,7 +1157,7 @@
>                         };
>                 };
>
> -               bus_fsys2_opp_table: opp_table5 {
> +               bus_fsys_opp_table: opp_table5 {
>                         compatible = "operating-points-v2";
>
>                         opp00 {
> --
> 2.17.1
>
