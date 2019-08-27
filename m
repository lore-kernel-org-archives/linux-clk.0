Return-Path: <SRS0=sRHc=WX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34223C3A5A3
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 16:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BD2A22CBB
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 16:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWc3gZnr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730079AbfH0Quz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Aug 2019 12:50:55 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45459 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbfH0Quz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Aug 2019 12:50:55 -0400
Received: by mail-pl1-f196.google.com with SMTP id y8so12076994plr.12
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2019 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kShiklbxXonPvyTtTpQ9U0Ep+Qam/mfANXjVpM7jQl4=;
        b=zWc3gZnr0b+oGaMG1D8r6/cR+FDRLjznPoGq2Lo20/Q9xX/PzIkD8n+5E//ntur0E8
         WR/9POMJW62WmqhFxPj8iFoyAKjCNFDZxUpIc9pBJ+VIkuwmFIUi75ZLkrD4+zsbSHM9
         nTrzh1chNlu0s97T4KsQBe18nkqS2NSVAGjPbjP3WcetOSCxZQ1EqdQOU2YpBUKvfwqj
         5Ju35G1nmWDdlUbUckIzVsAvIZDz1+rffnd/4UxQfftwA12tZkSsHjjvweieGo637UAP
         GHAxwfusWmrKnJ75mCVXVuw//K9f2lLdzLRa0r7YqeLTl3gu44ViTQwGviDloqJ+0AWe
         YlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kShiklbxXonPvyTtTpQ9U0Ep+Qam/mfANXjVpM7jQl4=;
        b=l/vR2OAek92b6FbnrzGP9gmqa7eenRwmBiB0VEJfaYNiZ6swdFwRQOVNWh1e/Wv96r
         i/oKciRl/ozLKJ9QFrydErXGMk4nGTEFKP+d+u6mSyzdOgua5LMj5/mABoVFU0doGUzB
         VaRhKWaTsZHWKsPo7sBF92dCHCE+rztb/ldUMX/9LkS4c7N8UO7JJ2XF9cNx9D2A7b30
         3Deu5mpv2WQoIm7XbSxxTt5TjhFtFCnEnQPhx01dKdII5gwfNXYsimDWPsO6/XKJiLcg
         Xhsv+G76Oq32TYTku72lcNC9WgVbu7dT4w4m/Z9X8R++QaeVnnhwB28AblPRpsePgkzt
         Tt2g==
X-Gm-Message-State: APjAAAXfWpjFR1m8t62VWOEW58veG8dniKRcXyWuX+WIDq/NjwoNWOH5
        XyQDDA3+GUHCITSNg2pSQVnP2w==
X-Google-Smtp-Source: APXvYqyhmY7LYOx1nKrYPzEEZ/udP6aG+qMVvXVKYs5SpBKNQI8RISuq2sDW1fwdsrEe7X14JGEuCA==
X-Received: by 2002:a17:902:fe8c:: with SMTP id x12mr10273576plm.55.1566924654505;
        Tue, 27 Aug 2019 09:50:54 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o129sm16313302pfg.1.2019.08.27.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 09:50:53 -0700 (PDT)
Date:   Tue, 27 Aug 2019 09:52:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
Message-ID: <20190827165245.GD26807@tuxbook-pro>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
 <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
 <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
 <CAP245DWbC8vY1pVuYnGvZ=7LVAAaqAm9TtccCktdxNWuuoxf5w@mail.gmail.com>
 <d8cf720c-b44f-f4ea-1c26-92ce34fd31e6@free.fr>
 <20190808042925.90F3721743@mail.kernel.org>
 <20190827144855.GA17311@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827144855.GA17311@centauri>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 27 Aug 07:48 PDT 2019, Niklas Cassel wrote:

> On Wed, Aug 07, 2019 at 09:29:24PM -0700, Stephen Boyd wrote:
> > Quoting Marc Gonzalez (2019-07-03 07:00:31)
> > > On 24/06/2019 15:57, Amit Kucheria wrote:
> > > 
> > > > On Mon, Jun 24, 2019 at 6:56 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
> > > >>
> > > >> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 used to be enabled by default
> > > >> in drivers/clk/qcom/Kconfig. A recent patch changed that by dropping
> > > >> the 'default ARCH_QCOM' directive.
> > > >>
> > > >> Add the two options explicitly in the arm64 defconfig, to avoid
> > > >> functional regressions.
> > > >>
> > > >> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > > > 
> > > > Acked-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > 
> > > Stephen,
> > > 
> > > Can you take the following two patches through the clk tree?
> > > 
> > > [PATCH v2] clk: qcom: msm8916: Don't build by default
> > > [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
> > > 
> > 
> > Did Andy pick up this defconfig change? The subject is misleading.
> > defconfig changes should be something like
> 
> Neither Andy nor Bjorn has picked this.
> 
> Could you please pick it up? (possibly with subject fixed up)
> 

Picked up and updated the subject.

Thanks Marc!

Regards,
Bjorn

> > 
> > 	arm64: defconfig: Add qcom clk options
> > 
> > I don't think I need to pick up the defconfig change. It can go through
> > Andy and arm-soc. So I'll just grab the first one and guess it won't
> > break much on the way in.
> > 
