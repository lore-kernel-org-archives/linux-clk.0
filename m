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
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0f52c05a-4f70-3022-3720-07c6bcf29ed8@redhat.com>
Date: Mon, 27 Aug 2018 20:53:19 +0200
MIME-Version: 1.0
In-Reply-To: <153539565488.129321.2586881199420174235@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 27-08-18 20:47, Stephen Boyd wrote:
> Quoting Hans de Goede (2018-08-27 07:31:58)
>> On some boards a platform clock is used as clock for the r8169 chip,
>> this commit adds support for getting and enabling this clock (assuming
>> it has an "ether_clk" alias set on it).
>>
>> This is related to commit d31fd43c0f9a ("clk: x86: Do not gate clocks
>> enabled by the firmware") which is a previous attempt to fix this for some
>> x86 boards, but this causes all Cherry Trail SoC using boards to not reach
>> there lowest power states when suspending.
>>
>> This commit (together with an atom-pmc-clk driver commit adding the alias)
>> fixes things properly by making the r8169 get the clock and enable it when
>> it needs it.
>>
>> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=193891#c102
>> Cc: Johannes Stezenbach <js@sig21.net>
>> Cc: Carlo Caione <carlo@endlessm.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Thanks.

>> @@ -7614,6 +7616,11 @@ static void rtl_hw_initialize(struct rtl8169_private *tp)
>>          }
>>   }
>>   
>> +static void rtl_disable_clk(void *data)
>> +{
>> +       clk_disable_unprepare(data);
>> +}
>> +
>>   static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>>   {
>>          const struct rtl_cfg_info *cfg = rtl_cfg_infos + ent->driver_data;
>> @@ -7647,6 +7654,32 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>>          mii->reg_num_mask = 0x1f;
>>          mii->supports_gmii = cfg->has_gmii;
>>   
>> +       /* Get the *optional* external "ether_clk" used on some boards */
>> +       tp->clk = devm_clk_get(&pdev->dev, "ether_clk");
> 
> An "optional" clk API is in flight, but it's easier to wait for that to
> merge and then this to be updated, so just take that as an FYI.

That is good to know.

> It would
> be interesting to see how to support optional clks with clkdev lookup > though, which would be needed in this case.

Ack.

> How would you know that a clk device driver hasn't probed yet and isn't
> the driver that's actually providing the clk to this device on x86
> systems? With DT systems we can figure that out by looking at the DT and
> seeing if the device driver requesting the clk has the clocks property.
> On x86 systems it's all clkdev which doesn't really lend itself to
> solving this problem.

Right on x86 the assumption is that the clk driver will be builtin and
will probe before the consumer. In this case that is true as the
pmc-atom-clk driver can only be builtin and its platform device is
instantiated from the acpi_lpss code and acpi init happens before
the PCI bus is scanned.

We have the same problem with ACPI OpRegions and drivers who have
_PS0 / _PS3 methods using those OpRegions and the "solution" so far
is the same, make sure all drivers providing OpRegion handlers are
builtin.

Basically we (x86) miss the nice dependency info and complete hw
description devicetree gives, so we rely on initialization order
for some of this. I added the -EPROBE_DEFER handling for completeness
sake / for other platforms, as you point out it will never trigger
on x86.

Regards,

Hans




> 
>> +       if (IS_ERR(tp->clk)) {
>> +               rc = PTR_ERR(tp->clk);
