Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Subject: Re: [PATCH v4 4/6] bus: ti-sysc: Add support for software reset
To: Tony Lindgren <tony@atomide.com>
References: <20180705142319.19583-1-faiz_abbas@ti.com>
 <20180705142319.19583-5-faiz_abbas@ti.com>
 <20180705154758.GA112168@atomide.com>
 <cf8652a1-019c-d423-9b44-0d62006734f8@ti.com>
 <20180706103541.GC112168@atomide.com>
From: Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <46b0d881-e6ba-f314-e995-2848ab9fc429@ti.com>
Date: Fri, 6 Jul 2018 18:05:15 +0530
MIME-Version: 1.0
In-Reply-To: <20180706103541.GC112168@atomide.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, paul@pwsan.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com, robh+dt@kernel.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Friday 06 July 2018 04:05 PM, Tony Lindgren wrote:
> * Faiz Abbas <faiz_abbas@ti.com> [180706 10:05]:
>> Hi,
>>
>> On Thursday 05 July 2018 09:17 PM, Tony Lindgren wrote:
>>> * Faiz Abbas <faiz_abbas@ti.com> [180705 14:24]:
>>>> +static int sysc_reset(struct sysc *ddata)
>>>> +{
>>>> +	int offset = ddata->offsets[SYSC_SYSCONFIG];
>>>> +	int val = sysc_read(ddata, offset);
>>>
>>> Can you please just warn and return early for now if no
>>> syss_mask is specified? Otherwise we'll have mysterious
>>> errors if somebody leaves out "ti,hwmods" for module types
>>> we do not yet support reset for.
>>
>> RESET write to sysconfig can still happen even if there's no syss_mask
>> right? Not all modules need to poll on reset status.
> 
> It can but we currently don't have anything similar to
> srst_udelay like we have in _ocp_softreset(). And we don't
> currently have suport for sysc reset done bit.
> 
> So we want to warn and return error except in the known
> working case for now.
> 

Ok.

Thanks,
Faiz

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
