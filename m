Return-Path: <hdegoede@redhat.com>
Return-Path: <hdegoede@redhat.com>
Subject: Re: [PATCH 2/4] r8169: Get and enable optional ether_clk clock
To: Stephen Boyd <sboyd@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Irina Tirdea
 <irina.tirdea@intel.com>, Michael Turquette <mturquette@baylibre.com>
Cc: netdev@vger.kernel.org, Johannes Stezenbach <js@sig21.net>,
 Carlo Caione <carlo@endlessm.com>, linux-clk@vger.kernel.org
References: <20180827143200.8597-1-hdegoede@redhat.com>
 <20180827143200.8597-3-hdegoede@redhat.com>
 <153539565488.129321.2586881199420174235@swboyd.mtv.corp.google.com>
 <0f52c05a-4f70-3022-3720-07c6bcf29ed8@redhat.com>
 <153539729389.129321.804899531283282568@swboyd.mtv.corp.google.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8a424470-9c57-9b95-9d41-3ea51d3f2629@redhat.com>
Date: Wed, 29 Aug 2018 19:09:57 +0200
MIME-Version: 1.0
In-Reply-To: <153539729389.129321.804899531283282568@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 27-08-18 21:14, Stephen Boyd wrote:
> Quoting Hans de Goede (2018-08-27 11:53:19)
>> On 27-08-18 20:47, Stephen Boyd wrote:
>>> How would you know that a clk device driver hasn't probed yet and isn't
>>> the driver that's actually providing the clk to this device on x86
>>> systems? With DT systems we can figure that out by looking at the DT and
>>> seeing if the device driver requesting the clk has the clocks property.
>>> On x86 systems it's all clkdev which doesn't really lend itself to
>>> solving this problem.
>>
>> Right on x86 the assumption is that the clk driver will be builtin and
>> will probe before the consumer. In this case that is true as the
>> pmc-atom-clk driver can only be builtin and its platform device is
>> instantiated from the acpi_lpss code and acpi init happens before
>> the PCI bus is scanned.
> 
> If we can go with this assumption then we can make the optional clk API
> work even on clkdev based systems. Maybe if x86 had some way of
> indicating that all builtin clks are registered?

Unfortunately there is no such thing I'm afraid.

> That might work but
> it's not very clean. Or if we could check to see if we're running on an
> ACPI based system in clkdev we could use that to assume that clk_get()
> will only be called after all providers have registered their lookups.

Yes some check for x86 + ACPI (ARM also uses ACPI, but there we
should no do this AFAICT) is probably best. That or not use the
new optional clk API on x86, but that means that any cross platform
driver cannot use it, which would be a pain.

BTW does your Acked-by indicate you are ok with merging this series
through the netdev tree as I suggested in the cover-letter? If so
can I also add your Acked-by to the 3th patch ?

Regards,

Hans
