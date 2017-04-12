Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kevin Hilman <khilman@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <149181015787.91618.7461737194577750243@resonance>
Cc: linux-clk@vger.kernel.org,  linux-amlogic@lists.infradead.org
References: <m2o9wb7oho.fsf@baylibre.com>
 <149181015787.91618.7461737194577750243@resonance>
Message-ID: <149200138297.88277.9296054276836015367@resonance>
Subject: Re: [GIT PULL] Amlogic clock driver updates for v4.12
Date: Wed, 12 Apr 2017 14:49:42 +0200
List-ID: <linux-clk.vger.kernel.org>

Quoting Michael Turquette (2017-04-10 09:42:37)
> Quoting Kevin Hilman (2017-04-05 01:16:19)
> > Steven, Mike,
> > =

> > Below is a request to pull the full set of Amlogic clock changes for
> > v4.12.  Note that this includes the previous pull for headers, but I
> > wanted to send them separately for completness, and so there's an
> > obvious tag to use as a dependency source for our DT changes.
> =

> Pulled.

As we discussed, your PR included commits that I had already merged into
the clk-meson stable branch and I have resolved this by dropping
clk-meson from the clk tree. This PR is now merged into the clk tree
without duplicated commits.

Thanks,
Mike

> =

> Regards,
> Mike
> =

> > =

> > Thanks,
> > =

> > Kevin
> > =

> > =

> > The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d=
9201:
> > =

> >   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> > =

> > are available in the git repository at:
> > =

> >   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.g=
it tags/amlogic-clk
> > =

> > for you to fetch changes up to 3a429818a2e48928ae0114df5fb3b0612dd57001:
> > =

> >   Merge branch 'v4.12/clk-drivers' into v4.12/clk (2017-04-04 15:58:11 =
-0700)
> > =

> > ----------------------------------------------------------------
> > Amlogic clock driver updates for v4.12
> > - meson8: add some new PLLs
> > - new clocks for Mali
> > - misc fixes.
> > =

> > ----------------------------------------------------------------
> > Jerome Brunet (9):
> >       clk: meson: fix SET_PARM macro
> >       clk: meson: add missing const qualifiers on gate arrays
> >       clk: meson8b: put dividers and muxes in tables
> >       clk: gxbb: put dividers and muxes in tables
> >       clk: meson: mpll: add rw operation
> >       clk: meson: gxbb: mpll: use rw operation
> >       clk: meson8b: add the mplls clocks 0, 1 and 2
> >       clk: meson: mpll: correct N2 maximum value
> >       dt-bindings: clk: gxbb: expose i2s output clock gates
> > =

> > Kevin Hilman (1):
> >       Merge branch 'v4.12/clk-drivers' into v4.12/clk
> > =

> > Neil Armstrong (7):
> >       clk: meson-gxbb: Add MALI clock IDS
> >       clk: meson-gxbb: Expose GP0 dt-bindings clock id
> >       dt-bindings: clock: gxbb-clkc: Add GXL compatible variant
> >       clk: meson-gxbb: Add MALI clocks
> >       clk: meson: Add support for parameters for specific PLLs
> >       clk: meson-gxbb: Add GP0 PLL init parameters
> >       clk: meson-gxbb: Add GXL/GXM GP0 Variant
> > =

> >  Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt |   3 +-
> >  drivers/clk/meson/clk-mpll.c                                  | 152 ++=
++++++++++++-
> >  drivers/clk/meson/clk-pll.c                                   |  53 ++=
+++-
> >  drivers/clk/meson/clkc.h                                      |  29 ++-
> >  drivers/clk/meson/gxbb.c                                      | 505 ++=
++++++++++++++++++++++++++++++++++++++++++++----
> >  drivers/clk/meson/gxbb.h                                      |  23 ++-
> >  drivers/clk/meson/meson8b.c                                   | 127 ++=
++++++++++-
> >  drivers/clk/meson/meson8b.h                                   |  20 +-
> >  include/dt-bindings/clock/gxbb-clkc.h                         |  11 ++
> >  9 files changed, 867 insertions(+), 56 deletions(-)
> >=20
