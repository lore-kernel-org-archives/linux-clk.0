Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A94519A7;
	Tue, 18 Aug 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049656; cv=none; b=u7kxeuzUalQYVMaM3tFBN2X91iHizEQ+fKA+6Wt7jV9qjHWMTLnDomqFgORk1Eh59/Md/nHc/chFG2+ZINEUNTJUvcJ5O0NZuWKqALLlB7l2Dc4WkvUnib2KI8rLXnoUu/ocXj5yXbxq9CsJ1myP1ppgAQ+0foEk1nqrOItpXII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049656; c=relaxed/simple;
	bh=Emg+OPwrmvmmmLjhTHS0K31NsuB9INYsECYcrSeIRes=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rO/5pgMft5StKmdw/Y+qvaw7cyxCN6BjVr5QV5DsMiJSj6Ybg3ROlNxHcun3s+s7YAvHAkEzkTaiWrImuU6VcDrtUHW+eQlqzSn96lHxlQEsa2osBmlYUyuAuU48x6sHaDUk9zVujLeA47Z8aq7qlxrDCZU/zfgQ7Jkxv+Y/zgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emnSsJW3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emnSsJW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D4B1F00A3A;
	Tue, 18 Aug 2026 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049654;
	bh=q0GmnbWq1aR7sLH8tE0OsA3GKSBK5iDArgf3cNkYHD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=emnSsJW3sS/8RgCMZhtFYIVTgjKOJR/e84GB/yZJ1exmpd1n+madriHnsaXSuCpvw
	 691j7eqlhIBssqdI69kArIPA4lQ/s7M9EHP59mWU1s7vJp1YxbzqYZzMVn33DF5Ofm
	 tEQWAicw1lFiiM1ktHw+cVd/4bSJ390Ypq5UUK15UHfWZFfrXbLlCeLEmV7B6Bc+rm
	 2jAJDIlv+8eh12EnOyGTX0Sx7oQaD0Ubh7d1hTbgN+sGZb8kfTKp2Jc8vltGNRxp0X
	 tE98yb/phliKGd6WlGZbsnhVkm5FfIl9zC1XcwBHubThS2eSdkD+FarfKMIyA5oqyN
	 jkh/mFadDbZkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/12] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260818-cv75-v5-v5-5-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-5-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:40:54 +0000
Message-Id: <20260818104054.80D4B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The required `arm,primecell-periphid` value of `0x00000061` for th=
e `ambarella,cv75-gpio` variant conflicts with the ID required by the `gpio=
-pl061` driver, preventing probing.
--

--- Patch [5]: [PATCH v5 05/12] dt-bindings: gpio: pl061: add Ambarella CV7=
5 variant ---
commit 788e96b7a4c4ea1764ff5dc908fde736c8cb17ba
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: gpio: pl061: add Ambarella CV75 variant

This commit documents the Ambarella CV75 GPIO bank compatible for the
PL061 binding. It adds a requirement for a synthetic arm,primecell-periphid
override because the hardware lacks a discoverable ID.

> diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Doc=
umentation/devicetree/bindings/gpio/pl061-gpio.yaml
> --- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
[ ... ]
> @@ -57,6 +70,20 @@ properties:
>      minItems: 1
>      maxItems: 8
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ambarella,cv75-gpio
> +    then:
> +      properties:
> +        arm,primecell-periphid:
> +          const: 0x00000061

[Severity: High]
Will this synthetic ID value prevent the gpio-pl061 driver from probing?

During device initialization, the amba bus subsystem reads the
arm,primecell-periphid property from the device tree and attempts to match
it against registered drivers. The gpio-pl061 driver expects an amba
ID of 0x00041061 with a mask of 0x000fffff.

Since 0x00000061 masked with 0x000fffff does not equal 0x00041061, the match
will fail and the driver will not bind to the device on Ambarella CV75
platforms.

Should this value be 0x00041061 to match the driver's expected ID table?

> +      required:
> +        - arm,primecell-periphid
> +        - gpio-ranges
>
>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D5
