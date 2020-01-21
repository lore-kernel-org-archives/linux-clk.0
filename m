Return-Path: <SRS0=oBAc=3K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74647C2D0CE
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 08:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 479E92465B
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 08:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NB17wEru"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgAUIei (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jan 2020 03:34:38 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33340 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgAUIei (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jan 2020 03:34:38 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so2174622wrq.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2020 00:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Z+bgbxbzUTNGQI+/VZp2r0XjEBbl7TwogVArBP2mRJc=;
        b=NB17wErunaQYRJET2RIyMRKFIfBXOSDYccrxJw+1chbepUN6k51qSO2b0fj2H5VNIJ
         niK0al1uPosacjl4NC4DNjvnvI2LN2c/jBamqYa6fBRRUvWADYKBeBOrqVBiUldT2Lzy
         Aca99cLF3NbSi47lFpODWO0QDcjuQOOt9kCL4aitGdEjAz60qIpgadd2CSnB9OL2atsg
         ILEBT4I0Uf2hjT/yQ8X7UCoAO72E2yD7bUkNVuU13x21vJIsAqIt/bTbBruHft2eo0B+
         Ydgpujt/xC+IgE0TTed2n8SJgXGypy5yIPqXbxcGbJIVz+LzEWOWhwyB1nD11h4veP7G
         pTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Z+bgbxbzUTNGQI+/VZp2r0XjEBbl7TwogVArBP2mRJc=;
        b=C8V5X+9nH0UeNpBY8OjzZjvjUegaztfgw5Fye4EK8fb56rr3UYoAKbHu/3f1Uj+Pfo
         CQPSGm2y9LVQZZ4/zsPIaYhq4T3pe6tiUvAWCEoxak5w43MOGzqLajGje6Asft3wMHcK
         uUnjsKHsLKUYvXdA2uenyiIolruKyKF1EpUSQnmir01s8THozRSR7JjSIoiSpuGdf9e6
         lOZ7BffscNd7VQ7+TRRWDUm9ca0rAgn88ysHznv1hSs7w+H1PDn24irWM6CUpXWjyBtq
         Z7xqhdQnS0Ihfv+xELwM2/RiqEAhsjUe4UGa1cL1jVwm3WmMo6QECnfVdOArPH0WR/Hu
         CRJQ==
X-Gm-Message-State: APjAAAUZkhziQT4po4TBiN7mi3VLQRPJLXmNMofAbdUpwqTnc1D3s+ok
        iReiw6I2E0SJBbibERVez9pN6w==
X-Google-Smtp-Source: APXvYqwzT7EyPaxBCnLVrqxaASOoY/qsRqiUmyFo7lStSiyLndIZNhQhrSyEYyxpC1+tK+YPTXfBJQ==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr3855403wru.173.1579595676129;
        Tue, 21 Jan 2020 00:34:36 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id c5sm2904792wmb.9.2020.01.21.00.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 00:34:35 -0800 (PST)
Date:   Tue, 21 Jan 2020 08:34:50 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "broonie@kernel.org" <broonie@kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@ger.kernel.org" <linux-gpio@ger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200121083450.GG15507@dell>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <20200120135446.GD6852@sirena.org.uk>
 <70ac7b71d5d54d4b90ded032214c473569b9fae1.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70ac7b71d5d54d4b90ded032214c473569b9fae1.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 20 Jan 2020, Vaittinen, Matti wrote:
> On Mon, 2020-01-20 at 13:54 +0000, Mark Brown wrote:
> > On Mon, Jan 20, 2020 at 03:40:20PM +0200, Matti Vaittinen wrote:
> > > Patch series introducing support for ROHM BD71828 PMIC
> > > 
> > > ROHM BD71828 is a power management IC containing 7 bucks and 7
> > > LDOs. All
> > > regulators can be controlled individually via I2C. Bucks 1,2,6 and
> > > 7 can also be assigned to a "regulator group" controlled by run-
> > > levels.
> > 
> > This is the *third* version of this you've sent today alone.  Please
> > stop sending me this series until the MFD has been merged, perhaps
> > just
> > drop the subsystem patches while you resolve whatever the problems
> > are
> > that remain with the MFD?  I'm pretty much just deleting these
> > patches
> > without even looking at them at this point, it's a large series, it's
> > getting huge numbers of resends and I don't think any version I've
> > had a
> > chance to look at before it got resent had a change in the one
> > regulator
> > patch that'd cause me to have to re-review it.

To be fair, yours is one of the reviews we're waiting for!

See [PATCH 03/11].

> Sorry Mark (and all). I guess this is annoying. Why I do resend whole
> series is that during the bd71837 work Lee instructed me to always
> resend whole series - not just the changed patches.

Which in general is the correct thing to do.  Having a large threaded
series on the list containing in the form of subsequent
versions gets real confusing real quick:

| [PATCH v2 01/05]
| > [PATCH v3 01/05]
| [PATCH v2 02/05]
| > [PATCH v3 02/05]
| -> [PATCH v4 02/05]
| [PATCH v2 03/05]
| [PATCH v2 04/05]
| > [PATCH v3 04/05]
| [PATCH v2 05/05]
| > [PATCH v3 05/05]
| -> [PATCH v4 05/05]
| --> [PATCH v5 05/05]
| ---> [PATCH v6 05/05]

However, you should wait for a suitable period per submission, to give
each maintainer a chance to review the patches they are responsible
for.

> I sure can learn and drop some of the recipients in the future - and
> actually I did for this last resend. Reason why you are in the
> recipients is that Lee asked me to get your ack for patch 3/11. Same
> goes with Stephen.
> 
> Linus is involved as Lee asked me to get his ack for patch 11.
> 
> But resending this series 3 times today is really my fault. (Well, of
> course, I did send this and no one else). I messed up the previous
> series.
> 
> I was hoping the revision history in cover letter would be a fast way
> to determine if something relevant has changed. Additionally, I did try
> to include statement that "no changes" in the beginning of each patches
> for most of the versions. (for versions up-to 11 - this was omitted
> from v12 and v13 which only did very specific changes).
> 
> But sure, I should try to be more careful so that I don't need to do so
> many resends - and I really could drop most of the recipients earlier.
> Thanks for pointing it out.

If dropping recipients is your tactic of choice (I wouldn't choose to
do that myself), just ensure you keep everyone on Cc for the
cover-letter ("[PATCH 00/00]") and maybe indicate the fact that they
have been dropped and why ("dropped Lee since the MFD patches have
been reviewed and are unchanged in this series").  Reason being;
if/when a set is applied, the cover-letter is used as the Reply-to
for sending out the pull-request to all those concerned.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
