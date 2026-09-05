Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4204227CCE0;
	Sat,  5 Sep 2026 21:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788644943; cv=none; b=WPJZeF1oV6WwyJ1bpa4Pa+GQRP1ID5cSOVre36SYoHxXZdbnFWI+UMdGlYIOYY3CLvC4jc2kEEVengKx3y+wNZ8XPSVGwh51KWLcekJ8lXXqCeux/wdCkPxJhYQWh8Riwwmwc+4k6h9QFrIFrE0YvlmTNc1wtfSq6OPLPCzgncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788644943; c=relaxed/simple;
	bh=nK4VDzo2w+Yz90V1Vl2xVdyqfqMFI8yazCCJBQVYDqY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uFmkYCFx+c7IHx7ptnX0ifjcOZzzN0lWs0HNoL/jd++gJF7S5Pc6pQRYNpOP/2TehJoZAQmj2ZaAKIzquKdMLnkhs72HujF4gqI1KKhRyYGsqY3we0JOTi9ZDNNJ5W4mLiWiyeVC5grsCF7M6987LbavQSyY2DYYp73n0y47tus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZYjGGaW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZYjGGaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AD71F00A3A;
	Sat,  5 Sep 2026 21:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788644942;
	bh=M8vYBLo3iZtM7UqAc+TKk4TOI5xjkKlIlDJFeLhnAzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mZYjGGaWkFR1ZhZ8Vz15K1+3qiWtpXbWRwT6RzCA2lPFlJZJveg6iah3vf1mgpiof
	 7eHQ5PVZ/wlymbmWP2nwh3R5cgGm6HRN5Mig4P0yRjvoPoDFeFdCTZaqEvIBOzjaqa
	 RBW6R93T2+znXkHqm6GWDYn02WBhXfYodLARyuNYozN2+4zaoHgrvAtw9dWJVYQdKM
	 iiXdrLCV8AXi45LWT8Ydt6piAeOYlHgqPgqyxv3yDohiObKKv1Fhiljpsd21cP5RrS
	 qLF42wcqLf0naQ7XSa4rrZ4kVbDbAqYY7x47DzxrVQlXHFLZMxvOnpibcIxbetlQdz
	 kMd59zav9QQBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: clock: ti,da850-pll: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260906-ti-pll-v3-1-d1751f4648f0@gmail.com>
References: <20260906-ti-pll-v3-1-d1751f4648f0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 21:49:01 +0000
Message-Id: <20260905214901.D1AD71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema fails to enforce that `ti,da850-pll0` requires exactl=
y two clocks, making the second clock optional and violating the original t=
ext binding constraints.
--

commit 1e378ce145d7c772d10cbc597290a47125cd1157
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: clock: ti,da850-pll: Convert to DT schema
   =20
Convert TI da850-pll binding from legacy text to dt schema.
No functional change is introduced during conversion.

Link: https://lore.kernel.org/r/20260717-ti-pll-v1-1-f6f9ba8c9b5e@gmail.com

> diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-=
pll.yaml b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.=
yaml
> new file mode 100644
> index 0000000000000..c6563290a702b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml
> @@ -0,0 +1,164 @@
[ ... ]
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Primary reference clock input
> +      - description: External clock source
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: clksrc
> +      - const: extclksrc

[Severity: Medium]
Does this schema unintentionally allow ti,da850-pll0 configurations with mi=
ssing
external clocks to pass validation?

The global properties.clocks and properties.clock-names definitions both set
minItems: 1, which effectively makes the second clock (extclksrc) optional =
for
all compatible strings.

[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,da850-pll1
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +        ti,clkmode-square-wave: false
> +        auxclk: false

[Severity: Medium]
While the allOf block correctly restricts ti,da850-pll1 to a single clock,
it appears to miss a matching conditional block (or else-clause) to enforce
the minItems: 2 requirement for ti,da850-pll0.

Since the original text binding mandated two clocks for ti,da850-pll0, shou=
ld
there be a corresponding if-then block ensuring minItems: 2 for pll0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-ti-pll-v3-=
1-d1751f4648f0@gmail.com?part=3D1
