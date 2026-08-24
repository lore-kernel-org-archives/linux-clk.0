Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2FD412270;
	Mon, 24 Aug 2026 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573327; cv=none; b=TFPA3EqemEceBnO9DjphtGcYaUCTPkW0GvqFlk9RbdjLMrM8syF53f2KpU4P0nfC4toQ2Pb1ifzRJmqL+haxvY8ur1jlcXekQphj6J3Kec/4Qf5dOM9fTg67xZDdLarQ1a/vOfqOr1KPEABGBGClVdg59PZkLz7ja6lPHd6An/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573327; c=relaxed/simple;
	bh=kDktB8hk2UsIpK638B3c+yLzWkR4I5jS6z4fe2JtEPg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HWcOjJrRilL4iJ67QiV9zRRjwhYe8mM6GExV+GcBNK6DYmaPcChCcb26PnbH9dnTDcrSvUw/ziNqYNeDj67suAEwdWGvwlADUi99shFcOyJlarCIihj3UQSIAaSccoB7oOc4MlPePeE1pQD/XtuGAckPDa7gcSX/ujldf1jLGHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5lgEqMR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5lgEqMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE0D1F00A3A;
	Mon, 24 Aug 2026 12:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787573325;
	bh=XmqKY2Ol02TXgqf6Qc5HgfhZxESygUot6iq4xas4fPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N5lgEqMRDxIioYq1BDUFdk+en7Pb5bAdZffQkMF+Nif4DUzIEjeXnVlBSjnpzqkJj
	 Rf7Y285o6hIOn+hHOdOGedf6ijdVyTu8h/7jnIpsz2+zsWOY9zxlvDlk3rEKZK2K1P
	 gYKbSkep9PhNLbMe1dfWDpbmz8TA1Ap//g8ZgOeS1IbIJfLOoONQmeMQQOeGr/Q+CX
	 vpo6hBCO0bt0zJnGZOIkZOJKVbvaGsBZBhrAQfiQDDsbPIDcNyvP47+uYDSNWmJYo8
	 677h7ibP5bjCrKLrkeyipXLoW3OQMICPJJ64KtRVixjHM/XBhvWMBPOPYEOas9Er4E
	 UUo6T4mRugAnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/47] dt-bindings: clock: qcom: sm8650-gcc: Add CX
 power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-8-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-8-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:08:44 +0000
Message-Id: <20260824120845.2FE0D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The YAML example includes the legacy RPM power domain header instea=
d of the correct RPMh header.
- [Low] Incorrect indentation for the added `power-domains` property in the=
 YAML example.
--

--- Patch [8]: [PATCH v3 08/47] dt-bindings: clock: qcom: sm8650-gcc: Add C=
X power domain ---
commit 1e67472888818783bc114028708b08007c44b70d
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: clock: qcom: sm8650-gcc: Add CX power domain

This commit adds a required CX power domain to the SM8650 GCC clock
binding. It updates the schema to reflect this requirement and adds
the power domain to the example.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml

[ ... ]

> @@ -45,6 +51,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>

[Severity: Low]
Does this example include the correct header? This includes the legacy RPM=
=20
power domain header (qcom-rpmpd.h) rather than the RPMh header appropriate=
=20
for the SM8650 SoC.

>      clock-controller@100000 {
>        compatible =3D "qcom,sm8650-gcc";
>        reg =3D <0x00100000 0x001f4200>;
> @@ -58,6 +65,7 @@ examples:
>                 <&ufs_mem_phy 1>,
>                 <&ufs_mem_phy 2>,
>                 <&usb_1_qmpphy>;
> +       power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
This is just a stylistic formatting issue, but is the indentation here
aligned correctly? The power-domains property appears to be indented with
7 spaces, whereas the sibling properties below it use 6 spaces.

>        #clock-cells =3D <1>;
>        #reset-cells =3D <1>;
>        #power-domain-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D8
