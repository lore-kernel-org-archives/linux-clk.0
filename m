Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CA4C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 09:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F75E610E6
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 09:56:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhJNJ6D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Oct 2021 05:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbhJNJ6C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Oct 2021 05:58:02 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A18BC061746
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 02:55:58 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j21so24806422lfe.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JmYUMK/UpCPTQkNa2eHt3u3bSnQ6UeJZgf9fcyINgsU=;
        b=mVYlAwjTxWDUaBNLDN0kgN/g/YvJGNU+qqXTHe/yDPKOT7wKUmz2VhEvsDmJpaLbUF
         JzmX5SOBfopOFWv4MMobCXKvOtq35pi9+Tv2h99NRH7LDKiMgD13AGFjtqXdfZVmA3/2
         LBBEQ24GND2moC7wMKG2krrUoGENkEJdY9LuvzsJIAXnUZ+qbQGNJhMBv7F4Zf5OLuFw
         0X+9oY7KpkjEJuBfbYCGHYr/2+Fx3OyQ9M/4ihjNNdGXU+RQYM5EfLcbh/75NClaUyHQ
         swSYYlaB6z+O2nPtdN8qjfZdFJUykeYjnZHyWiWQnuIHIDEf/QNrD9FadDjd70wRTuZZ
         eEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JmYUMK/UpCPTQkNa2eHt3u3bSnQ6UeJZgf9fcyINgsU=;
        b=rRERLhABquY0VBR2vK+ynAkhZ4IEs4E9cxI2CspqpILb0Atl5CVmzDJyJDptxW8GmQ
         apllhlX7g3miVbrN6C0suh515cjr7pooE+AvyrYk5LFnClG2pxf2a7eLRqB1gjwPtOUA
         dKfIfIGUQLnAEpMQQ9CAdS57cNfJQ6QfqCp9Lx39O30qegOQ0m6L3EtBmkPvuyi4/XmU
         H2QFQmuZ0jXTgDrB54/U9OI9y5bYEgrS1y2y5XHBNWJq4LtFNcVwt2RUir67l6zgyUeZ
         wxxa/KDkGHY/BZ55wuW5IcrgfqerFckoSevzI5VzJc0JrzF0Pm4lY9Uq4WjdmLlmFKWy
         l9jQ==
X-Gm-Message-State: AOAM5302uz6DUWtJYh1/l3cz1i0TQiCBAKUb3tCUNTfhAqra4WZyw76m
        c7+5qqXvuNHqkMwE8hB+P3MA5wlJu6kNpil1jT6h/w==
X-Google-Smtp-Source: ABdhPJzfcuLOXluZNCiIFiHuEMZOmaPq4SFwqJhe51BVnbLOcrMdlfjEobokM/9rmKz908yjKMJDYvKU8LEE1TjdTto=
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr5021872ljj.4.1634205356539;
 Thu, 14 Oct 2021 02:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211011165707.138157-1-marcan@marcan.st> <20211011165707.138157-5-marcan@marcan.st>
 <20211012032144.2ltlpat7orrsyr6k@vireshk-i7> <b7cd51ec-38e5-11d8-5193-1170c9d60ac9@marcan.st>
 <20211012055143.xmkbvhbnolspgjin@vireshk-i7> <caf16a6c-f127-7f27-ed17-0522d9f1fb9e@marcan.st>
In-Reply-To: <caf16a6c-f127-7f27-ed17-0522d9f1fb9e@marcan.st>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 14 Oct 2021 11:55:16 +0200
Message-ID: <CAPDyKFoVjVYkc4+v-=eD+JbC10GazGt8A1LtD1so3PKMmVcyMg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/9] opp: core: Don't warn if required OPP device does
 not exist
To:     Hector Martin <marcan@marcan.st>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>, Marc Zyngier <maz@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 12 Oct 2021 at 07:57, Hector Martin <marcan@marcan.st> wrote:
>
> On 12/10/2021 14.51, Viresh Kumar wrote:
> > On 12-10-21, 14:34, Hector Martin wrote:
> >> The table *is* assigned to a genpd (the memory controller), it's just that
> >> that genpd isn't actually a parent of the CPU device. Without the patch you
> >> end up with:
> >>
> >> [    3.040060] cpu cpu4: Failed to set performance rate of cpu4: 0 (-19)
> >> [    3.042881] cpu cpu4: Failed to set required opps: -19
> >> [    3.045508] cpufreq: __target_index: Failed to change cpu frequency: -19
> >
> > Hmm, Saravana and Sibi were working on a similar problem earlier and decided to
> > solve this using devfreq instead. Don't remember the exact series which got
> > merged for this, Sibi ?
> >
> > If this part fails, how do you actually set the performance state of the memory
> > controller's genpd ?
>
> The clock controller has the genpd as an actual power-domain parent, so
> it does it instead. From patch #7:
>
> > +     if (cluster->has_pd)
> > +             dev_pm_genpd_set_performance_state(cluster->dev,
> > +                                                dev_pm_opp_get_required_pstate(opp, 0));
> > +
>
> This is arguably not entirely representative of how the hardware works,
> since technically the cluster switching couldn't care less what the
> memory controller is doing; it's a soft dependency, states that should
> be switched together but are not interdependent (in fact, the clock code
> does this unconditionally after the CPU p-state change, regardless of
> whether we're shifting up or down; this is, FWIW, the same order macOS
> uses, and it clearly doesn't matter which way you do it).

Yes, this sounds like you should move away from modeling the memory
part as a parent genpd for the CPUs' genpd.

As Viresh pointed out, a devfreq driver seems like a better way to do
this. As a matter of fact, there are already devfreq drivers that do
this, unless I am mistaken.

It looks like devfreq providers are listening to opp/cpufreq
notifiers, as to get an indication of when it could make sense to
change a performance state.

In some cases the devfreq provider is also modeled as an interconnect
provider, allowing consumers to specify memory bandwidth constraints,
which may trigger a new performance state to be set for the memory
controller.

In the tegra case, the memory controller is modelled as an
interconnect provider and the devfreq node is modelled as an
interconnect-consumer of the memory controller. Perhaps this can work
for apple SoCs too?

That said, perhaps as an option to move forward, we can try to get the
cpufreq pieces solved first. Then as a step on top, add the
performance scaling for the memory controller?

>
> --
> Hector Martin (marcan@marcan.st)
> Public Key: https://mrcn.st/pub

Kind regards
Uffe
