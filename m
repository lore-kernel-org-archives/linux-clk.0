Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Raman Banka <raman.k2@samsung.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1528105245-26623-1-git-send-email-raman.k2@samsung.com>
Cc: alim.akhtar@samsung.com, shaik.ameer@samsung.com, m.szyprowski@samsung.com,
 krzk@kernel.org, s.nawrocki@samsung.com
References: <CGME20180604095335epcas2p4131d5a7ea0c6091c3e2f17bd98847efa@epcas2p4.samsung.com>
 <1528105245-26623-1-git-send-email-raman.k2@samsung.com>
Message-ID: <153029668040.143105.2059491089047180792@swboyd.mtv.corp.google.com>
Subject: Re: [RFC PATCH] Add more debugfs features in CCF.
Date: Fri, 29 Jun 2018 11:24:40 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Raman Banka (2018-06-04 02:40:45)
> Currently there is a directory hierarchy in debugfs for visualizing the
> clk tree structure. Each clock has a directory in debugfs which contains
> read-only members that export information specific to that clk node:
> clk_rate,clk_flags, clk_prepare_count, clk_enable_count &
> clk_notifier_count.
> =

> Change the member clk_rate from read-only to read-write,
> writing some other rate to clk_rate calls clk_core_set_rate()
> of the corresponding clock.
> =

> Change the member clk_prepare_count from read_only to read_write,
> writing to which calls clk_core_prepare() or clk_core_unprepare()
> of the corresponding clock depending on the value written.
> =

> Change the member clk_enable_count from read_only to read_write,
> writing to which calls clk_core_enable() or clk_core_disable()
> of the corresponding clock depending on the value written.
> =

> Add a new read-write member named clk_parent reading which exports
> the name of the parent clock and writing a different name for parent
> clock searches for that clock and calls clk_core_set_parent_nolock().
> =

> Signed-off-by: Raman Banka <raman.k2@samsung.com>
> ---
>  drivers/clk/clk.c | 169 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 164 insertions(+), 5 deletions(-)
> =

> I was working on some internal project where there was a requirement to p=
rovide
> debugfs entries for controlling clock operations. So I thought allowing to
> change rate, parent, enable_count and prepare_count of clocks through deb=
ugfs
> may be a desirable feature. I felt debugging is much easier with these fe=
atures
> as one need not boot the kernel every time he/she wants to test a clock,
> especially helpful in case of booting linux on an emulator where it takes
> hours to finish booting. Being new to linux, I'm not sure whether it is d=
esirable
> or not. Hence I request for comments.

Historically we've avoided allowing userspace to change clk settings,
even in debugfs[1]. That's best left up to drivers so that drivers don't
get confused or have trouble when they try to operate on things and
their clk frequency changes underneath them. It also opens up a way for
bad userspace applications to exist and start writing into debugfs to do
userspace clk control, which is something we really want to avoid at all
costs.

I can understand on an emulator it is hard to get things right
initially, and you may not even have drivers for certain devices that
are using the clks, and hours to reboot takes time to fully test a clk
driver, but then you can just make a patch like this and apply it to
your tree and do rapid debug and development until things are sorted
out. I've experienced this first hand and carried around a patch to do
just this for a long time.

We have discussed adding "dead" code to the kernel to support read/write
like this underneath some #ifdef guard, like you see regmap do with
their #ifdef REGMAP_ALLOW_WRITE_DEBUGFS code. I would be open to that
sort of patch that I can then easily add a special define to enable the
super dangerous mode. As long as it isn't exposed as a Kconfig we're
pretty safe from non-developers finding it.

[1] https://lists.linaro.org/pipermail/linaro-kernel/2013-August/006226.html
