Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:35957 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752857AbbFRWed convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jun 2015 18:34:33 -0400
Received: by pdjm12 with SMTP id m12so75634712pdj.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2015 15:34:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	"Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <20150614193052.GA22385@lukather>
Cc: linux-clk@vger.kernel.org,
	"Maxime Ripard" <maxime.ripard@free-electrons.com>
References: <20150614193052.GA22385@lukather>
Message-ID: <20150618223420.9112.67702@quantum>
Subject: Re: [GIT PULL] Allwinner late clock changes for 4.2
Date: Thu, 18 Jun 2015 15:34:20 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2015-06-14 12:30:52)
> Hi Mike, Stephen,
> 
> I totally forgot to send you this pull request with these two patches
> before.
> 
> Given that they're pretty minor (one "simple" clock addition and one
> fix) and that they've been in linux-next for quite some time now, and
> have been tested by kernelci, I hope you'll consider it for inclusion.

It's been that kind of development cycle ;-)

Pulled for 4.2.

Regards,
Mike

> 
> Sorry for that,
> Maxime
> 
> The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:
> 
>   Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/sunxi-clocks-for-4.2
> 
> for you to fetch changes up to ec80749dfd859b560e8864d665d38d7a63e6a7f2:
> 
>   clk: sunxi: Add support for the usb-clk on sun8i a23 and a33 SoCs (2015-06-02 10:24:39 +0200)
> 
> ----------------------------------------------------------------
> Allwinner clocks additions for 4.2
> 
> One error fix, and one patch to add support for the USB clock found on the
> Allwinner A23 and A33
> 
> ----------------------------------------------------------------
> Hans de Goede (1):
>       clk: sunxi: Add support for the usb-clk on sun8i a23 and a33 SoCs
> 
> Maxime Ripard (1):
>       clk: sunxi: Fix of_io_request_and_map error check
> 
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>  drivers/clk/sunxi/clk-sun9i-core.c                | 10 +++++-----
>  drivers/clk/sunxi/clk-sunxi.c                     |  2 ++
>  drivers/clk/sunxi/clk-usb.c                       | 11 +++++++++++
>  4 files changed, 19 insertions(+), 5 deletions(-)
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
