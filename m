Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A34B2D77F7;
	Tue, 18 Aug 2026 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049429; cv=none; b=sfM0ezGhtDVT/Ny3CL/bqlMMsMWE+hJ5MoaW1Xu5XXB08x8pV9ysKZ4wSD7n5HGzQhiSqZuoimmQm+4kkJzLdj3QoBXKSiln1eijHObJZNeD7eGzkkqJrjfNybAe5yAa3hiV8a4H8Yh1pDQ5bpHqTcnisJAI9Hxdf01/BpzoQHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049429; c=relaxed/simple;
	bh=WiAI87j2Mi7avHNHhUVBY63l7N0iA4OIqp1/+A5ZPc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=inwwzQFwclpKKauBwlR1EbydFJEDkhFok3gio2Fco64YRT+xq4NmkO2ZciSNrfKEEaNSX6SScgk+eVgGwun2P2ZU92gt4fqEXDC7oOcZ0T/rQ9SIbc4rb4geXEp21mbQuiL3jlh4q0EK2hlwyo8eHFiV1OIF/0xkTWBZa4FknKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfXhYC4K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfXhYC4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF491F000E9;
	Tue, 18 Aug 2026 10:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049428;
	bh=PS7SkIWRH22Qy3Nitrb0KMsG9A/ZQBWZdYQXYxxZo0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BfXhYC4KvFMAPJFWMR88Hum69rcDEtoUed3lykY8J1YKgJyQ9t5MYjkoLmslrE5NJ
	 borij9l8RAUFtyVdirjN4di3HvvzNv9SdtlIwjxUzzTgkEbnWVtvnlAP+NKG7O/smw
	 72Y8NP4MESjLnD3FiEJqd8gvurQvZSLkjmvlheMdMVxjJeYH3z+/Zw8mGz6fxXQV2c
	 MOp0nneb5VeNz927sVbj1mJ6ahfl40QWl8Y0LhZgfl4YHvM4tp5rlgkxagSsVbGKYi
	 Ld27cm+MdwrYlrwwjwZqOR/BCOGbjwrYVbD+iUrysIn8eVOEdOhXqJr+MVjecmvoUB
	 J4udxtAhYOYGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/12] dt-bindings: mfd: syscon: add Ambarella CV75
 secure scratchpad
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-cv75-v5-v5-2-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-2-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:37:07 +0000
Message-Id: <20260818103707.DDF491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new compatible string `ambarella,cv75-sec-scratchpad` was added=
 to the `properties:compatible` definition but was omitted from the schema'=
s top-level `select:properties:compatible:contains:enum` list.
--

--- Patch [2]: [PATCH v5 02/12] dt-bindings: mfd: syscon: add Ambarella CV7=
5 secure scratchpad ---
commit 2e61d4a5b3f63c115582c6eb092f0bbc87c52d87
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad

This commit adds the ambarella,cv75-sec-scratchpad compatible string to
the syscon device tree bindings schema.

> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index e228670880631..05c7f59aba5de 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -148,6 +148,7 @@ properties:
>                - allwinner,sun50i-a64-system-controller
>                - altr,l3regs
>                - altr,sdr-ctl
> +              - ambarella,cv75-sec-scratchpad
>                - amd,pensando-elba-syscon
>                - amlogic,meson-mx-assist
>                - amlogic,meson-mx-bootrom

[Severity: Low]
Does this new compatible string also need to be added to the top-level
select list?

Looking at Documentation/devicetree/bindings/mfd/syscon.yaml, the schema
relies on a select list to trigger validation:

select:
  properties:
    compatible:
      contains:
        enum:
          - airoha,en7581-pbus-csr
          ...
          - altr,sdr-ctl
          - amd,pensando-elba-syscon

Without being added to this list alongside the other compatible strings,
could device tree nodes using "ambarella,cv75-sec-scratchpad" bypass dtbs_c=
heck
validation entirely, allowing invalid device trees to silently pass?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D2
