Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Feb 2016 09:11:05 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Kevin Smith <kevin.smith@elecsyscorp.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Gregory CLEMENT" <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v3 1/2] clk: mvebu: Remove corediv clock from Armada XP
Message-ID: <20160218091105.4a272bf9@free-electrons.com>
In-Reply-To: <20160218011630.2278.67415@quark.deferred.io>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455209620-6125-1-git-send-email-kevin.smith@elecsyscorp.com>
	<20160218011630.2278.67415@quark.deferred.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Wed, 17 Feb 2016 17:16:30 -0800, Michael Turquette wrote:
> Quoting Kevin Smith (2016-02-11 08:53:52)
> > There is no corediv clock on Armada XP, so this is unnecessary.
> > 
> > Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Acked-by: Michael Turquette <mturquette@baylibre.com>
> 
> I'm fine to take both patches through the clk tree, or to have them go
> through arm-soc. Let me know if you have a preference.

I'll let Gregory Clement answer on this one. Since there is no build
dependency with the stuff planned in arm-soc, I believe it's fine if
you take them, but I'll let Greg give you the final answer since he is
taking care of the mvebu stuff going to arm-soc.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
