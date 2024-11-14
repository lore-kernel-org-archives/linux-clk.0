Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93E51AB6F1;
	Thu, 14 Nov 2024 21:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731618157; cv=none; b=SLokvr5Hc8wAgGzX5VE+IAubDwG4yuth7mJ5Now03/9zaL/WZSlwgbPAZ1EtCj8uY+7ZrF9dpR/YkcSN/IGifPH8ogcUUAvEHPGE52s+6LSSASuBuPDRkat393MAxd2F/kXCiQCF7kYMwRNq8OQyoowuYhs7NclzGb/d47SRI8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731618157; c=relaxed/simple;
	bh=7Ny8jBLlC1faSs+d+SgKuo5GECTaTBR5nVaEj3pd534=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ImlCg0RqZZwaKfUOcSt7dGtamlHeRmfwBBO6JbyXPpfu8+B9KbtHzLRe2htRydEqnYmB40fGliErjF1H8o9X73Vjixpdc2+yNIoV207LD09VCY8rU9+3buFZ8if1YrBChrTIsR7SjCSxaUpCETSbNDjHQBZBsUJlAkpXjEQn3Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TY1IrQj0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TY1IrQj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A4BC4CECD;
	Thu, 14 Nov 2024 21:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618156;
	bh=7Ny8jBLlC1faSs+d+SgKuo5GECTaTBR5nVaEj3pd534=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TY1IrQj0MpsSaKc5C7yUKfOL7uP7bp8/+V6IadrFHJTyTtc0sX0VKwt4MtGCA8/Hi
	 RElr/heq1lwIUj/1kYIrizo8ErGul4QlJ3dbmJKSvOBLtIMmogp+dYbXianGGfKY6E
	 e9YhqlLVXwV36ybiDW/8tvT+rlnUG0VnFUsIVXga9pLQCN+Jk1lUYosj7FRgxQMO5V
	 jGVYs7svLUYh7SfFLiEiAbUrb7AsA+tbs5k4T54KN1+eaQ+98Mgh4KA3v8N+8HQsI6
	 JD+nP9unqaHhId3uQUgUh0lXTnexUWH/LBZVTZVU6ytgxXRI0g+VCsXEMZEhUVnv6l
	 2Z5RuZpDfEMMA==
Message-ID: <3437542ab1b8ed9d6159b9f4660ad499.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-6-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-6-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 6/7] clk: en7523: move en7581_reset_register() in en7581_clk_hw_init()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:02:34 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Lorenzo Bianconi (2024-11-11 16:08:53)
> Move en7581_reset_register routine in en7581_clk_hw_init() since reset
> feature is supported just by EN7581 SoC.
> Get rid of reset struct in en_clk_soc_data data struct.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
