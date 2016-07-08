Return-Path: <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/arm: register clocks used by the hypervisor
To: Dirk Behme <dirk.behme@de.bosch.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org
References: <1467282752-14053-1-git-send-email-dirk.behme@de.bosch.com>
 <146776885213.35356.11565744417822933094@resonance>
 <20733b68-9529-bdb9-2a7d-576c8193f15c@de.bosch.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
From: Julien Grall <julien.grall@arm.com>
Message-ID: <577F73FB.1070302@arm.com>
Date: Fri, 8 Jul 2016 10:35:55 +0100
MIME-Version: 1.0
In-Reply-To: <20733b68-9529-bdb9-2a7d-576c8193f15c@de.bosch.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 08/07/16 07:48, Dirk Behme wrote:
>>>  #include <linux/cpuidle.h>
>>>  #include <linux/cpufreq.h>
>>>  #include <linux/cpu.h>
>>> @@ -444,6 +445,52 @@ static int __init xen_pm_init(void)
>>>  }
>>>  late_initcall(xen_pm_init);
>>>
>>> +/*
>>> + * Check if we want to register some clocks, that they
>>> + * are not freed because unused by clk_disable_unused().
>>> + * E.g. the serial console clock.
>>> + */
>>> +static int __init xen_arm_register_clks(void)
>>> +{
>>> +       struct clk *clk;
>>> +       struct device_node *xen_node;
>>> +       unsigned int i, count;
>>> +       int ret = 0;
>>> +
>>> +       xen_node = of_find_compatible_node(NULL, NULL, "xen,xen");
>>> +       if (!xen_node) {
>>> +               pr_err("Xen support was detected before, but it has
>>> disappeared\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       count = of_clk_get_parent_count(xen_node);
>>> +       if (!count)
>>> +               goto out;
>>> +
>>> +       for (i = 0; i < count; i++) {
>>> +               clk = of_clk_get(xen_node, i);
>>
>> Is there a struct device we can use here?
>
>
> It doesn't look so. Julien?

We don't have a struct device. Maybe we can create a dummy one if it 
simplifies the logic?

-- 
Julien Grall
