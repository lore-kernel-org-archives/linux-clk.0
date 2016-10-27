Return-Path: <irina.tirdea@intel.com>
From: "Tirdea, Irina" <irina.tirdea@intel.com>
To: Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "x86@kernel.org"
	<x86@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Ingo Molnar
	<mingo@redhat.com>, Michael Turquette <mturquette@baylibre.com>, "H. Peter
 Anvin" <hpa@zytor.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>, Takashi Iwai
	<tiwai@suse.com>, "Bossart, Pierre-louis" <pierre-louis.bossart@intel.com>,
	LKML <linux-kernel@vger.kernel.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>
Subject: RE: [RESEND PATCH v4] clk: x86: Add Atom PMC platform clocks
Date: Thu, 27 Oct 2016 13:50:02 +0000
Message-ID: <1F3AC3675D538145B1661F571FE1805F2F38B3E2@irsmsx105.ger.corp.intel.com>
References: <1476735320-4315-1-git-send-email-irina.tirdea@intel.com>
 <alpine.DEB.2.20.1610202349200.4938@nanos>
 <20161021045932.GA90338@f23x64.localdomain>
 <1F3AC3675D538145B1661F571FE1805F2F387575@irsmsx105.ger.corp.intel.com>
 <20161026213323.GB23374@f23x64.localdomain>
 <alpine.DEB.2.20.1610262341020.5013@nanos>
 <20161026220212.GA24422@f23x64.localdomain>
In-Reply-To: <20161026220212.GA24422@f23x64.localdomain>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Darren Hart wrote:
> On Wed, Oct 26, 2016 at 11:43:24PM +0200, Thomas Gleixner wrote:
> > On Wed, 26 Oct 2016, Darren Hart wrote:
> > > On Mon, Oct 24, 2016 at 01:38:54PM +0000, Tirdea, Irina wrote:
> > > > intel_pmc_* drivers or is it enough to move it as a standalone
> > > > driver for now?
> > >=20
> > > If the functionality is substantially different, then I don't see a
> > > compelling, and certainly not an immediate, need to merge them.
> > > Assume for now they are to remain as separate drivers. I suggest
> > > keeping the existing name for now as well. Let's just complete the
> > > move with as little user-visible changes as possible.
> > >=20
> > > The placement of the header file is a bit tricky as it is being used
> > > in drivers/clk/x86 in addition to the pmc_atom driver in
> > > drivers/platform/x86.
> > >=20
> > > The best existing location would appear to be include/platform_data/
> > >=20
> > > Thomas, is that acceptable to you?
> >=20
> > Yes
> >=20
> > > arch/x86/platform/atom/pmc_atom.c -> drivers/platform/x86
> > > arch/x86/include/asm/pmc_atom.h -> include/platform_data/
> > >=20
> > > If there are enough of these, it might make sense to create:
> > >=20
> > > include/platform/x86/
> > >=20
> > > but I suggest we start with minimal change.
> >=20
> > No. Make that x86 directory right away. include/platform_data is
> > already a maze of 224 files. Start structuring it now.
>=20
> OK, that's fine with me too.
>=20
> (but I typo'd, should have been: include/linux/platform_data/x86)
>=20
> Irina, does this give you enough to go on?
>=20

Yes, everything is clear now. I will make the change and send a patch
in a few days.

Thanks,
Irina
