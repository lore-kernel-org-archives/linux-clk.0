Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D3D1AC44C;
	Thu, 14 Nov 2024 21:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731618114; cv=none; b=Id6wBJKLfLzXdS5Uaa16HsCo9IjznkjnMCmifmalJi4MOgWMfKgDudUkW8MqbYWHGFz9/m3RyWwzKP0evm5GeA0fvAAA9X3sCSzso6WfKUPgj5soZoa97qme1e2arv2g2WkeNwolrWvRRnznx9Ca8een9/+sdlBg6e1+zqCJPck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731618114; c=relaxed/simple;
	bh=ZS31F9JNh91PoOVQoiqXN/QhKMilDV7i7W7at0m8jOk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=QZt175fPHF4qTiTsKDtMhpF2wPkUj5AJ5kvVLclm1W/cJPZhSKf8gU6T+LJhhZpMImR4/jfobGph6AQB76ZqJOZXuGrFxYEt/182r9CqXaOzCqvyUxZ4p066T2lL7fOdnzeQg8cxxMMY/u1zYhdJqmwy7XXVxygG2k2dKF4yjXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vdwigqz2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vdwigqz2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCE2C4CEDC;
	Thu, 14 Nov 2024 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618114;
	bh=ZS31F9JNh91PoOVQoiqXN/QhKMilDV7i7W7at0m8jOk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Vdwigqz2AbtaalJaYu6wicRZ1j7vzp6sdoExqhqRrA2u8JisOLpG3QsbfRrN8/DAE
	 zE7w7Vr3RT5bgEwSeYSGdNfS5rovrL4CmQ3Zd092ulX6Yy3BkOi3L86wx9rk0Rab6P
	 WaXNEOwqZLj+sAVS9ZLLRLz1Igj5611LM6oVXAlDdow7maduiuf4PFyA1FBtv+ziOZ
	 LmQlNK8Nn2CUg4yb2QJp33sgEglMK1tyrp/5EE29hoaZoSisjY1LFGeuepvrt2Ohyi
	 BzvxxfCHx2H9f5MbB52xLjGA8AccMxeJxcDPsKCaQ5drofIN4Z734h3FD55axatov+
	 NSzoXlk5n9L8Q==
Message-ID: <57e3bcb03685a8d88b50ab1993701cac.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-4-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-4-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 4/7] clk: en7523: introduce chip_scu regmap
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:01:52 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Lorenzo Bianconi (2024-11-11 16:08:51)
> Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
> memory area via a syscon node. Remove first memory region mapping
> for EN7581 SoC. This patch does not introduce any backward incompatibility
> since the dts for EN7581 SoC is not upstream yet.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
