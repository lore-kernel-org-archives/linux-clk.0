Return-Path: <matthias.bgg@gmail.com>
Return-Path: <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/8] mfd: mtk-mmsys: Add mmsys driver
To: CK Hu <ck.hu@mediatek.com>
Cc: ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com,
 p.zabel@pengutronix.de, airlied@linux.ie, robh+dt@kernel.org,
 mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org,
 lee.jones@linaro.org, davem@davemloft.net, gregkh@linuxfoundation.org,
 mchehab@kernel.org, rdunlap@infradead.org, pi-cheng.chen@linaro.org,
 sean.wang@mediatek.com, linux-clk@vger.kernel.org, linux@armlinux.org.uk,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
References: <20171114214114.15793-1-mbrugger@suse.com>
 <20171114214114.15793-3-mbrugger@suse.com>
 <1511427867.8489.9.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f65015fa-7103-30bc-2660-7401037f7e12@gmail.com>
Date: Thu, 23 Nov 2017 19:37:12 +0100
MIME-Version: 1.0
In-Reply-To: <1511427867.8489.9.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 11/23/2017 10:04 AM, CK Hu wrote:

>> +static const struct of_device_id of_match_mmsys[] = {
>> +	{ .compatible = "mediatek,mt2701-mmsys",
> 
> Because this driver replace the original "mediatek,mt2701-mmsys" driver,
> could you modify the binding document of "mediatek,mt2701-mmsys" [1]?
> 
> [1]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> 

Well we are actually no replacing the compatible but keeping it. But yes, the
documentation should be updated.

Apart right now we have the definition twice. The other location is here:
Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt

Regards,
Matthias
