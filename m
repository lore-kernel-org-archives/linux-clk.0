Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1fc17b7a14830306a83747b5086c0fd5d6dff290.1493812478.git-series.maxime.ripard@free-electrons.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <1fc17b7a14830306a83747b5086c0fd5d6dff290.1493812478.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 4 May 2017 11:28:47 +0800
Message-ID: <CAGb2v645io5TT21jhaRwCa0A4WeWAEG8W=6WKTpxNN-RvSFuDA@mail.gmail.com>
Subject: Re: [PATCH v2 8/20] clk: sunxi-ng: sun5i: Export video PLLs
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
	dri-devel <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 3, 2017 at 7:59 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The video PLLs are used directly by the HDMI controller. Export them so
> that we can use them in our DT node.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
