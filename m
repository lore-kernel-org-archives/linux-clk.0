Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BD5288C30;
	Mon, 15 Jun 2026 06:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503639; cv=none; b=ph/5mARLuwuN/JZ2koqvkz+0U33us2bCm9CtFZkrLHcv5oikh7QP+9QVDWu5rGh/QDfsSrN8WfkemZT8mdtbP+0XjDQ9ZkyhB67Xbl3kEbNC3YG28zESuFTuskT7mjqLOBt5HN+1kH3d2BINTbt1Ffyf5TkvR401sVEUefNON5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503639; c=relaxed/simple;
	bh=OvFkwwxq73FZwe0cJrWDvfiAej+0wFSea+Y7W0xSIXg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=A+TNfx7lfHcPb07U2+aiHxkCyim4U8NSBK4EjBwOHm40BuO8zwyj8zuzel9fCD0at4+FCGIOHdQb+eLQqCOI3QAIp14iY8n8WtLX7ZpLIxt04wuEf5qpbwM6OnubSpSm9u4MQEO6izd5042DzmT1zQpIgIUMFupE2VfHoEU4TX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=ZCNFX7Ci; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="ZCNFX7Ci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=JlUzqvWJoPmBtFYEWjkZ8IYl/0ScnYlNv
	f4G7+4Fle0=; b=ZCNFX7CiMScyaDsCawi+1domAzWxCs4u/T0DvOfVvBJyJf1dU
	uVB8Dr+V7pfgQF8yCNuHjD7JIu37TawVZIeQgKEs2vEVHOcucnD6pu+QldXEDX+b
	6dMTKIC0VAkDo4d3sh03MTmkOyWEXI4C34wTA6G0sEAqAxTT8qb4Qd2LA0=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUKvli9qLoMKAA--.9392S2;
	Mon, 15 Jun 2026 14:07:43 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: clock: ultrarisc: Add DP1000 Clock
 Controller
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: wangjia@ultrarisc.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260611-reformist-wish-75a73a1d2c49@spud>
References: <20260611-ultrarisc-clock-v1-0-2d93ebb4cc13@ultrarisc.com>
 <20260611-ultrarisc-clock-v1-1-2d93ebb4cc13@ultrarisc.com>
 <20260611-reformist-wish-75a73a1d2c49@spud>
Date: Mon, 15 Jun 2026 14:07:07 +0800
Message-Id: <178150362720.3055943.7661118151533529664.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781503627; l=5534;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=OvFkwwxq73FZwe0cJrWDvfiAej+0wFSea+Y7W0xSIXg=;
 b=I6/PlPlXlo7xmg+S9fb8qtk8KfqK7a3AS6hmDUdHdnSm9i/oziM2sJosXVME4hHAVh9x127Kd
 NdnrV6BjmLTB9ZEPObrsy1fIFoZ+64LgwdWJtf/ZkGd8M6dOLWg9dBQ
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnYUKvli9qLoMKAA--.9392S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw45Kry3ur17tF18Xw1fZwb_yoW7XFyfpF
	nxCFZ0yF1IyF1xuw4Iqa43A3Z3Ja10kFy7GrW2kr1jyFZ093WrtFsFk3y5ZFy8Xrs7A3yq
	yF1Uuw1ayw429aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoWlkDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgBcsa

On 2026-06-11 18:29 +0100, Conor Dooley wrote:
> On Thu, Jun 11, 2026 at 05:40:53PM +0800, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Add doc for the clock controller on the UltraRISC DP1000 RISC-V SoC.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  .../bindings/clock/ultrarisc,dp1000-clk.yaml       | 72 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 +++
> >  include/dt-bindings/clock/ultrarisc,dp1000-clk.h   | 29 +++++++++
> >  3 files changed, 108 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml b/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
> > new file mode 100644
> > index 000000000000..d4d3d851a079
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/ultrarisc,dp1000-clk.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: UltraRISC DP1000 Clock Controller
> > +
> > +maintainers:
> > +  - Jia Wang <wangjia@ultrarisc.com>
> > +
> > +description: |
> > +  The UltraRISC DP1000 clock controller is driven from a single external
> > +  oscillator input. It provides a system PLL with fractional multiplier
> > +  and post-divider stages, several fixed-ratio derived clocks for
> > +  the on-chip subsystem, Clock Configuration Register (CCR) divider
> > +  outputs for GMAC and the UART, I2C, and SPI root clocks, and
> > +  per-instance gate clocks for UART0-3, I2C0-3, and SPI0-1.
> > +
> > +  All available clocks are defined as preprocessor macros in
> > +  include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> > +
> > +properties:
> > +  compatible:
> > +    const: ultrarisc,dp1000-clk
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      External oscillator input clock used as the parent of the PLLs.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: osc
> 
> Clock names don't really have any value when you have one input clock.
>

Thanks, I’ll drop clock-names in the next version.
 
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - "#clock-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/ultrarisc,dp1000-clk.h>
> > +
> > +    osc: oscillator {
> > +      compatible = "fixed-clock";
> > +      #clock-cells = <0>;
> > +      clock-frequency = <24000000>;
> > +    };
> 
> Drop this whole node please.
> 

I'll drop this node in the next version.

> > +
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      clock-controller@11080000 {
> > +        compatible = "ultrarisc,dp1000-clk";
> > +        reg = <0x0 0x11080000 0x0 0x1000>;
> > +        clocks = <&osc>;
> > +        clock-names = "osc";
> > +        #clock-cells = <1>;
> > +      };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e035a3be797c..3331f1edf002 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27357,6 +27357,13 @@ S:	Maintained
> >  F:	drivers/usb/common/ulpi.c
> >  F:	include/linux/ulpi/
> >  
> > +ULTRARISC DP1000 CLOCK DRIVER
> > +M:	Jia Wang <wangjia@ultrarisc.com>
> > +L:	linux-clk@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
> > +F:	include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> > +
> >  ULTRATRONIK BOARD SUPPORT
> >  M:	Goran Rađenović <goran.radni@gmail.com>
> >  M:	Börge Strümpfel <boerge.struempfel@gmail.com>
> > diff --git a/include/dt-bindings/clock/ultrarisc,dp1000-clk.h b/include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> > new file mode 100644
> > index 000000000000..5e484f652b08
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +#ifndef _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H
> > +#define _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H
> > +
> > +#define DP1000_CLK_SYSPLL		0
> > +#define DP1000_CLK_SYSPLL_DIV2		1
> > +#define DP1000_CLK_SUBSYS		2
> > +#define DP1000_CLK_GMAC			3
> > +#define DP1000_CLK_UART_ROOT		4
> > +#define DP1000_CLK_I2C_ROOT		5
> > +#define DP1000_CLK_SPI_ROOT		6
> > +#define DP1000_CLK_PCIE_DBI		7
> > +#define DP1000_CLK_PCIEX4_CORE		8
> > +#define DP1000_CLK_PCIEX16_CORE		9
> > +#define DP1000_CLK_PCIE_AUX		10
> > +#define DP1000_CLK_UART0		11
> > +#define DP1000_CLK_UART1		12
> > +#define DP1000_CLK_UART2		13
> > +#define DP1000_CLK_UART3		14
> > +#define DP1000_CLK_I2C0			15
> > +#define DP1000_CLK_I2C1			16
> > +#define DP1000_CLK_I2C2			17
> > +#define DP1000_CLK_I2C3			18
> > +#define DP1000_CLK_SPI0			19
> > +#define DP1000_CLK_SPI1			20
> > +
> 
> > +#define DP1000_CLK_NUM			21
> 
> This is not suitable to have in a binding, move it to the driver if it
> is required.
> pw-bot: changes-requested
> 

I'll move DP1000_CLK_NUM to the driver.

> Cheers,
> Conor.
> 
> > +
> > +#endif /* _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H */
> > 
> > -- 
> > 2.34.1
> > 
> > 

Best regards,
Jia Wang


