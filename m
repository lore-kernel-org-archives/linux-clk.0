Return-Path: <sudeepholla.maillist@gmail.com>
MIME-Version: 1.0
Sender: sudeepholla.maillist@gmail.com
In-Reply-To: <5628AA99.1000000@arm.com>
References: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
	<1445460100-26727-6-git-send-email-Julia.Lawall@lip6.fr>
	<5628AA99.1000000@arm.com>
Date: Thu, 26 Nov 2015 17:29:27 +0000
Message-ID: <CAPKp9uZH71gzAhhbuk-tGOxrQ3jXS1Ot4NpTW7Jx5nhrwi7bfg@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: scpi: add missing of_node_put
From: Sudeep Holla <sudeep.holla@arm.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>,
	Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike/Stephen,

On Thu, Oct 22, 2015 at 10:21 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> Thanks for the fix.
>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>
> PS: Since this driver is queued via arm-soc, it needs to go via them or
> wait for v4.4-rc1 and then queue via clk tree.
>

Now that the driver is in mainline, can you take this fix via clk tree for
you next -rc fixes ?

Regards,
Sudeep
