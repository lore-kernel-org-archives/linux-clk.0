Return-Path: <benh@kernel.crashing.org>
Message-ID: <1461832706.2791.0.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 03/11] doc/devicetree: Add Aspeed clock bindings
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Joel Stanley
	 <joel@jms.id.au>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Jeremy Kerr <jk@ozlabs.org>, mturquette@baylibre.com,
        sboyd@codeaurora.org, linux-clk@vger.kernel.org
Date: Thu, 28 Apr 2016 18:38:26 +1000
In-Reply-To: <4459295.XmBqACy0jk@diego>
References: <1461225849-28074-1-git-send-email-joel@jms.id.au>
	 <4956403.scaVRGhPEf@diego>
	 <CACPK8XfvLR+yZv77C0Eq=RsPOufrwvQjdPtBhnufNc=eJRLZYg@mail.gmail.com>
	 <4459295.XmBqACy0jk@diego>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2016-04-27 at 11:12 +0200, Heiko Stübner wrote:
> I guess the design would depend on the actual layout of your clock- /
> system-
> controller - aka what else is contained there.

One register controls most clocks so it makes sense to have one driver.

Cheers,
Ben.
