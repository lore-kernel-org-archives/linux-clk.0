Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C86016E88E;
	Mon,  1 Jul 2024 17:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719856325; cv=none; b=DQd+mJexjWAAPSh02794wS+9zb5/GU5oYIEY+dnKuEFZ3A7+8TT9/tHbJsyYLRXDgyumOdhe4G/PNx3TdX1IArezAjBNH6veSn5R8lmV/256Is38iI11e5NI7TBssQgKSbmlhPIHsvh/dUKVEsutxno1oWd/S5A9/FUfYNrwY84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719856325; c=relaxed/simple;
	bh=+D/sYMF2VOea7yjOxpRRxLRawKQrizXRMN+yOvfXLF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oIjuAoIkSKbXGc4eQnQ0QR3zlWQ6IUm4JPjk8kv7TQ51Tk9QsKPCFtBiD5k8xmkOoFzo5OgiURCF8RomC2Hu2EL/L86JsNEtsjoSGaOqqF1NCKtvImFbFyJk/sYeJ+fWAeJyoWPk5KoCTNewbHpWTVDl1ktf1hevbbsxfSPFR+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvB8uDfj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvB8uDfj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1E3C32781;
	Mon,  1 Jul 2024 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719856324;
	bh=+D/sYMF2VOea7yjOxpRRxLRawKQrizXRMN+yOvfXLF8=;
	h=Date:From:To:Cc:Subject:From;
	b=HvB8uDfjlXCEoeyy3WCLQ21i4W9FvSW6AN8Fk3l+fUk/RUQ2D5aWAci+pIAVrPXg+
	 jwBumulQ8y+lReMWIfNwhGLQ0QqsKVtCquOhK5VhiECf2T4YHAz5FITaEuxURI5GxA
	 yE/OTjsth9wgJYaY8xbp6xg9WisEgs2wmIlfWUAL6HqNZeqV/tyhypCzabl8h03quD
	 2QAuhyA6cpRFQYdQ7lj1tSvD/tF+uFshsEuaLHX5qYivQjuPwFWV2laYbl3hvJZnjc
	 wihVbRHjmkix+bwSsv7vaxtRQSTSvMNymLeJ2qvFo9I2TOWz5Yes4/X1QvQPQilc56
	 ZH4eDsTn7+gHg==
Received: by wens.tw (Postfix, from userid 1000)
	id 9D2FB5FBB1; Tue,  2 Jul 2024 01:52:02 +0800 (CST)
Date: Tue, 2 Jul 2024 01:52:02 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 6.11
Message-ID: <ZoLswiclc8k4DHi-@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jv73/2Bz+9YKHfGx"
Content-Disposition: inline


--Jv73/2Bz+9YKHfGx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Here are the changes for 6.11 for the Allwinner SoCs.

As the tag message mentions, there is one commit that is shared between
the clk branch and the soc branch.


Please pull.


Thanks
ChenYu


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.11

for you to fetch changes up to 002cf0dfa201e44685e3b96ae06b8de258b8b2c2:

  clk: sunxi-ng: h616: Add clock/reset for GPADC (2024-06-22 20:09:20 +0800)

----------------------------------------------------------------
Allwinner SoC clk changes for 6.11

This includes a commit shared with the soc tree. This commit adds clock
and reset indices to the device tree binding, and thus is needed for
both the device tree and driver changes.

- Remove unused |struct gates_data| from old sunxi driver library
- Add missing MODULE_DESCRIPTION() macros for sunxi-ng drivers
- Add GPADC clock and reset for H616

----------------------------------------------------------------
Chen-Yu Tsai (1):
      Merge branch 'sunxi/shared-clk-ids-for-6.11' into sunxi/clk-for-6.11

Chris Morgan (2):
      dt-bindings: clock: sun50i-h616-ccu: Add GPADC clocks
      clk: sunxi-ng: h616: Add clock/reset for GPADC

Dr. David Alan Gilbert (1):
      clk: sunxi: Remove unused struct 'gates_data'

Jeff Johnson (1):
      clk: sunxi-ng: add missing MODULE_DESCRIPTION() macros

 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c      |  1 +
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c    |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c      |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c       |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c      |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c      |  6 ++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      |  2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c       |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c         |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-r.c          |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c        |  1 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c    |  1 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c        |  1 +
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c    |  1 +
 drivers/clk/sunxi-ng/ccu_common.c           |  1 +
 drivers/clk/sunxi/clk-sunxi.c               | 11 -----------
 include/dt-bindings/clock/sun50i-h616-ccu.h |  1 +
 include/dt-bindings/reset/sun50i-h616-ccu.h |  1 +
 28 files changed, 32 insertions(+), 12 deletions(-)

--Jv73/2Bz+9YKHfGx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmaC7MIACgkQOJpUIZwP
JDCRdxAAjUQn9SMXoYWDOsfR+v1tHNyjdJtWh9tUHGBVjV1Wi57xgpqTGD486Hax
VC/07408yW1BLZBi+IbC3Ex7JFjFRcAxrQqqAocfQeqxISMke6vY/P/gO+LXtrvQ
buEw+HwZY160/kx2GRPvHzd1pDLxGc3jdc9z1wqlhz7bgs0s0D3o8r+GoLJvJAhI
ZMiIm+oIhc6txyoQFm+Wxmwaq9ziMueZOcgF0kYpKv7AyubWbnXv8KNArHiXlg2k
J2m2n3VK9J/wj5IiOACIW/HC3OJb8Qvkolzs6/6bbHyixg25f1O8YQmd7l0OL0eC
5wWbN0MdRYtWH5X1DluM97rGDijfsKRJKAC9WZJcnlpxKGktPkwwJSkFBlpKf0jK
PEQ9ZieUXtuLIwfBykV7n9ACFiVbo3eSQZEhxPW4O2ObWFz/iwfciyds1jDJYnvu
Ahub7vaE3vOgxzrz3UrYRcj8eC9IFmSHpKGdPbnTVYh0Llyos7CshfVRx5B81SVl
FcunCiHhmcbahIfTeI7tatgq5NNK4qn0bY8YunhrMgRaSXukEKKeBn5F2ndRhCCH
xPjZdI8Sp9TUN5PBIbciDKgLoU7rioduV79ZaPYpBHP7hNVkvPhYGMrT1h0TtJqA
cgxqa+GB8RD2I+SShvMqsLaGTOY2M8PXu9XIIPer2xB7oFdGKbk=
=YgAO
-----END PGP SIGNATURE-----

--Jv73/2Bz+9YKHfGx--
