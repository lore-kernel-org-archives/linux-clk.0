Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBC77B30
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 23:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IepUVHVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B882C433C7;
	Wed, 13 Dec 2023 23:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702510031;
	bh=M6tdt+BiuyB04nl0vTm8rispV+/AsHPHIKHuthhP4Hg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IepUVHVzOe8R3dfrMvWLh5isQEwEZu7vRkz6m7rBBDxs2dT+sdcKd+rMUPuzzp6QJ
	 laKQJxzzuQFjHacr5iWThV3HCKALiRonoRx5LLciGevEEEFw9YXc9yeCQmIlQA+Mob
	 YZHzfQpHnrn6/p683dgw892CHTdhHc4g3o+aMOyWZwaPqea1qAyVIXoTzEAlYGMDlH
	 bUc6NT/gyGpXqjU+WGUaceeiIgaldo1lz09H0ycd++oo7lmggC5Pe6qkS8ztOMU/rk
	 C2fpE+sP54BZbggKMrCmW9IS4yxMRgcVAKY/4m+vQ7e50Dd1ACojkMEG7chGw+Ho+i
	 6ADl/95sF2Wyg==
Message-ID: <f994b83929b1493bddad0a45d6d47d70.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5734430.DvuYhMxLoT@phil>
References: <5734430.DvuYhMxLoT@phil>
Subject: Re: [GIT PULL] Rockchip clock fixes for 6.7
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Wed, 13 Dec 2023 15:27:08 -0800
User-Agent: alot/0.10

Quoting Heiko Stuebner (2023-12-07 12:46:37)
> Hi Mike, Stephen,
>=20
> for a change, this time I have some fixes that would be really
> good to have in the current 6.7 cycle.
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>=20
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.7-rockchip-clkfixes1
>=20
> for you to fetch changes up to 99fe9ee56bd2f7358f1bc72551c2f3a6bbddf80a:
>=20
>   clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name (2023-11-28 10:30:59=
 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
