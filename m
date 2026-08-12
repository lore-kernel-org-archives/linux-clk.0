Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD69278161;
	Wed, 12 Aug 2026 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521333; cv=none; b=JMJAEUrp9NibtDAgaX09IQI5MErF7By0qLtA1R1scq8A0qz7yCi8/8ZYA3VT2pXpl4SHy7+q7IWztWf9gufgeV/+i69iIrNUB74VDY6XxNxtyZDGvlDGui6Thgr6floBYSg+2JmquM1rAZyYxDeBhCEabsUVNXNGFsYZ6aftAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521333; c=relaxed/simple;
	bh=WnWmdoLEufE4HCxQ85yCYnQfmIJZcQzKT/MAwTkvruc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GHvJEEDI5D4wk3jUluS0J5Jk6+mNiHJzPU+9slviBhBEJRECd8Ujx6M2+F2ZzaiCtnHk0jxDy/kPv99vcnPmGSS4uGsl+VxY9jUSXlT77Lrt1Tqx0kP1WL12pN1geNSVXltmyhihimu5me0FH9wLSbrXiyELQ61w2F/kEldkvVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGUU3DGB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGUU3DGB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8C41F000E9;
	Wed, 12 Aug 2026 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786521332;
	bh=J+NMkRGC70MdPbqsdsv79qBrfDy35dDj9Awcvwu9kLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lGUU3DGBg7BfEG/VrrSOVE20zkT9QhxFGJVEjpJrostUnLHuwRJleoKzA19OWshnA
	 gzLfDK2YY0n/KdiKBFN6lbgJd+X936Wuj5djBllpDDjjdVlg+62Uxohgyl0PzZ9bS9
	 sadojGhObSz612VklgW7tlZxHx4Tg0x7hS0sYM4/2uKtlKMfFXPxpAmhKmkZ6q5s+4
	 msKi5FQrrOmU2xOxif9kgy4kogcExmy5QZa7IPrbTivmISfBT3GhVcoVfqSKSs8FHg
	 1M+l1pkYyfYQSPpqun+VxpVhE/QHAEgkdr80d51WbQrIyM8NYIBN8p1bAWJZRJ3Y9f
	 YVY6EuhVAOAtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <85e52e1dd400f39e055196fa1462337285a9b875.1786518803.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
 <85e52e1dd400f39e055196fa1462337285a9b875.1786518803.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 07:55:31 +0000
Message-Id: <20260812075532.2F8C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing generic fallback compatible string in DWC3 devicetree bi=
nding
--

--- Patch [3]: [PATCH v3 3/6] dt-bindings: usb: add Altera Agilex5 DWC3 con=
troller ---
commit 1039f7f38ac48bd8193ef808b132fbeb99505e18
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

dt-bindings: usb: add Altera Agilex5 DWC3 controller

This commit adds a devicetree binding for the Altera Agilex5 SoC integration
of the Synopsys DWC3 USB controller.

> diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> new file mode 100644
> index 0000000000000..8a815e8a3b7d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> @@ -0,0 +1,102 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: altr,agilex5-dwc3

[Severity: Medium]
Does the compatible property definition need to include the generic
fallback string "snps,dwc3"?

Since this is rigidly constrained as a const, providing the generic fallback
string in a devicetree node will cause schema validation to fail.=20

If a device tree node only uses "altr,agilex5-dwc3" to satisfy this schema,
the generic DWC3 driver (drivers/usb/dwc3/core.c) will ignore the device
because it requires "snps,dwc3" or "synopsys,dwc3".

Should this be structured to allow an array of items including the fallback?

> +
> +  reg:
> +    description: DWC3 USB3 controller register region.
> +    maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786518803.gi=
t.adrian.ho.yin.ng@altera.com?part=3D3
