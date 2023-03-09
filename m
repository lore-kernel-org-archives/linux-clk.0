Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD02EC64EC4
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 18:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjCISTg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Mar 2023 13:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjCISTd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Mar 2023 13:19:33 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49525D330E
        for <linux-clk@vger.kernel.org>; Thu,  9 Mar 2023 10:19:32 -0800 (PST)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B3C113F07F
        for <linux-clk@vger.kernel.org>; Thu,  9 Mar 2023 18:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678385969;
        bh=SxKX8lAWQsQ9FTwiM9BPGc+zhxP/zhLFmNPZpha4eWo=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=uP0GiOf9z5jyzNVWgXm3BmS9nw8llmXFDUhT6qTsyENmOJpkgweywLZgWcqummL5B
         2Sb2g63S7eMMvt/RgEs+AJlpY26CytzlovBMVK5YLlyUPTDszzoVaB5u/jBp4TGWb8
         40xzhUOsBdV1PHY0WrXiL+yrdHzdaMThRz7+PR/oWSRC+UYTjILQSAJ5cSfMDabkYI
         MoGrVVNOs7EJ7rwHJSVYoMBXsQpX2ANyvwWohE+6RyLjFBNNd/5mzqfyUJQcARuwH/
         AEgLaNYt+sqKnvKUsdPpGppmEARoJzuhFcIOf4UGUj6Nd5l76VrE1Y9mzFowkzNtAj
         WKXE6Z+9Rm4nA==
Received: by mail-qv1-f71.google.com with SMTP id lt7-20020a056214570700b0057290f3623eso1635794qvb.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Mar 2023 10:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678385963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxKX8lAWQsQ9FTwiM9BPGc+zhxP/zhLFmNPZpha4eWo=;
        b=vy68YTRQIE8BYdlthnPWz3/Du70lyRjCsM6YoRb+xXnnkYaxGOagV+SQc1L89EaXp0
         13fsbkaVQSBzo9LY57hBILrA/PHF7VyXO3KH50q2IeGQX/lHQJJKSQ0hyxYtUE+xKvd+
         p/ir1/2gbd/Fvw/pN9O3HR8kF2tD3AcYs/XMuybPQCT8shbfassR9LY0sjWm2YS/X/FA
         J4pslTRdhWDXrsOivDuBN6EH0yBxZ/m0drvWZ+ahDYHIKEIdBb2NwTSVt2SE4KIDuIMp
         ba8/XLRt0/Q+8UHACisfaBcX0ERep81PJG/CwebiwgFcHmsnzI9q3WHGyIGoHFVCs4R3
         g20g==
X-Gm-Message-State: AO0yUKUYgz1OFAP/ZvlSxokiG4mMjWAfrfoStGpTS+URzK5ibVf0uKgT
        TILqdd42WHl3lTvoQ3jlMLrXX3E7POCJXvX6rdFBXifV8cwk0h9utS6nPytn6mu8GHOHWVBK0N3
        AGCPDwTRMpSl0I1sRpxEEsGuRoFc8NxSXXAKW0o6k3MgraBGasMHqcg==
X-Received: by 2002:ac8:429a:0:b0:3bf:bba8:69b0 with SMTP id o26-20020ac8429a000000b003bfbba869b0mr6074842qtl.5.1678385963012;
        Thu, 09 Mar 2023 10:19:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9OHYCSEuIKRx9FxuLcExe2yb6O6D1LT6790n4D4PIp0zTs0FgzUhcs4O8DexM+HqsfP/U+EGkFQOY6RIH4J0w=
X-Received: by 2002:ac8:429a:0:b0:3bf:bba8:69b0 with SMTP id
 o26-20020ac8429a000000b003bfbba869b0mr6074830qtl.5.1678385962760; Thu, 09 Mar
 2023 10:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-13-hal.feng@starfivetech.com> <CAJM55Z8H4qmy_BiD0SHW-w5ifzhzokdO-QxpUUz9aeUd+htrZg@mail.gmail.com>
 <8c30220a-abef-7518-cb44-abcea91408e2@starfivetech.com> <49ab1072-98ba-f364-9b66-68658566e732@starfivetech.com>
 <CAJM55Z9YGjD+1haWcXEZNkHnWNRZckdBmTTykTt7QZV_LUohgQ@mail.gmail.com> <032f9254-482a-4b97-8e7e-4afb1f78eb21@spud>
In-Reply-To: <032f9254-482a-4b97-8e7e-4afb1f78eb21@spud>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Thu, 9 Mar 2023 19:19:06 +0100
Message-ID: <CAJM55Z_HGt3iu=trv0v_VzyO3NkVo+aiEaT9vxRURz-MvrbCOg@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] clk: starfive: Add StarFive JH7110 always-on
 clock driver
To:     Conor Dooley <conor@kernel.org>
Cc:     Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 9 Mar 2023 at 19:11, Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Mar 09, 2023 at 03:06:13PM +0100, Emil Renner Berthing wrote:
> >  On Thu, 9 Mar 2023 at 10:44, Hal Feng <hal.feng@starfivetech.com> wrot=
e:
>
> > > The AON clock driver provides clocks for gmac0 which is used frequent=
ly.
> > > So I think it would be more convenient if we set "default y" here.
>
> > You're right that if we default y for the ethernet driver then the aon
> > clock/reset should also default y. Personally I don't think we should
> > default y for every ethernet driver that might be used on some
> > supported risc-v platform, but I see now that
> > arch/riscv/config/defconfig already contains CONFIG_MACB=3Dy,
> > CONFIG_E1000E=3Dy, CONFIG_R8169=3Dy and CONFIG_MICROSEMI_PHY=3Dy, so ma=
ybe
> > I'm wrong or just too late.
>
> The defconfig really needs a good bit of cleanup (one of the many things
> that I am telling myself I will do as part of kconfig.socs cleanup).
>
> w.r.t defconfig Palmer said it pretty well earlier on IRC: "defconfig
> should be useful for kernel devs, which means it should boot on the
> common dev boards".
>
> IMO, that means enough to boot an initramfs and poke the thing to see
> that it is alive, so: ethernet & serial, and the clocks/resets/pinctrl
> stuff required to get those going can all be set to y in defconfig.
>
> In the driver Kconfig entries, to me, it's more or less the same.
> I guess, answer the question "Will your customer's board get to the
> point where it can load a module ithout building this into the kernel?".
> If the answer to that question is yes, then don't make it default y.
>
> That's my =E2=82=AC0.02!

Cool. Defaulting to m in the Kconfig for anything that can be loaded
later is exactly what I was trying to say, except I mixed in the
defconfig for no good reason. That means both the aon clocks and
dwmac-starfive should default to m in Kconfig. The JH7110 (VisionFive
2) boots just fine like that and brings up aon clocks and ethernet
after loading the modules.

/Emil
