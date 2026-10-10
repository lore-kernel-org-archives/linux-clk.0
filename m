Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48A0449B01;
	Sat, 10 Oct 2026 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634109; cv=none; b=TF2kcf979ICKkhdlTmegsDZiZbhkSrIpiIiZf3KAh64ixU+wwgVPhnRK4hdns/rmUdym3l/X7ZuLC6RWDXQvQHdkERMWQvlazmc4W5KnNsoBT/O6nOanP/fFiIOSCohOSVRp5zBQjpwuu2go6I+BKB2l0oUB5bD6VW9JmHgi5Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634109; c=relaxed/simple;
	bh=AbFgTbRkgzTESWc81WDLIpFM2Hy2Hz3oHYkh00zCPZo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Hq0Y7YF3zoW+DCBFTnQKuKO9JEWcFi7vU6bx2rd4dWhrkT8MVSxNKymVBNZZp886xKS1KXJsQNduQAoJtqGboDVmJ0sIWUME/7kjB7GX1s5iR8OFBVQs/PdgfvqPqa2Dom2u1lLtkv84bQh5i0htNWhaAr2heYkZeHXsxV1btFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwAmOnv9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwAmOnv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27E21F000FF;
	Sat, 10 Oct 2026 12:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791634108;
	bh=7WHDSx4VLZtcN6zBFrATuVA/bE4Q6wOIlzLajOqITHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nwAmOnv9XUSWNw1qBJ5zppXWTDJ/whPnTywhOc6oNIU9WyJwffsB/XCKFo6ur7qgr
	 0muVJu8nq2kQHTR3zGYJ8cp1x9ENvlxcK7BitWsFfAFfjzQph3CKYVyDxOB6jSOfHC
	 RD4WWB7ebclZ92XnN3VmV34L8dVY+c9kextqUNThBTMpM+2RXMik3wwYOzbClMe+7i
	 BCR3RW7I/bT7T1zNQgIelV0x+SQAsX4+DaGEsNrpJJWSBupJ20JQj62JEFL+4u7UOS
	 V7SBpXdA64i5ASC+gKZTaUyLUVd8GfWnrBLc57vCy0zBeJFHqTX++XoeT4ReWo6BYh
	 IEdzk3AWkLTXg==
Message-ID: <sashiko-outbox-166487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: mediatek: mt8167: Add HDMI display
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-clk@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20261010115539.9237-8-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
 <20261010115539.9237-8-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 12:08:27 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: mt8167: hdmiddc compatible array violates schema enum constrai=
nt
--

commit c20e20334411b75b4e2b444ca191ccb04b2ad0ef
Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>

arm64: dts: mediatek: mt8167: Add HDMI display nodes

This commit adds the required device tree nodes to enable HDMI output on the
mt8167 SoC.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8167.dtsi
> index 27cf32d7ae35f..ab76e0637eb15 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi

[ ... ]

> @@ -120,6 +141,15 @@ iommu: m4u@10203000 {
>  			#iommu-cells =3D <1>;
>  		};
> =20
> +		hdmiddc: i2c@11011000 {
> +			compatible =3D "mediatek,mt8167-hdmi-ddc", "mediatek,mt8173-hdmi-ddc";

[Severity: Low]
Does this compatible array violate the devicetree schema constraints?

The mediatek,hdmi-ddc.yaml schema uses an enum constraint for the compatible
property:

properties:
  compatible:
    enum:
      - mediatek,mt7623-hdmi-ddc
      - mediatek,mt8167-hdmi-ddc
      - mediatek,mt8173-hdmi-ddc

This restricts the property to a single string and prevents fallback arrays.

Compiling the devicetree with make dtbs_check will throw a schema validation
warning here.

> +			reg =3D <0 0x11011000 0 0x10>;
> +			interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
> +			clocks =3D <&topckgen CLK_TOP_26M_HDMI_SIFM>;
> +			clock-names =3D "ddc-i2c";
> +			status =3D "disabled";
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010115539.9237=
-1-l.scorcia@gmail.com?part=3D7
