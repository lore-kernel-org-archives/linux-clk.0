Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 13 Jan 2017 10:41:04 -0600
From: Rob Herring <robh@kernel.org>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: heiko@sntech.de, dianders@google.com,
	linux-rockchip@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: clk: add rockchip,grf property for
 RK3399
Message-ID: <20170113164104.2nneuzklorcrdekl@rob-hp-laptop>
References: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
 <1484028930-20305-3-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1484028930-20305-3-git-send-email-zhengxing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 10, 2017 at 02:15:30PM +0800, Xing Zheng wrote:
> Add support for rockchip,grf property which is used for GRF muxes
> on RK3399.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
> 
> Changes in v4:
> - update the decription for rockchip,grf property
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
