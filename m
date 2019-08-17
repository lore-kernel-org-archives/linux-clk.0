Return-Path: <SRS0=iaTJ=WN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EF9C3A59B
	for <linux-clk@archiver.kernel.org>; Sat, 17 Aug 2019 07:05:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B8722086C
	for <linux-clk@archiver.kernel.org>; Sat, 17 Aug 2019 07:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfHQHFG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Aug 2019 03:05:06 -0400
Received: from muru.com ([72.249.23.125]:58110 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbfHQHFF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 17 Aug 2019 03:05:05 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 53AB0812D;
        Sat, 17 Aug 2019 07:05:32 +0000 (UTC)
Date:   Sat, 17 Aug 2019 00:05:01 -0700
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
        moaz korena <moaz@korena.xyz>, "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 0/6] Configure sgx interconnect data for some omap
 variants
Message-ID: <20190817070501.GK52127@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
 <CAHCN7x+p5+XoRHJP--mZ0QcP0FzpYK+pRj7d8Y-js6a8z=p_7A@mail.gmail.com>
 <20190815040248.GF52127@atomide.com>
 <20190815041502.GG52127@atomide.com>
 <CAHCN7xLNmTkvX9cKdRTu6xLvX+G-kkN6CbwXU0z+mdqscB3fvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLNmTkvX9cKdRTu6xLvX+G-kkN6CbwXU0z+mdqscB3fvQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190815 13:06]:
> On Wed, Aug 14, 2019 at 11:15 PM Tony Lindgren <tony@atomide.com> wrote:
> > Looks like omap34xx OCP registers are not readable unlike on omap36xx.
> > We use SGX revision register instead of the OCP revision register for
> > 34xx and do not configure any SYSCONFIG register unlike for 36xx.
> 
> Do you want/need me to test the OMAP3530?  I can run the same tests I
> did for the DM3730.

Sure if you can dod that easily.

Regards,

Tony
