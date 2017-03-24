Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 24 Mar 2017 10:20:01 -0500
From: Rob Herring <robh@kernel.org>
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	CC Hwang <cc.hwang@mediatek.com>,
	Loda Chou <loda.chou@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Jades Shih <jades.shih@mediatek.com>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	wsd_upstream@mediatek.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: mediatek: multiple bases support
 for sysirq
Message-ID: <20170324152001.nmzivwtietre27iq@rob-hp-laptop>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
 <1489937193-2953-2-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1489937193-2953-2-git-send-email-mars.cheng@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Mar 19, 2017 at 11:26:22PM +0800, Mars Cheng wrote:
> This describes how to specify multiple base addresses for sysirq
> in mediatek platforms.
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  .../interrupt-controller/mediatek,sysirq.txt       |   11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
