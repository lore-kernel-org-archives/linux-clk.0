Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C693B6C1D
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391387; cv=none; b=Q7MuRWAECgIVOKpTcTiihYvAZST9JrOFFabbjknGydNiRAVVgG3Q5OuA/8t3eaLoOzqV0lXlPGV+ORVYJc4Tc5kGoh0pOc6PTq49h2TbTDLeXXuocsvxKRERfT+FyeahLuPrso/jhNIInGH1ssnPg2e+oi27Nn4AoRGni7cgaqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391387; c=relaxed/simple;
	bh=eUaPJpNmizwAIs4PIzUN/LflEO3GMcgJaN9dpKI9P9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gvPuAYVGQeFZ4/8sSUs8d+FmImtCn+9PguAGEAmKCYjH1ZmArrv+8qO6UambitrHtzmWFTHj2qov+ux74Az6bBbMXl2FoPCTBHDTybYUYn7PSj7KlDFoxpgziQ5zgsLZiSAhXnSDWtefUzaeYNyI10sf3WeXAYflGVRmaoPHMJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDXYC17+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDXYC17+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2D21F00898;
	Tue,  2 Jun 2026 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780391386;
	bh=6c11wr/P23B82J0faqOmEOPTqeU+AJXGBp8NKpJOrYI=;
	h=Date:From:To:Cc:Subject;
	b=cDXYC17+xBPKoqX3wvSeft4sNGdZuym12jXWMV/HJtvoJFcV0KOE5Vvqu759/6k/j
	 NEoz5LwchwgS5ejg6l+tE1Mb7PH/qEwZTOvhCrWQex45PtlfT2ofjgRTWWu91KduOR
	 sNAwecptEMNE97UH5k5gKa7V+q63zcvtAnD+hX5XnlNMM09hBl3Vyv02nzmRQ97Cus
	 cEdNZNp378avy6Rp2+51luersh/FUmLeIUiFB4TooboswSzDJlRq0/eLitOjaUMa6J
	 95nrkpXDGoOqFa+sgWJl3pTmehvD7VVgCzDZMVhl1A83Scy9dyTA+DifHcbE97AEko
	 69e/1LxSIMc9w==
Date: Tue, 2 Jun 2026 10:09:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	conor@kernel.org, Troy Mitchell <TroyMitchell988@gmail.com>,
	Xukai Wang <kingxukai@zohomail.com>,
	linux-riscv@lists.infradead.org
Subject: [GIT PULL] canaan clk changes for 7.2
Message-ID: <20260602-latitude-unroasted-d88074ae2ebc@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SlRgpDK8SzB1i+YF"
Content-Disposition: inline


--SlRgpDK8SzB1i+YF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Stephen,

Please pull the addition of a new driver for the Canaan k230 SoC.

It's been on the list for quite a while, with minimal feedback received
on recent versions, so I figured I'd grab it and send a PR so that I can
merge the rest of the SoC support for 7.2. It's been in linux-next for
about two weeks with no issues that I am aware of.

Thanks,
Conor.


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ clk-canaan-7.2

for you to fetch changes up to a7b7c7c6c01679efef0fd2f2ca1c5114f303e4f5:

  clk: canaan: Add clock driver for Canaan K230 (2026-05-22 17:13:10 +0100)

----------------------------------------------------------------
Canaan k230 clock support

Driver and devicetree bindings for the Canaan k230 SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Xukai Wang (2):
      dt-bindings: clock: Add Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230

 Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml |   59 ++++++
 drivers/clk/Kconfig                                          |    6 +
 drivers/clk/Makefile                                         |    1 +
 drivers/clk/clk-k230.c                                       | 2452 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h                  |  220 +++++++++++++++++++
 5 files changed, 2738 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
 create mode 100644 drivers/clk/clk-k230.c
 create mode 100644 include/dt-bindings/clock/canaan,k230-clk.h

--SlRgpDK8SzB1i+YF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah6d1gAKCRB4tDGHoIJi
0tVMAP98lboKhjOQ0/6AWaMyTfo00JdTRTW2Ovh2fvMLS+HkrAD/dCz2/ARZX8vZ
9azg458HgiSZ4dK1RbTqvZTTmW1Cvg8=
=DuRN
-----END PGP SIGNATURE-----

--SlRgpDK8SzB1i+YF--
