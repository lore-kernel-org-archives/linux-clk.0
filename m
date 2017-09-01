Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 1 Sep 2017 09:32:58 -0500
From: Rob Herring <robh@kernel.org>
To: Romain Perier <romain.perier@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/4] nvmem: rockchip: add support for RK3368
Message-ID: <20170901143258.ccto72dhc5hd34ou@rob-hp-laptop>
References: <20170828121604.15968-1-romain.perier@collabora.com>
 <20170828121604.15968-4-romain.perier@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170828121604.15968-4-romain.perier@collabora.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 28, 2017 at 02:16:03PM +0200, Romain Perier wrote:
> This adds the necessary functions and data for handling support on RK3368
> SoCs.
> 
> Signed-off-by: Romain Perier <romain.perier@collabora.com>
> ---
>  .../devicetree/bindings/nvmem/rockchip-efuse.txt   |  1 +

For the binding only:

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/nvmem/rockchip-efuse.c                     | 80 ++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
