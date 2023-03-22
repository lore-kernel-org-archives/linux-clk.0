Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71980C6FD1F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Mar 2023 08:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjCVIj1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Mar 2023 04:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjCVIj0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Mar 2023 04:39:26 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC4A3BC7D;
        Wed, 22 Mar 2023 01:39:24 -0700 (PDT)
Received: from booty (unknown [37.160.6.101])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id EEB1020015;
        Wed, 22 Mar 2023 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1679474363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wz9JRgOQIMXRFmXdLRwJEba3ig72shB4CQk5G3EPImk=;
        b=TCL05enbOB0QJnuM/O0bDTeHVFDCWPFQScT6mHJu4nTz6/dUQs906scsp0TLqQ85+FDD4x
        XNrsna6SBl6J1/PWHEKAFBDv+N4HkTEzjy141bAv1I2Nm1xopxBPUxQpoeQ4DeblVau+dL
        VKDCvkcfGrlTUSd/W+LANUbrobDQK1r4PWQCTKNYakh8a8IPslfusYX636H+/jmYysgTas
        EqidyXoTincrKoQ/HHQi6dtxJwA3FyRV1aAEVK2bGsr7fIfzRlojMzeAPJ1rBklMLd8aCk
        bAGl+68yOgoDrmVHm3QwLvZV/WgDnaPO+dUw96lAIO2bRLlNlaLFIch2GR/w/w==
Date:   Wed, 22 Mar 2023 09:39:18 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-reneas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
Message-ID: <20230322093918.33690db3@booty>
In-Reply-To: <83f4f33ebd3706ec7d35acd807b1e44b.sboyd@kernel.org>
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
        <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com>
        <20230124091236.1bf8c6da@booty>
        <CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com>
        <232f59aa-704b-a374-6a78-469156ccdbea@seco.com>
        <83f4f33ebd3706ec7d35acd807b1e44b.sboyd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Stephen,

On Mon, 20 Mar 2023 14:27:56 -0700
Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Sean Anderson (2023-01-24 08:23:45)
> > On 1/24/23 03:28, Geert Uytterhoeven wrote:  
> > > Hi Luca,
> > > 
> > > On Tue, Jan 24, 2023 at 9:12 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:  
> > >> On Thu, 19 Jan 2023 14:27:43 -0500
> > >> Sean Anderson <sean.anderson@seco.com> wrote:  
> > >> > On 1/11/23 10:55, Geert Uytterhoeven wrote:  
> > >  
> > >> I'm wondering whether Geert has a practical example of a situation
> > >> where it is better to have these properties optional.  
> > > 
> > > My issue was that these properties were introduced long after the
> > > initial bindings, hence pre-existing DTS does not have them.
> > > Yes, we can add them, but then we have to read out the OTP-programmed
> > > settings first. If that's the way to go, I can look into that, though...  
> > 
> > FWIW I think there's no need to update existing bindings which don't
> > have this property. The required aspect is mainly a reminder for new
> > device trees.
> >   
> 
> Is there any resolution on this thread? I'm dropping this patch from my
> queue.

IIRC Geert kind of accepted the idea that these properties should stay
required. Which is a bit annoying but it's the safest option, so unless
there are new complaints with solid use cases for making them optionalm,
I think it's OK to drop the patch.

Luca
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
