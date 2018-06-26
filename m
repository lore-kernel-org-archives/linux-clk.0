Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
References: <cover.1524820923.git.mbrugger@suse.com> <64ca273429d92f581568a48f3efe6035af65f579.1524820923.git.mbrugger@suse.com>
 <20180430103029.GD5147@dell> <4ead47f6-2f69-2afa-bfcc-a240a9845dc4@gmail.com>
In-Reply-To: <4ead47f6-2f69-2afa-bfcc-a240a9845dc4@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 26 Jun 2018 12:32:54 -0600
Message-ID: <CAL_Jsq+TTsgCeFeSXYdF1e8MyrOmmFvnR7ZwyQzv+FYK1G5R6w@mail.gmail.com>
Subject: Re: [v3 01/10] dt-bindings: mediatek: mmsys: Add support for mfd
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, matthias.bgg@kernel.org,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, CK Hu <ck.hu@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, David Miller <davem@davemloft.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, Sean Wang <sean.wang@mediatek.com>,
	linux-clk <linux-clk@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 25, 2018 at 9:39 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 30/04/18 12:30, Lee Jones wrote:
> > On Fri, 27 Apr 2018, matthias.bgg@kernel.org wrote:
> >
> >> From: Matthias Brugger <mbrugger@suse.com>
> >>
> >> Add binding description for the mmsys mfd for some Mediatek
> >> devices. mmsys has some registers to control clock gates (which is
> >> used in the clk driver) and some registers to set the routing and enable
> >> the differnet blocks of the display subsystem.
> >>
> >> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> >> ---
> >>  .../bindings/arm/mediatek/mediatek,mmsys.txt       |  2 --
> >>  .../bindings/display/mediatek/mediatek,disp.txt    |  2 +-
> >>  .../devicetree/bindings/mfd/mediatek,mmsys.txt     | 27 ++++++++++++++++++++++
> >>  3 files changed, 28 insertions(+), 3 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mmsys.txt

Please CC DT list on bindings.

Rob
