Return-Path: <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/arm: register clocks used by the hypervisor
To: Stefano Stabellini <sstabellini@kernel.org>,
 Dirk Behme <dirk.behme@de.bosch.com>
References: <1467282752-14053-1-git-send-email-dirk.behme@de.bosch.com>
 <alpine.DEB.2.10.1607051449370.2575@sstabellini-ThinkPad-X260>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland
 <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <577BBC1A.8020209@arm.com>
Date: Tue, 5 Jul 2016 14:54:34 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1607051449370.2575@sstabellini-ThinkPad-X260>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 05/07/16 14:53, Stefano Stabellini wrote:
> On Thu, 30 Jun 2016, Dirk Behme wrote:
>> +- clocks: one or more clocks to be registered.
>> +  Xen hypervisor drivers might replace native drivers, resulting in
>> +  clocks not registered by these native drivers. To avoid that these
>> +  unregistered clocks are disabled, then, e.g. by clk_disable_unused(),
>> +  register them in the hypervisor node.
>> +  An example for this are the clocks of the serial driver. If the clocks
>> +  used by the serial hardware interface are not registered by the serial
>> +  driver the serial output might stop once clk_disable_unused() is called.
>
> What if we use the "status" property of the clocks? Could we set it to
> "disabled" in Xen? Would that be enough for Linux to leave them alone?

clocks could be shared between multiple devices. So it is not possible 
to disable the clock.

-- 
Julien Grall
