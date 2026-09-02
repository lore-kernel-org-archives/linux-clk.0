Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C8144E66A;
	Wed,  2 Sep 2026 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349220; cv=none; b=s1GaTHQx/4YliYgs7eQA80Vu7fvyRd/nA54qStFhzVIVR/wuPVLi94/09ptkUuoB4yQqNNubZo5JXUszj1ecj8KdZspI5CBKvV938yDs4aCZl26IZlCeXV/17EPuycQmgtmeilZ2nQqguskiRV7RZZpENmMdyqwPg4A/fjuS0qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349220; c=relaxed/simple;
	bh=+1CpZmj2E9rii//fMPAPFKjNARoI7W9NGmIojKyE+Sk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sqFQbLUTbqWMSZmfyy+X/hYgTK6rGK5ALGFIH/MnwYA/BqL/Srej5D9YAp471aPesxX0Mimp0vVDeccmvKG/mi6o1iGt6ErgQ6JJa7JTrYbQDrWhQDbkoi98EKRXL9dIPtaUxL1moxpdPV6GFz3v+tGGmYEChHfz2SwqwCwHyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAxBZzbv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAxBZzbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38CE1F000E9;
	Wed,  2 Sep 2026 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788349219;
	bh=+3Y+pHxc2mOqqvoqm0AInQiCfF5yKVPQ6O3UGbgE6eU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XAxBZzbvI19EAmitL6c8L1TtINi2uP0gWdDR3L4i7lL2SOpfoXgGYc6com3gn0XXu
	 yd7N47tcjmpxzciWoo0MoJOPea/xuuwnsDhoKBxfMSUYaZe/6KIwKdYyZx04tTT2ja
	 +ek2qGPTfoHpZNXmeOQfonbi5kGOdy7IdHXB/7yefUawjK9PNb+2wCsBf/WCa6p+BE
	 iXsam4NbPB8BOu4wbLEpTZ5pce+fMuST2HeBh0ewm9kpA7GIFve9S8OjViK0ST2V5g
	 Y6lhx6/qEU8Z+comsJ9MAKaWDzb8l1EzQcH1kIRCi5QiBxxDlynfDxH2Mkz+VzRdZ2
	 Jy8kTKcZL80xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/12] arm64: dts: renesas: ironhide: Add CPG/MDLC
 renesas,scmi-firmware properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <da82ca150ef0bae62ba61b60376103c262f60ebc.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
 <da82ca150ef0bae62ba61b60376103c262f60ebc.1788338320.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:40:18 +0000
Message-Id: <20260902114018.B38CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree patch references node labels (`&cpg` and numerous `=
&mdlc_*` nodes) that are never defined in the included `.dtsi` base files, =
causing a Device Tree Compiler (DTC) build failure.
--

commit 09da6ce12835b48b20d43a6bbc6347dc7ace67b7
Author: Geert Uytterhoeven <geert+renesas@glider.be>

arm64: dts: renesas: ironhide: Add CPG/MDLC renesas,scmi-firmware properties

This commit links the various Clock Pulse Generator (CPG) and Module
Controller (MDLC) device nodes to their SCMI provider by appending the
renesas,scmi-firmware properties.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm=
64/boot/dts/renesas/r8a78000-ironhide.dts
> index 04291f04da2b7..a6f055a1f38a8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -170,6 +170,10 @@ ecc@1e66660000 {
>  	};
>  };
> =20
> +&cpg {
> +	renesas,scmi-firmware =3D <&scmi>;
> +};
> +

[Severity: Low]
Does this device tree compile cleanly? It appears the &cpg label is never
defined in the included base device tree files, which usually causes a
fatal "label or path not found" error during the dtbs build.

[ ... ]

> =20
> +&mdlc_aon {
> +	renesas,scmi-firmware =3D <&scmi>;
> +};
> +

[Severity: Low]
Similarly, are the &mdlc_aon node and the numerous other &mdlc_* nodes that
follow defined in the base files? Attempting to modify nodes that do not
exist will also trigger a build breakage in the Device Tree Compiler.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788338320.gi=
t.geert+renesas@glider.be?part=3D12
