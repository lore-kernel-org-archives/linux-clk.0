Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4503FF1AC;
	Thu, 17 Sep 2026 22:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685187; cv=none; b=PGbRIAwrJAR1fUh6bEBYXdjGfKzno5zDxkYUIHLwkBLcSeznzaVl9bH1c9aUXIrwkNCwFzMVva1HouRStO/K/2WNGtIfg2KluN8tnAN58PSE+yEl4LyIdeMWx9NTrIGTb0dfKGuId95+WPLbnZT9xLtA2tFF4tWd4V9CvVj3Keo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685187; c=relaxed/simple;
	bh=TbvPTHo3H0ljtPA1m7+lZ2lrMnPEil5v8FGyyEeFgoA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tky8wWh0Vm9Ai6MHrcsJ91oTL8ACov1T/SB9WkmrUz/jh96lnp3mPANgU3iXpPKFGVxpDmkMUDQILF6gPDs0CA16k49pfrTdLIslz7rFzzKgea/ZuyM4jpcNinimaunH/tEFOMU2YKUUx0UAycgdxViF8T+k2V8ZWIGGAD413vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLqS2jcz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLqS2jcz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AFF1F000FF;
	Thu, 17 Sep 2026 22:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685185;
	bh=nG04/SPCSWrkWM0YgWRvnrpWLxFvW7XD3EWqW0yKoAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jLqS2jcza3nxeYvkrB8b5AA3315lLgJCVxM0fpGD9um2zD0CVjKZODIlwCRRG34vt
	 mzXGgmttwOJBpD96ygCEF2SIw80yA9sbjES1Ox3ggZUDky4hxKn5kyu4bSsXPsrfwJ
	 pZW0EidhbM30/T2KIw+lsGjUhT7lYQWwsgIFV6CzWbNT0dFV8nuJX9e0XCgcEQJRHx
	 TIjUtlI8xtjtNvYAw/Z1T90ur9JkMCwDWyfOxcXWPccBE+PbkAF21YmZfGD/WGEuU4
	 pCVgL1USPEBBJsdZ7s6PSLyTl+oADAIklI2Xvv4HQNbqDEDFE1H72Kbz3XKgKDU2xK
	 HyLXEpwZPAupA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: sun55i-a523-ccu: Add A523
 CPU CCU clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260917223913.1855301-4-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
 <20260917223913.1855301-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 22:46:24 +0000
Message-Id: <20260917224625.76AFF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: clock: sun55i-a523-ccu: CPU CCU incorrectly requires #=
reset-cells
--

commit 6b88ed1238e42f9cf204f24c2d92453688b20a13
Author: Andre Przywara <andre.przywara@arm.com>

dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU CCU clock controller
   =20
There are four clock controllers in the A523 SoC, but only three are
described in the DT binding so far.
   =20
Add a description for the CPU CCU, which provides separate clocks for
the two CPU clusters and the DSU interconnect.

> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a52=
3-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-=
ccu.yaml
> index 58be701a720ea..98d47d2aabc48 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.y=
aml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.y=
aml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - allwinner,sun55i-a523-ccu
> +      - allwinner,sun55i-a523-cpu-ccu

[Severity: Low]
Does the new sun55i-a523-cpu-ccu compatible string incorrectly inherit the
global #reset-cells requirement?

Looking at the binding, #reset-cells is globally required:

required:
  - "#clock-cells"
  - "#reset-cells"
  - compatible

Since the CPU CCU does not seem to provide resets, will this force device t=
ree
nodes to include an unnecessary #reset-cells property to pass schema
validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917223913.1855=
301-1-andre.przywara@arm.com?part=3D3
