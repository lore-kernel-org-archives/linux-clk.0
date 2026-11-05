Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910211;
	b=LJKV5s1uF1br/fGyLHMSLS24/BnOd4JZs359Tq0NfhwoAKNUy1okm6zw8ajN3cV6RgSe
	 tpppGY5DB1Zj2Bwnv5I5iYfdRhU5v0+Vd3bExHH1cJ1mMUVlTPQJaOj57gc3vUQ/T7zCC
	 nqjOZXmoHkpURHkkbodxiZ6vhBWKmR6etumQxyOqHc9DUcGEi13vbVLEjoyPR5VlhsjvM
	 7JQW787N9dRHdBhegcGyf7ceqgRZ42QTCoyQFrY+Xfiwr4qt/m0ammB4WdiZyBXQ/MrIb
	 4O/ODtpzf4+R3SRTlPGFQ/L3Y5MJS1nvrERSeF0I3+6+ShXN4Snolxmz0RDYLahmdHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910211;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EW+t71jhy7LMxyaA2zPHlVI+DPJ5VusFQchtnKOjjO4=;
	b=XCogHgPW/DSpv7BMVSkXfirB0hojc0L9frQe5ntjBaMCR64JvXYbMocp2IYAuZMd8x1O
	 hiNpzYqzee98ITXIAOxpnv5DkUmzTWib3eGxON+G36aEgPKkOCuhd0IueDu81zdGY6rmI
	 D/T8HPPdP4uN6JqTbVsd0w1ilRKF8vrK+88rn4d4kY3P3BRsJK+y0l+Ciqe1OhotevUIA
	 v9iLbPL9ehCkoUPCUSxt+MIigqUQdgADrQTfPKCivAJ75TkfMYC8gAFM04ZBvCg+RC2Xe
	 Sh8dpOpFAXuxQA2y6ofsctLpLXKBj4GEcrXtMVphuN+txS5dA7EydGt1z3b+zG6zRDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WtYRHUl/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F80A606A329;
	Thu,  5 Nov 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtYRHUl/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698F61F008A1;
	Thu,  5 Nov 2026 20:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793910210;
	bh=EW+t71jhy7LMxyaA2zPHlVI+DPJ5VusFQchtnKOjjO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WtYRHUl/waP6OoYRdcQo/GE3JvGS8fKocRo+cJOuPumx17rncEQclB5f8h6X68j3Q
	 RW729mDnYA33mXjmRcPotZRj7xg011VRnbjMvwfcdijHAl9yl0tke8azO0LeAPVmCY
	 JG7dkMPDjpaxxx/sgbJfnjuEQkPQaKzIGQD+NG4n2mTtPvNGx8v/rf/OejnIoAyUsO
	 DP8dyNV6cLmeEC4F8jU09BY2MZ6eDBNCSEVd+PzH32dMzkqrvMxvamTQdtfJ9p9aZR
	 s8NVrboS0XwdAsXv36hp3JILfnfsthzQFZQTrXG6FmQv5QOkrKI4li9q77DnH3em8B
	 yLVv1IovvmBvw==
Message-ID: <53323b7e-5169-4a36-a051-ed1eb1718b7d@kernel.org>
Date: Thu, 5 Nov 2026 21:23:20 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: soc: introduce
 toshiba,tc9564-config-syscon.yaml
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-2-elder@riscstar.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261104004332.2141282-2-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2026 01:43, Alex Elder wrote:
> Define the binding for the system controller that implements the clock
> and reset controller functionality present in the Toshiba TC9564 SoC.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../toshiba/toshiba,tc9564-config-syscon.yaml | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  include/dt-bindings/soc/toshiba,tc9564.h      | 46 +++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>  create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
> new file mode 100644
> index 0000000000000..5a241a9c915d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/toshiba/toshiba,tc9564-config-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC9564 Multifunction System Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description:
> +  The Toshiba TC9564 is an SoC accessed by a host system through the
> +  upstream PCIe port on the PCIe switch it implements.  The switch
> +  includes an embedded PCIe endpoint that provides access to various
> +  SoC peripherals via its BARs.  These peripherals include a simple
> +  controller to gate internal clocks, as well as a reset controller.
> +
> +  The clock controller uses registers within the same page as a reset
> +  controller, so this system controller controls access to both.
> +
> +  A total of 21 simple gated clocks are implemented within the SoC.
> +  At this time, support for enabling and disabling only a subset of
> +  them is provided at this time.  Similarly, the SoC implements 13
> +  resets, but currently not all of them can be controlled.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: toshiba,tc9564-config-syscon
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      Clock ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
> +
> +  "#reset-cells":
> +    const: 1
> +    description:
> +      Reset ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@0 {
> +        compatible = "toshiba,tc9564-config-syscon", "syscon";

I disagree this to be syscon.

This is internal to the PCI device. I read Daniel Thompson answer:
https://lore.kernel.org/all/auOI8LbZNWbNGJuN@aspen.lan/
And I accept arguments that you want to re-use a lot of existing
bindings like DWMAC and so on. Syscon does not count there.

I remember you posted somewhere full DTS, but now I could not find it
again and I do not see it in the cover letter here.

So again, why does it have to be a syscon, which is pure
internal-register-access thingy?

Best regards,
Krzysztof
