Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122A5146A98;
	Mon,  8 Jul 2024 20:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470117; cv=none; b=IZlJQA58Nat4wnKrhAqsaM6u2ogEXnvwmVfi1BUwhzfbuqTi9LKPLmqknofmCJ+M/ASUyKmHMTmJuhIqawZH18ie5bAmd/p4HH/W9gjWiiBsbgF9bZrYlTmKXVUXwUloKRWdUe1LE3lbtsBEimx3lUIP2/TCfra7RENygWHNWxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470117; c=relaxed/simple;
	bh=h0lA3stJyxR175NFaZjaVtmYP7b5xzxmndEVKASRq54=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mVOFrq4xyg0eZHTzmiPIR03vfHZ+dxVZQcu7c1Iu8T6b1iKwoUZIRG+xnuLcqKUljn7p0iuTgPX1D6GXQCaiLVwWAEDf03AEMT0IhP9gjgnEXaq52d41JqUdp/67rsqFecBiqCa1j0t/xubIBTHzoG7l7YVw0hwmR/2GpN6OLSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pl7ee+Y3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pl7ee+Y3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2920C116B1;
	Mon,  8 Jul 2024 20:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720470116;
	bh=h0lA3stJyxR175NFaZjaVtmYP7b5xzxmndEVKASRq54=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pl7ee+Y3BsZF71mOdRCoH7FnRU/jxFqlfGc9wGetMsc8KoFOIQ/RQegJK/526/5Eb
	 9rZy7PXvHmMyeCk/tTTCuYT8ysyH2YnxScS2yc4BEWa2YF/FEVsGDBvS382b+AHzVs
	 zJEW63DD3lia/9AvVa0kUVNEs+drevsCfwL1yXu9RAF1U3wy0kUaDPN/ZieE5CoqLa
	 d1cnYIhkKhGFARUggiS39Bnaj7AHn1yLAkpyn9bF2QH8UF6lsFgU/5PrDwaYz3d0XI
	 j6tbmPCxGn6kNZ5Rr8dL+DovG4wQRrYYmg1H4Ne7PAuoCgseAH3ct7JkkpOaVqUkIO
	 vcgrDqQn0ogXw==
Message-ID: <86f495fd0518007ce417599e571f49b0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <43276af5f08a554b4ab2e52e8d437fff5c06a732.1719485847.git.lorenzo@kernel.org>
References: <cover.1719485847.git.lorenzo@kernel.org> <43276af5f08a554b4ab2e52e8d437fff5c06a732.1719485847.git.lorenzo@kernel.org>
Subject: Re: [PATCH v4 4/4] clk: en7523: Remove PCIe reset open drain configuration for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, lorenzo.bianconi83@gmail.com, conor@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com, catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 08 Jul 2024 13:21:54 -0700
User-Agent: alot/0.10

Quoting Lorenzo Bianconi (2024-06-27 04:04:25)
> PCIe reset open drain configuration will be managed by pinctrl driver.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
