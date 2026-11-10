Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307982;
	b=ldPCKOIXU3+GkSNVLRLvDNFJ2xaTXLLH3MgppZ2Az6/awwY7L2YBB6LxIT4cH45AcUIN
	 C9etxDSc3WiuedPMdDioaVuSWeOW6Qu5ekyCQmsE+ZeL1s1cNw6tGfniS8DFhNOZaxbUq
	 FCLQ237FdRnDhJMCJCQ+7K1a7Y/1PZuU0y2DDPmJTkRw0oK67y0JmCsud5+Sxu7FYezf/
	 L+YGvf/hrwRpfb61LWqt44HwXDWKE6Yyt8UHpRYG90hlE5hTIZrW24Rqd3SPHLQDCk5br
	 6tU3Ci4OiSTA9cKMuxW60/TXr7DtlPXh91ITI+l6k+G2zdC9uO45cj5fUJ1Vnv9fMTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307982;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OgKc3c5QH5H+T6m8YvXodkG+iDUitzJmbpA5RXrr4bg=;
	b=JKC9BISKY560yWIeFgXVPgEikxmSyYJ3+FRV3gMN++FMdU4yz/n98kRIAQ8h1prcMha8
	 ZZCasC6JrBsWuznrxgCm5hUiCzQs1YOcBXWPgoYZcNadn7JJDj+dDL7aj1PorZF1qzFIh
	 RjMctY3chQgo9ROPlcwF8afVw0MAOoQZO6oEdv5DWp+qDHAV0xDpQKkwfvV8W9jOr00kQ
	 xoKO8vgZYh9YcUpmuFaRQDSnV/tm9KzMwO5mIOcKznGd5lyrX6Ec2QQtTv5hhP7+cZffh
	 GVCrwThpMt8EKUmls8ojV4hovHMNc+10z7yo/kpjCoPV3vcX312rG8ztI0EGBADdeig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHLTICha;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AC606A321;
	Tue, 10 Nov 2026 10:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHLTICha
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467951F0089F;
	Tue, 10 Nov 2026 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794307981;
	bh=OgKc3c5QH5H+T6m8YvXodkG+iDUitzJmbpA5RXrr4bg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHLTIChaMVM9VPANu5liatvsy6XYB1dy5Wazg55lBlVZ1DQsRdPK52k7a7kodz65m
	 rk5X9viS7hdpACkERjdH/ZotGqlmV6D7NSsVZi0EH15uFXTINYuWpnNRSgYtrnYLRK
	 6oB276CdIqHqXBg2BxFapFsn0DSmvnhcEiajGE5up/aX9tuhg3RTChV3D5XCfgut24
	 AuYptDBT1X4TnTqVLYw4Jl6+JVKZksJgFJCM0PFdgu8DrQ5aw7bTvEhTEZqDgJ+lTi
	 1fp7767dz8rwMQrsymB+UjdOhm8G5vhcWRsk3EFAqiSmsP8VQH/4vBfb07xxjDEHA7
	 LRCpxniYRqtnw==
Message-ID: <sashiko-outbox-206899@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add STM32MP25 SYSCFG clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gabriel Fernandez" <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-1-667829cd290a@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-1-667829cd290a@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:53:00 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: clock: stm32mp25-syscfg-clk duplicates parent
  syscfg clock provider
--

commit 56dc8d49308b7af249ab11bbe59e951afa0c0726
Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

dt-bindings: clock: Add STM32MP25 SYSCFG clock controller

This commit adds the devicetree binding and clock identifier header for
the STM32MP23x and STM32MP25x SYSCFG display pixel clock controller.

> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-=
clk.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.=
yaml
> new file mode 100644
> index 0000000000000..027d14f28b0cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32mp25-syscfg-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32MP2 SYSCFG clock controller
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> +
> +description: |
> +  The SYSCFG of the STM32MP23x and STM32MP25x SoCs provides clocks, desc=
ribed
> +  by a clock controller sub-node of the SYSCFG node.
> +
> +  The provided clocks are identified by the macros defined in
> +  include/dt-bindings/clock/st,stm32mp25-syscfg-clk.h:
> +    - CK_SYSCFG_PIX_LTDC: LTDC pixel clock, selected in the DISPLAYCLKCR
> +      register among the LTDC kernel clock, used by the RGB parallel out=
put,
> +      the LVDS PHY pixel clock and the DSI PHY byte lane clock.
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-syscfg-clk
> +
> +  "#clock-cells":
> +    const: 1

[Severity: Medium]
Does this st,stm32mp25-syscfg-clk child node duplicate the clock provider
already defined on the parent SYSCFG node?

Commit 1b9482f8dfce ("dt-bindings: arm: stm32: add required #clock-cells
property") already added #clock-cells =3D <0> as a required property on
st,stm32mp23-syscfg and st,stm32mp25-syscfg in
Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml for this
display clock multiplexer, and the existing STM32MP23 and STM32MP25 dtsi
files already wire <&syscfg> as the LTDC reference clock:

Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - st,stm32mp23-syscfg
              - st,stm32mp25-syscfg
    then:
      required:
        - "#address-cells"
        - "#clock-cells"
        - "#size-cells"
        - phy@2400
        - phy@2800

Adding a separate reg-less child node just to instantiate a platform
driver goes against Documentation/devicetree/bindings/writing-bindings.rst
and leaves two conflicting clock provider bindings on the same SYSCFG
block.  Could the parent SYSCFG node remain the clock provider directly
(for example by registering the clock or an auxiliary device from the
syscfg driver)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-ups_mp25_c=
lk_syscfg-v1-0-667829cd290a@foss.st.com?part=3D1
