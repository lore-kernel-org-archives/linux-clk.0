Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE065C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 21:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E88861051
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 21:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbhICVnr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Sep 2021 17:43:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:39996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230425AbhICVnq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Sep 2021 17:43:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3FE460FD7;
        Fri,  3 Sep 2021 21:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630705366;
        bh=Dcm016rrrRfbSotF02Hxb+DhiruaAuM61q/d9qK71xU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gvbDRsRlkgBePYnNQ4xUucjIktM82+zQ3QjOvCFQr5uUZJafr3XjVWfHPejoDq9Cv
         MXPOLM6ziGa1GdmxVnc0pDuo23rxQJec8+X3PCuAn4I7PL36lLn4jiEKmwf3kcH9J9
         Ni6lhnr7kkO5eXT6kMQ/2WeB0iM8LG2qm07Bcf3HoYqQsT7ZyuAoBDXzEe4b+2W8Dh
         66HoZbBFh3xXXIB/TJY9nft551o2RonV141uIYkXi6AV8wZQl+9nxMT3IC+np10pmp
         dqw+oMCCEPYJFvV779UkkKh4x+DKAGtiwa77KRDTitb48WFCprUTvjiJ04A1Q6yScf
         qh6N0IScRhpuw==
Date:   Fri, 3 Sep 2021 23:42:35 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Jan Kotas <jank@cadence.com>,
        robh+dt@kernel.org, devicetree@vger.kernel.org, pali@kernel.org
Subject: Re: [PATCH RFC] dt-bindings: clk: fixed-mmio-clock: Document
 mapping MMIO values to clock rates
Message-ID: <20210903234235.1c51e1a1@thinkpad>
In-Reply-To: <163069377886.405991.177735942780420525@swboyd.mtv.corp.google.com>
References: <20210903173107.950-1-kabel@kernel.org>
        <163069377886.405991.177735942780420525@swboyd.mtv.corp.google.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 03 Sep 2021 11:29:38 -0700
Stephen Boyd <sboyd@kernel.org> wrote:

> > This patch applies only after fixed-mmio-clock is converted to YAML by
> >   dt-bindings: clk: fixed-mmio-clock: Convert to YAML
> > 
> > This is a RFC and does not contain actual driver change. I would like
> > to hear your opinions.  
> 
> When it comes to masks and shifts in DT it's a NAK from me. I believe we
> don't have a good way to understand what endianess the mask is. Is it
> device order, or CPU order, or always big endian?

Several DT bindings already have little-endian/big-endian properties,
so this is solvable. Of course it is possible that such things are
frowned upon and I am not aware.

In this particular case though the register is part of the NB pinctrl
registers and that node is also a syscon node. In fact for the driver
I was considering to look at parent device whether it is a syscon node,
and if so, access the register via regmap. Regmaps have endianity
defined properly.

> It's also trending toward the one node per clk style of binding that we
> don't accept. I think this came up when the fixed-mmio binding was
> proposed. I hoped that nobody would use it outside of FPGAs.

I agree that one node per clk is not a good solution in most cases.

Yes, it would be possible to abuse this binding by for example using it
to define all peripheral clocks on 1 GHz variant of Armada 3720.

This is not the intended usage. The intended usage is system reference
clocks.

For reference clocks there _really is_ one crystal chip soldered on the
board. In this case I think one device node (per chip soldered on board)
is not something insane...

The reason why I did write this is that the current solution for A3720
seems weird to me: we have armada-37xx-xtal driver, which just looks at
one bit of one specific register registers fixed-rate clock with rate
depending on the value of that bit. This just looked like something
that should be generalized.

Also it makes more sense to me to have the possible frequencies of
reference clocks listed in the device tree instead of the driver, for
devices which allow several possible values. But others may of course
disagree...

> > +      compatible = "marvell,armada-3700-xtal-clock", "fixed-mmio-clock";
> > +      #clock-cells = <0>;
> > +      reg = <0x8 0x4>;  
> 
> Because it has a reg property. Of course, a reg property that isn't
> aligned to a 4k page or so would imply that the clk is actually part of
> a larger hardware block that should have a binding for the whole device
> instead of picking the clk part out of the hardware and setting a node
> to be exactly the one register in there that is of interest.

I actually was thinking about whether I should also add parent node in
this example, because yes, in this case the register resides in
north-bridge pinctrl device register space. I decided against it in the
end, but I can do it in future version, if we decide that we want to do
what I am proposing.

Marek
