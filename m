Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B13BC433E0
	for <linux-clk@archiver.kernel.org>; Sat, 13 Feb 2021 01:15:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0864064E8A
	for <linux-clk@archiver.kernel.org>; Sat, 13 Feb 2021 01:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbhBMBPS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Feb 2021 20:15:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229903AbhBMBPS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Feb 2021 20:15:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1DF564E8A;
        Sat, 13 Feb 2021 01:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613178877;
        bh=xKaV6FK/Ficlxn1hBqpGRH6ioxbR3kHSmD95kEm9UEE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=acS1T/Caltierk5WZIY/Ta0j7WkeW9TSS/EOpAzRELuu2l1RYnFxIT7T26/HZOEZo
         DrQoaeCDBYDoEgqlhimxmT9UhAXWd69GKCflp/1NCalXXEpZE8ZxY6wVBYQCd6bu5p
         ja04alEGpLkRC8nD6tZJYwrWAmGbwmWM2gmKb5OdZwHCJsH3fSkM2bVx4jz+uMcjd2
         xKgqoGmsjFHWS1rL7FDRwV9eBWSP6lGpZjGFv7g/fAa6sYMfWYgqVyYehXu40yE6Jz
         s6JkIzEDV05V+zse04f+BGJNCB8jeoTtzIOlNwQc+uXsDoJM+kmLwjdg39eqNhBpeB
         qfdC2mjVGAcDQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210211080509.5kl2u3ofdggyzuvj@pengutronix.de>
References: <20201221092713.vq6cfo2jyxl5l2rm@pengutronix.de> <20210113083042.tezxr5sim2oevtvm@pengutronix.de> <161301324986.1254594.14610246660375821616@swboyd.mtv.corp.google.com> <20210211080509.5kl2u3ofdggyzuvj@pengutronix.de>
Subject: Re: [PATCH] clk: Warn when clk_get_rate is called for a disabled clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Simon South <simon@simonsouth.net>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de
To:     <u.kleine-koenig@pengutronix.de>
Date:   Fri, 12 Feb 2021 17:14:36 -0800
Message-ID: <161317887654.1254594.6078241024095194891@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe (2021-02-11 00:05:09)
> Hello Stephen,
>=20
> On Wed, Feb 10, 2021 at 07:14:09PM -0800, Stephen Boyd wrote:
>=20
> > What problem are you trying to address? Is there some issue you've
> > encountered in the kernel that would have been fixed by having this
> > warning?
>=20
> The warning obviously doesn't fix anything. My eventual goal is to
> answer the question in the initial mail in this thread. The motivating
> situation is: Should I continue to tell patch authors who use
> clk_get_rate() that they have to ensure that the given clk must be
> enabled as the documentation suggests? And if yes: Can we please check
> this automatically (e.g. with my patch or by returning 0 for a disabled
> clk) and don't rely on human review to adhere to this rule.
>=20

I suggest to stop telling folks that they must enable the clk before
getting the rate. The documentation says

 "This is only valid once the clock source has been enabled"

which is really ambiguous. What is "this?" supposed to be? Is it trying
to say the clk isn't toggling at the frequency until it is enabled, so
the rate isn't valid until it is toggling? Or is it saying that the
return value isn't valid until the clk is enabled?  It's been there for
a long time, in fact since Russell introduced the header file on arm in
2004[1]. I'm inclined to read it as:

 "The clk won't be toggling at the rate returned by this function until
  the clk is enabled by clk_enable()"

Maybe send a documentation update instead?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit=
/include/asm-arm/hardware/clock.h?id=3D0471b5fb91816b448f10e43f922b8a5e264f=
e039
