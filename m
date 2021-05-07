Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CABC43461
	for <linux-clk@archiver.kernel.org>; Fri,  7 May 2021 00:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55568613BA
	for <linux-clk@archiver.kernel.org>; Fri,  7 May 2021 00:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbhEGATZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 May 2021 20:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233551AbhEGATZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 May 2021 20:19:25 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B07EC061763
        for <linux-clk@vger.kernel.org>; Thu,  6 May 2021 17:18:27 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y2so4262253plr.5
        for <linux-clk@vger.kernel.org>; Thu, 06 May 2021 17:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fV18dwtn48LbYqtUNII+U1sK5U/gi1BuSDsNnAhHG24=;
        b=MYpD7CjcrphZ4my3TYsWeM2OdrpZazyN+NnRL5x8v5VFpr+u7uZ9abthjHGxBRWmKC
         9uKEh12en8aNciSJcxab7peUABhQdCKV4zfQVvrpBN5VRj9gMerazqZGtI3R8AnKRK5m
         2xptVyQ+gx/g/IxxdJOvAR3r3V3Z9LezSOzuechLeVemFJ0m9RIstiy7+8DYsnJymGgY
         idHeOV/VedR8+t3hIn8e7WchpLfETSsHmTsmMlbGyIb8beOQsOhhhfnwN05NycVRSX3p
         8OgNxSGwSEEXUJ9VSPKYqYa7G5R5+v+n76r1yx+aVVfbHrTN5UoK7jXlshT2BBEqvgwW
         53dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fV18dwtn48LbYqtUNII+U1sK5U/gi1BuSDsNnAhHG24=;
        b=XP06AyfFqcr2oYNFUFp6g2cWVApeltmas25Sgtjq65LdITf+eZnQsf8hS8Qi+PINv7
         1wVmEvYNTCpkDPWN2r+gh715SEww20r2NgKWNLMK/bD5iY4ZK0usAzShxeBzcan/x9Ta
         VkSuSc9u/66o2xzKrOqNah5yUq4DDRenMhHFTqT6ychw0E+5O2XJ9P23BO73TeITRjPe
         0/nSJRzg1xWvpm3bD0QHcOaLsse7bafmFxVIgK6t12uSdKwDDeXJ4WvF4WrHRSCvM4XS
         AwS7wVjMZyq85fT1kOvO39uiwFlGIiXyZ3eGiESDpceIVNZc3sQHOcZttqqH+MFpGmsH
         FLyw==
X-Gm-Message-State: AOAM530yuchBS0p6h2fZZP07NC/IOUw+aBuUKuRjs7sjqf8nkSyhE/lU
        Uhn+om8T3DIqbZcoPx/GuTA/nw==
X-Google-Smtp-Source: ABdhPJxRx82i02LDLS2+djk0BHt1+xL+GR9hJCey0SBueodvY0Fw57884EVQI3JzzFz78Db5xXSNrw==
X-Received: by 2002:a17:90a:510d:: with SMTP id t13mr20271514pjh.1.1620346706374;
        Thu, 06 May 2021 17:18:26 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id a129sm3208419pfa.36.2021.05.06.17.18.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 May 2021 17:18:25 -0700 (PDT)
Date:   Fri, 7 May 2021 08:18:20 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: update qcom,a53pll bindings for
 MSM8939 support
Message-ID: <20210507001818.GB8679@dragon>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
 <20210504052844.21096-3-shawn.guo@linaro.org>
 <20210506202726.GA744866@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506202726.GA744866@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 06, 2021 at 03:27:26PM -0500, Rob Herring wrote:
> On Tue, May 04, 2021 at 01:28:41PM +0800, Shawn Guo wrote:
> > Update qcom,a53pll bindings for MSM8939 support:
> > 
> >  - Add optional clock-output-names property.
> >  - Add MSM8939 specific compatibles.
> >  - Add MSM8939 examples.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  .../bindings/clock/qcom,a53pll.yaml           | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> > index db3d0ea6bc7a..7a410a76be2f 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> > @@ -18,6 +18,9 @@ properties:
> >      enum:
> >        - qcom,ipq6018-a53pll
> >        - qcom,msm8916-a53pll
> > +      - qcom,msm8939-a53pll-c0
> > +      - qcom,msm8939-a53pll-c1
> > +      - qcom,msm8939-a53pll-cci
> 
> These 3 have differences?

Yes.  They need to hook up with different frequency table as shown in
patch #5.

> 
> >  
> >    reg:
> >      maxItems: 1
> > @@ -33,6 +36,9 @@ properties:
> >      items:
> >        - const: xo
> >  
> > +  clock-output-names:
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -57,3 +63,31 @@ examples:
> >          clocks = <&xo>;
> >          clock-names = "xo";
> >      };
> > +  #Example 3 - A53 PLLs found on MSM8939 devices
> > +  - |
> > +    a53pll_c1: clock-controller@b016000 {
> > +        compatible = "qcom,msm8939-a53pll-c1";
> > +        reg = <0xb016000 0x40>;
> > +        #clock-cells = <0>;
> > +        clocks = <&xo_board>;
> > +        clock-names = "xo";
> > +        clock-output-names = "a53pll_c1";
> > +    };
> > +
> > +    a53pll_c0: clock-controller@b116000 {
> > +        compatible = "qcom,msm8939-a53pll-c0";
> > +        reg = <0xb116000 0x40>;
> > +        #clock-cells = <0>;
> > +        clocks = <&xo_board>;
> > +        clock-names = "xo";
> > +        clock-output-names = "a53pll_c0";
> > +    };
> > +
> > +    a53pll_cci: clock-controller@b1d0000 {
> > +        compatible = "qcom,msm8939-a53pll-cci";
> > +        reg = <0xb1d0000 0x40>;
> > +        #clock-cells = <0>;
> > +        clocks = <&xo_board>;
> > +        clock-names = "xo";
> > +        clock-output-names = "a53pll_cci";
> > +    };
> 
> Do these examples really add anything?

The example was added to demonstrate that multiple A53PLL clock
controllers could be found on a single SoC.  But I'm happy to drop it
if you think it's not so useful.

Shawn
