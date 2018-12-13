Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F3CC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 08:13:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F0ED20849
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544688825;
	bh=hdSxwL6L48BawQk84aJlwPIeau5JWl7HwWdpz6eEVcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=d6cJbtruYa9a3KJLYKce8cvoHYhlmslhAxXnyYNRDBX5FYmE7XpU5kYCtK/hQnSs/
	 nA2qcV+sVirmvNhZx//qSz3PqtYjMQxnSHIq/nSNKtZ6WW48wTW1NodJsD+VAj/60k
	 hgtBbzpkRVvUyWcPkvSfE6bi4tEgWAjrGa5O55Ck=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F0ED20849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbeLMINp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 03:13:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:46880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726895AbeLMINp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 03:13:45 -0500
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83D9E20672;
        Thu, 13 Dec 2018 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544688823;
        bh=hdSxwL6L48BawQk84aJlwPIeau5JWl7HwWdpz6eEVcY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sscv4wFdgL2IdKX8eV/BP7/OwMEOne7iu887Yt2xkGBYEr+4Hn9+ZfZ06aCAQF0KP
         N+JJHp5XctJ3Y6rfVX4w4u8gUTo8hs+MNsqbUlPD8oLItZdRj5or/9zmRwASP/S83i
         CYxm1QVRCWQGDbNGF7v/RfYGf1Mv8IjlZuAkrGJw=
Date:   Thu, 13 Dec 2018 16:12:41 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Olof Johansson <olof@lixom.net>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>, linux-imx@nxp.com,
        Sascha Hauer <kernel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V11 1/7] clk: imx: add configuration option for mmio clks
Message-ID: <20181213081239.GB12458@dragon>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-2-git-send-email-aisheng.dong@nxp.com>
 <154468785263.19322.9529215687462426277@swboyd.mtv.corp.google.com>
 <CAOesGMhFtawJLpHmXbxvs=z+S1jVW8n2VQVv1gMcWicrOxDWdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOesGMhFtawJLpHmXbxvs=z+S1jVW8n2VQVv1gMcWicrOxDWdA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Dec 13, 2018 at 04:02:34PM +0800, Olof Johansson wrote:
...
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index a47430b..8a9440a 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -72,7 +72,7 @@ obj-$(CONFIG_ARCH_DAVINCI)            += davinci/
> > >  obj-$(CONFIG_H8300)                    += h8300/
> > >  obj-$(CONFIG_ARCH_HISI)                        += hisilicon/
> > >  obj-y                                  += imgtec/
> > > -obj-$(CONFIG_ARCH_MXC)                 += imx/
> > > +obj-y                                  += imx/
> > >  obj-y                                  += ingenic/
> > >  obj-$(CONFIG_ARCH_K3)                  += keystone/
> > >  obj-$(CONFIG_ARCH_KEYSTONE)            += keystone/
> > > diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> > > new file mode 100644
> > > index 0000000..37478ba
> > > --- /dev/null
> > > +++ b/drivers/clk/imx/Kconfig
> > > @@ -0,0 +1,5 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# common clock support for NXP i.MX SoC family.
> > > +config MXC_CLK
> > > +       bool
> > > +       def_bool (ARCH_MXC && !ARM64) || (ARCH_MXC && ARM64 && SOC_IMX8MQ)
> >
> > Ok I looked closer, SOC_IMX8MQ is only being introduced now and has only
> > been in linux-next for a few days. Having such a config symbol is highly
> > unusual for arm64 code. Has that been accepted by arm-soc? I don't know
> > why it would be because we don't add SoC specific config options
> > anymore. I imagine it will be rejected and we'll need to have this new
> > MXC_CLK config be enabled in the defconfig instead of selected from the
> > arch layer.
> >
> > Given all that, is there any damage if this is just a def_bool ARCH_MXC
> > right now? If it's enabled on the platforms that don't use it because
> > they have SCU, does it actually matter? Or we just get some code bloat?
> > If it's just some extra code, then even more reason to make a user
> > visible config option that can be selected in the configurations that
> > care to save some space.
> 
> On arm64 we generally add an ARCH_<family> and leave it at that. So,
> ARCH_MXC would be suitable, but we shouldn't add more finegrained than
> that.

Olof,

I'm just about to send pull request for i.MX8MQ support, which
introduced SOC_IMX8MQ option.  It sounds like we should rework the
patches to get SOC_IMX8MQ killed?

Shawn
