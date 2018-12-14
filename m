Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98FCC65BAE
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:36:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DED020811
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="z9W+ByU6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DED020811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbeLNBgp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 20:36:45 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:51198 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbeLNBgp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 20:36:45 -0500
Received: by mail-it1-f195.google.com with SMTP id z7so6770149iti.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Dec 2018 17:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KailU4Gc8p2XIAPTeGM+qSOnK3rvNuZuKnmoMhqPtbs=;
        b=z9W+ByU6Tmewsu9mqYy/LSyZvNDglZb7BFBOjMTgAl2NeKR8epXLVbHdZgaJXIfVEr
         V2lGJ5Fy58qRMhcWOupOarUStqoYfIcnFV+WiwXTU72MA/SsEE14bHwnnoxC4LLyr242
         JrN7wIbF9sAMTvse+055CgAOymIKYmX1LQnd3jc2yUYhdg56pvCXigFBc3XGzcMdPYWf
         WWsVKj5/8BWgWhdHUaWwxocbGmMZC3XAeg9WAI8QlrboZ3YDK3yu+BKMaPEScgT/PaoN
         xKLBDAwCrG9UEhUrgchigkuRcR8XNXPQ6yfAx1aRg5EdjQvntqAUzdtaMuPZzJFo+uC+
         Mtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KailU4Gc8p2XIAPTeGM+qSOnK3rvNuZuKnmoMhqPtbs=;
        b=WCD+ZzGBnWM1VSJHyYYYqfRPnCBAJPUYBt1eMOmpNFFb8LBTm7kvAaneh/do9Q8t0G
         umHWE3s54ehwSKQPdu1keVDKgwB2VjeHY6Zaj5I668+3XbFTOzhdELCpaeX9wJd3gTzJ
         HVUOcoyGqAOBtddpPBNJwwKDxK8QwzEguiglpVQQFiGknhnDNIb6VQJ3Mk8x2IVAOtur
         m+1e/by+VXmsEsFLB7IFLWoqgq9/hFH80jGHcIIErUlcz+FbgU4lMRgWArdyxo1+kGqO
         ynL+/8bjiEM2JbQ48VgI+TD2cbFRUuFL6BccUSsx87SNjqtRPZM4Crih+8ftt3xiX0UD
         eduA==
X-Gm-Message-State: AA+aEWbp/YuP7bcGPs5x/5tFKS2KNx7BalvfdRlt2eEU5w8dw4qYVEXL
        aaHzKzpN4r6PGUXtJtE53a4Ot5T0A4lpKZsr/d2F0A==
X-Google-Smtp-Source: AFSGD/V3k3UI0YpA/yfSE5+R2+FYe+B08Jm4KQBR7Wl6H3nFuV6G10o4UIpG+UASB1cCwy680AJMVCQdxyoaM7RT4CM=
X-Received: by 2002:a24:2104:: with SMTP id e4mr1526625ita.59.1544751403655;
 Thu, 13 Dec 2018 17:36:43 -0800 (PST)
MIME-Version: 1.0
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-2-git-send-email-aisheng.dong@nxp.com> <154468785263.19322.9529215687462426277@swboyd.mtv.corp.google.com>
 <CAOesGMhFtawJLpHmXbxvs=z+S1jVW8n2VQVv1gMcWicrOxDWdA@mail.gmail.com> <20181213081239.GB12458@dragon>
In-Reply-To: <20181213081239.GB12458@dragon>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 14 Dec 2018 09:36:31 +0800
Message-ID: <CAOesGMictB3QQOazbd0y1k5ijJjbx_8DL76XHWEQnKH3mxmXNw@mail.gmail.com>
Subject: Re: [PATCH V11 1/7] clk: imx: add configuration option for mmio clks
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>, linux-imx@nxp.com,
        Sascha Hauer <kernel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Dec 13, 2018 at 4:13 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Thu, Dec 13, 2018 at 04:02:34PM +0800, Olof Johansson wrote:
> ...
> > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > index a47430b..8a9440a 100644
> > > > --- a/drivers/clk/Makefile
> > > > +++ b/drivers/clk/Makefile
> > > > @@ -72,7 +72,7 @@ obj-$(CONFIG_ARCH_DAVINCI)            += davinci/
> > > >  obj-$(CONFIG_H8300)                    += h8300/
> > > >  obj-$(CONFIG_ARCH_HISI)                        += hisilicon/
> > > >  obj-y                                  += imgtec/
> > > > -obj-$(CONFIG_ARCH_MXC)                 += imx/
> > > > +obj-y                                  += imx/
> > > >  obj-y                                  += ingenic/
> > > >  obj-$(CONFIG_ARCH_K3)                  += keystone/
> > > >  obj-$(CONFIG_ARCH_KEYSTONE)            += keystone/
> > > > diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> > > > new file mode 100644
> > > > index 0000000..37478ba
> > > > --- /dev/null
> > > > +++ b/drivers/clk/imx/Kconfig
> > > > @@ -0,0 +1,5 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +# common clock support for NXP i.MX SoC family.
> > > > +config MXC_CLK
> > > > +       bool
> > > > +       def_bool (ARCH_MXC && !ARM64) || (ARCH_MXC && ARM64 && SOC_IMX8MQ)
> > >
> > > Ok I looked closer, SOC_IMX8MQ is only being introduced now and has only
> > > been in linux-next for a few days. Having such a config symbol is highly
> > > unusual for arm64 code. Has that been accepted by arm-soc? I don't know
> > > why it would be because we don't add SoC specific config options
> > > anymore. I imagine it will be rejected and we'll need to have this new
> > > MXC_CLK config be enabled in the defconfig instead of selected from the
> > > arch layer.
> > >
> > > Given all that, is there any damage if this is just a def_bool ARCH_MXC
> > > right now? If it's enabled on the platforms that don't use it because
> > > they have SCU, does it actually matter? Or we just get some code bloat?
> > > If it's just some extra code, then even more reason to make a user
> > > visible config option that can be selected in the configurations that
> > > care to save some space.
> >
> > On arm64 we generally add an ARCH_<family> and leave it at that. So,
> > ARCH_MXC would be suitable, but we shouldn't add more finegrained than
> > that.
>
> Olof,
>
> I'm just about to send pull request for i.MX8MQ support, which
> introduced SOC_IMX8MQ option.  It sounds like we should rework the
> patches to get SOC_IMX8MQ killed?

Yeah, I think the suggestions downthread are good approaches to avoid it.

Some platforms create SOC config options if they need it under
drivers/soc, but it will depend on your platform if you truly need it;
for most cases I think it'll just make dependencies more complicated.


-Olof
