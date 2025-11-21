Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0106423C8C7;
	Fri, 21 Nov 2025 05:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763702451; cv=none; b=IDEll/Xe/jt3iUlzm1LLq6LqbgHp5NDRh5+BJUZAvJrU02hdVNFKZa/IKICHg1c2x+ldlti1hMKyIcHnI4KBROGUEOmGJOUsZ/i2CUNgcjqmdRbyH/+Mee2V/CTGRx+zD/6Xh3Y0wiFWzWTjOw8vVnpH3skCFszbsLkFYU9gvQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763702451; c=relaxed/simple;
	bh=Siiw7pVgduRMyqsIBGRHkzNydO8FFZun7CIgfPDv+1U=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=IqJmAWhsRymFL64u2aNapRtLQOOahiRna560RfkRQcbIRYJXeLHBYr3HtBfTrfOjGV+s3BVSKAzzXgLgyTS1RZ94gAjfVKtACVqclENbnlMhGEMWeKJNciNV7ZFqSAlbC/LAE8w7DFCyZ2QXeTx4caCR1TaLrrBZbxC9PLwAgcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XF4XP6cM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XF4XP6cM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BABC4CEF1;
	Fri, 21 Nov 2025 05:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702450;
	bh=Siiw7pVgduRMyqsIBGRHkzNydO8FFZun7CIgfPDv+1U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XF4XP6cMSXtfX6GojvsSr2wWuahnrNFeWRINIQYMm328w4pgtcYWyII2aHvOe9C7M
	 9u9dwjEYpoM+LybfIPfR3FvxhzdoC3C3RQA1f7l0KbZwN1uE0r1RZIov1B1qbey8tE
	 3bIj+dcg8faBEFC/JnEwZBc/+OJo5urkgmYVcKkx0dXjAPsxePlsCYUUEczaSPN+SE
	 L/CMHTlfL2kw0zoCDVfhqfTe7qpB2l8oVQxjCEguIs5EhJTTzjUEGhrT447fkaJonq
	 vLas31xZZSTWLfw+LuuP4xP37kp/j234rJpjJXYPeULPaGS/LS+SdYciYf8jzW0gfh
	 lRkCi9sgpn1FQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114070512.855008-3-yuji2.ishikawa@toshiba.co.jp>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp> <20251114070512.855008-3-yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH v3 2/2] clk: visconti: Add VIIF clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 20 Nov 2025 18:56:54 -0800
Message-ID: <176369381444.11952.3963774406317821182@localhost.localdomain>
User-Agent: alot/0.11

Quoting Yuji Ishikawa (2025-11-13 23:05:12)
> Add the control sequence of register bits to handle the clocks and the
> resets of Video Input Interface.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---

Applied to clk-next but see below.

> diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/=
clkc-tmpv770x.c
> index 94a736da6..1e2e8d643 100644
> --- a/drivers/clk/visconti/clkc-tmpv770x.c
> +++ b/drivers/clk/visconti/clkc-tmpv770x.c
> @@ -18,8 +18,8 @@
>  #include "reset.h"
> =20
>  /* Must be equal to the last clock/reset ID increased by one */
> -#define CLKS_NR        (TMPV770X_CLK_BUSLCK + 1)
> -#define RESETS_NR      (TMPV770X_RESET_SBUSCLK + 1)
> +#define CLKS_NR        (TMPV770X_CLK_VIIFBS1_PROC + 1)
> +#define RESETS_NR      (TMPV770X_RESET_VIIFBS1_L1ISP + 1)
> =20
>  static DEFINE_SPINLOCK(tmpv770x_clk_lock);
>  static DEFINE_SPINLOCK(tmpv770x_rst_lock);
> @@ -32,6 +32,10 @@ static const struct clk_parent_data pietherplls_parent=
_data[] =3D {
>         { .fw_name =3D "pietherpll", .name =3D "pietherpll", },
>  };
> =20
> +static const struct clk_parent_data pidnnplls_parent_data[] =3D {
> +       { .fw_name =3D "pidnnpll", .name =3D "pidnnpll", },
> +};

This is wrong. There's no "pidnnpll" in the DT binding for
toshiba,tmpv770x-pismu 'clocks' property. Please send a follow up patch
that cleans up the usage of clk_parent_data in this driver.
