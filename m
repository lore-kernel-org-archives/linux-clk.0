Return-Path: <van.freenix@gmail.com>
Return-Path: <van.freenix@gmail.com>
Date: Tue, 19 Jan 2016 09:18:08 +0800
From: Peng Fan <van.freenix@gmail.com>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Ian Campbell <ian.campbell@citrix.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Julien Grall <julien.grall@citrix.com>,
	David Vrabel <david.vrabel@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-clk@vger.kernel.org
Subject: Re: [Xen-devel] [RFC/WIP] xen: clk: introudce pvclk for device
 passthrough
Message-ID: <20160119011806.GA12932@linux-7smt.suse>
References: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
 <CAFLBxZa9W6At5M_fFy17u__C_AGHRAdYHebOzymnb1su715jzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAFLBxZa9W6At5M_fFy17u__C_AGHRAdYHebOzymnb1su715jzA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hello George,

On Mon, Jan 18, 2016 at 11:22:44AM +0000, George Dunlap wrote:
>On Sat, Jan 16, 2016 at 5:22 AM, Peng Fan <van.freenix@gmail.com> wrote:
>> This patch was just a initial patch, not sure whether this way
>> is ok from you side for handlding clk when doing platform device
>> passhthrough. Any comments are appreciated, and your comments may
>> give me a better direction.
>
>Hey Peng,
>
>Just speaking from the perspective of a Xen dev who's not an ARM dev:
>a few more words on the relationship between pvclk and
>device-passthrough would be helpful to set the context.  It sounds
>like:
>
>* On ARM, passing through a device requires a clocksource (at least
>for many devices)
>
>* dom0 has the hardware clocksource, but at the moment domUs don't
>have a suitable clocksource
>
>* This patch implements pvclk front/backend suitable for such devices
>
>Is that right?  In which case something like the following would be helpful:

Yeah. right. You have a better explaination than me :)

>
>"This patch introduces pvclk, a paravirtualized clock source suitable
>for devices to use when passing through to domUs on ARM systems."
>
>(Obviously change it as necessary to make it accurate.)

I'll add your words into the commit log.

Thanks,
Peng.

>
>Thanks,
> -George
