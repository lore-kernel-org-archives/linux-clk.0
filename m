Return-Path: <dunlapg@gmail.com>
MIME-Version: 1.0
Sender: dunlapg@gmail.com
In-Reply-To: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
References: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
Date: Mon, 18 Jan 2016 11:22:44 +0000
Message-ID: <CAFLBxZa9W6At5M_fFy17u__C_AGHRAdYHebOzymnb1su715jzA@mail.gmail.com>
Subject: Re: [Xen-devel] [RFC/WIP] xen: clk: introudce pvclk for device passthrough
From: George Dunlap <George.Dunlap@eu.citrix.com>
To: Peng Fan <van.freenix@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>, Ian Campbell <ian.campbell@citrix.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Julien Grall <julien.grall@citrix.com>, David Vrabel <david.vrabel@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jan 16, 2016 at 5:22 AM, Peng Fan <van.freenix@gmail.com> wrote:
> This patch was just a initial patch, not sure whether this way
> is ok from you side for handlding clk when doing platform device
> passhthrough. Any comments are appreciated, and your comments may
> give me a better direction.

Hey Peng,

Just speaking from the perspective of a Xen dev who's not an ARM dev:
a few more words on the relationship between pvclk and
device-passthrough would be helpful to set the context.  It sounds
like:

* On ARM, passing through a device requires a clocksource (at least
for many devices)

* dom0 has the hardware clocksource, but at the moment domUs don't
have a suitable clocksource

* This patch implements pvclk front/backend suitable for such devices

Is that right?  In which case something like the following would be helpful:

"This patch introduces pvclk, a paravirtualized clock source suitable
for devices to use when passing through to domUs on ARM systems."

(Obviously change it as necessary to make it accurate.)

Thanks,
 -George
