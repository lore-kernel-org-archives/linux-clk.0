Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <a766ed0410e4c78e49f1e462775fdba1a70a88bf.1495006350.git-series.maxime.ripard@free-electrons.com>
References: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
 <a766ed0410e4c78e49f1e462775fdba1a70a88bf.1495006350.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 17 May 2017 17:00:02 +0800
Message-ID: <CAGb2v66Cxb84sRoESWQbqDxpTVAVFd0vFcKz+DB2TKD83Aw1JA@mail.gmail.com>
Subject: Re: [PATCH v3 15/21] drm/sun4i: Ignore the generic connectors for components
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 17, 2017 at 3:40 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The generic connectors such as hdmi-connector doesn't have any driver in,
> so if they are added to the component list, we will be waiting forever for
> a non-existing driver to probe.
>
> Add a list of the connectors we want to ignore when building our component
> list.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
