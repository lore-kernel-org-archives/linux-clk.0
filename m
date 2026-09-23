Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A4A448BBE;
	Wed, 23 Sep 2026 18:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188626; cv=none; b=V8VqG7MT1zE/jCwoJ8CE9vsRCXAgT74r3reUXK/WoqxtcuDUMLSqTsgU6wD8LuG2arzOajLKowRbOmtWAro/1RGVwtmKZrtfDifkcKZV0KExT/MRbqhF+RYwkYiYa7nliPxHE1qq5sobfFSHBaO7zZVI7sN+MeSBX9aZcnM4iNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188626; c=relaxed/simple;
	bh=jcCasPK6HNX+0lseMfpcrKEZck3glsLRnbTn6yxSXdM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bFf5Wet3H+s+3O5Cexlb1n312ATtWQ+4Voo8LyRC+mZw9vdMtg8+4eDXoZxj424T0QG5asXTMhoyCuPqTY0ZZmqRLluZcNWtmlUOOfU+qNTdiaZPpGWyOvUB9y243zBREDDFStvsNkHPReesVOP4oyDI05z9YezBX7lqpd4/jVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQ79VCyh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQ79VCyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E37F1F000FF;
	Wed, 23 Sep 2026 18:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188624;
	bh=WqSJNIizELZuispw3o4Rwp/Dg427OuWZN5m99HzCcnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQ79VCyh+tdFjyzQm2wrxB/JprCsIXDe16pcV3gLcrH+diPAGB50+xuHvdzY7yfeD
	 DUXk6WL2CNSWTsodKtx+AWF8Sl/MLyxYs95d7396vXwR8wjNhTSwKWkaBDSmIRYkgT
	 ez2sutQl8Oy0Pupbu4yMOcGN9fsXqR9p90k13QXq3vbVU5ueb7g2HV5DyaEnzbyJhW
	 H72SaHNc/Ym7Z7JBVOhKs4v8I1eA+QYWzXww19G7YxTT+2hsn0zJyGMCQdRru3OlGw
	 XfsxUqvZZKR2tb9BrOgsy1bhE3Mm3EYbguqhMx55OKKomYC8bG/ssHygl/zT/j+ZWe
	 9xzRa5ns2A0Mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: lee@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, mfd@lists.linux.dev, linux-clk@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-zx29clk-v12-2-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-2-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:37:03 +0000
Message-Id: <20260923183704.3E37F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: clk: zte: overlapping macro indices lack controller na=
mespaces
--

commit dca4f092e4746ba80e9fc5a9d7398c954138a93c
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller

This commit introduces the matrix clock and reset controller for the ZTE
zx297520v3 SoC. It adds the bindings documentation, along with definitions
for the clock and reset indices.

> diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-=
bindings/clock/zte,zx297520v3-clk.h
> index 1bc9267e4d62e..d98bc38635b03 100644
> --- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
> +++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
> @@ -69,4 +69,49 @@
>  #define ZX297520V3_GSM_156M			60
>  #define ZX297520V3_ABB_WCLK			61
> =20
> +#define ZX297520V3_SYS_TIMER_WCLK		0
> +#define ZX297520V3_CPU_WCLK			1

[Severity: Low]
Is there a risk of unintended misconfigurations because these macros restart
the index space at 0 without a distinguishing prefix like MATRIXCRM_?

Since they overlap directly with the topcrm macros defined earlier in the
same file, both sets evaluate to identical integers (e.g., both evaluate
to 0).

Could this regression lead to a mismatched hardware configuration at runtime
if a topcrm macro is accidentally used with a matrixcrm phandle?

[ ... ]

> diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/d=
t-bindings/reset/zte,zx297520v3-reset.h
> index 4a0eaec0e9816..54e5b24f859af 100644
> --- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
> +++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
> @@ -27,4 +27,17 @@
>  #define ZX297520V3_USB_RESET			18
>  #define ZX297520V3_HSIC_RESET			19
> =20
> +#define ZX297520V3_CPU_RESET			0
> +#define ZX297520V3_ZSP_BUS_RESET		1

[Severity: Low]
Does restarting the index space at 0 for these matrixcrm resets introduce
a similar regression risk as the clock indices?

These macros similarly lack a namespace prefix and evaluate to the same
integers as the topcrm reset macros.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D2
