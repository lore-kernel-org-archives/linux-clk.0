Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F178179A8
	for <linux-clk@vger.kernel.org>; Tue,  2 Jan 2024 23:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3ZE47Lj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D17C433CA;
	Tue,  2 Jan 2024 23:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704238450;
	bh=WdepfEda+YXgv03KGYsOVF0L11R3Jotno5U9Y+c+TAw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h3ZE47LjM5boSq4RLVHmKErAtycl4JyTdvNrZ3PxDxYKvwG4TPvt4O4aNmSw5TLgC
	 AcSP/MYVa6BITFIehFgFK0hSo3RyInNOWVG67+DfMDaJcW0xlITSwcoPnszCdppSBS
	 YFWIPEsCPiepqqFN2OoFDAO1zmBCdz45egLiFwrN3KE3xqlZfpJD/XyVzmrD6K1wSS
	 C3jeTXS25kPl9t6q2AM2mQGgcg98FVguHpelPMH0rh+s75IU8wW1I/3KVO/65p+KgN
	 0trbD8rDBghJfn7RGkPJLcoGQIzOHBBZ6mPZP16fFM+t/93VVjCu/21xNzpkw+Mr8a
	 WCB137KrVv5GA==
Message-ID: <6276336e185b0c347a17722b9582edbd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jzfy28qdf.fsf@starbuckisacylon.baylibre.com>
References: <1jzfy28qdf.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic clock updates for v6.8
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 02 Jan 2024 15:34:07 -0800
User-Agent: alot/0.10

Quoting Jerome Brunet (2023-12-22 02:41:11)
>=20
> Hi Stephen,
>=20
> Here are the amlogic clock updates for v6.8.
> It adds few new clocks on the g12 SoC family, for DSI, CSI and the ISP.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>=20
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.8-1
>=20
> for you to fetch changes up to 5205628ab0bfe64952974d476ee001f6c7e0ef7f:
>=20
>   clk: meson: g12a: add CSI & ISP gates clocks (2023-11-24 18:08:48 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
