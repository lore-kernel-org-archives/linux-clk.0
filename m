Return-Path: <sudeep.holla@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: ACPI support in common clock framework
To: Stephen Boyd <sboyd@kernel.org>,
 Srinath Mannam <srinath.mannam@broadcom.com>
References: <CABe79T6zQ_7Ycws5b=xaQ3edpVn1QPQyWd9p24eqLGpYbdtt0A@mail.gmail.com>
 <CAHp75VdSW1po7fVv+A6ATTU7CkN-4nQ1haQSCq7b_+ZR9tNXCQ@mail.gmail.com>
 <CAJZ5v0iJcTg=X_j-4nap9d_H4jq2rwOETT8Sukx6UL5UsDKjgA@mail.gmail.com>
 <152908459103.16708.4012421602830600322@swboyd.mtv.corp.google.com>
 <CAJZ5v0gA76NwwgRnuztY+dUOKXS+__-7Ghw7Azb-84h_eMRt4w@mail.gmail.com>
 <152994466823.143105.11787470853817181844@swboyd.mtv.corp.google.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <914341e7-ca94-054d-6127-522b745006b4@arm.com>
Date: Mon, 25 Jun 2018 18:15:45 +0100
MIME-Version: 1.0
In-Reply-To: <152994466823.143105.11787470853817181844@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 25/06/18 17:37, Stephen Boyd wrote:
> Quoting Rafael J. Wysocki (2018-06-16 08:50:18)
>> On Fri, Jun 15, 2018 at 7:43 PM, Stephen Boyd <sboyd@kernel.org> wrote:
>>>
>>> Is this for clk_enable/disable? What about clk_set_rate() or
>>> clk_set_phase()? Is ACPI's AML taking care of that?
>>
>> That's for clk_enable/disable AFAICS.
>>
>> AML doesn't manage device performance states at all.
> 
> Alright. We may need to add a better way for device drivers to get
> handles to clk pointers on ACPI firmware so they can change frequencies
> or phase, etc. 

Is there any specific usecase/device needing this in the kernel ? SPI
slaves ?

> Right now it's all through clkdev and it looks to be
> mostly based on string matching of connection names instead of
> associating clks with devices.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-acpi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Regards,
Sudeep
