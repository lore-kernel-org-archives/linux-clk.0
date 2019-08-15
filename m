Return-Path: <SRS0=fX0Q=WL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B863EC31E40
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 04:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 955CB2067D
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 04:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfHOECz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Aug 2019 00:02:55 -0400
Received: from muru.com ([72.249.23.125]:57858 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbfHOECz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Aug 2019 00:02:55 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C95EE80C8;
        Thu, 15 Aug 2019 04:03:19 +0000 (UTC)
Date:   Wed, 14 Aug 2019 21:02:48 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        moaz korena <moaz@korena.xyz>
Subject: Re: [PATCH 0/6] Configure sgx interconnect data for some omap
 variants
Message-ID: <20190815040248.GF52127@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
 <CAHCN7x+p5+XoRHJP--mZ0QcP0FzpYK+pRj7d8Y-js6a8z=p_7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7x+p5+XoRHJP--mZ0QcP0FzpYK+pRj7d8Y-js6a8z=p_7A@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190814 19:14]:
> echo on > /sys/bus/platform/devices/5000fe00.target-module/power/control
> # devmem 0x5000fe00 32
> 0x40000000
> 
> and
> 
> echo auto > /sys/bus/platform/devices/5000fe00.target-module/power/control
> # devmem 0x5000fe00 32
> [  776.373504] 8<--- cut here ---
> [  776.376617] Unhandled fault: external abort on non-linefetch (0x1018) at 0xb6
> f76e00
> [  776.384338] pgd = bde98bb0
> [  776.387054] [b6f76e00] *pgd=8cb61831, *pte=5000f383, *ppte=5000fa33
> [  776.393402] In-band Error seen by MPU  at address 0
> 
> Then
> 
> Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit

Thanks for testing, yes that's all there is to it for the SoC glue in
this case. The child device driver(s) can be just generic sgx driver(s)
that just do pm_runtime_get_sync() to access the registers and that
enables the parent interconnect target module as needed.

> I do wonder if an omap34xx or omap36xx should use
> compatible = "ti,sysc-omap4", "ti,sysc";
> 
> should it use an omap3 equivalent?

We named the old hwmod type1 as ti,sysc-omap2, type2 as ti,sysc-omap4,
and type3 as ti,sysc-omap4-simple based on where we thought they
appeared. Based on the sysconfig register bit layout, sgx on omap36xx
seems to have a subset of ti,sysc-omap4 and we can recycle it. If we
used a wrong type, the module would not get enabled or disabled as
the register bits would not match.

How about let's add a comment like:

Yes sg has a subset of ti,sysc-omap4 type sysconfig register

Regards,

Tony
