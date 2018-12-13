Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C843EC67839
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 08:02:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BFE520672
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 08:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="JeQN7cki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BFE520672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbeLMICt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 03:02:49 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:53208 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbeLMICt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 03:02:49 -0500
Received: by mail-it1-f193.google.com with SMTP id g76so2417605itg.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Dec 2018 00:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+EoIiB7t0sg6iJAPwEj4Js/iaR5JgIvLxPtOu5qkufY=;
        b=JeQN7ckiOiW4f9lpfNizP6DwENk0Q3Y/8/aDk9rAbZrRjDVcS6n23BqOaMl7NdePkW
         2kCQBUQ6nTot06irm9XwPFpVhBuSbNFK9d2/mG4JH7jQVSKVgekhuuWQCe4KdJsccfTv
         NywH2BngJHVIPC4T+6QknFvvcNaayloiAuMZHPnaydT+qK3Il18L7nM0+BRncfRW42jn
         T7qj7rZ10v6Ohvpi4tuPDNfZwRNeaI3nJnmu/S7otgQEPm09We9vxkWcWeEiyByonKkJ
         G1RW2CE9q/GAz1n0EU/Ucfv7U3AGXI0BnwkHx7nR2tktKpkxTe0NO7Vjfajlj8OWyjOe
         e2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+EoIiB7t0sg6iJAPwEj4Js/iaR5JgIvLxPtOu5qkufY=;
        b=Xk9TOG6Hb9e+gjWSxKT9rCtLfzPfJ5Ixx2WEpxiEO6FKbRXXWERXJ0CKMGynWBZRK4
         DUbWd26KgM4TSD0kGp1y/TuI4KPCU6aZxBej8B9ZqABlQBdp/baXdJDKI8ayCTo4GxiF
         5ckFJV5fNeRKZp9RwDHCo3CYcili+BprJWPZpHpj//zxNcFhxgI3eV3YY9fv/pF6alXL
         kZ7J7U6wNT69hwv+KsJ2gdKgp0nrLkRNmi6FwjmrJxFV6cbFsOxH8rio0X29RAKkZUGD
         InDikcBMonMp6zHynw2E5Ap4qxJ1bL4FhhIfh0oYtpze3yq3GYXL6j/PAOZCniU/6RRl
         ImxA==
X-Gm-Message-State: AA+aEWYlGuyv8f5Xxpp3kjjmHFuAWBf/jxbVEdZlutNocpCxKUkqie5o
        UO88eVikGhXSg53J0dVplLpXI0kxkvz/9HNulcmK/w==
X-Google-Smtp-Source: AFSGD/U9Rk0VY/1NraQ3wTCjiG3nPTHd1U+iFwaUqElceNiFnhhO6sPh0tGSkSJRQnXr3MeWhjQbsrbxSZrZsK85C/M=
X-Received: by 2002:a02:88cf:: with SMTP id b15mr22592849jak.10.1544688166628;
 Thu, 13 Dec 2018 00:02:46 -0800 (PST)
MIME-Version: 1.0
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-2-git-send-email-aisheng.dong@nxp.com> <154468785263.19322.9529215687462426277@swboyd.mtv.corp.google.com>
In-Reply-To: <154468785263.19322.9529215687462426277@swboyd.mtv.corp.google.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 13 Dec 2018 16:02:34 +0800
Message-ID: <CAOesGMhFtawJLpHmXbxvs=z+S1jVW8n2VQVv1gMcWicrOxDWdA@mail.gmail.com>
Subject: Re: [PATCH V11 1/7] clk: imx: add configuration option for mmio clks
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>, linux-imx@nxp.com,
        Sascha Hauer <kernel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Dec 13, 2018 at 3:57 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Aisheng Dong (2018-12-12 17:07:52)
> > The patch introduces CONFIG_MXC_CLK option for legacy MMIO clocks,
> > this is required to compile legacy MMIO clock conditionally when adding
> > SCU based clocks for MX8 platforms later.
> >
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index a47430b..8a9440a 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -72,7 +72,7 @@ obj-$(CONFIG_ARCH_DAVINCI)            += davinci/
> >  obj-$(CONFIG_H8300)                    += h8300/
> >  obj-$(CONFIG_ARCH_HISI)                        += hisilicon/
> >  obj-y                                  += imgtec/
> > -obj-$(CONFIG_ARCH_MXC)                 += imx/
> > +obj-y                                  += imx/
> >  obj-y                                  += ingenic/
> >  obj-$(CONFIG_ARCH_K3)                  += keystone/
> >  obj-$(CONFIG_ARCH_KEYSTONE)            += keystone/
> > diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> > new file mode 100644
> > index 0000000..37478ba
> > --- /dev/null
> > +++ b/drivers/clk/imx/Kconfig
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# common clock support for NXP i.MX SoC family.
> > +config MXC_CLK
> > +       bool
> > +       def_bool (ARCH_MXC && !ARM64) || (ARCH_MXC && ARM64 && SOC_IMX8MQ)
>
> Ok I looked closer, SOC_IMX8MQ is only being introduced now and has only
> been in linux-next for a few days. Having such a config symbol is highly
> unusual for arm64 code. Has that been accepted by arm-soc? I don't know
> why it would be because we don't add SoC specific config options
> anymore. I imagine it will be rejected and we'll need to have this new
> MXC_CLK config be enabled in the defconfig instead of selected from the
> arch layer.
>
> Given all that, is there any damage if this is just a def_bool ARCH_MXC
> right now? If it's enabled on the platforms that don't use it because
> they have SCU, does it actually matter? Or we just get some code bloat?
> If it's just some extra code, then even more reason to make a user
> visible config option that can be selected in the configurations that
> care to save some space.

On arm64 we generally add an ARCH_<family> and leave it at that. So,
ARCH_MXC would be suitable, but we shouldn't add more finegrained than
that.


-Olof
