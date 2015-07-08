Return-Path: <linux-kernel-owner@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Leo Yan <leo.yan@linaro.org>,
	"Jassi Brar" <jassisinghbrar@gmail.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20150707140424.GA12992@leoy-linaro>
Cc: "Russell King <linux@arm.linux.org.uk>, Linux Kernel Mailing List"
	<linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org
References: <20150706113355.GA6967@leoy-linaro>
 <CABb+yY1qjq_uXTb-S4GO7rugs1Wa9j_VpSb3=0rq1Zv+-t+u2Q@mail.gmail.com>
 <20150707140424.GA12992@leoy-linaro>
Message-ID: <20150708165429.9112.88891@quantum>
Subject: Re: Query: Clock driver requests mailbox channel
Date: Wed, 08 Jul 2015 09:54:29 -0700
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Cc'ing linux-clk and Stephen Boyd

Quoting Leo Yan (2015-07-07 07:04:25)
> On Tue, Jul 07, 2015 at 10:54:55AM +0530, Jassi Brar wrote:
> > On Mon, Jul 6, 2015 at 5:03 PM, Leo Yan <leo.yan@linaro.org> wrote:
> > > Hi all,
> > >
> > > i'm working with one clock driver, which will invoke mailbox API to
> > > request the mailbox channel and send message.
> > >
> > > Usually clock driver will init with devicetree, below is the example:
> > > CLK_OF_DECLARE(hi6220_clk_power, "hisilicon,hi6220-clock-power",
> > > hi6220_clk_power_init);
> > >
> > > Clock init function it will pass the pointer of struct device_node
> > > but not the pointer of struct device. So finally it's difficult to
> > > invoke mailbox API *mbox_request_channel()*, due it need use the
> > > struct device to search DT's property "mboxes".
> > >
> > > I want to find which is the best way to resolve this issue, so do you
> > > suggest clock driver to manually register one device? Or can we add
> > > one more API to request the mailbox channel directly with device_node?
> > >
> > IIUC, such clocks (that require platform resources) should be
> > populated from the platform_device's probe()?
> 
> Thanks for response, Jassi. If we use general platform_device's probe()
> function, then we can smoothly to get device poiner.
> 
> But if we use the method with CLK_OF_DECLARE, then i tried to get device
> pointer with the function of_find_device_by_node(), it will return the
> device pointer is NULL. But this is the common case in many clock drivers.

Using platform_device is the right approach. Stephen has been trying to
encourage use of that and discourage use of CLK_OF_DECLARE where
possible.

If your clock driver needs to register some early clocks then perhaps
those can be handled separately with CLK_OF_DECLARE and the rest can be
managed through a proper platform_driver?

> 
> So i just wander if can provide another mailbox API for this case,
> which will only need to pass device node pointer?

I can't comment on the mailbox API question, but I think the Right Thing
is to use a platform_driver for your clock driver, which would solve
your particular issue. This is something we are encouraging in Clock
Land ;)

Regards,
Mike

> 
> Thanks,
> Leo Yan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
