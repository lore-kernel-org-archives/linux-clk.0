Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:34994 "EHLO
	mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377AbbJ2Mo6 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 29 Oct 2015 08:44:58 -0400
MIME-Version: 1.0
In-Reply-To: <1446117914-6392-1-git-send-email-geert+renesas@glider.be>
References: <1446117914-6392-1-git-send-email-geert+renesas@glider.be>
Date: Thu, 29 Oct 2015 21:44:57 +0900
Message-ID: <CANqRtoRgiUFAPKRQtBWBCHUS0c=puJS+3w9DHuuL9dUXKzVQtw@mail.gmail.com>
Subject: Re: [PATCH/RFC] drivers: sh: Handle PM_GENERIC_DOMAINS_OF=n with new
 r8a7795 CPG/MSSR driver
From: Magnus Damm <magnus.damm@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	SH-Linux <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

On Thu, Oct 29, 2015 at 8:25 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> If CONFIG_PM=n (and thus PM_GENERIC_DOMAINS_OF=n), the CPG/MSSR driver
> doesn't install its Clock Domain. Make sure the needed module clocks are
> still enabled by using the Legacy Clock Domain.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I'd be happy to make CONFIG_PM=y mandatory for new SoCs/DTS, so we can
> drop this patch.
>
> Thoughts?

Yeah, making CONFIG_PM=y mandatory must be the right way forward for new SoCs.

> For your convenience, I have push this patch to the
> topic/r8a7795-drivers-sh-v1 branch of my renesas-drivers repository.  A
> full integration for R-Car Gen3 is available in the topic/gen3-latest
> branch.

Thanks for your help! So shall we work towards dropping your
workaround and fix CONFIG_PM=y for r8a7795 and newer SoCs?

Cheers,

/ magnus
