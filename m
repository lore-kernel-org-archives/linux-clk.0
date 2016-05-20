Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:48186 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932526AbcETJjG (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2016 05:39:06 -0400
Date: Fri, 20 May 2016 11:38:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mickael GARDET <m.gardet@overkiz.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>,
	linux-clk@vger.kernel.org
Subject: Re: at91 slow clock with an external crystal (on Atmel SAM9G25)
Message-ID: <20160520113846.5df0be05@bbrezillon>
In-Reply-To: <9cf2f9be-7f76-ca65-f2cf-ca0d20de6d2f@overkiz.com>
References: <9cf2f9be-7f76-ca65-f2cf-ca0d20de6d2f@overkiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

+ Atmel and clk maintainers.

Hi Mickael,

Please use get_maintainer.pl (or the MAINTAINERS file) to find people
you should send your questions too

On Wed, 18 May 2016 10:04:35 +0200
Mickael GARDET <m.gardet@overkiz.com> wrote:

> Hi,
> 
> I have one question about usage of slow clock with an external crystal 
> (on Atmel SAM9G25).
> 
> All work fine If I set CONFIG_SCLK=y in at91bootstrap but we wouldn't 
> update at91bootstrap.

Yes, the 'external crystal'/'internal RC osc' selection is currently
done in at91bootstrap, and Linux just use what has been configured by
the bootstrap.

> 
> If I force usage of external crystal (like this [1]) it work 
> for me but what's the recommended way to do this ?

I'd rather see something more generic for mainline, but you can keep it
in your own tree ;).

IMHO, the proper solution would be to add a min_accuracy field in
struct clk_rate_request (and a clk_set_min_accuracy() helper), implement
->determine_rate() in clk-slow.c to find the parent matching this
constraint, and patch all users of the slow clk to set this constraint
to something appropriate (100ppm ?).

At least, slow clock users should check if the accuracy provided by the
slow clock match what they expect and complain if it's not the case
(it's already doable thanks to the clk_get_accuracy() function).

Best Regards,

Boris

> [1]http://code.bulix.org/kpzu92-98883


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
