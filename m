Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04801AC44C;
	Thu, 14 Nov 2024 21:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731618105; cv=none; b=BMY/E7RixM/Lj/18GfycJw/E3fJ4WfCtYoOcI51tt7KPUjyqjIqIUxQqUnyLBZOhYa1F4ySFO4Xm/GqPQcAfcpRb8Ay9korF4dRLtZ7FF6FfuMr2quV7AR6m2sybql8B4TmHjNGDTHmujNoVLBknccE5Bq3MX0zQ0u9iBZWvjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731618105; c=relaxed/simple;
	bh=JbVEEkL8lglYHKBJSgT9JiBSY0i5Tm3rez3G/cRCJ9g=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mapxz314jZoSqMCw825hfu3T/4CvSTHouFr+cLIGpTlvryqxM059X28A0hs5DyPcMFMUQg+nFp29fib7wogJ+tz9K07kd33oDkpmOxoKpTe6BZNCXD/+Qg1yGq9PJcmfS3uysI4Jl2HNijhIcH4+O+RmMwkVPDMI+nPd9W5q7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKDixHel; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKDixHel"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63923C4CECD;
	Thu, 14 Nov 2024 21:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618104;
	bh=JbVEEkL8lglYHKBJSgT9JiBSY0i5Tm3rez3G/cRCJ9g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eKDixHelJokBuECvd+Kz/bmmlvVRmVnIODXaAat2ZVyHL2dgImTv8UTgnA5RZxkj4
	 Ib+0IKp2/GpvyxBG3e6yA1Ewstc68XxZzfqHxi4gnzMqCp38FIXy0JjAkCkYGhGrbO
	 UtoqLw6U56vvkWr7N/6tQW8au50JybT36Fr1nv2I2l3irg4QKYYPDgZqnxuMsoP6PN
	 XkkFR3mLUs38U0QzBA0bHAnxgt3VnBsmWW2eJ2jnTF6DjXMnfrioypHl126QDNaHFt
	 Df7i0DWqJHdkb/1doRF02XK/+HcjpKC5GEvE6glKcV8QZte1br8VY/eL9xhc+wOoD3
	 8q9Hs5DUvNUJg==
Message-ID: <f7298afe9999b1f6f1bca0891c999cd0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-3-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-3-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 3/7] clk: en7523: move clock_register in hw_init callback
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:01:42 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Lorenzo Bianconi (2024-11-11 16:08:50)
> Move en7523_register_clocks routine in hw_init callback.
> Introduce en7523_clk_hw_init callback for EN7523 SoC.
> This is a preliminary patch to differentiate IO mapped region between
> EN7523 and EN7581 SoCs in order to access chip-scu IO region
> <0x1fa20000 0x384> on EN7581 SoC as syscon device since it contains
> miscellaneous registers needed by multiple devices (clock, pinctrl ..).
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
