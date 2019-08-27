Return-Path: <SRS0=sRHc=WX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAF4C3A5A6
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 14:49:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C412F21881
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 14:49:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vvu9dxa9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfH0OtA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Aug 2019 10:49:00 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34305 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfH0OtA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Aug 2019 10:49:00 -0400
Received: by mail-lf1-f66.google.com with SMTP id z21so6929496lfe.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2019 07:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7a/OLOPcOZSlvhkIopmFtdKC63x8DyVHJSn0hSTbfvc=;
        b=Vvu9dxa9eI6ZfI76dLHUz1pA4uteEG1BHHaVBjsbGpNynEw+dbnfAqzFAEO8d/4Kio
         IXjYsOp9OILFBSYTsufUjXUSaSLKNgNaRiOCwcJyCU8EyF4WsJoPb9isaT/g99TR4g3z
         PZyPQBxkKEvlUP3J9qAX2v88PJ17CDPPtaZ16lPQVYqEz+ZZQIIymaTbBbizeakGMyuu
         3j3IMkDQbo5MLZfTnmlIAeYFyFhGHzoTDhI+JkmzhsobE49HzZyxWiUphXMWMHWz7GqT
         7xvFc5udxtThPKLNP3i6U5oxx7evhc97qy/Xwpd7RaGHQBon16438mSR2wa+cv04UP0c
         uxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7a/OLOPcOZSlvhkIopmFtdKC63x8DyVHJSn0hSTbfvc=;
        b=QyXkWhvB3gU2YH2U2stGDODbR0nfFKIsXrqBnh6MagScultaW1/61fPsDlvZyU94gP
         0Gry1kvCwX/oGc6h9QCtDEMoo/uzQq4KBV/XreZtesggXoBXN2ffsXS1Rmlr1H6M/o5/
         TsExAYRUSaVo38+zaPuTAeSEJCcxyVBw76m2Tv/r4RJWJv3v7Pi0fUy8LMsg0oYyw7nc
         G7mtzA0XLRSLrDsP+KZeJwXMTGPdE6JMduAfoOz8CXNE6Onbnm2ATSLzut0TqABiuvEz
         C/NrzcrJ2ntt3r9+EHTDzy8g7+y4hPV3JHtnGAaHzn7IIfx9BJo0EX29XRcGVq3ohcnV
         H1Lg==
X-Gm-Message-State: APjAAAUaXdyrERDTZlPOtA3mpiYwb9XKgn9o22JCl8zXKbQw3krebdS8
        YwLggKKOGcNvBmq2AsF7W6pKxQ==
X-Google-Smtp-Source: APXvYqwo0sRAJcq83xtcRLc4IE6dHUk4NS2LqFi8LcgUEzkHHh1U/k6+CGsi0LZTJCv1knSsRL7wKA==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr14294268lfm.77.1566917338150;
        Tue, 27 Aug 2019 07:48:58 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id t82sm1728876lff.58.2019.08.27.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 07:48:57 -0700 (PDT)
Date:   Tue, 27 Aug 2019 16:48:55 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
Message-ID: <20190827144855.GA17311@centauri>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
 <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
 <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
 <CAP245DWbC8vY1pVuYnGvZ=7LVAAaqAm9TtccCktdxNWuuoxf5w@mail.gmail.com>
 <d8cf720c-b44f-f4ea-1c26-92ce34fd31e6@free.fr>
 <20190808042925.90F3721743@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808042925.90F3721743@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 07, 2019 at 09:29:24PM -0700, Stephen Boyd wrote:
> Quoting Marc Gonzalez (2019-07-03 07:00:31)
> > On 24/06/2019 15:57, Amit Kucheria wrote:
> > 
> > > On Mon, Jun 24, 2019 at 6:56 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
> > >>
> > >> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 used to be enabled by default
> > >> in drivers/clk/qcom/Kconfig. A recent patch changed that by dropping
> > >> the 'default ARCH_QCOM' directive.
> > >>
> > >> Add the two options explicitly in the arm64 defconfig, to avoid
> > >> functional regressions.
> > >>
> > >> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > > 
> > > Acked-by: Amit Kucheria <amit.kucheria@linaro.org>
> > 
> > Stephen,
> > 
> > Can you take the following two patches through the clk tree?
> > 
> > [PATCH v2] clk: qcom: msm8916: Don't build by default
> > [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
> > 
> 
> Did Andy pick up this defconfig change? The subject is misleading.
> defconfig changes should be something like

Neither Andy nor Bjorn has picked this.

Could you please pick it up? (possibly with subject fixed up)

> 
> 	arm64: defconfig: Add qcom clk options
> 
> I don't think I need to pick up the defconfig change. It can go through
> Andy and arm-soc. So I'll just grab the first one and guess it won't
> break much on the way in.
> 
