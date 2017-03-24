Return-Path: <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: mediatek: multiple bases support
 for sysirq
To: Rob Herring <robh@kernel.org>, Mars Cheng <mars.cheng@mediatek.com>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
 <1489937193-2953-2-git-send-email-mars.cheng@mediatek.com>
 <20170324152001.nmzivwtietre27iq@rob-hp-laptop>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, CC Hwang <cc.hwang@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Jades Shih <jades.shih@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang
 <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-clk@vger.kernel.org
From: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <97d965b5-7dc0-ead7-441c-d5bbe9921129@arm.com>
Date: Fri, 24 Mar 2017 15:58:41 +0000
MIME-Version: 1.0
In-Reply-To: <20170324152001.nmzivwtietre27iq@rob-hp-laptop>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 24/03/17 15:20, Rob Herring wrote:
> On Sun, Mar 19, 2017 at 11:26:22PM +0800, Mars Cheng wrote:
>> This describes how to specify multiple base addresses for sysirq
>> in mediatek platforms.
>>
>> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
>> ---
>>  .../interrupt-controller/mediatek,sysirq.txt       |   11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Thanks Rob. I've queued patches 1-3 for 4.12.

Cheers,

	M.
-- 
Jazz is not dead. It just smells funny...
