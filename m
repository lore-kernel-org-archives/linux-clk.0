Return-Path: <SRS0=3pyO=3L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25066C32771
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 07:32:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB09424672
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 07:32:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6u8yHtu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgAVHcT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jan 2020 02:32:19 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51909 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgAVHcT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jan 2020 02:32:19 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so2053567wmi.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2020 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3MXVPLATCXULyeCR7yaqGELOWx3DHy+QYePsTz+P4LE=;
        b=q6u8yHtuE47K1Z+hOqI7fLNWAfN2zOXLqfJMXGS+qwUnyuQOIYGoErhstEMs+YJjJ+
         7H7p179b9vES5VbNh2SI7WbThfykts9DTNZL9NZwumSnxBARX2NNLT/tC+00s+qnjn9f
         yatrsjkK2Ul4mnQjvqDtcspDvs3MJgTOHY6f4ycA9z5NbnAbKY/X5AwW4ukCFfAi+doo
         srBvVbdcLfYU6hDUadUC1VRXHwgNUiwQt7N9CsL8uspZaqoeGEawUoluNJcddYmg5w3O
         PhNqQ50JYOpqbE/OZiyxkeuP9zuaXJGphq1NujKqluXnWiIazUb3BGM6mqCHejspJn2W
         wZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3MXVPLATCXULyeCR7yaqGELOWx3DHy+QYePsTz+P4LE=;
        b=Rc2Lkc4LI+qI9I7Q9t2gdXxsOpy5O2VA5LbsvXEM1UEGNwYDb9QyzOyKLcBVPnPrnY
         PlRSw4QBebpH8s2Boo6tk+tt0C3DVHCHC+vDKJNhEV/dFp1EwD9evcnJ3Vy1Fc4x1LnK
         mlT6VuisgsP/kU/4Yl0CJKpyfQl+RWffOW9TjxpBE6P07w62K9YgrVfi+wWqsEIjplJO
         VUUNvV12c5dTOiW9zsVXGgjrXvj7py8U28NYVa7jQ0rhyfFPomITXllPx3m+iKS+FZqI
         e68Dh7e8JLRhtjamG8ro99vVYKH+Xvp+I+l2koPkbK8KoLyZUgdpszpLVJ9FN8kg7AqE
         ZZnA==
X-Gm-Message-State: APjAAAVeRvbDhiz7gsLF2Pebz6pPxyDlJvuyiZiRjo68wFTzVoFHx7XN
        7xtI1QhX4M8fBmH7d66JQUJbug==
X-Google-Smtp-Source: APXvYqyjPCF7y6EzjM6jOvdrbLjyyz0IpFGGxBG/vUyUMqvtv8ynraUNgAr0S7wDG10A8dZIYfxAQw==
X-Received: by 2002:a05:600c:24d1:: with SMTP id 17mr1346004wmu.136.1579678337359;
        Tue, 21 Jan 2020 23:32:17 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id k82sm2822489wmf.10.2020.01.21.23.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 23:32:16 -0800 (PST)
Date:   Wed, 22 Jan 2020 07:32:30 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200122073230.GK15507@dell>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <20200120135446.GD6852@sirena.org.uk>
 <20200121083658.GH15507@dell>
 <20200121161512.GC4656@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200121161512.GC4656@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 21 Jan 2020, Mark Brown wrote:

> On Tue, Jan 21, 2020 at 08:36:58AM +0000, Lee Jones wrote:
> > On Mon, 20 Jan 2020, Mark Brown wrote:
> 
> > > This is the *third* version of this you've sent today alone.  Please
> > > stop sending me this series until the MFD has been merged, perhaps just
> > > drop the subsystem patches while you resolve whatever the problems are
> > > that remain with the MFD?
> 
> > > I'm pretty much just deleting these patches
> > > without even looking at them at this point
> 
> > Don't do that please.  You are one of the reasons he's resending.
> 
> Me not looking at something can't reasonably be triggering the volume of
> resends this series is getting, we're talking multiple times a week
> here.  For example looking at the changelog in the cover letter the
> thing that triggered the resends yesterday was converting a macro to an
> enum, most of the others seem to have been changes for individual
> drivers.
> 
> > Please review Patch 3, or you will block the submission.
> 
> That's the patch
> 
>    mfd: rohm PMICs - use platform_device_id to match MFD sub-devices
> 
> which given the title hadn't really registered as needing any
> attention...

If I chose patches to review based on subject alone, I would miss a
high percentage of reviews.  Maybe your mail/manual/brain filters
need to be improved.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
