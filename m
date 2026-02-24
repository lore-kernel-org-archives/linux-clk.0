Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00803A7F73;
	Tue, 24 Feb 2026 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771953046; cv=none; b=uaRXUzPpTOoyzsWchBGQJV8GlgdrL6iwA2sqQ+YyX7KOT4o8QLfL9fyEVJkkuBZBHglrPe5KdS5DrRSP6pux6h5QXGTpegZb4w0k/JgJDVMFSINfvWA/WlPr+HXSL56nE+PLpAjrh4BGujmz4UoMkgVjNCKo5P8CBKIK9rQs46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771953046; c=relaxed/simple;
	bh=Ztw7NYo3dcKh1IGItKd9Z+QXx4QfpxBQRazYm/tm6J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8+VbnuWRqww7u1nmgckB4Jl0CzGpUZAyqGgg1RrBEg+lDYfl7e+mFU6yYkGbicI7tPRz54KV01wmVXMjf3xEyq179jLdM5NuNvx1dyc/r1Cb20xL2eQx0ktM4qy2cgSQ0bCjuXQrhLBLs7kvKcau8lhf9uh9B7p67rJM2WjpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBTqAsIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBTqAsIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CEAC19422;
	Tue, 24 Feb 2026 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771953046;
	bh=Ztw7NYo3dcKh1IGItKd9Z+QXx4QfpxBQRazYm/tm6J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBTqAsIfuXzpeasPgE028/f3ZQKwM9EgvgeSIq7TeshnPESeBGanudPog35yl9Xrv
	 9pCWJ2NjQy8t0XE+OKHKtaVqM5YW1Hn7fyxExR8ZiXzXZepkoQ93Y175Hgrx+046Gk
	 7FQ8QbzyYyZiNOCcsYJD2MOSU2pzrtROeDbZkIPTBbH/GLWUvchjgsvAknkZyTWwUY
	 8v3faKGl2HNG5OCksewo3nmtY6Dx5V5GAopOntHNjSNwjgy/gbByZo2mFofTwQM2lU
	 R2Shzos2oirNCiMInr+6JqMrvXURajpzPXPxVJzHrTpznFMmGZ1d1erJyF4T95BJis
	 o1s8nzBMqm71g==
Date: Tue, 24 Feb 2026 17:10:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <20260224-placate-runt-54aa8419ec40@spud>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dtm3MbfamtQF2IlR"
Content-Disposition: inline
In-Reply-To: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>


--Dtm3MbfamtQF2IlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 06:51:03PM -0500, Brian Masney wrote:
> Here's a small series that lets us enable COMPILE_TEST for the pic32 clk
> driver so that this driver can be compiled on all architectures in the
> future to help avoid breakage.

Why do you care about this platform? Originally I thought you cared cos
you were getting involved in clock subsystem stuff, but I see you doing
stuff with it in pinctrl etc. Is that just general cleanup work, or do
you actually have an interest in the platform?

Also, seeing "clk: microchip: core" in my inbox triggers me, cos the
stuff I work on uses "microchip: core" a lot for FPGA IP cores. Can we
do:

-- >8 --
=46rom 5e972ac119c87257ce141382019f2b58ebd53359 Mon Sep 17 00:00:00 2001
=46rom: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 24 Feb 2026 16:59:53 +0000
Subject: [PATCH] clk: microchip: rename clk-core to clk-pic32

clk-core is a confusingly generic name, since it is only used by a
single platform and it uses very similar naming to the "soft" IP cores
for use in FPGA fabric (CoreClock or similar is what that would be
called, although nothing like that exists right now) that the FPGA
business unit produces. Rename it to clk-pic32, matching the prefix
used by most functions in the driver. As far as I can tell, impact
on whatever users may (or may not...) exist for the platform is minimal
as it's built-in only and the functions are called directly from
clk-pic32mzda.c

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Makefile                    | 2 +-
 drivers/clk/microchip/{clk-core.c =3D> clk-pic32.c} | 2 +-
 drivers/clk/microchip/{clk-core.h =3D> clk-pic32.h} | 0
 drivers/clk/microchip/clk-pic32mzda.c             | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/clk/microchip/{clk-core.c =3D> clk-pic32.c} (99%)
 rename drivers/clk/microchip/{clk-core.h =3D> clk-pic32.h} (100%)

diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/Makefile
index 13250e04e46cf..8e60bc1a03ae7 100644
--- a/drivers/clk/microchip/Makefile
+++ b/drivers/clk/microchip/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_COMMON_CLK_PIC32) +=3D clk-core.o
+obj-$(CONFIG_COMMON_CLK_PIC32) +=3D clk-pic32.o
 obj-$(CONFIG_PIC32MZDA) +=3D clk-pic32mzda.o
 obj-$(CONFIG_MCHP_CLK_MPFS) +=3D clk-mpfs.o
 obj-$(CONFIG_MCHP_CLK_MPFS) +=3D clk-mpfs-ccc.o
diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-p=
ic32.c
similarity index 99%
rename from drivers/clk/microchip/clk-core.c
rename to drivers/clk/microchip/clk-pic32.c
index 692152b5094e0..9d128fba2cdea 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-pic32.c
@@ -11,7 +11,7 @@
 #include <linux/iopoll.h>
 #include <linux/platform_data/pic32.h>
=20
-#include "clk-core.h"
+#include "clk-pic32.h"
=20
 /* OSCCON Reg fields */
 #define OSC_CUR_MASK		0x07
diff --git a/drivers/clk/microchip/clk-core.h b/drivers/clk/microchip/clk-p=
ic32.h
similarity index 100%
rename from drivers/clk/microchip/clk-core.h
rename to drivers/clk/microchip/clk-pic32.h
diff --git a/drivers/clk/microchip/clk-pic32mzda.c b/drivers/clk/microchip/=
clk-pic32mzda.c
index 27599829ea40a..e11cbdd982a61 100644
--- a/drivers/clk/microchip/clk-pic32mzda.c
+++ b/drivers/clk/microchip/clk-pic32mzda.c
@@ -14,7 +14,7 @@
 #include <linux/platform_device.h>
 #include <asm/traps.h>
=20
-#include "clk-core.h"
+#include "clk-pic32.h"
=20
 /* FRC Postscaler */
 #define OSC_FRCDIV_MASK		0x07
--=20
2.51.0


--Dtm3MbfamtQF2IlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ3bkgAKCRB4tDGHoIJi
0hfXAP4ymaWy9IisZ1elLfYoFO6YKBTDXV953YHummZLIRFpzgEArIcdO2m7GIOn
LpH3Aex/Lb0YCvS21GVlSzNxZNvfZgc=
=oypA
-----END PGP SIGNATURE-----

--Dtm3MbfamtQF2IlR--
