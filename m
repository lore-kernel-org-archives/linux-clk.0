Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34876 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751177AbdFBAgj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2017 20:36:39 -0400
Received: by mail-lf0-f68.google.com with SMTP id v20so519187lfa.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2017 17:36:38 -0700 (PDT)
Date: Thu, 1 Jun 2017 17:27:03 -0700
From: Olof Johansson <olof@lixom.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "arm@kernel.org" <arm@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [GIT PULL] Gemini DTS updates, take one
Message-ID: <20170602002703.GM13314@localhost>
References: <CACRpkdYVqQ4qyraofQO3sLUV=NjBn48a9sX-k+O9ASSaBY7pyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACRpkdYVqQ4qyraofQO3sLUV=NjBn48a9sX-k+O9ASSaBY7pyA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 24, 2017 at 11:03:14AM +0200, Linus Walleij wrote:
> Hi ARM SoC folks,
> 
> this is a first pull request of DTS updates to the Gemini architecture.
> 
> It tries to follow the merge strategy to merge DTS files with numeral
> and then patch in macros after -rc1.

Appreciated!

> The combines clock+reset DT bindings are part of the pull request,
> but the macros and drivers are merged by the subsystem maintainers
> for clock and reset respectively.
> 
> I will likely submit more Gemini DTS pulls based on this one as drivers
> trickle in: ATA/SATA, DMA and maybe Hans' USB work come to mind.
> But let's create a firm base for it all first.

Cool.

> Please pull it into ARM SoC!
> 
> Yours,
> Linus Walleij
> 
> 
> The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
> 
>   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> tags/gemini-v4.13-dts-1
> 
> for you to fetch changes up to 664ed4e283926d753e876a1347b7729135a3f6b8:
> 
>   ARM: dts: Add clocks to the Gemini SoC (2017-05-24 10:50:22 +0200)

Merged into next/dt for v4.13. Thanks!

-Olof
