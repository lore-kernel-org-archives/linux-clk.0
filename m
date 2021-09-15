Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5866CC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 15:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26745611C6
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 15:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234169AbhIOPOD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Sep 2021 11:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhIOPOD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Sep 2021 11:14:03 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EF3C061764
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 08:12:44 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id t1so3042051pgv.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wsSC3ElljOcNuAZkoNqFxs8B8LwK8+PsifC2X+pKq7Y=;
        b=zHdY0vpXi3Pehr90PDksje3KtwyZby9zVYvErd1f3eV5Pa9SrhfiiLDYEiY78DN8yp
         e+495euySl52T9t+V2t4jh8/xuSmCkhO4oBtKFUoZ0obPPedm3f4F9cTiTzk+XpcVyFV
         TsOUUcNlJxeXnsA5+TvASjwcGHl1k2GevSoClqzJcupRErVWzaXoMB0sL+rktxgLL8gH
         LfZ6yYjipI18Z4+FkklOwqTJP+adgJPBLx9WQhMza19gSgVJhIuLnYf0m6YaZk+J5OFA
         F1ybeX/Ylw1Ahvmf2uw/50ayrfzkakqMLGceTESq3nqCaWU1WarJwdJfmN9qZOofXSJ8
         ieVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wsSC3ElljOcNuAZkoNqFxs8B8LwK8+PsifC2X+pKq7Y=;
        b=fnFZqagSuk+513FeT/ZwiBmY0UenRXCjANooxgtOLaxQxk544gTLD3IcRNzMqUyxu/
         Omw2rcbbTD7tYtKtenSOl4bpS7nbV7oGSFT7Nq2IJVJCVJOEbCtYHU4soY4N8DzzhGy2
         k64WNtWhyjX0R8AsvoLn9S48zBN+PiDEZ9zDnBYviKL+ERM2i/XLQH+KTvTwOT2Onyuc
         a7KhQ/nJKaqDHj/e1nMwaAexYnInj2U7HfKhlF0Sl/lxUj9baKHL8FUqop/+PKnEvWq4
         iLupzN1DsfhVInWvij1Ay2AHjWLAsKB2QqLFBjeZWNUliP6YkyEeEciLKkYAkePt/cX2
         hqhw==
X-Gm-Message-State: AOAM530cagm1pdCXtcehqe54OV8rbed5qiyLA1Jabgj56D5DDVRyybKz
        Ycv6jGSUti/4F38UzGssJ4Muug==
X-Google-Smtp-Source: ABdhPJyGqBLjcp/KUd3ds6sWYN6mT2/YPk+mfHPuNRq4EgjEc+zEcs0+PCVfueU9CI7jAVkKj02vEw==
X-Received: by 2002:a62:1c85:0:b0:440:3583:9fda with SMTP id c127-20020a621c85000000b0044035839fdamr455092pfc.0.1631718763504;
        Wed, 15 Sep 2021 08:12:43 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id u10sm92513pjf.46.2021.09.15.08.12.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 08:12:42 -0700 (PDT)
Date:   Wed, 15 Sep 2021 23:12:37 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: smd-rpm: Add rate hooks for
 clk_smd_rpm_branch_ops
Message-ID: <20210915151236.GF25255@dragon>
References: <20210914025554.5686-1-shawn.guo@linaro.org>
 <20210914025554.5686-2-shawn.guo@linaro.org>
 <YUFgmdhYK/p2v1LS@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUFgmdhYK/p2v1LS@ripper>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 14, 2021 at 07:55:21PM -0700, Bjorn Andersson wrote:
> On Mon 13 Sep 19:55 PDT 2021, Shawn Guo wrote:
> 
> > On QCM2290 platform, the clock xo_board runs at 38400000, while the
> > child clock bi_tcxo needs to run at 19200000.  That said,
> > clk_smd_rpm_branch_ops needs the capability of setting rate. Add rate
> > hooks into clk_smd_rpm_branch_ops to make it possible.
> > 
> 
> Most platforms has a crystal oscillator ticking at 38.4MHz feeding the
> PMIC (represented by the rpmcc and its "xo" parent) and out comes the
> bi_tcxo with a fixed 19.2MHz rate.

Yeah, but all those platforms are running clk-rpmh driver, I think.

> Is there a problem with the way sdm660_bi_tcxo is defined in this
> regard?

There is no problem if xo clock is 19.2MHz, but for platforms with
38.4MHz xo, bi_tcxo will be seen as 38.4MHz in clock tree, while we
expect it to be 19.2MHz.

Shawn
