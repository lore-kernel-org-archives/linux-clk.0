Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABDE18A6DB;
	Thu, 15 Oct 2026 05:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042370; cv=none; b=DMUC/7q6vkhnh1MFr4emzp1BSm/4zA3IMnqddJowhwuTYaA8B07A3uGsmQhkDpOK3z6fC9ENkkd3RIdFeR7Ocl/AlxDp6JZuQ4F7oWg4iRF+c8UGu9lnvIf0GjIYhj6A92V8AFWMaLtIyB+IxQZNWHWBAtVV4fCYDeM/c1gt41U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042370; c=relaxed/simple;
	bh=v74u142zCOZBauzq5r9WsnTYIPSUTxMBnq8+SWrLgSw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WztVNgfaP9CNaoo+J9E9IO6GMffambWqCWShsgPKjBglf4a5DKiXLTYh0MFMXX4ZWN28v33OKu/Cj66DXNq52xZbRvzgJw/tXldKdAln6eF6laBCyaMllsg/ydUogGChdloTeXgsDEB08t4bE7+iYZtPhA7IlsI5l8c4eNKYOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2Ko5lgE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2Ko5lgE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBD61F000C4;
	Thu, 15 Oct 2026 05:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792042369;
	bh=HxWlm7kO0JKdirLmw8k78sCMDS5j8xxKx67CPFzT0hM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E2Ko5lgEgbVpQJVGnA6a6s23pILIyy15ydP3XtjEzP8h5/ZiI40/b15wimQCKFL0g
	 vfHdNWjUDULsNm6Y+cBZEIzZ8EVAHvH4HMI6gbLuCPyWyxnvWq0PjGMqur8oLqOi2U
	 Vkt2DqzyaKLKTGVZj9eD2f7J+teeIs+ONAewed/a7bP5zYk0ngpLELYTokVDr1tPbH
	 L04wExkzGthCgcrBIp1RoNHCF0rCt+kNloHWZvSIYtwpAT42+5mkH1y0CO/WvjaCED
	 yW7JAoskOjcN7MOhvCII7sNFJJBeuab6rrYXy5PO3hNhEO3SPo9lQwTcDvGB1R5Wk1
	 7X0ZVZw6ozq5Q==
Message-ID: <sashiko-outbox-172309@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/6] arm64: dts: qcom: Add SM7250 devicetree file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015051926.13752-7-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
 <20261015051926.13752-7-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 05:32:48 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: mismatched #address-cells with empty ranges property
--

commit d7254d0330c233afd2ea9eb553621c4b088c8ea0
Author: Sreeshankar K <sreeshankar0910@gmail.com>

arm64: dts: qcom: Add SM7250 devicetree file

This commit adds the base devicetree file for the SM7250 SoC, including bas=
ic
nodes like cpu, psci, and other required configurations for booting up to
the serial console.

> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/q=
com/sm7250.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
[ ... ]
> +	soc: soc@0 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges =3D <0 0 0 0 0x10 0>;
> +		dma-ranges =3D <0 0 0 0 0x10 0>;
[ ... ]
> +		timer@17c20000 {
> +			compatible =3D "arm,armv7-timer-mem";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges;

[Severity: Low]
The parent soc@0 node defines a 2-cell address space layout, but this child
node defines 1-cell addresses and uses an empty ranges property. According
to the Devicetree specification, an empty ranges property asserts that
parent and child address spaces are identically formatted.

Does this mismatch trigger a ranges_format dtc compiler warning?

While Linux of_translate_address() gracefully handles this by reading the
child's cells and zero-padding the parent's cells, could relying on
OS-specific parsing quirks for an invalid device tree structure break non-L=
inux
parsers like bootloaders?

Would it be better to resolve this by using an explicit translation mask,
such as ranges =3D <0 0 0 0x20000000>;?

> +			reg =3D <0x0 0x17c20000 0x0 0x1000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015051926.1375=
2-2-sreeshankar0910@gmail.com?part=3D6
