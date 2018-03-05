Return-Path: <joonas.kylmala@iki.fi>
Subject: Re: [linux-sunxi] [PATCH v3 15/16] ARM: dts: sun8i: h3: Enable HDMI
 output on H3 boards
To: jernej.skrabec@siol.net
Cc: maxime.ripard@free-electrons.com, wens@csie.org, airlied@linux.ie,
 robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
 sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-sunxi@googlegroups.com
References: <20180301213442.16677-1-jernej.skrabec@siol.net>
 <20180301213442.16677-16-jernej.skrabec@siol.net>
From: =?UTF-8?Q?Joonas_Kylm=c3=a4l=c3=a4?= <joonas.kylmala@iki.fi>
Message-ID: <57afe052-9a8c-f63b-ee43-5bad8cd1d193@iki.fi>
Date: Mon, 05 Mar 2018 15:27:00 +0000
MIME-Version: 1.0
In-Reply-To: <20180301213442.16677-16-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Jernej Skrabec:
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint = <&hdmi_con_in>;
> +	};
> +};

This node is added to all the DTS files you enabled HDMI on. Is it
something that could be instead put to the DTSI file?

Joonas
