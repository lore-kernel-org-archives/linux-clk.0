Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43B5215789;
	Thu,  9 Jan 2025 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736414191; cv=none; b=p7lahVao1XTh7Qp1bDnUFIgsXluJZeFXlCUCBVYeJRjmUAHln3Z53EUZqaapjscnHgiTaPNX31M85dUIXRfeeZ7SvafvWXc014oDZnuzJbut4JoeK4iKE4x1TlD9beycMNWvpMn7Kx0siyP9T/C+ojAivV8DLAdOpeXZeMm0zjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736414191; c=relaxed/simple;
	bh=0xssGUaTU/N9kw20xJoCUInNv2QQ7gksj+PFGnZRZQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWCE0+pQMJb2qw0qaLQ/ZyuSJHkxXkZKmwyDAdcnzMj2mZh0pnFy1M2UowGuL4r5YtkCGRGvL2n6d1lr0yH2whI+UfG3T694yKqXkITtEj4VFxn2C5meu2/U8Nt12EY5bz5e708wGPSyNK/h9gC6VRbM3IHfHs/b7CnxyMsXt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=S35kHxXn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="S35kHxXn"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A52F725B74;
	Thu,  9 Jan 2025 10:16:25 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drfea6D4_RPN; Thu,  9 Jan 2025 10:16:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1736414181; bh=0xssGUaTU/N9kw20xJoCUInNv2QQ7gksj+PFGnZRZQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S35kHxXn7ZtR1jTBLNzkbBHuUJlmcfM/5tc6JCxr6jxGws/4//S75oR1ea4UmP5jy
	 p+grjNMpyscc9x0l292GmqIFCBu+I/9c+7iOrhPkjO9cLduPwaLrv8/Cs9mP6j3QRA
	 iZYVVvGYw5yUEVMa9S08jVZv4AmE2HfNm622oBJxFHnRt3C/Fx98/Q5WtOMxuZe9Ck
	 qp+0arF1FlKvR5Bkd2iNeU7S+ANO4tzABcIyRrKK+A1688UYSl7+5h7zsM3aLJvTx0
	 7UlzM+80DltqU+Hy14nrXlcuQ/wkbtA/2r8wJiIRMI0/QCB0gyCCjduGhMfaLFfUvF
	 5/N4VHDKyij3g==
Date: Thu, 9 Jan 2025 09:16:12 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Document clock and reset unit
 of RK3528
Message-ID: <Z3-T3JwcsW0xYKvk@pie>
References: <20250108114605.1960-2-ziyao@disroot.org>
 <20250108114605.1960-3-ziyao@disroot.org>
 <tep74dy3oc6y2wwhp6bthv6brhkge7cojzrtj6x53lvtsws4g5@areqtyxhyayq>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tep74dy3oc6y2wwhp6bthv6brhkge7cojzrtj6x53lvtsws4g5@areqtyxhyayq>

On Thu, Jan 09, 2025 at 09:59:25AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Jan 08, 2025 at 11:46:02AM +0000, Yao Zi wrote:
> > There are two types of clocks in RK3528 SoC, CRU-managed and
> > SCMI-managed. Independent IDs are assigned to them.
> > 
> > For the reset part, differing from previous Rockchip SoCs and
> > downstream bindings which embeds register offsets into the IDs, gapless
> > numbers starting from zero are used.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../bindings/clock/rockchip,rk3528-cru.yaml   |  67 +++
> >  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
> >  .../dt-bindings/reset/rockchip,rk3528-cru.h   | 241 ++++++++++
> >  3 files changed, 761 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> >  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
> >  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> > new file mode 100644
> > index 000000000000..19dbda858172
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/rockchip,rk3528-cru.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip RK3528 Clock and Reset Controller
> > +
> > +maintainers:
> > +  - Yao Zi <ziyao@disroot.org>
> > +
> > +description: |
> > +  The RK3528 clock controller generates the clock and also implements a reset
> > +  controller for SoC peripherals. For example, it provides SCLK_UART0 and
> > +  PCLK_UART0 as well as SRST_P_UART0 and SRST_S_UART0 for the first UART
> > +  module.
> > +  Each clock is assigned an identifier, consumer nodes can use it to specify
> > +  the clock. All available clock and reset IDs are defined in dt-binding
> > +  headers.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3528-cru
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  assigned-clocks: true
> > +
> > +  assigned-clock-rates: true
> 
> Drop both, totally redundant.

Okay, will fix in next version.

> > +
> > +  clocks:
> > +    items:
> > +      - description: External 24MHz oscillator clock
> > +      - description: 50MHz clock generated by PHY module
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xin24m
> > +      - const: gmac0
> 
> gmac
> (unless you have gmac1 here as well but then please add it now)

RK3528 comes with two onchip gmacs. This input clock is only used for
the first one and I think keeping the number would give the reader an
extra hint. What do you think about it?

> 
> Best regards,
> Krzysztof
> 

Thanks,
Yao Zi
