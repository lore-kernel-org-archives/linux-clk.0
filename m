Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EBCECAAD8
	for <linux-clk@archiver.kernel.org>; Fri, 16 Sep 2022 20:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiIPUHB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Sep 2022 16:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiIPUGt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Sep 2022 16:06:49 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6509B942D
        for <linux-clk@vger.kernel.org>; Fri, 16 Sep 2022 13:06:47 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id r22-20020a9d7516000000b00659ef017e34so49918otk.13
        for <linux-clk@vger.kernel.org>; Fri, 16 Sep 2022 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hgnUqlACSahkkKGPSxg+d/+QJ7Obq2vwSzlhBetjicM=;
        b=X/bCGjcyPoH3ZRseX4Ic3CbiODiqKLJ2a7EaCBnMMftyxg0C60f1DaF+bzDPWgTlXk
         xDp/uVNwdC87eRj0FtRviZEUCQb/TZ8lf3Hej9QdDhbiRLc18jvK+qKKTFrt/uCqteTp
         aNvUJ3XtfusS86JtD4fN+Y5FSNJ2JdenFitS+MXqGEgLJmOVsUR4NtdEzomYyOLtghrc
         xYROzzzCUHKyk7B/dkrVZ2Jj/s7NBetCK+I7z+ux43xlAOcDmW2XLLgwDN6F2PDVxAoZ
         a0/ah0WoCw5Sf99NF2dssAH1EszyJ5xbTn6fxQugDOFOuTXv1mQl0CPRDKkluwqwTZQH
         iXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hgnUqlACSahkkKGPSxg+d/+QJ7Obq2vwSzlhBetjicM=;
        b=Na5W5LYMnFyPDrHVBcK8jD/5GUKMrWgNkIQZz1N6/lPI7BbPro0DXL9y/77/HETF59
         j5Sphk2sGAp2xePeAmzUx7RyKBX9Va80Ucv8+tOrJsMEBKMqBo5vVor5ChC0VP8niuKP
         LJZAEQsBot/i4IhrduxAtwn4vXldeniv4gy6wIUubagaQu9c9tWEyJ4Q/Gsfs4jNvgFz
         pwE1TnbasDHSOYFqYkLH05sbaDwmC76q/BeP6/tGH3nInkqrndRuYcmGxvLnOF+YC+Ml
         7yy12mVZcieUfq1FWvVgrehyp9s/mXa8yc62GDb538WSTH4/V5qbAzm/muU7tqFsl6xR
         H7YA==
X-Gm-Message-State: ACrzQf15y+pl4ev27rGvsvw+CA7fcqeHEyX11gjRYKD6nRMLQxNkhfqL
        OgGJzkwliVZiTjFkiVjYcayuYoTRkXLkaM/OpDiZNw==
X-Google-Smtp-Source: AMsMyM4LI/haScjx+w75HX53rbGxUkpFeFMWYeiCk3r+ArZJjJnJwxpPmfr16vcieKDggrmQoZdaIB7/Fn509SXH87s=
X-Received: by 2002:a9d:6458:0:b0:657:90f0:9c49 with SMTP id
 m24-20020a9d6458000000b0065790f09c49mr3068037otl.50.1663358807147; Fri, 16
 Sep 2022 13:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220914142256.28775-1-ansuelsmth@gmail.com> <20220914142256.28775-3-ansuelsmth@gmail.com>
 <20220916191715.GA1079300-robh@kernel.org> <6324d1be.050a0220.9d842.7b47@mx.google.com>
In-Reply-To: <6324d1be.050a0220.9d842.7b47@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 16 Sep 2022 23:06:35 +0300
Message-ID: <CAA8EJprEQOsm4TxGWJYZo04D1PagT3QmhDdYQkEid-KSP-tpTw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: arm: msm: Convert kpss-acc driver
 Documentation to yaml
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Takashi Iwai <tiwai@suse.de>,
        Christian Brauner <brauner@kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Marc Herbert <marc.herbert@intel.com>,
        James Smart <jsmart2021@gmail.com>,
        Justin Tee <justin.tee@broadcom.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 16 Sept 2022 at 22:43, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Fri, Sep 16, 2022 at 02:17:15PM -0500, Rob Herring wrote:
> > On Wed, Sep 14, 2022 at 04:22:53PM +0200, Christian Marangi wrote:
> > > Convert kpss-acc driver Documentation to yaml.
> > > The original Documentation was wrong all along. Fix it while we are
> > > converting it.
> > > The example was wrong as kpss-acc-v2 should only expose the regs but we
> > > don't have any driver that expose additional clocks. The kpss-acc driver
> > > is only specific to v1. For this exact reason, limit all the additional
> > > bindings (clocks, clock-names, clock-output-names and #clock-cells) to
> > > v1 and also flag that these bindings should NOT be used for v2.
> >
> > Odd that a clock controller has no clocks, but okay.
> >
>
> As said in the commit v2 is only used for regs. v2 it's only used in
> arch/arm/mach-qcom/platsmp.c to setup stuff cpu hotplug and bringup.
>
> Should we split the 2 driver? To me the acc naming seems to be just
> recycled for v2 and it's not really a clk controller.
>
> So keeping v2 in arm/msm/qcom,kpss-acc-v2.yaml and v1 moved to clock?

I suspect that qcom,kpss-acc-v2 is misnamed as the "clock-controller".
According to msm-3.10, these regions are used by the Krait core
regulators.

-- 
With best wishes
Dmitry
