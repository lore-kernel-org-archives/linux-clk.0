Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1452785109-6172-13-git-send-email-maxime.ripard@free-electrons.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-13-git-send-email-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 17 Jan 2016 01:12:37 +0800
Message-ID: <CAGb2v64Ae0bUgFZ2q21-n67sUNFfMtxruMiEE1R18xw+Lp-Gqw@mail.gmail.com>
Subject: Re: [PATCH v2 12/26] ARM: sun5i: Add TV encoder gate to the DTSI
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>, Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 14, 2016 at 11:24 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> It turns out that the A13 / R8 also have a tve encoder block, and a gate
> for it.
>
> Add it to the DT.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  arch/arm/boot/dts/sun5i-a13.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

[...]
