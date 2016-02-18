Return-Path: <robh@kernel.org>
Date: Thu, 18 Feb 2016 08:35:48 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Jens Kuske <jenskuske@gmail.com>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/8] DT: clk: sunxi: add binding doc for the
 multi-bus-gates clock
Message-ID: <20160218143548.GD9654@rob-hp-laptop>
References: <1455709440-8668-1-git-send-email-andre.przywara@arm.com>
 <1455709440-8668-4-git-send-email-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455709440-8668-4-git-send-email-andre.przywara@arm.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 17, 2016 at 11:43:55AM +0000, Andre Przywara wrote:
> Recent Allwinner SoCs introduced a bus gates clock which can have
> different parents for individual gates.
> For the time being we encoded this relation in the driver.
> This commit specifies a new binding which allows to encode this in
> the DT by using a child node for each parent clock used. This allows
> to specify any kind of relation efficiently and also keeps the very
> same kernel driver for all SoCs at the same time.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Whether this makes sense or not for sunxi, I don't know. But for the 
binding:

Acked-by: Rob Herring <robh@kernel.org>
