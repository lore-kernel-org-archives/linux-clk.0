Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C0450EBE7;
	Thu, 17 Sep 2026 13:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653468; cv=none; b=jMYuYgco089P3YtDX3ShMf5UUznLX3TZhAUPAMl7lT0IwC/OMxvI5ak1LdGVAaFqzhDmZXvxPyZIFH9TOCH/EVrnwwtvnMYB8PlmzzZOwCjVJP97L/sB5DvN/q+TWPUG5mA7ErodsbVJcLCpYtaKf0FPrGnxYzgxbJ9Ob3Rbp54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653468; c=relaxed/simple;
	bh=RSvQA9mnN8KAm0hg2Ax5JgPW0ESTjOO+F4d5bTTSljc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=heQIVByAkT7+P2e3WUQ07RsDoCVZzQFl0JoHRrnU3VvlInwHuA5WskQG4xCyzXm9+XoaI7e6WexLeyRDc7Jd7cwaiql/4CXvw5smSMbWz96JYOg1VwXlJPiBSDJAHNqGpRb3USlmBCD5znfBRBLqahT7gP2zeuKJhcRuyX9M0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9YlY2Bx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9YlY2Bx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDEA1F000FF;
	Thu, 17 Sep 2026 13:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789653467;
	bh=8UAT7IvTcmwi83IUaelNM3GAVNHGJd0wkYM9OiHkrUk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c9YlY2BxUrYFyKFbPoJz2iX4BndKV7E/rvF0jh8OnnYFRKJBM600B/JwPJqRfm73r
	 09XUbIkIEAVms8QOq3kQt5wfuTutxH1lbl2QJGdPCA/TwAWPOcRwSFaendhS03rEiV
	 ojnXHUqspNU9hm/CAjFLgOmaIVVqfo2IWBNu/q5WxPLjvgop4WsL2dmcFQ3Bx8GPtJ
	 9cwpGKCx8SLcqOO4h5fqedDFOPFb1ynyWTbBZQMSIVrUhZlHVZoqTZBdVyEn9RXyvz
	 zUHuxXuGcg29zu0IFEbPKa0OQma1wYwOQFZCKNTNwgffv7wHfBv+YF1g3oiLDuLxZK
	 sTPDqqQcuxCxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: devfreq: event: rockchip,dfi: add
 clocks to rk3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260917-rockchip-dfi-cleanup-v1-2-4f00a97a69a6@collabora.com>
References: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
 <20260917-rockchip-dfi-cleanup-v1-2-4f00a97a69a6@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:57:46 +0000
Message-Id: <20260917135746.DBDEA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: devfreq: missing conditional constraints for rk3568-dfi
--

commit 75c6ca72e6782643c9c65600f7fef45a8cfa9e7d
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588

This commit updates the rockchip,dfi device tree binding to document the
existence of individual channel clocks for the RK3588 DFI hardware. It
increases the maximum number of clocks from one to four and adds conditional
schema checks for the RK3399 and new RK3588 variants.

> diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi=
.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> index 50d3fabe958d5..d6e06a9bea19f 100644
> --- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> +++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
[ ... ]
> @@ -40,17 +48,50 @@ required:
>    - interrupts
>    - reg
> =20
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - rockchip,rk3399-dfi
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3399-dfi

[Severity: Low]
Should the rockchip,rk3568-dfi compatible string also be included in this
enum?

The global schema constraints for clocks and clock-names were relaxed to
maxItems: 4 earlier in this patch to support the 4-channel rk3588-dfi. By
only including rk3399-dfi here, the existing rk3568-dfi compatible is omitt=
ed
from this strict 1-item limit conditional block.

Does this leave rockchip,rk3568-dfi without proper clock constraints, meani=
ng
invalid device trees specifying too many clocks or invalid clock-names for
the rk3568 variant will now silently pass schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-rockchip-d=
fi-cleanup-v1-0-4f00a97a69a6@collabora.com?part=3D2
