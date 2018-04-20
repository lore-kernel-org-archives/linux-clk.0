Return-Path: <matthias.bgg@gmail.com>
Return-Path: <matthias.bgg@gmail.com>
Subject: Re: [PATCH 4/8] clk: mediatek: mt2701-mm: switch to mfd device
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
 robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
 lee.jones@linaro.org, davem@davemloft.net, gregkh@linuxfoundation.org,
 mchehab@kernel.org, rdunlap@infradead.org, pi-cheng.chen@linaro.org,
 sean.wang@mediatek.com, linux-clk@vger.kernel.org, linux@armlinux.org.uk,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
References: <20171114214114.15793-1-mbrugger@suse.com>
 <20171114214114.15793-5-mbrugger@suse.com>
 <20171115001705.GJ11955@codeaurora.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e41d07ff-5870-1ec5-18fc-d89538529a8f@gmail.com>
Date: Fri, 20 Apr 2018 15:00:39 +0200
MIME-Version: 1.0
In-Reply-To: <20171115001705.GJ11955@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 11/15/2017 01:17 AM, Stephen Boyd wrote:
> On 11/14, Matthias Brugger wrote:
>> As the new mfd device is in place, switch probing
>> for the MMSYS to support invocation from the mfd device.
>>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> ---
> 
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> 

I did a minor change to this patch and patch 7/8 to get rid of mmsys_private
variable. Nevertheless I kept your Acked-by, as it only changes how we get the
device tree node.

Hope that's OK with you.

Regards,
Matthias
