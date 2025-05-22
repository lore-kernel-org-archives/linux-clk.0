Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944342D193B
	for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955935; cv=none; b=F81aYY8k6LZtWHYDKhJRxBWPgEQYkLb8p+CTV7JeiD8l027RINjY+0Fg4m8g9nDrsnHuo4o5Q1jju2DvUZSY7K9W/9IjIVbBu4VDZhRBrt0CB993hyQLVzZyN1KwUFJLnYOF/n3LxI4ZSko3BSkQ1imyriBMlLtIvyudCuQf2YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955935; c=relaxed/simple;
	bh=P3t4DL3xYUyTBmAEER2maWx8tKVsMIZCBNPFoN+u+9I=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=G6dIAjyAbBkAFTGAhqkn3uBbigLR++sTAG6zSsnrtZkS7zQpLt5UqJ0qR15t2h8VbKOtFShnpe31oHCOgM34kdxUxNTOrTBc6nGq0UyilK0B6zpq2wSdRUrL3BJD4poh8GZ30wAxXRZFpSi6ztxu81O9zLVgz5VG0jCzugWIGCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3RQj8Dt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3RQj8Dt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D054C4CEEB;
	Thu, 22 May 2025 23:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955935;
	bh=P3t4DL3xYUyTBmAEER2maWx8tKVsMIZCBNPFoN+u+9I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=P3RQj8DtIgVMpAjGTC4WR+s/4lgjFbMEY52cPLSy9ssQ6XI3M5cfIPuaN+nvTIOKW
	 hUVe9xHj+PWelCqqwzU7VuU/+zWp4REsIDGcZw3bzGPgWSXjKvf5fg07NkKuKqeE9A
	 3+/h5Ut1mJxD3c3+kVdppKa8T5ZvohymkH1VpTuOpbdtDPDp8XlZNOffiD3yYSPVRB
	 JEj1raxHn+TbsKru0JblwotvTPMaDG98oPt0PjQ537hjIZVgrgdY/A/MRQzFzu62B3
	 eAauOxh+Yg4dsiSuW+YwuJhDGMnRtjDaj0SCcKCa78IZTqcfiXn6sb8Kjnv5FfeJtq
	 ABrG8jyNUdFPQ==
Message-ID: <42ee51cc911b4a72c2659f94282519df@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <23068874.EfDdHjke4D@phil>
References: <23068874.EfDdHjke4D@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.16 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Thu, 22 May 2025 16:18:53 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Heiko Stuebner (2025-05-18 02:11:44)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with Rockchip clock change for 6.16
>=20
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.16-rockchip-clk1
>=20
> for you to fetch changes up to 276036283716b9135525b195675ea42801bde204:
>=20
>   clk: rockchip: rk3528: add slab.h header include (2025-05-15 14:49:05 +=
0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
