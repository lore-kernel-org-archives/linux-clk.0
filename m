Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD436196E;
	Wed, 12 Aug 2026 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521227; cv=none; b=Caiou1qkZT8u/kwpB1+1V60Da3qH5AABTHnQSNXNJuMeyODML28+pYfk4sjoo1VQvb5OpQQ+WdlNT5vdeT01War9HzORjMKVIdKNRJbkyQ1zEW17lVoF1LJd2yRk5kujdWfc1h9kL92RXm3Sv957f28z6PVl9qRRrnImbMUFeWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521227; c=relaxed/simple;
	bh=IrL+rC0iTWLi2sfxZUag/fx7/QF50qD7HzL+FRxW+vg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uSRXnWw0UMKPKWNXom/u4oPtid4cNKQ/BnHgw9kZZdFmUqbjyC3T15cVA1s2RJnXkqfD3ZNpeZde8FPDv5+t324kTbJXqWXrFslsOeiLWpbo039f9LNfUb90eNGQqTCvYvBfwr26vaQ89/aMyNyZJv5yjqhmB4ZHrCJSeAf5ZiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5OVKJM3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5OVKJM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CD01F000E9;
	Wed, 12 Aug 2026 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786521225;
	bh=Rj/oZ2tqDp3lQIn0V42mBsmNJ7RxPHvHPmvL9C8Dbhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d5OVKJM3j/N5h28iExQpTOaZl8dMyUHBSBd7rfJL2n8Orc4G+d2qN6OoUINFYYrhn
	 GlGE9mUonr2zbUZCQzwKfLQ5IK9SJuYOW+dkKsowLxMbV+Q/p2HKnIMzxUKT3ymUt+
	 oPHwYBLRzqslTymIwqBtU0tsHDkr8ma8TWWzCV0AyVrIHzPhTwMXZwoUS/jgsGoJRt
	 1NpV8ZIowjO3HENtQXmlrOwACZNPRcT5ExXznyiRS2RAcRaV2oMZFO7+aQA0gpEs8t
	 hxa/QNHy12pGRYOnf7sdtjbzk7OZo0i1mueAxQWTbvRkoNtva5L+aXL3HkhT4X5kSs
	 Ysi4ReX4hBtlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] arm64: dts: intel: agilex5: add USB3.1
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <628275930f99fb6cdc3edb7269ac75cd04f870dd.1786518803.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
 <628275930f99fb6cdc3edb7269ac75cd04f870dd.1786518803.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 07:53:44 +0000
Message-Id: <20260812075345.41CD01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Devicetree structurally contradicts itself regarding 40-bit DMA su=
pport for the USB3.1 controller.
--

--- Patch [4]: [PATCH v3 4/6] arm64: dts: intel: agilex5: add USB3.1 contro=
ller node ---
commit 2f2039b2059cdc372b94f8f6d45151844510ff80
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

arm64: dts: intel: agilex5: add USB3.1 controller node

This patch adds a DTS node for the Synopsys DWC3 USB3.1 controller on the
Agilex5 SoC. It places the device under a simple-bus configured with a 40-b=
it
DMA window and enables it in host mode on the SoCDK board.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index b06c6d5d60eed..043b980832c23 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -494,6 +494,33 @@ usb0: usb@10b00000 {
>  			status =3D "disabled";
>  		};
> =20
> +		usb31_bus: usb-bus@11000000 {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <2>;
> +			ranges =3D <0x00 0x11000000 0x00 0x100000>;
> +			dma-ranges =3D <0x00 0x00 0x100 0x00>;

[Severity: High]
Does this dma-ranges property structurally contradict the #address-cells
configuration for a 40-bit DMA window?

The usb31_bus node and its parent soc@0 both use #address-cells =3D <1>.
With a 32-bit (4 GB) child address space, is it mathematically possible to
accommodate the 1 TB (<0x100 0x00>) window length specified in dma-ranges?

When the Linux OF core parses this, won't it truncate the window against the
parent's 32-bit boundaries and silently limit the device to 32-bit DMA?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786518803.gi=
t.adrian.ho.yin.ng@altera.com?part=3D4
