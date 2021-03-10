Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA12C433DB
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 16:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FF7264FC3
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 16:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbhCJQit (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Mar 2021 11:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbhCJQid (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Mar 2021 11:38:33 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6A0C061762
        for <linux-clk@vger.kernel.org>; Wed, 10 Mar 2021 08:38:33 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso11458469wme.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Mar 2021 08:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sVQWlrBBeoHKwdd8D9L9gvXK0pkYdnkCO45O59sXhqE=;
        b=q0jOQtaYZjQtMu6WQQD9tfAYd5at3q0TEHS1dUCtD72fMVVqkUYR87DPWZHJiDyy+q
         vFZTNiFX5UjeF3jS2V2FB/TneNRx3Bd7Zx6ln/1DhisKyiOJGCEe6ZKfk2f7qNKfO6AU
         /aXcMcx9zW3jq26E+kIs9+yMB4spWrO3tfJ465ANnCpKOy9Ov4KIV8x27u7BQdeDygqb
         9TC6WFH2Gqm1L9KEqiK0qnm8GSII/tKMRmGDsS+l81kV/ZyAGP3Igr4KyD4TJdCVCHRJ
         0bRf+nadEtziMOPrKBx/ZV+LM1WdQBYKGgQgZSY3klS4OBLzQMbZTf45HjaV/p8KEVPN
         Fcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sVQWlrBBeoHKwdd8D9L9gvXK0pkYdnkCO45O59sXhqE=;
        b=iJPJ8GerStCnLN294kE/gW8BsKuh667kXFJoatp13qO3Vju3JfhglJ/puLu3QGxA3N
         SbLPQdcjh7UmxZAKGt6DVrmzcs40PfBrAfMndUJ0QhBOyDkoC9iTm1NMWufZ/Az4SL11
         qmp/xuDx0ZRHWzjxqnw53nCTP2oZWdvCHRezOrmqG/1iYm2DNphE3ghmubwVnNmGhiF1
         4fWku3ot08apKE5ozkBkSaELUKovCJ3akE8+dgd0hw40jj7k8i7kZtrNEJU8AI863Z0e
         Ro6RSrae+qgXReG3SP3c0fitVhgYvy7ro8+eeW7LX8i/+mRFdo5HI3GTeFjECeGN4t8D
         4D1w==
X-Gm-Message-State: AOAM5337OqIOaCvS/MxKJuFfyon9iHeKvggi0GOiAVvTuIOITTC1M467
        ACXUfWhpAtf7fNvmUwU7f6r3Ng==
X-Google-Smtp-Source: ABdhPJwDrIR7F7SMof/RHEqmZ96cNOGJ6ObmZEUKOAayqrXrKfrobyIkYN8y7xne+Pl/tcOX6LVXLA==
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr4242467wmf.17.1615394312049;
        Wed, 10 Mar 2021 08:38:32 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id p12sm8446541wrx.28.2021.03.10.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:38:31 -0800 (PST)
Date:   Wed, 10 Mar 2021 16:38:29 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
Message-ID: <20210310163829.GS701493@dell>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
 <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
 <20210310103639.GG701493@dell>
 <a631bbc3dd3bd0f02693d1c35f9a14dbaec67cc3.camel@fi.rohmeurope.com>
 <20210310111755.GN701493@dell>
 <e7bb00af76de65c60061c58a570d5b6f40961eb0.camel@fi.rohmeurope.com>
 <20210310133136.GQ701493@dell>
 <c1cb760a0bd2cf46dc5d9b21d1a08286a7671d21.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1cb760a0bd2cf46dc5d9b21d1a08286a7671d21.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 10 Mar 2021, Matti Vaittinen wrote:

> 
> On Wed, 2021-03-10 at 13:31 +0000, Lee Jones wrote:
> > On Wed, 10 Mar 2021, Matti Vaittinen wrote:
> > 
> > > On Wed, 2021-03-10 at 11:17 +0000, Lee Jones wrote:
> > > > On Wed, 10 Mar 2021, Vaittinen, Matti wrote:
> > > > 
> > > > > Hello Lee,
> > > > > 
> > > > > On Wed, 2021-03-10 at 10:36 +0000, Lee Jones wrote:
> > > > > > On Mon, 08 Mar 2021, Matti Vaittinen wrote:
> > > > > > 
> > > > > > > Add chip ID for ROHM BD71815 and PMIC so that drivers can
> > > > > > > identify
> > > > > > > this IC.
> > > > > > > 
> > > > > > > Signed-off-by: Matti Vaittinen <
> > > > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > > > Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > > > > > > ---
> > > > > > >  include/linux/mfd/rohm-generic.h | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > 
> > > > > > > diff --git a/include/linux/mfd/rohm-generic.h
> > > > > > > b/include/linux/mfd/rohm-generic.h
> > > > > > > index 66f673c35303..e5392bcbc098 100644
> > > > > > > --- a/include/linux/mfd/rohm-generic.h
> > > > > > > +++ b/include/linux/mfd/rohm-generic.h
> > > > > > > @@ -14,6 +14,7 @@ enum rohm_chip_type {
> > > > > > >  	ROHM_CHIP_TYPE_BD71828,
> > > > > > >  	ROHM_CHIP_TYPE_BD9571,
> > > > > > >  	ROHM_CHIP_TYPE_BD9574,
> > > > > > > +	ROHM_CHIP_TYPE_BD71815,
> > > > > > 
> > > > > > Is there a technical reason why these can't be re-ordered?
> > > > > 
> > > > > No, I don't think so.
> > > > > 
> > > > > BTW. there will probably be a (trivial) conflict here as both
> > > > > this
> > > > > series and the BD9576/BD9573 series add an ID here. Let me
> > > > > guess,
> > > > > you'd
> > > > 
> > > > That's fine.  I will resolve that manually.
> > > 
> > > Thanks :)
> > > 
> > > > > like to see them sorted?
> > > > 
> > > > Wouldn't that be nice? :)
> > > Aesthetics is not really my cup of tea. OTOH, if amount of IDs
> > > grow,
> > > then sorting helps spotting whether some IC has an ID here. So yes,
> > > it
> > > kind of makes sense.
> > 
> > By 'nice' I don't mean 'pretty'.
> > 
> > I mean 'improving readability/maintainability would be nice'.
> > 
> > > Can you do sorting while resolving the conflict between series or
> > > do
> > > you want me to
> > > a) do sorting if (when) I re-spin the series
> > > b) send separate sorting patch as a part of this series
> > > c) send sepatate sorting patch after all the pending patches
> > > touching
> > > these IDs have been merged?
> > 
> > I'll let you use your imagination.
> > 
> 
> Right :)
> 
> I'll sort the ID enum when I respin a series which is touching it, ok?
> Or do you want me to resend this even if there were no other changes?
> 
> It's just an old habit to add new enums at the bottom to maintain
> binary compatibility - which does not matter in this case.

I won't let this alone hold up merging of the whole set, but it looks
like you're still short of quite a few reviews.  I'd be surprised if
it's this version that gets applied.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
