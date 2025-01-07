Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E01F63C5
	for <linux-clk@vger.kernel.org>; Tue,  7 Jan 2025 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278925; cv=none; b=EluGwddY4Pd9+H0r3SyTY0EufEeL7y1ZJ5B16IW5dejehvrVM1BgQJNfN0yowqjLRx/Lh+ms+/PSuKO5hFdbenDT7PY/J0EVNOpfzm6Wol5aVMkPQzhNOxSlEuEt6m5XqCY8qUaIy9B3Grf/pAFXgS8vABbyr+/6X2B8IVoqifI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278925; c=relaxed/simple;
	bh=qSpJdrdYaiwt7T2XNpsJjZDUclKe4MEQ4ZAlcMcs42g=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=udpfO64IlAy07rYVSstbGcGGTGTUGtusw8uMQzsA0UYT2OdcbRp4rEyO3M0LZc7vSG/7d6UXSzzeiHuITMHpcYA4UDRahe2XcmwhBfkUPuOh/2akh2tcwI/I9NQdeNbwDNEzf/vdPo0oGiJElxWMv/SYIMO6PhKbctvKXQbwU6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8wVipwY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8wVipwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71C0C4CED6;
	Tue,  7 Jan 2025 19:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736278924;
	bh=qSpJdrdYaiwt7T2XNpsJjZDUclKe4MEQ4ZAlcMcs42g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=G8wVipwYb2DVqeUZXM1xBbWAfH5MSzwPmr9Ix1L67f0MEiobo8A2unxxOh9zDoJIg
	 mddOcsMnN18B4cRq2jMmGgsl8sMNWwFpcJA+KwdChAfDy+UnM0h5OD+H770L9Kq59X
	 VkProfyxaoqEuI05bYy8CJFMVVbJm4/UtG677r+m4VyWNvCgqyA00CSZ8h4WnTyGNd
	 Qrhnjg0NUu6hnpPRECiPkcqeayy5E7rHiN82vrFMSx4nDnr40HK0SzO5N4mXDbO2Cj
	 1wibGlYC+yuxk1CwKjSmFckn5/hDBuJ6T5vahEA2jz0PXqIrq6UOtKU1CiqtMRA54D
	 O53bqoEpX0ACQ==
Message-ID: <fe420519b351c3e27188e359c3ca62f1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250107081637.759666-1-claudiu.beznea@tuxon.dev>
References: <20250107081637.759666-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock updates for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, conor.dooley@microchip.com
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Tue, 07 Jan 2025 11:42:02 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Claudiu Beznea (2025-01-07 00:16:37)
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.14
>=20
> for you to fetch changes up to 9a497710cab94140762bcfbd9b6dc2c45f30678b:
>=20
>   clk: at91: sama7d65: add sama7d65 pmc driver (2024-12-29 14:17:55 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
