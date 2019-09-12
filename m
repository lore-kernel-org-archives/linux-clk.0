Return-Path: <SRS0=F2l5=XH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DCAC5ACAE
	for <linux-clk@archiver.kernel.org>; Thu, 12 Sep 2019 10:03:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FC97208E4
	for <linux-clk@archiver.kernel.org>; Thu, 12 Sep 2019 10:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOQJK+F3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730970AbfILKDe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Sep 2019 06:03:34 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39752 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730878AbfILKDe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Sep 2019 06:03:34 -0400
Received: by mail-qt1-f194.google.com with SMTP id n7so28883379qtb.6
        for <linux-clk@vger.kernel.org>; Thu, 12 Sep 2019 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aOWYB3DMPBdvSwiXyF/GUh8D7R8BU3JTpRh9eNB50ww=;
        b=iOQJK+F3Xh4PPUjpY0GaAGDZ7VttfqtZpUaqyZLYJsstBuH+U//r/47PYtwiMrUymC
         +RIu5KaGmOqoA1BXAMhf03gyhA8+cL0qYtzn5aJ0figtQFVRk8HuwsLfFLYYUh0eQ6UL
         1fbrbbltTdIxNoBM8syoEnHSUsXhYUYVwThNaIBMPtAVL3kWU8BCWOtARgjIygZZb6zp
         KINRjXD8yOkUAViAV3oWKxOc0i1Z25Ae+P0kSIFMVVi72gTD//ZHE7mKIdgs9G1Kuawi
         Ms+M9iHQC3FAnmSmbJUkBRkOFS6S3xbVTYvi5SAIOE8i3NUeQ/Be0soUMZ3ZzjaQVbSi
         E9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aOWYB3DMPBdvSwiXyF/GUh8D7R8BU3JTpRh9eNB50ww=;
        b=otH79/khHS7g+j4y2lpRz2QhmhtTgQOvz5DiVhrJskBmHONyOkGiz6HpyJ5ONdKWM9
         pby3vKy6AGxXV80cw3i1/OqisJDrITi5ngrX9SKSpVP+2/iaYfUpSCBZ2mOLHV5WbfVd
         NOpXqG7xhm2Eaaf9SCjyv80oPfL1I02W6L9X3oJegTUibc7KzgDyZAPk1E4Eve+CGlYM
         Mb1ahhE8BMjCix29IOaKxtXiCLvzplRatEsW0VT82O0SIx76RKhqs7RRcLqSvorb06A3
         KioiWD8Ilbts8SAsdkI+Xj5/uq4QzsdmZcxwv7zgNVvCrJLW+fL0+JlaVNUwOoAL4wxl
         p/nQ==
X-Gm-Message-State: APjAAAVVAgy5SSC53il8Sg4U7jTFIET1HHc/7MYDJ8y+CCN5NYcOiHke
        yAlrYXpE/Q9y/4lGtVP6fLM2nasvP4P1rSC86T4d5w==
X-Google-Smtp-Source: APXvYqyYqFVBKfUcLfS+7Te1gAsm+iJfnRQxxrlLXOVJMqmgd4LMC/pVx2XfUktZHZPdRIqzoioVTHAClDoQFNDQUkA=
X-Received: by 2002:aed:2a3b:: with SMTP id c56mr41859375qtd.343.1568282611921;
 Thu, 12 Sep 2019 03:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568239378.git.amit.kucheria@linaro.org> <20190912094651.GH2036@sirena.org.uk>
In-Reply-To: <20190912094651.GH2036@sirena.org.uk>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 12 Sep 2019 15:33:20 +0530
Message-ID: <CAP245DXBwwtcbjRQV_bCdYK5SZH9C9oxZJ2rFraJpbd5L0sHvw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Cleanup arm64 driver dependencies
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lists LAKML <linux-arm-kernel@lists.infradead.org>,
        arm-soc <arm@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 12, 2019 at 3:17 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Sep 12, 2019 at 03:48:44AM +0530, Amit Kucheria wrote:
>
> > I was using initcall_debugging on a QCOM platform and ran across a bunch of
> > driver initcalls that are enabled even if their SoC support is disabled.
>
> What exactly is the problem you're trying to fix here?  For the
> drivers I looked at these were bog standard register the driver
> with the subsystem type initcalls on optional drivers so not
> doing anything particularly disruptive or anything like that.

I was trying to prune the defconfig only to drivers that make sense on
the SoC. e.g. Why should I see a brcmstb_soc_device_early_init() call
on a QCOM system when I've disabled ARCH_BRCMSTB?

I came across this while trying to figure out how to make thermal and
cpufreq frameworks initialise as early as possible.

> For any given system that's going to be an issue for the
> overwhelming majority of drivers on the tree, including those
> that aren't associated with any particular architecture.

Indeed. From a quick check, MFD and GPIO has a bunch of 'generic'
drivers that aren't SoC-specific. I'm sure there are several such
drivers in regulator framework too. They don't need to be 'fixed'.

I was just trying to ring-fence obvious SoC-specific drivers behind a
ARCH_FOO dependency since they seemed like low-hanging fruit. Let me
know if it isn't a good use of everyone's time.

Regards,
Amit
