Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18722DECAA
	for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753119783; cv=none; b=nV2nBrf2EHv/lS++9EUAQrlbgxK6wRCZHjllIRLzkZ/QCjQhKAXKFRZf0RtelFMdbOhF3yYbcvWGUL6pz84UjsgX3SxYeUGEhvL+oXFbL9vcM6jBMa3Sa9QHEJPTMrF+CEon7wUZAJkRaOmbGUyFZMX+oSWudIHdfw7qf6k4lBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753119783; c=relaxed/simple;
	bh=XoJjYqS6/hSyXdRtMUnU0RZZfulFb6pXKIkPWE6tVOE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oX0f6jEKU2FHBEl/qXL4g7RxTQFe2+vpjbHWvoKq5mCjTOrC+0YCjuS5BwIILLelCtQnh2IGvH/hFEFJhQlPho3i2WIINBZsW0fJe1WCYF+0KcLCbUBU7bSWRYVMsnMEOjd8NiWYLMsCjdw25zzqwVewOAcldIW7d3Hv3orHNWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d19clrLf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d19clrLf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CA5C4CEED;
	Mon, 21 Jul 2025 17:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753119782;
	bh=XoJjYqS6/hSyXdRtMUnU0RZZfulFb6pXKIkPWE6tVOE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d19clrLfqVrlIKLaehbiYisqF1sSFoxxSb+XWsfdacSGi8mReu0kqAsXHt0fHA6eF
	 CelOUs3JD2kdhElZBtPH+BZOeGmvfyV1arj2ZDplvsysJHEbSXMXv8raGlaLU2SIXA
	 xsH1H0g9bA2HqVZVye9/AyoVvESQ6B4V4WzXDu3Z81b++QrRus0XoNdrVMLBDckUoN
	 TDbjJsHYRLM/FRSJYFTk9ydpQqrbx8yWTWBo2+jOU4hbqLYbjwcMldkeoUcVLngs6b
	 mbC3F1tPfRMOzgpS7xYZJX2uhcbkXHy+3Xe6SuVxVwzNYTSxRxEvv9pqvJApplnZpH
	 T9xZbE00CiyTQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j7c09pf23.fsf@starbuckisacylon.baylibre.com>
References: <1j7c09pf23.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 21 Jul 2025 10:43:01 -0700
Message-ID: <175311978158.4111.6766617410857124161@lazor>
User-Agent: alot/0.11

Quoting Jerome Brunet (2025-07-15 09:57:40)
>=20
> Hi Stephen,
>=20
> Here are the Amlogic clock updates for v6.17. This one is a bit larger
> than usual. It depends on the changes in your clk-hw-device branch and
> is based on it.
>=20
> There is the conclusion of a long standing topic around reset drivers in
> clock, this time using the generic helper to create the auxiliary
> device.
>=20
> There is also the beginning of clean up of the amlogic controllers with
> more coming in future releases.
>=20
> Nothing is overly complicated in there but it makes quite a large diff
> since it touches all existing controllers.
>=20
> Please pull.
> Cheers
>=20
> Jerome
>=20
> The following changes since commit ac32d031f508e46c19ab38d6ba8b53fc28df99=
45:
>=20
>   clk: tests: add clk_hw_get_dev() and clk_hw_get_of_node() tests (2025-0=
6-20 00:15:39 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.17-1
>=20
> for you to fetch changes up to 8a65268500b00ecee5402ef9f80618ff73f30707:
>=20
>   clk: amlogic: s4: remove unused data (2025-07-02 15:38:19 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next
