Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA191C11F64
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 19:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C165861289
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 19:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhGAT3U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jul 2021 15:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbhGAT3M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jul 2021 15:29:12 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23CAC061764
        for <linux-clk@vger.kernel.org>; Thu,  1 Jul 2021 12:26:41 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id r20so3972517oic.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Jul 2021 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kgry+NHhIXRto0lihG09dvKrpOIpSuRCcDkQYUAh4RI=;
        b=aizhnnYOcdskMEQ6r7sUhkeD59cflOqSzk9alJZHPv3y5LbR1/JWMIX51EAoC3Q6ya
         T/1dJ9/FcXOXLZC9bgH1vVyLDDXla90OgKB4eygUvPEaddF7R/i311qvgRyaCIj3mH/D
         UU1CdRZiiz8/tnHaMJQqP7qTCNTmp+cqjQBBqCiv6j5RpkjuLeNjfCYFeR5GoHElPWhF
         u72S5BFduhL0HeBtjtkrN5E15Kt4cZH+d8HtNNB1CHW9w0yqkEteCl6REChwMY+rgDWj
         SjUs9dSJpxkkFAEP1yvxhhjyyQlyZG1BrGdyH7Ms6GzJgo0wPAryxK1ZGl+4f2W/+lIY
         mezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kgry+NHhIXRto0lihG09dvKrpOIpSuRCcDkQYUAh4RI=;
        b=ny06Z6ev2adJ6aykThq/RjH8pCESX5+bSwn6vHjtPWT7+tlVTYCwoa9ucoLsAY4s5G
         yWmwGNO8c1AptYnM29b8A9RF3kn4r+haYlASVrAdywhUZ/Y9XEd1okyj4YjWW9teWUMY
         FEonheNMKwfIJBYzQfRhL1xITVbUHbFY2dovgtZJStR++2vPzG3GVRHTnO/hJH0F6x4H
         ShrI4y8qK7lEYABSc+WCAFu+ZM5wcz/Zb/FWOb5egOh8ESsFt0EhFNHPc/4lgi06vsyT
         ABThw3AzX5B+UOBDYLMt+s+9o5/YqoJQotYuZn/5JwCMqeP9ZVKJ+tcdusWBtaVAZKft
         3u8w==
X-Gm-Message-State: AOAM532lWUL1AOpNJptvwQjXQrtK7kUZ4z8ZHeLGBU4eFmCkmlqG27dn
        YTWH5AkB976jQK9jGPuyGOTHTA==
X-Google-Smtp-Source: ABdhPJw8dFMNFHOqRpqbt6qTcwP5OdglQZTYNAI/4mcxv9pX4SSp3kexHozFx6rQg5fYNi9NVdJGOw==
X-Received: by 2002:aca:d0c:: with SMTP id 12mr2441231oin.62.1625167601087;
        Thu, 01 Jul 2021 12:26:41 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n65sm129311ota.37.2021.07.01.12.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 12:26:40 -0700 (PDT)
Date:   Thu, 1 Jul 2021 14:26:38 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx
 power domain
Message-ID: <YN4W7vd3Yep+DX3N@yoga>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-2-dmitry.baryshkov@linaro.org>
 <CAPDyKFpXD3rCmp53LFFYky_xQv9ucofvTezG5qWyDZt427chNQ@mail.gmail.com>
 <CAA8EJpob=TpXiJozac-5sKJzE71ddWRFDj7D2-F=W=a2mgKvxA@mail.gmail.com>
 <CAPDyKFq-vwMchLFb3JvK7B9ZQ9=z-TXzGHUij6CocTR+VmAOqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFq-vwMchLFb3JvK7B9ZQ9=z-TXzGHUij6CocTR+VmAOqQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 01 Jul 11:58 CDT 2021, Ulf Hansson wrote:

> On Thu, 1 Jul 2021 at 18:39, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 1 Jul 2021 at 19:17, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Wed, 30 Jun 2021 at 15:31, Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On sm8250 dispcc requires MMCX power domain to be powered up before
> > > > clock controller's registers become available. For now sm8250 was using
> > > > external regulator driven by the power domain to describe this
> > > > relationship. Switch into specifying power-domain and required opp-state
> > > > directly.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  .../bindings/clock/qcom,dispcc-sm8x50.yaml    | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > > index 0cdf53f41f84..48d86fb34fa7 100644
> > > > --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > > @@ -55,6 +55,16 @@ properties:
> > > >    reg:
> > > >      maxItems: 1
> > > >
> > > > +  power-domains:
> > > > +    description:
> > > > +      A phandle and PM domain specifier for the MMCX power domain.
> > > > +    maxItems: 1
> > > > +
> > >
> > > Should you perhaps state that this is a parent domain? Or it isn't?
> > >
> > > Related to this and because this is a power domain provider, you
> > > should probably reference the common power-domain bindings somewhere
> > > here. Along the lines of this:
> > >
> > > - $ref: power-domain.yaml#
> > >
> > > As an example, you could have a look at
> > > Documentation/devicetree/bindings/power/pd-samsung.yaml.
> >
> > I'll take a look.
> >
> > >
> > > > +  required-opps:
> > > > +    description:
> > > > +      Performance state to use for MMCX to enable register access.
> > > > +    maxItems: 1
> > >
> > > According to the previous discussions, I was under the assumption that
> > > this property belongs to a consumer node rather than in the provider
> > > node, no?
> >
> > It is both a consumer and a provider. It consumes SM8250_MMCX from
> > rpmhpd and provides MMSC_GDSC.
> 
> That sounds a bit weird to me.
> 

dispcc is a hardware block powered by MMCX, so it is a consumer of it
and needs to control MMCX.

> In my view and per the common power domain bindings (as pointed to
> above): If a power domain provider is a consumer of another power
> domain, that per definition means that there is a parent domain
> specified.
> 

And in addition to needing MMCX to access the dispcc, the exposed
power-domain "MDSS_GDSC" is powered by the same MMCX and as such
MDSS_GDSC should be a subdomain of MMCX.


But what I was trying to say yesterday is that the power-domain property
should be sufficient and that we shouldn't need to drive MMCX to a
particular performance_state in order to access the registers.

Then as clients make votes on clock rates that requires higher
performance_state, they would describe this in their opp-tables etc.


But without any performance_state requests, pd->corner will in
rpmhpd_power_on() be 0 and as such powering on the power-domain won't
actually do anything. Similarly dev_pm_genpd_set_performance_state(dev,
0) on an active power-domain from rpmhpd will turn it off.


So the reason why Dmitry is adding the required-opps to the binding is
to get rpmhpd to actually tell the hardware to turn on the power domain.
And I don't think this is in accordance with the framework's
expectations.

Regards,
Bjorn
