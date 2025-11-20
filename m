Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684F0A41;
	Thu, 20 Nov 2025 18:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763661712; cv=none; b=ucd0ZQCwq7oeOyH3oLrla5Nsz7eVurT7XQ70bZTM1YmS8C2OvZ7t4eUJb3urq5IbJZZnPDhpFiy05vZheEnFVgIR7B9opvJjhyiv1Jcn4gJUlQXsjm0UyJpa8wdlF5ZZMiWYEXLw0x/XZxYYQAUx7TnY3MG90HJ+wmioEjZicTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763661712; c=relaxed/simple;
	bh=O1lgqQO1rPnioMIL/N11uQCIUh306m6w5d+VYhGjuK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN4hI/d1spVl6LgBqY57cES7zwaNVXcuDHDNfr4V4r30JJ4XNVcPHGpRotEjdKehyiTPwZQKyIDkyAwdwhA+eFxHbGeESr+kDEwS5RdJLlKd4qRDmKLug9TQEhzOT6hu/viPyaf+2ky4Ba3VkiAXwGRPKWGIO9EKM/nnSGG0i/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3gqHlvk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3gqHlvk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D97C4CEF1;
	Thu, 20 Nov 2025 18:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763661711;
	bh=O1lgqQO1rPnioMIL/N11uQCIUh306m6w5d+VYhGjuK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3gqHlvk81twLDfgfnTcSW1SZMT/IioQDLEI93f+wxPQ/3qTlxH9DH1Y59vhukQdU
	 B3qrCGAEMlz67nHhAf//CASey5oQxIjGPTcd+mUK3mmlZ2lGmbYV02u2GTtepjVLZI
	 /oTau3cKm7wdNvZaMgjvG8+8pLqAKuFMXEm6w7F/obNukQduzONir3URlTKKJFNlJr
	 9HiNShZzl2f1Udc7lyZfT37eSU4bvZDYvqylpvjmDS7OqBRtkJlCxAB1VD7AZI+WWf
	 XhHO1K09yiz5qUho+C4MOMnmI9ne//6Bx+NL7QjUF23HJTWkqBK2R2AOaMICi8JBzt
	 0Fc1b6SO856vw==
Date: Thu, 20 Nov 2025 18:01:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 1/7] dt-bindings: clock: thead,th1520-clk-ap: Add ID for
 C910 bus clock
Message-ID: <20251120-counting-trapeze-ea03dcedf308@spud>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hciV0fsKO5750iZC"
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-2-ziyao@disroot.org>


--hciV0fsKO5750iZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 01:14:10PM +0000, Yao Zi wrote:
> Add binding ID for C910 bus clock, which takes CLK_C910 as parent and is
> essential for C910 cluster's operation.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  include/dt-bindings/clock/thead,th1520-clk-ap.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt=
-bindings/clock/thead,th1520-clk-ap.h
> index 09a9aa7b3ab1..68b35cc61204 100644
> --- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
> +++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
> @@ -93,6 +93,7 @@
>  #define CLK_SRAM3		83
>  #define CLK_PLL_GMAC_100M	84
>  #define CLK_UART_SCLK		85
> +#define CLK_C910_BUS		86
> =20
>  /* VO clocks */
>  #define CLK_AXI4_VO_ACLK		0
> --=20
> 2.51.2
>=20

--hciV0fsKO5750iZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR9XiQAKCRB4tDGHoIJi
0jtfAQDWP31/ok/XHSOAXY4rVTGjq8mwEOqTxwqsWpG4YLsddwEAlZHkUga5QIVC
JGylv23X3GaAaW8Z8PE5rjNZmFN6Rg4=
=R26s
-----END PGP SIGNATURE-----

--hciV0fsKO5750iZC--
