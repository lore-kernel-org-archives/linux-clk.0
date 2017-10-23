Return-Path: <fabrizio.castro@bp.renesas.com>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chris Paterson
	<Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 1/4] dt-bindings: display: rcar-du: Document R8A774[35] DU
Date: Mon, 23 Oct 2017 09:36:23 +0000
Message-ID: <TY1PR06MB08951ABE5C6936AE7D7DEACBC0460@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1507908142-13142-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1507908142-13142-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <4307810.tuXz3FVuBl@avalon>
In-Reply-To: <4307810.tuXz3FVuBl@avalon>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hello Laurent,

thank you for getting back to me.

>
> Hi Fabrizio,
>
> Thank you for the patch.
>
> On Friday, 13 October 2017 18:22:19 EEST Fabrizio Castro wrote:
> > Add device tree bindings for r8a7743 and r8a7745 DUs.
> > r8a7743 DU is similar to the one from r8a7791, r8a7745 DU is similar
> > to the one from r8a7794.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/display/renesas,du.txt     | 30 ++++++++++----=
-----
> >  1 file changed, 17 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> > b/Documentation/devicetree/bindings/display/renesas,du.txt index
> > 4bbd1e9..c520226 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > @@ -3,6 +3,8 @@
> >  Required Properties:
> >
> >    - compatible: must be one of the following.
> > +    - "renesas,du-r8a7743" for R8A7743 (RZ/G1M) compatible DU
> > +    - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
> >      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
> >      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
> >      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> > @@ -27,10 +29,10 @@ Required Properties:
> >    - clock-names: Name of the clocks. This property is model-dependent.
> >      - R8A7779 uses a single functional clock. The clock doesn't need t=
o be
> >        named.
> > -    - R8A779[0123456] use one functional clock per channel and one clo=
ck
> > per
> > -      LVDS encoder (if available). The functional clocks must be named
> > "du.x"
> > -      with "x" being the channel numerical index. The LVDS clocks must=
 be
> > -      named "lvds.x" with "x" being the LVDS encoder numerical index.
> > +    - R8A779[0123456] and R8A774[35] use one functional clock per chan=
nel
>
> How about "All other DU instances use one functional clock..." ? I expect=
 more
> entries to the added in the future, it would be nice not to have to modif=
y
> this paragraph.

I agree.

>
> > and
> > +      one clock per LVDS encoder (if available). The functional clocks=
 must
> > be
> > +      named "du.x" with "x" being the channel numerical index. The LVD=
S
> > clocks
> > +      must be named "lvds.x" with "x" being the LVDS encoder numerical
> > index.
> > - In addition to the functional and encoder clocks, all DU versions als=
o
> > support externally supplied pixel clocks. Those clocks are optional. Wh=
en
> > supplied they must be named "dclkin.x" with "x" being the input
> > @@ -49,16 +51,18 @@ bindings specified
> > in Documentation/devicetree/bindings/graph.txt. The following table lis=
ts
> > for each supported model the port number corresponding to each DU outpu=
t.
> >
> > -Port 0Port1Port2Port3
> > +                      Port0          Port1          Port2          Por=
t3
> >  ----------------------------------------------------------------------=
-----
> > -- - R8A7779 (H1)DPAD 0DPAD 1--
> > - R8A7790 (H2)DPADLVDS 0LVDS 1-
> > - R8A7791 (M2-W)DPADLVDS 0--
> > - R8A7792 (V2H)DPAD 0DPAD 1--
> > - R8A7793 (M2-N)DPADLVDS 0--
> > - R8A7794 (E2)DPAD 0DPAD 1--
> > - R8A7795 (H3)DPADHDMI 0HDMI 1LVDS
> > - R8A7796 (M3-W)DPADHDMILVDS-
> > + R8A7743 (RZ/G1M)     DPAD 0         LVDS 0         -              -
>
> When there's a single DPAD the table mentions "DPAD" instead of "DPAD 0".
> There's no specific reason for that other than a historical one, but to k=
eep
> entries consistent I would either keep doing so, or rename DPAD to DPAD 0=
 in
> all existing entries. What would you prefer ?

My personal preference is to number all of the entries (not just DPAD ones)=
.

>
> If you're fine with these changes there's no need to submit a new version=
, I
> can fix when applying the patch to my tree.

Thank you Laurent!

Best regards,
Fab

>
> > + R8A7745 (RZ/G1E)     DPAD 0         DPAD 1         -              -
> > + R8A7779 (R-Car H1)   DPAD 0         DPAD 1         -              -
> > + R8A7790 (R-Car H2)   DPAD           LVDS 0         LVDS 1         -
> > + R8A7791 (R-Car M2-W) DPAD           LVDS 0         -              -
> > + R8A7792 (R-Car V2H)  DPAD 0         DPAD 1         -              -
> > + R8A7793 (R-Car M2-N) DPAD           LVDS 0         -              -
> > + R8A7794 (R-Car E2)   DPAD 0         DPAD 1         -              -
> > + R8A7795 (R-Car H3)   DPAD           HDMI 0         HDMI 1         LVD=
S
> > + R8A7796 (R-Car M3-W) DPAD           HDMI           LVDS           -
> >
> >
> >  Example: R8A7795 (R-Car H3) ES2.0 DU
>
>
> --
> Regards,
>
> Laurent Pinchart




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
