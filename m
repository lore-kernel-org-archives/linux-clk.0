Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65152F37
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 22:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758493791; cv=none; b=JWx0VEnz0ObHg9pI32h/odDu1rnRfYFmEXBhdKTvs3bUIQkflscaaPXJGvJJcnZQZRGVZbdsjRGrAeF8gHzi13UGpbtt67QRcIN82u7mWiLpZUjSTDvn6KwWW+8KpPauayZyywOp8lpTzog4YrI69dbf0bNmpEXynMYNf9Qj5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758493791; c=relaxed/simple;
	bh=t3M/HHaQ1LdJyfOFRrtusW7jDfV1vsfN6PQ9v2tBdIQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VRXcUI0NSp7IpoOSRoa2HBZgKUY9YdrAbjY+AuZ/PCq2bLHkkgtG5sNIPwyg1H7ogF1fJjPxkKoYzlLJ7+enXSbFAYpjtPRJqj96RCp4vki23yapD1YINp3Sm9pywWPdSgVikM1BIL4XE6hSd1bSrFneE3JgZTcF2PQzKBGUuzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/HiWiQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/HiWiQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D43C4CEE7;
	Sun, 21 Sep 2025 22:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758493791;
	bh=t3M/HHaQ1LdJyfOFRrtusW7jDfV1vsfN6PQ9v2tBdIQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=S/HiWiQgimVDNPWriwiE+Zajl8ymdN7j0xlpWfoFbGJhRnNGCFtCPSeBRuwxEfx4z
	 Tx8PL3HBxzuSYwYSZ6E3B83LGdthHWG2XY+UxbDuzp7dVpU0InQb4qz3R9v8qrsk7j
	 wlJRqNZu3I2vHbtPqjq/3JpkPlImj1kd21e+436+IUSSq1Q2smiesVsEO8VmB1gjuL
	 VUGHqXwQX2oJZPIHoOiX5nIQxQ8BW4l7kDznDzn49vCGlO0z1Lp1R4d0reFUnAArN3
	 b6rkKvIcvwgBpZ74ERimnEPdV1USlHKy+rkZuj7nWLgrwewln2drMMoh16uLjlQhbf
	 3xL1u+VcO3BXw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1897877.QZUTf85G27@diego>
References: <1897877.QZUTf85G27@diego>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.18 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Sun, 21 Sep 2025 15:29:49 -0700
Message-ID: <175849378973.4354.1911356302020699433@lazor>
User-Agent: alot/0.11

Quoting Heiko Stuebner (2025-09-21 13:59:39)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with Rockchip clock change for 6.18
> Just a single newly exported clock for an older SoC.
>=20
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.18-rockchip-clk1
>=20
> for you to fetch changes up to 77111b2c22ef5b368da5c833175b6f7806b39ccb:
>=20
>   clk: rockchip: rk3368: use clock ids for SCLK_MIPIDSI_24M (2025-09-03 1=
4:17:54 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
