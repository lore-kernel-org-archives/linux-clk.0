Return-Path: <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 03/12] irqchip: mtk-sysirq: prevent unnecessary
 visibility when set_type
To: Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
 <1489937193-2953-4-git-send-email-mars.cheng@mediatek.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang
 <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-clk@vger.kernel.org
From: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <4f74ffd9-279f-7516-f922-a5f2a6978fca@arm.com>
Date: Thu, 23 Mar 2017 16:13:16 +0000
MIME-Version: 1.0
In-Reply-To: <1489937193-2953-4-git-send-email-mars.cheng@mediatek.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 19/03/17 15:26, Mars Cheng wrote:
> This prevent unnecessary visibility when configuring trigger type
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
