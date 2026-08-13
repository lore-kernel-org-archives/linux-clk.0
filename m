Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C73D44AB9E;
	Thu, 13 Aug 2026 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615381; cv=none; b=P+Sex05kcDyCoivcuYJVZNXJzZJTnXFJdC1JFrICqRFT4w/boo8qr8A7bto89C4DiK0SvoNZ+UU9WyhDXFCozO6v25zuHxw43AcZp1Eo1YPWhDpvTssz+OWT7vtPC68cL1H0CnMWxwIkN332xdG1ha+0x6RBre7OKVqlg3+Z2FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615381; c=relaxed/simple;
	bh=+tL4jLnBFSoqVgrOSpv1z5U8nGGDZ/aijU7R3vO7fLs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HBEP/FD9af4rCUM6kjcLhRaeA2VAyvvgkYE7Ljdx72pQOkWEvXOGWQjRzFIWi322wNSknXkGOiYQeXs6XRLlWvJL4MJdYsZwMT1ROu417a+ssAtIif21hme1b984OjHruu+okWqLP0kFRJLx6fhD4rPVQ0HYTRjBQ5lHjv9CivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3zn/L5b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3zn/L5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5207D1F000E9;
	Thu, 13 Aug 2026 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786615379;
	bh=yYJHVwsrMXH8k6042I6I5dewZ3/nP4QH7CO+1t5wvS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h3zn/L5bVPW38B/fP4qercCaBbXAGePBORHEbqgUowZl7A7oy8gfVhWRcSuda0736
	 +KStsos6oXBF3QLXx63WaQG/Kg0x+A9Vu0rKe3XXQFAh4Xf6kZrnL2R8FPJLs8wlqd
	 zNY8yYD6WW9wz94cIe4X+mR23PqhQud7Y54KeLxgzdWgb/zmGBudpoCN4X5DlAfRHv
	 Uwafybiei6DQZQNNDzpv+zB0f685FWc1URNApzBZym43OwuZriOoFQOtsUaY7UZj95
	 HKRDFq6tgDCT+J74hHoOAdO9eT0ADR6JJrIaCvCEM3jb5y0959P4zNB0jvEroxC20y
	 L2vpkoLWcPb0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: clock: add Ambarella CV75 RCT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-cv75-v3-a-v3-3-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
 <20260813-cv75-v3-a-v3-3-cfdd20b1b4dd@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:02:58 +0000
Message-Id: <20260813100259.5207D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding for the Ambarella CV75 Reset and Clock Tree (RCT) is=
 missing the `#reset-cells` property, failing to describe the hardware's re=
set provider capabilities. Device tree bindings must describe complete hard=
ware capabilities rather than just the subset supported by the initial driv=
er implementation.
--

--- Patch [3]: [PATCH v3 3/6] dt-bindings: clock: add Ambarella CV75 RCT ---
commit 34559a1295566c6903b0871d6d486afaede08d21
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: clock: add Ambarella CV75 RCT

This commit documents the CV75 RCT clock controller and the clock ID header
used by DT consumers. It introduces the new binding schema which defines
the register properties, clock requirements, and provides an example node.

> diff --git a/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.y=
aml b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
> new file mode 100644
> index 0000000000000..eb5956fc32bc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
> @@ -0,0 +1,58 @@

[ ... ]

> +properties:

[ ... ]

> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"

[Severity: Medium]
Since the commit message indicates this is a Reset and Clock Tree (RCT) blo=
ck,
should #reset-cells be defined and included in this required properties list
to accurately reflect the hardware's role as a reset provider?

Device tree bindings typically need to describe complete hardware capabilit=
ies,
so existing device trees that omit the property will not silently pass sche=
ma
validation when reset support is eventually added.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@ed080000 {
> +        compatible =3D "ambarella,cv75-rct", "syscon";
> +        reg =3D <0xed080000 0x1000>;
> +        clocks =3D <&osc>;
> +        clock-names =3D "osc";
> +        #clock-cells =3D <1>;
> +    };

[Severity: Medium]
If #reset-cells is added to the binding, should this example node also be
updated to demonstrate its correct usage alongside #clock-cells?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-cv75-v3-a-=
v3-0-cfdd20b1b4dd@ambarella.com?part=3D3
