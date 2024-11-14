Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869732BD04;
	Thu, 14 Nov 2024 21:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731618065; cv=none; b=WSUHQWKmAxo6qdfiqgSZKNWdstlA11wWeQOoCE0qd05LQfnfVKZnGn4P22NL9ATIcXRIS1vM6T6NbOw7S5pfwCN2asXs8Vjn63/2yBpd5hGfUl/TKjSOIqMOOFGNk4nIKkGmg9f8uTXHwhgso1xZ/d3PHWYF/KhWfc1aD2l7FSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731618065; c=relaxed/simple;
	bh=Ke4CSsmoo37ob03EFZnj/Ddi/Mx2+bZe+XEedCadk4g=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=eVVMcGOhAYrOhjR5tFvpEArzGFC0MKXjecu0VvfXFDY0Ujm6JWExSRpJc1KxlT8LtLbYqOCN6zfNziz1C0H/Di5wZSy+62i8flPqUggT/flfz5oF8ZycLfG4gW5lM+sLgMJ0Tbp6Y62XDcOTQJEPQh1XX+7fvKliyDp0Zwj0PwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsBHO+eO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsBHO+eO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FBEC4CECD;
	Thu, 14 Nov 2024 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618065;
	bh=Ke4CSsmoo37ob03EFZnj/Ddi/Mx2+bZe+XEedCadk4g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EsBHO+eOl9nchowEo72O8J1roMutK49GO/Rjk2Cvppzm6k7UA9YheZMuyWxHMF+Tl
	 QX6uBrLA+MUntz2su7sPm82Ho6Sjit8KSlOE5pzrYpu3zROeBFQrUeCEjdyF+Yxgx5
	 0LmGhrLtRfEiraKWw9rmx/61Z1Prn5Q/U7AMKHNmfE4tLsJpp8MerjdIUQKxQOc985
	 gSxNcZHQcM1KmI2WUnkHWx1VvEL2cJ9hsFbxEgO3xf/Zy5L9BWr/rjWOtpIPP356rd
	 VCo40Edn5NrQS4/g9Xb2J+zM6AG4B3WVREE6KITbZrzdhEcLbQYWwQEaGMXvuHy5hG
	 fPaFe/7k+ez4A==
Message-ID: <cbee144512ba1f4c1dce6aac7f6012e5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 1/7] dt-bindings: clock: airoha: Update reg mapping for EN7581 SoC.
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:01:02 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Lorenzo Bianconi (2024-11-11 16:08:48)
> clk-en7523 driver for EN7581 SoC is mapping all the scu memory region
> while it is configuring the chip-scu one via a syscon. Update the reg
> mapping definition for this device. This patch does not introduce any
> backward incompatibility since the dts for EN7581 SoC is not upstream
> yet.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
