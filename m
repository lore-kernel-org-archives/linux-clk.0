Return-Path: <yorksun@freescale.com>
Subject: Re: [Resend Patch v6] driver/clk/clk-si5338: Add common clock
 framework driver for si5338
To: Stephen Boyd <sboyd@codeaurora.org>
References: <20151010000948.GW26883@codeaurora.org>
 <562165C3.1090103@freescale.com> <20151016213139.GE16437@codeaurora.org>
 <56216E0D.4010709@freescale.com> <20151016230555.GE10182@codeaurora.org>
 <562553E4.30906@freescale.com> <20151019234348.GE19782@codeaurora.org>
 <CY1PR03MB14694C6FFC8BA80C08EB039ABE390@CY1PR03MB1469.namprd03.prod.outlook.com>
 <20151020003604.GF19782@codeaurora.org> <562598AE.2000600@freescale.com>
 <20151020174904.GG19782@codeaurora.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"pmarrecas@outlook.com" <pmarrecas@outlook.com>, Mike Turquette
	<mturquette@baylibre.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
	"Andrey Filippov" <andrey@elphel.com>, Paul Bolle <pebolle@tiscali.nl>
From: York Sun <yorksun@freescale.com>
Message-ID: <5626DB8E.3040909@freescale.com>
Date: Tue, 20 Oct 2015 17:25:50 -0700
MIME-Version: 1.0
In-Reply-To: <20151020174904.GG19782@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Return-Path: yorksun@freescale.com
List-ID: <linux-clk.vger.kernel.org>



On 10/20/2015 10:49 AM, Stephen Boyd wrote:
> On 10/19, York Sun wrote:
>>
>>
>> On 10/19/2015 05:36 PM, Stephen Boyd wrote:
>>> On 10/20, York Sun wrote:
>>>>
>>>> You can see, when the fixed-rate clock is registered, the device id of si5338 is unknown yet. (I am using one 25MHz clock to feed multiple si5338, where maybe I should create multiple 25MHz clocks, but that's another discussion.)
>>>>
>>>> I hope I have made it clear.
>>>
>>> Yes. It would be great if we could modify the i2c framework to
>>> let us create an i2c device but not call device_register() until a later
>>> time. So something like this could be done in the platform
>>> driver:
>>>
>>> 	for (i = 0; i < NUM_SI5338_CHIPS; i++) {
>>> 	     adap = i2c_get_adapter(private->i2c_adp->nr + 1 + i);
>>> 	     private->i2c_client[i] = i2c_new_device_unregistered(adap,
>>> 	     				&si5338_info[i], i2c_si5338_addr);
>>> 	     clkdev_create(clk, NULL, dev_name(private->i2c_client[i]->dev));
>>> 	     device_register(private->i2c_client[i]->dev);
>>> 	}
>>>
>>> Then in the si5338 driver we call devm_clk_get(i2c->dev, NULL)
>>> and we get the xtal clock.
>>>
>>
>> Then what do we do before we have this i2c_new_device_unregistered()? Does my
>> proposal make sense?
> 
> There's nothing to do before we make this new API. Make a patch
> to add the new API, and then use it in the pcie driver. Your
> proposal makes sense, but it isn't necessary or desirable.
> 

Stephen,

I am making progress on this direction, but need your guidance on one matter.

When device tree is used, devm_clk_get() generates a pr_err if the clock doesn't
exist. For si5338, it can have one/two/three/four parent clocks. Missing some
clocks shouldn't be treated as an error. It works but the message is confusing
and annoying. I am thinking to add flags to mark unused clocks when parsing
device tree. Please let me know if it is a bad idea.

York
