Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967230;
	b=i9y+L8tB8+FHomDLcb8+AUkwq7NwQhuqC0FnbnLfN3iebtXRUGCX/MkraFLcSlFkbcfP
	 2tqMnFVJ6DQOAGHcSV1REr4i242FJGdKXKKOFgolo1IKE3WM16GdehvG6F1ktlYe2V6DP
	 v94tmxi9fFqzZyf8PZpNkw+PNbWrKmW31pzoSElovwWo7ogqCRs2x4L4M0xBgE3oPYBU5
	 oKyIhHJa7CUOGIzGKouKC1LGJzYLq6JDXMSxjaMU7EtQQNN7oXXJUfGEoajnDr1zq2y6a
	 kyymVwQNmtloCLZOiqEKOhZ2WoXj5If7mhLyY84g/2n8ORp/Z46g3ZSu6owN6PabNsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967230;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CJdF7YU7558EC/fyLpCrIC/iswIs8MrQY4LLw1gWtzQ=;
	b=H3ho7vETX8WXvA+IDcAS5KP9ooe0I0QpODq6+Z4dfyNfGHXW4hM9tLA3fWTEdjBSumhR
	 2XqH2WA7Bd81txL16wl8P28zNItkGer6rdiwDJWec92/raxz7lyOXv4LUlNh5Ic5F5PSQ
	 8DikrKDnKW4roPxwudM4CmGJfhYXscCucaDBMZpENQ+rH00Tvax+4pidk33vyT4vjxDMz
	 /0HkVvzKGcZpczZ1OE9zImaf4HCnu2QMdOD0JTjZ0FS/yWfmAIBBd4y4lDRz3IXc7v6BL
	 aYiKLGrduZO9ufwyk+5MkMdagea9u0npnqA/gLXh9wGsiNjPj6JqenUjqpA3xhOvzKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8E4Cxbb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E5606A329;
	Fri,  6 Nov 2026 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8E4Cxbb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D601F0089F;
	Fri,  6 Nov 2026 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967229;
	bh=CJdF7YU7558EC/fyLpCrIC/iswIs8MrQY4LLw1gWtzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W8E4CxbbTgWt+uzhlbeV6quessrtRvFwxFH9NjxZTLKi3oJ0jg+pl2A+I9EHn3gQX
	 w77LRq1Z4UfmPxMriaXlORDF6QemErNoYKJeAIR8DX/EzNdVFf1QW81aN4d7FUnJKS
	 8KYjbA0KnK9mfdEq2SWX+nCmlVMJ9za6pWfeNL4okNZXjuN9P1cMP29KiOHdtJ0QG2
	 RgHHxfmppb4JapPHSFU65RMThQ/uV4QwO0BfCHToAtj5OAn/GtksyG/FWYFCMEePVm
	 krNDDN9o9P6lwvMPT4SGGLQ6zOXgfqzeA5hmI7w5zueEhfWLuWJCQWl2ZNEH3pSFtz
	 +5WgbKuSmZTLw==
Message-ID: <sashiko-outbox-201392@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/5] clk: en7523: add support for Airoha AN7583
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106115852.189098-6-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
 <20261106115852.189098-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:13:49 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] clk: en7523: NULL deref in clk_hw_get_dev() before PCIe clk
  registration
- [Medium] clk: en7523: AN7583 MDIO clocks registered as fixed-rate
  clocks
--

commit aa0856354194d69ec115be8f509c3f8848e95a7f
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

This commit adds clock and reset controller support for the Airoha AN7583
SoC to the en7523 clock driver.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 8e24eef651a17..821a5f5ad4d8e 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -368,6 +377,138 @@ static const struct en_clk_desc en7581_base_clks[] =
=3D {
>  	}
>  };
> =20
> +static const struct en_clk_desc an7583_base_clks[] =3D {
[ ... ]
> +	}, {
> +		.id =3D AN7583_CLK_MDIO0,
> +		.name =3D "mdio0",
> +
> +		.base_reg =3D REG_CRYPTO_CLKSRC2,
> +
> +		.base_value =3D 25000000,
> +
> +		.div_bits =3D 4,
> +		.div_shift =3D 15,
> +		.div_step =3D 1,
> +		.div_offset =3D 1,
> +	}, {
> +		.id =3D AN7583_CLK_MDIO1,
> +		.name =3D "mdio1",
> +
> +		.base_reg =3D REG_CRYPTO_CLKSRC2,
> +
> +		.base_value =3D 25000000,
> +
> +		.div_bits =3D 4,
> +		.div_shift =3D 19,
> +		.div_step =3D 1,
> +		.div_offset =3D 1,
> +	}
> +};

[Severity: Medium]
Can clk_set_rate() configure the divider for AN7583_CLK_MDIO0 and
AN7583_CLK_MDIO1 when they are registered through en7581_register_clocks()?

en7581_register_clocks() registers every entry in soc_data->base_clks with
devm_clk_hw_register_fixed_rate(), whose clk_fixed_rate_ops has no
.determine_rate or .set_rate callback.  When airoha_mdio_probe() calls
clk_set_rate() to lower the MDIO clock from its 25 MHz default to 2.5 MHz,
the call succeeds without writing the 4-bit divider in REG_CRYPTO_CLKSRC2,
leaving the MDIO bus running at its boot frequency.

[ ... ]
> @@ -1323,6 +1559,18 @@ static const struct en_clk_soc_data en7581_data =
=3D {
>  	.hw_init =3D en7581_clk_hw_init,
>  };
> =20
> +static const struct en_clk_soc_data an7583_data =3D {
> +	.base_clks =3D an7583_base_clks,
> +	/* We increment num_clocks by 1 to account for additional PCIe clock */
> +	.num_clocks =3D ARRAY_SIZE(an7583_base_clks) + 1,
> +	.pcie_ops =3D {
> +		.is_enabled =3D en7581_pci_is_enabled,
> +		.prepare =3D en7581_pci_enable,
> +		.unprepare =3D en7581_pci_disable,
> +	},
> +	.hw_init =3D an7583_clk_hw_init,
> +};

[Severity: High]
Does assigning en7581_pci_disable to .unprepare cause a NULL pointer
dereference in clk_hw_get_dev() during probe?

an7583_clk_hw_init() -> en7581_register_clocks() ->
en7523_register_pcie_clk() calls init.ops->unprepare(&cg->hw) before
devm_clk_hw_register(dev, &cg->hw) initializes cg->hw.core:

drivers/clk/clk-en7523.c:en7523_register_pcie_clk() {
    ...
	if (init.ops->unprepare)
		init.ops->unprepare(&cg->hw);

	if (devm_clk_hw_register(dev, &cg->hw))
		return NULL;
    ...
}

en7581_pci_disable() calls clk_hw_get_dev(hw), which dereferences
hw->core->dev while hw->core is still NULL.

Also, pcie_ops pairs .is_enabled with .prepare and .unprepare instead of
matching .enable/.disable or .is_prepared, whereas en7581_data wires
en7581_pci_enable and en7581_pci_disable to .enable and .disable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106115852.1890=
98-1-ansuelsmth@gmail.com?part=3D5
