Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838105;
	b=ngZ0jySLw47PmXxHePrER7D4bo5H8pW1/wr6XTLFvtt6NGdKLVWYMNk50ZSa6TM9NYWn
	 UXZlmHwhWX+XbDDYGNkjEocYxvLVZsfc31QkdqWB7LRDZU0A2SPTLx7CLKBCQWGNOF41T
	 /RKBbsU5Sxa7ioT3ub3mJ5ZmbKkqbC6HEWhsP7WLczWu2ChqeXXWfWp7vTPG1pe3g2wfX
	 9ViF3BxIFqzCb0wdouxC4HcWwy0LDG+qmfGT2QqSO/6TojVtApCHbkIqM30fqpnivHhJZ
	 P5GrGagy5h4fRtu18/OCIsIacIWnRwzY4TvR9SAEV+GP5wnpqeGycF4Tn35tVeu79HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838105;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=73yYLSrxYp+5E8KgorDSDGALLhc63TH2dJs/z3r+roM=;
	b=bwkBUqLwf0hfk+j6LSSw5Y9f4xJDY6qn058L6e/EDC1mpBWkK3pZHzcPFgzNaNV21RZU
	 loAGeZfZhqUdbANo1hTZO5s3bxcsYYn+liIqjw54CS9NFJNjrT/asQKw0vr4re4xqJb81
	 lz7f4gfLIzHpMBhRXE/1ZKUA3ggupp5QAXry8ALVKZP6AQ9eLEezz8zsZB/RMOaoRlwhc
	 gBSCp8ML5WxXtXAAjl3A7rt2MjBFoYsUnfv/v9YwCYOuiChs616IMNfONce5boJrZeLGq
	 kMAiTnbGGze9EUFhSl7blst/RiRx1O4NuIjXVVvM+KTNRGbVIdX7WeBXmyWYdMucLdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrtWuKQk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD19606A31B;
	Sat, 24 Oct 2026 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrtWuKQk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECFF1F01825;
	Sat, 24 Oct 2026 10:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792838105;
	bh=73yYLSrxYp+5E8KgorDSDGALLhc63TH2dJs/z3r+roM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VrtWuKQkMFbaqU1EnAC93NMviIqfL7FLRki22LnRiiPcpASpe7tbBD2KxtjP+e5/j
	 IuBhCxpX+wVptLbKvmpb8Y0ef8CxTbEJsZo0ZHFJaDKEuSxsSYOAHO696BX7NjBmC/
	 5Wub8D1MsKxpMjetvUhRwAewIWRY5RtmGAL6PLdc5Ysl4vxjx1T/QXpzmdfe/xV/ar
	 qeCgKApR6amSbEd4CYim2+3ilob/O9MzUVQbOT2tAa6T39bSEd4B7Z50XA0c/T1NIs
	 Ue00ue/QQoIDqnYm9rbHLHTtf7dF7X3db1S8RXJ7duMp3WaIwX3OCsujgKhmQb0KPw
	 oNLxFPQp9xO7A==
Message-ID: <sashiko-outbox-183648@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: rockchip: Add RK3572 CRU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunhao Lu" <1579567540@qq.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-add-board-ok3572-c-clk-v2-1-90b98836be6e@qq.com>
References: <20261023-add-board-ok3572-c-clk-v2-0-90b98836be6e@qq.com>
 <20261023-add-board-ok3572-c-clk-v2-1-90b98836be6e@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 10:35:04 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: reset: rockchip: skipped reset ID 421 in rk3572-cru=
.h
- [Low] dt-bindings: clock: rockchip: CLK_NR_CLKS and ID gap in rk3572-cru.h
- [Low] dt-bindings: clock: rockchip: schema and example issues in rk3572-c=
ru.yaml
--

commit 23f6ead5b7b62aaf8bea62aacf6220f09c8b789f
Author: Elaine Zhang <zhangqing@rock-chips.com>

dt-bindings: clock: rockchip: Add RK3572 CRU

This patch adds the Devicetree binding schema and the clock and reset ID
header files for the Rockchip RK3572 Clock and Reset Unit (CRU).

>     dt-bindings: clock: rockchip: Add RK3572 CRU
>    =20
>     The RK3572 CRU uses the PMU0 GRF for the AUPLL reference mux.
>     Describe the controller and define its clock and reset IDs.
>    =20
>     Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
>    =20
>     - Documented the xin24m input.
>     - Made the PMU0 GRF phandle required.
>     - Updated the example.
>    =20
>     Signed-off-by: Cunhao Lu <1579567540@qq.com>
>
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3572-cru.=
yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3572-cru.yaml
> new file mode 100644
> index 0000000000000..89e360ccb8846
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3572-cru.yaml
> @@ -0,0 +1,57 @@

[ ... ]

> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xin24m
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: PMU0 GRF register block.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +  - rockchip,grf
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@26090000 {
> +      compatible =3D "rockchip,rk3572-cru";
> +      reg =3D <0x26090000 0x60000>;
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +      rockchip,grf =3D <&pmu0_grf>;
> +    };

[Severity: Low]
In Documentation/devicetree/bindings/clock/rockchip,rk3572-cru.yaml, the
example node body for clock-controller@26090000 uses 2-space indentation
instead of the 4-space indentation expected by dt-check-style in strict mod=
e.

Also, since clock-names only has a single entry, should it use a direct
const: xin24m rather than a single-element items list, and should clocks and
clock-names be listed under required and included in the example (matching
the changelog notes left between the two Signed-off-by lines in the commit
message)?

> diff --git a/include/dt-bindings/clock/rockchip,rk3572-cru.h b/include/dt=
-bindings/clock/rockchip,rk3572-cru.h
> new file mode 100644
> index 0000000000000..9c586d9e9ae91
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rk3572-cru.h
> @@ -0,0 +1,560 @@

[ ... ]

> +#define ACLK_CRYPTO_NS				525
> +#define CLK_PKA_CRYPTO_NS			526
> +#define PCLK_DDR_MON				527
> +
> +/* Secure clocks */
> +#define ACLK_CCI				600
> +#define SCLK_DDR				601

[ ... ]

> +#define PCLK_WDT_S				613
> +#define TCLK_WDT_S				614
> +#define HCLK_TRNG_S				615
> +
> +#define CLK_NR_CLKS				(HCLK_TRNG_S + 1)
> +#endif

[Severity: Low]
Should CLK_NR_CLKS be dropped from
include/dt-bindings/clock/rockchip,rk3572-cru.h, and should the secure clock
IDs starting at ACLK_CCI be contiguous with PCLK_DDR_MON (527)?

Exposing CLK_NR_CLKS in the Devicetree binding header couples the DT ABI to
the total number of clocks if new clocks are added later. Rockchip clock
drivers calculate the maximum clock ID dynamically via
rockchip_clk_find_max_clk_id(), and CLK_NR_CLKS was previously removed from
other Rockchip binding headers in commits 2dc66a5ab2c6 and fb234516c5a0.

In addition, jumping from PCLK_DDR_MON (527) to ACLK_CCI (600) leaves an
unused gap of 72 indices (528..599) in the clk_hw pointer table allocated by
rockchip_clk_init().

> diff --git a/include/dt-bindings/reset/rockchip,rk3572-cru.h b/include/dt=
-bindings/reset/rockchip,rk3572-cru.h
> new file mode 100644
> index 0000000000000..a789475326818
> --- /dev/null
> +++ b/include/dt-bindings/reset/rockchip,rk3572-cru.h
> @@ -0,0 +1,713 @@

[ ... ]

> +/* CRU-->SOFTRST_CON87 */
> +#define SRST_PRESETN_CENTER_BIU                  417
> +#define SRST_RESETN_TEST_JUDGE_24M_CENTER        418
> +#define SRST_RESETN_TEST_JUDGE_CENTER            419
> +#define SRST_RESETN_LINKSYM_HDMITXPHY0           420
> +
> +/* PHPPHY_CRU-->SOFTRST_CON00 */
> +#define SRST_PRESETN_PHPPHY_CRU                  422
> +#define SRST_PRESETN_PCIE2_COMBOPHY0             423

[Severity: Medium]
Is reset ID 421 intentionally skipped between SRST_RESETN_LINKSYM_HDMITXPHY0
(420) and SRST_PRESETN_PHPPHY_CRU (422) in
include/dt-bindings/reset/rockchip,rk3572-cru.h?

All other reset IDs in this header are sequential 0-based integers. Leaving=
 a
gap at 421 results in an uninitialized zero entry at index 421 in the drive=
r's
lookup table, which rockchip_softrst_assert() and rockchip_softrst_deassert=
()
would silently treat as bank 0, bit 0 (SOFTRST_CON00 bit 0) if reset ID 421=
 is
ever referenced in Devicetree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-add-board-=
ok3572-c-clk-v2-0-90b98836be6e@qq.com?part=3D1
