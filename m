Return-Path: <boris.brezillon@free-electrons.com>
Date: Thu, 9 Jul 2015 22:39:38 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Tony Lindgren <tony@atomide.com>, Ralf
 Baechle <ralf@linux-mips.org>, Emilio =?UTF-8?B?TMOzcGV6?=
 <emilio@elopez.com.ar>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Tero Kristo <t-kristo@ti.com>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen
 Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-mips@linux-mips.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5] clk: change clk_ops' ->determine_rate() prototype
Message-ID: <20150709223938.19450e75@bbrezillon>
In-Reply-To: <559D66EE.4060707@codeaurora.org>
References: <1436294888-25752-1-git-send-email-boris.brezillon@free-electrons.com>
	<20150708005748.GG30412@codeaurora.org>
	<20150708110005.704c49ff@bbrezillon>
	<559D66EE.4060707@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Wed, 08 Jul 2015 11:07:42 -0700
Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 07/08/2015 02:00 AM, Boris Brezillon wrote:
> > Hi Stephen,
> >
> > On Tue, 7 Jul 2015 17:57:48 -0700
> > Stephen Boyd <sboyd@codeaurora.org> wrote:
> >
> >> On 07/07, Boris Brezillon wrote:
> >>>
> >>>  	} else {
> >>>  		pr_err("clk: clk_composite_determine_rate function called, but no =
mux or rate callback set!\n");
> >>> +		req->rate =3D 0;
> >>>  		return 0;
> >> Shouldn't this return an error now? And then assigning req->rate
> >> wouldn't be necessary. Sorry I must have missed this last round.
> >>
> > Actually I wanted to keep the existing behavior: return a 0 rate (not
> > an error) when there is no mux or rate ops.
> >
> > That's something we can change afterwards, but it might reveals
> > new bugs if some users are checking for a 0 rate to detect errors.
> >
>=20
> Ok. Care to send the patch now to do that while we're thinking about it?
> We can test it out for a month or two.
>=20

Here is a patch modifying a few drivers to return errors instead of a 0
rate. Feel free to squash it in the previous one if you think this is
better.

Best Regards,

Boris

--- >8 ---

=46rom dca9c28301042cf19dad4b1e4555cdb7c1063745 Mon Sep 17 00:00:00 2001
From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Thu, 9 Jul 2015 12:20:21 +0200
Subject: [PATCH] clk: fix some determine_rate implementations

Some determine_rate implementations are not returning an error when then
failed to adapt the rate according to the rate request.
Fix them so that they return an error instead of silently returning 0.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/mips/alchemy/common/clock.c    |  4 ++++
 drivers/clk/clk-composite.c         |  3 +--
 drivers/clk/clk.c                   | 15 ++++++---------
 drivers/clk/hisilicon/clk-hi3620.c  |  2 +-
 drivers/clk/mmp/clk-mix.c           |  5 ++++-
 drivers/clk/sunxi/clk-factors.c     |  6 ++++--
 drivers/clk/sunxi/clk-sun6i-ar100.c |  3 +++
 drivers/clk/sunxi/clk-sunxi.c       |  6 ++++--
 8 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/arch/mips/alchemy/common/clock.c
b/arch/mips/alchemy/common/clock.c index 0b4cf3e..7cc3eed 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -469,9 +469,13 @@ static int alchemy_clk_fgcs_detr(struct clk_hw *hw,
 		}
 	}
=20
+	if (br < 0)
+		return br;
+
 	req->best_parent_rate =3D bpr;
 	req->best_parent_hw =3D __clk_get_hw(bpc);
 	req->rate =3D br;
+
 	return 0;
 }
=20
diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 9e69f34..35ac062 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -125,8 +125,7 @@ static int clk_composite_determine_rate(struct
clk_hw *hw, return mux_ops->determine_rate(mux_hw, req);
 	} else {
 		pr_err("clk: clk_composite_determine_rate function
called, but no mux or rate callback set!\n");
-		req->rate =3D 0;
-		return 0;
+		return -EINVAL;
 	}
 }
=20
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c182d8a..d67d9b4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -447,24 +447,18 @@ clk_mux_determine_rate_flags(struct clk_hw *hw,
struct clk_rate_request *req,=20
 	/* if NO_REPARENT flag set, pass through to current parent */
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
-		parent =3D core->parent;
+		best_parent =3D core->parent;
 		if (core->flags & CLK_SET_RATE_PARENT) {
-			ret =3D __clk_determine_rate(parent ?
parent->hw : NULL,
+			ret =3D __clk_determine_rate(best_parent ?
best_parent->hw : NULL, &parent_req);
 			if (ret)
 				return ret;
=20
 			best =3D parent_req.rate;
-			req->best_parent_hw =3D parent->hw;
-			req->best_parent_rate =3D best;
-		} else if (parent) {
+		} else if (best_parent) {
 			best =3D clk_core_get_rate_nolock(parent);
-			req->best_parent_hw =3D parent->hw;
-			req->best_parent_rate =3D best;
 		} else {
 			best =3D clk_core_get_rate_nolock(core);
-			req->best_parent_hw =3D NULL;
-			req->best_parent_rate =3D 0;
 		}
=20
 		goto out;
@@ -493,6 +487,9 @@ clk_mux_determine_rate_flags(struct clk_hw *hw,
struct clk_rate_request *req, }
 	}
=20
+	if (!best_parent)
+		return -EINVAL;
+
 out:
 	if (best_parent)
 		req->best_parent_hw =3D best_parent->hw;
diff --git a/drivers/clk/hisilicon/clk-hi3620.c
b/drivers/clk/hisilicon/clk-hi3620.c index a0674ba..c84ec86 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -316,7 +316,7 @@ static int mmc_clk_determine_rate(struct clk_hw *hw,
 		req->rate =3D 180000000;
 		req->best_parent_rate =3D 1440000000;
 	}
-	return 0;
+	return -EINVAL;
 }
=20
 static u32 mmc_clk_delay(u32 val, u32 para, u32 off, u32 len)
diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
index 7a37432..665cb67 100644
--- a/drivers/clk/mmp/clk-mix.c
+++ b/drivers/clk/mmp/clk-mix.c
@@ -218,7 +218,7 @@ static int mmp_clk_mix_determine_rate(struct clk_hw
*hw, parent =3D NULL;
 	mix_rate_best =3D 0;
 	parent_rate_best =3D 0;
-	gap_best =3D req->rate;
+	gap_best =3D ULONG_MAX;
 	parent_best =3D NULL;
=20
 	if (mix->table) {
@@ -262,6 +262,9 @@ static int mmp_clk_mix_determine_rate(struct clk_hw
*hw, }
=20
 found:
+	if (!parent_best)
+		return -EINVAL;
+
 	req->best_parent_rate =3D parent_rate_best;
 	req->best_parent_hw =3D __clk_get_hw(parent_best);
 	req->rate =3D mix_rate_best;
diff --git a/drivers/clk/sunxi/clk-factors.c
b/drivers/clk/sunxi/clk-factors.c index 7a48587..94e2570 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -107,8 +107,10 @@ static int clk_factors_determine_rate(struct
clk_hw *hw, }
 	}
=20
-	if (best_parent)
-		req->best_parent_hw =3D __clk_get_hw(best_parent);
+	if (!best_parent)
+		return -EINVAL;
+
+	req->best_parent_hw =3D __clk_get_hw(best_parent);
 	req->best_parent_rate =3D best;
 	req->rate =3D best_child_rate;
=20
diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c
b/drivers/clk/sunxi/clk-sun6i-ar100.c index d70c1ea..21b076e 100644
--- a/drivers/clk/sunxi/clk-sun6i-ar100.c
+++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
@@ -105,6 +105,9 @@ static int ar100_determine_rate(struct clk_hw *hw,
 		}
 	}
=20
+	if (best_rate < 0)
+		return best_rate;
+
 	req->rate =3D best_rate;
=20
 	return 0;
diff --git a/drivers/clk/sunxi/clk-sunxi.c
b/drivers/clk/sunxi/clk-sunxi.c index d0f72a1..0e15165 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -146,8 +146,10 @@ static int sun6i_ahb1_clk_determine_rate(struct
clk_hw *hw, }
 	}
=20
-	if (best_parent)
-		req->best_parent_hw =3D __clk_get_hw(best_parent);
+	if (!best_parent)
+		return -EINVAL;
+
+	req->best_parent_hw =3D __clk_get_hw(best_parent);
 	req->best_parent_rate =3D best;
 	req->rate =3D best_child_rate;
=20
--=20
1.9.1
