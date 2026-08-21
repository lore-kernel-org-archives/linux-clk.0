Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4C9430314;
	Fri, 21 Aug 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329131; cv=none; b=tfJHUCiNLIX68S//v/cJkRNLKX20zqj7/enlng6kJlZXS1e18JyIV41klfeg0xdNGrGuU4fgb0Ozk59iBNeDtvhaQqwDugfAs3ZoL0an36E/GaJycvb23X+Lc3id9Sgcy81rvafWHrpf8hzN9XhTVWT/UPZyoxHd/X05EUmkVmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329131; c=relaxed/simple;
	bh=Rk/IvkJxcmZfPrG+trIi4DwTKyDDwJWI+bFxkiiKGI8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oB8u5OcBxyAt+Los1uZ548JHX7vBidOeZ/BePpUMfaGfDTyOFHXYE12sxIwHBjkmGJ4nX2GEJcPjxLtUfBXjIkNs4XjMURYTI3sGbNzqGx7lpPr8NwNe/Guo00czI5oHw79fLF6hL2pK0izePclaiRVzwAiFmaEI22gb6ExHNOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GK29tDhs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GK29tDhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046611F000E9;
	Fri, 21 Aug 2026 16:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329129;
	bh=sdy2YyRQMYAVIxeyMOq32R5v6BTjIjoIVykkmFAs38M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GK29tDhsNkf69Vu0YtZ9gNqr4IVCNRqsHRc7OtWqKgSOrUGHg9cGFSPaoEqfCe3Qq
	 C6swO1SsIp2FvgjYBo/Rezn2ITlZiCWk8QdunNdcDNufCqNdDiOX+TP4YvvBa1QTJp
	 Zi/7Dc9shJyggQmqiy1CDa1mSGjpLr7RjJLVrQ2uZ9f/i4IiWeo3q95bXB5wm6GMa5
	 WZ/jh3QGEjBES+x0IdhYCsRRmTMxAYIgjH4gKXP51CJvs64nz+xgD3XmcUqEIPQNv/
	 uqZGmxvyp+dgGzOY6PyfT0VoP0smgEnIdSJxPcoqcVp/gnZB9Pae5LFxZhixWN9GUO
	 tVVf5NF57Hvtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/15] dt-bindings: clock: qcom: Add Kuno Global
 Clock Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821-kuno-soc-support-v3-10-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-10-196e2b306368@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 16:18:48 +0000
Message-Id: <20260821161849.046611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML binding requires `#power-domain-cells`, but no power do=
main macros (GDSCs) are defined in the header file, and the driver provides=
 no implementation.
--

--- Patch [10]: [PATCH v3 10/15] dt-bindings: clock: qcom: Add Kuno Global =
Clock Controller ---
commit e8474d42563c99c569b8bb564eb4620691ab9a28
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

dt-bindings: clock: qcom: Add Kuno Global Clock Controller

Document the Global Clock Controller (GCC) binding and associated
clock/reset IDs for the Qualcomm Kuno SoC.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b=
/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml

[ ... ]

> +required:
> +  - compatible
> +  - clocks
> +  - '#power-domain-cells'

[Severity: Medium]
Does this binding intend to enforce power domains for the Kuno GCC?

The YAML binding requires '#power-domain-cells' here, but looking at the
associated qcom,kuno-gcc.h header file, there are no power domain macros
(GDSCs) defined.

If the hardware does provide power domains, it seems the definitions are
missing from the header. If it does not, this requirement will force device
tree nodes to include meaningless boilerplate to pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-kuno-soc-s=
upport-v3-0-196e2b306368@oss.qualcomm.com?part=3D10
