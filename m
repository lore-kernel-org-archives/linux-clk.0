Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10893C77B7C
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 17:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjEIRxH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 13:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjEIRxG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 13:53:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA6D40E5
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 10:53:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D8D761634
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 17:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AC1C433EF;
        Tue,  9 May 2023 17:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683654784;
        bh=tWgR3+pNstlOjHvOjM5Qf0s3WnTQ6LeXkywW+xrMO40=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=C73/5giShPsIdNnFQJQ46sNcU3aKnpNu9JaoM9MdKuA4iOLC032Xgn1Jcc230Hx7L
         /j+fwISpIxPOX87cpL7Wj5QlyQ/ac0Pebu93AbCODcqiOcY3QHw+BlgsycIyDDRVEN
         HpSS1/6Dsf1ubSMen0reCFRWmw2462KRt6UhdcJFxYToC04cZ2xpS5TF+X0kOJbufe
         FVgQWOydkxN5p51v04IiuteiqX5QpVYKl5xiVORkze4mrIoa0Ege/YXbvWz+N0TOqq
         SDzDGLT9pV9t9x0Bxm3JNrmvVK4WfYC3R0WBCdGVqSOoS6DyTTphKnbRuRQZL+DFB9
         cIl4eOhVXLZig==
Date:   Tue, 9 May 2023 10:53:02 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Paolo Abeni <pabeni@redhat.com>,
        "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        poros <poros@redhat.com>, mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <20230509105302.3703216c@kernel.org>
In-Reply-To: <ZFplBpF3etwRY5nv@nanopsycho>
References: <ZFPwqu5W8NE6Luvk@nanopsycho>
        <20230504114421.51415018@kernel.org>
        <ZFTdR93aDa6FvY4w@nanopsycho>
        <20230505083531.57966958@kernel.org>
        <ZFdaDmPAKJHDoFvV@nanopsycho>
        <d86ff1331a621bf3048123c24c22f49e9ecf0044.camel@redhat.com>
        <ZFjoWn9+H932DdZ1@nanopsycho>
        <20230508124250.20fb1825@kernel.org>
        <ZFn74xJOtiXatfHQ@nanopsycho>
        <20230509075247.2df8f5aa@kernel.org>
        <ZFplBpF3etwRY5nv@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 9 May 2023 17:21:42 +0200 Jiri Pirko wrote:
> Tue, May 09, 2023 at 04:52:47PM CEST, kuba@kernel.org wrote:
> >On Tue, 9 May 2023 09:53:07 +0200 Jiri Pirko wrote:  
> >> >Yup. Even renaming EXT to something that's less.. relative :(    
> >> 
> >> Suggestion?  
> >
> >Well, is an SMT socket on the board an EXT pin?
> >Which is why I prefer PANEL.  
> 
> Makes sense.
> To speak code, we'll have:
> 
> /**
>  * enum dpll_pin_type - defines possible types of a pin, valid values for
>  *   DPLL_A_PIN_TYPE attribute
>  * @DPLL_PIN_TYPE_UNSPEC: unspecified value
>  * @DPLL_PIN_TYPE_MUX: aggregates another layer of selectable pins
>  * @DPLL_PIN_TYPE_PANEL: physically facing user, for example on a front panel
>  * @DPLL_PIN_TYPE_SYNCE_ETH_PORT: ethernet port PHY's recovered clock
>  * @DPLL_PIN_TYPE_INT_OSCILLATOR: device internal oscillator
>  * @DPLL_PIN_TYPE_GNSS: GNSS recovered clock
>  */
> enum dpll_pin_type {
>         DPLL_PIN_TYPE_UNSPEC,
>         DPLL_PIN_TYPE_MUX,
>         DPLL_PIN_TYPE_PANEL,
>         DPLL_PIN_TYPE_SYNCE_ETH_PORT,
>         DPLL_PIN_TYPE_INT_OSCILLATOR,
>         DPLL_PIN_TYPE_GNSS,
> 
>         __DPLL_PIN_TYPE_MAX,
>         DPLL_PIN_TYPE_MAX = (__DPLL_PIN_TYPE_MAX - 1)
> };

Maybe we can keep the EXT here, just not in the label itself.
Don't think we care to add pin type for PANEL vs SMT vs jumper?

> >> Sure, I get what you say and agree. I'm just trying to find out the
> >> actual attributes :)  
> >
> >PANEL label must match the name on the panel. User can take the card
> >into their hand, look at the front, and there should be a label/sticker/
> >/engraving which matches exactly what the kernel reports.
> >
> >If the label is printed on the board it's a BOARD_LABEL, if it's the
> >name of a trace in board docs it's a BOARD_TRACE, if it's a pin of 
> >the ASIC it's a PACKAGE_PIN.
> >
> >If it's none of those, or user does not have access to the detailed
> >board / pinout - don't use the label.  
> 
> To speak code, we'll have:
> DPLL_A_PIN_PANEL_LABEL (string)
>    available always when attr[DPLL_A_PIN_TYPE] == DPLL_PIN_TYPE_PANEL

Not sure about always, if there's only one maybe there's no need 
to provide the label?

> DPLL_A_PIN_BOARD_LABEL (string)
>    may be available for any type, optional
> DPLL_A_PIN_BOARD_TRACE (string)
>    may be available for any type, optional
> DPLL_A_PIN_PACKAGE_PIN (string)
>    may be available for any type, optional
> 
> Makes sense?

yup (obviously we need to document the semantics)

> But this does not prevent driver developer to pack random crap in the
> string anyway :/

It doesn't but it hopefully makes it much more likely that (1) reviewer
will notice that something is off if the driver printfs random crap;
and (2) that the user reading the documentation will complain that 
e.g.BOARD_LABEL is used but does not match the label on they see...
