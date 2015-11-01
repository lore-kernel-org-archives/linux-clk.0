Return-Path: <robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20151030173738.GD17183@ulmo.nvidia.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-10-git-send-email-maxime.ripard@free-electrons.com>
 <CAL_JsqLuUUApGAgdw7U8EJ7p5yrYJg8AKFB32AE9Ufrf47=WpQ@mail.gmail.com> <20151030173738.GD17183@ulmo.nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 1 Nov 2015 08:28:59 -0600
Message-ID: <CAL_Jsq+viBYCzw_YvVu0zVbPFb8r42+ma-wBcw1bbyOKUTaEYg@mail.gmail.com>
Subject: Re: [PATCH 09/19] drm: sun4i: Add DT bindings documentation
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Oct 30, 2015 at 12:37 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Fri, Oct 30, 2015 at 11:40:03AM -0500, Rob Herring wrote:
>> On Fri, Oct 30, 2015 at 9:20 AM, Maxime Ripard
> [...]
>> > +Optional properties:
>> > +  - allwinner,tv-encoder: phandle to the TV Encoder in our pipeline
>> > +  - allwinner,panel: phandle to the panel used in our RGB interface
>>
>> Use of-graph please.
>
> Why? Panels are a really simple resource and a simple phandle is fully
> capable of describing the relationship.

So we can have some consistency in bindings and common parsing code.
It is simple when it is just a panel, but when it can be tv-encoder or
other board level downstream bridge devices it doesn't stay so simple.
Also, we already have a simple way to do panels which is as a child
node. Let's not have a third way.

Rob
