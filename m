Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F59E2A1D3;
	Mon,  1 Jul 2024 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719855630; cv=none; b=HljV2hyXzzlagTEEx4ymHgyq1hGWCkuewOBlssNUbPbgXfAc3Z5RKpMjuMUca0KfCn90bgOg3I+LJjwWZ+SZSDOR9olAGTVrFGDpyDQUJcmpqHXo0Pb1vg+NP2Gy8cxqx+NzgbAzCoKmxRmGcoyfHBHHMbPSJE8ETv33XMCWF/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719855630; c=relaxed/simple;
	bh=E5f6qHZVxjrXFAD48QF0CGUhGy9Va81Pd+F+wrb6l34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ToRp2AZWB+DFpgJ0sbBtGszNbcp9/Sm9psvORq/Hwd7fnZODAD5mdhZkP7iKwFBdoiiD1yBIoghktnUafvUAee1N/va75pmlUmEyf2ujrSvDllH3eDVwADd+2MUg/mJH+o/OFIqs+jn5qfjEEVSyd2g3Xyy/6ARhRxf6OXPNO3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nu+EreWM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nu+EreWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3D3C116B1;
	Mon,  1 Jul 2024 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719855629;
	bh=E5f6qHZVxjrXFAD48QF0CGUhGy9Va81Pd+F+wrb6l34=;
	h=Date:From:To:Cc:Subject:From;
	b=nu+EreWM9O4lKeWsKkp2Lcqr0vGnzV7aD/1YAtlUn2zDqrCJaywNGO5icEnxRP2sq
	 sfoPZIh2tcTMgTJUhkMRi0w2/AYVPC8BthMfyXpDNIyUM13fZI0zNcjBpy/4zIbJTs
	 gxSLzpxbIGWvlm21DN5xuj/oOGlsosRVlFgcup8yUj59m8cVktUCq+MFB/n8YSbhPk
	 wAWPEMAMQIS/7a4BeTsupq0ZHmtACd7xsUsmDdSPmFx/7+6pMegR+HlW68IALnjN/t
	 ldsgzh9lqjbaNI6Ri2ILUdM16SIzy2FuZQ0h9tRHE4GMxh4b2llZaoC7+slswwBXCS
	 jxaa3CXqRx5DA==
Received: by wens.tw (Postfix, from userid 1000)
	id 9495B5FADF; Tue,  2 Jul 2024 01:40:27 +0800 (CST)
Date: Tue, 2 Jul 2024 01:40:27 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 6.10
Message-ID: <ZoLqC7gTDxEkNPsE@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yuP47/a85TH1IIqh"
Content-Disposition: inline


--yuP47/a85TH1IIqh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

We have (hopefully) just one fix for the 6.10 cycle.

Please pull.


Thanks
ChenYu

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-6.10

for you to fetch changes up to ea977d742507e534d9fe4f4d74256f6b7f589338:

  clk: sunxi-ng: common: Don't call hw_to_ccu_common on hw without common (2024-06-30 23:12:44 +0800)

----------------------------------------------------------------
Allwinner SoC clk fixes for 6.10

- Fix min/max rate clamping that caused a regression back in 6.9

----------------------------------------------------------------
Frank Oltmanns (1):
      clk: sunxi-ng: common: Don't call hw_to_ccu_common on hw without common

 drivers/clk/sunxi-ng/ccu_common.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

--yuP47/a85TH1IIqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmaC6gYACgkQOJpUIZwP
JDDNDA//cpQNm16JnmmttGesxB4FBQR8mDBHQwVPRoVMVoGHSEY7KKZCwFhGPnkN
AvrAl6RkvD2Mf1VNinQmJC3jnH9YYwQjF3euhRKEX1R4suypnHIpWcFYlj67Qvbj
BVGdEFv4v4YG7haMLzh+miO88gjmHT2tgMQ74xmNTgmDqM1csRGKA0Tp7HcZZR67
FUBX9/dK6kFiBhXEuDRLsKjV8NkpXI0xxEcgWqzBouxdcI9BaFHawkb8foG6dM59
/mgBlC2bxPBxSneh4NjMJ4iVO+LdwA4oxdjvSb9qUkUB9/ZVsGg/2Xkhv0QPM/TS
bqIDvoW8jdMviA4Qhhoj0EK6+nD892TDUN42fr34slTRp0ct4umaCLOFcjJTlIVi
wdkmO4bLz28i22kBWDxoFgt2V/+IN8sjXXB+ZFGU86PvohPT/TMtlsafTA7hnroC
CJw7MONfvNbO9+dIWzSOIgA+SNI7SIoCeaB1Ng/4LOFA/mmP+2zqKatu4fyJJ+Rx
XdM3Dit9DXeaoqdZ5d5N8Tg/rPWDDjPgQA6ZtPqGY7T9hHEpsDA2zql4jAqiPYy7
tficBTqWi+1rj8QMXFaF7Pw/7Ar7pXrHBhDZKejAnStTTrl2A3p30Zjaj9FEZbvo
JvByB5Y2S9L8mMhL5B6aBi9kWc1mwFZPw+T9RFj2CusF2Naxja4=
=hoz3
-----END PGP SIGNATURE-----

--yuP47/a85TH1IIqh--
