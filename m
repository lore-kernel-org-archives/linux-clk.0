Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012403EF0A6;
	Mon, 24 Aug 2026 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574464; cv=none; b=gkX5M9IrPcU2ZlGHVMeIUdP1+4ZT2StsX0gdJ7C6l2KtaCBp1BhfH74+1KtOHOtSFw4hs67gtf9EU8fVjy/VFoEF6JP+0aCHNyxJoua2OSNUzmFyT3XjOx4snsaZEyGH5U4qmtFlHg7I9CNFLAjvQef3zZEYg9gq1QIp1sQGvck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574464; c=relaxed/simple;
	bh=Mor9mfcYbXGDr8DACOGmhY32AFtfDJWLsDnalLoYVy8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q8zKx+9HYDVGaQ0HJIBIcyl+sU5EFicikHjjZGB+71w7T9qW/I6LFLlLTbYUDktSElENCnaa64Lbuw59tK4Z260WHOjgC9xCvb9AzStceohTXSjkX97ful7nxaOoKr3yDTXgROWoNJQLqvTI/wMySOhh1PRbKsDe1DnMY4f3Lww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwz/yAJS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwz/yAJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3DE1F000E9;
	Mon, 24 Aug 2026 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574462;
	bh=w/rKONGpNinSpBfRClZ0+WW0QH+hwvqj2lBdMu3pgW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lwz/yAJSTayVFgIAmh+0CV/nddfOUVtbXGs2XB6535XXBI76Pq59WvU9f8Ws5Kpjd
	 UBFmEr4j3w+XEAq/DCOFgWZOmAON6JWs0FNcWCSpX6FUjN8/Z7SSWdfpEx+Hi5W+Qk
	 U+UL7rqBSYeyQ8W2JoODUN2RD9aotTRNWC2ZbMJLuop67RRc6Ounaoi99/NAHgifLy
	 0yaA1lFQoj5y6+kbFhsUe/1hwlALh0KeN1aGavwQmH2t2fHG3mh6PV57zCG8RXZPXl
	 7N86O9GSBGKtHcCmlfQs28fZRNQYS+t5UqlSuREqnAifMGZDF7AnLCgENDxkEdm2zl
	 A0DFZ19BKfsmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 34/47] arm64: dts: qcom: qdu1000: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-34-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-34-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:27:42 +0000
Message-Id: <20260824122742.8A3DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `power-domains` property is added to the `gcc` node in `qdu1000=
.dtsi`, but the corresponding dt-binding `qcom,qdu1000-gcc.yaml` is not upd=
ated to allow it.
--

--- Patch [34]: [PATCH v3 34/47] arm64: dts: qcom: qdu1000: Add GCC CX powe=
r domain ---
commit a47858da198026a42957240d575a834059b75374
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: qdu1000: Add GCC CX power domain

This commit adds the CX power-domain reference to the GCC node in the
QDU1000 device tree. This allows votes from GCC GDSC consumers to propagate
to the RPMh CX domain.

> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/=
qcom/qdu1000.dtsi
> index af106aebd30dc..accb4b989655d 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -396,6 +396,7 @@ gcc: clock-controller@80000 {
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;
> +			power-domains =3D <&rpmhpd QDU1000_CX>;

[Severity: Low]
Does this new property require a corresponding update to the dt-binding
schema?

Because Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml sets
unevaluatedProperties: false and does not currently define power-domains,
will this addition cause make dtbs_check to fail during validation?

>  		};
> =20
>  		ecpricc: clock-controller@280000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D34
