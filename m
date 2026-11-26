Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685062;
	b=CmjsQqxM2/qQtFmZDUOdO+9lfPpEF1p6ZoT2PgfQiQHDbmipTTLCjnnEfG8uyP2cz0oy
	 DgOKOyoZpEuY777rIiTZPAt/fUk6IYU4h2nTJc2qBIbJ/LsxPwJ9NFEPiQ/Ajvi6iJT51
	 fc8tyY+KjO2f4ius+DqFr2hTPOT/EaBEnCuCUZkS/mUBInwQ98V5hIvIZPxtRUZcEySA9
	 gsJ3gENHfYHJ0n7RkCSLCvwHTjwJMzfKChpUIGnbPba5zWCHCGn400uxZ4D0L9kDMnbwk
	 fOtEBIVrQZ/9yqgJ1KlaVbmo7wT6D59Ur9dDyy6OtpQuFdutIjF/fM64ORD+ODMP+/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685062;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cDj3g8UJBQ0tGrHxEPBXKZHnYGxxMMKOE94C1CZhOV4=;
	b=yTdmQSP7VkeR13zGFzKWzbPtSboR6cr1/0QwkHIBacCTJv+kn/GfT/H9+fSKECLqpop3
	 ZguV0Yz97HCHCuJLSWOj5MSjC++6PvyJujyIEB3guqpY5RPJs0hfi5bfjv4uSecUPJe/u
	 ZoyU9UlbHawC3CQ4ByGyERSUCEciObrxqLx7FY9V1DdOhni/WzcBmiQt7Z4WVMQUBFuHx
	 v26Rr5+Fb8kwvzjBOY+9fMnpCUFZ4zeMgl+8AX6dUlL30uDqo3bI66QxeAFbwPLewsl/D
	 oyii0yEeN2MpJmffjiIBia2fYI0AsO+qopgQm0BrW4WWgAVNfWFryFhO4OwzzvOsfgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYKh59vt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B520C606A33A;
	Thu, 26 Nov 2026 09:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYKh59vt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C8A1F000C0;
	Thu, 26 Nov 2026 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685061;
	bh=cDj3g8UJBQ0tGrHxEPBXKZHnYGxxMMKOE94C1CZhOV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mYKh59vt7AxRB3TaQ6vZbkEBfx6yE9Mlyuf9CTxU3FJHvFyAM4Hd+WaYpTvHklWgr
	 omad5peNy52zoqHWeAA95IyRepobvliSuhvTs6exTeg0e4AWO/NZ+boiZUJqur3QX3
	 1Cs5v75iM2AjUNf0RV45I6GYAjKlCHs2AD5G5+2HtJoAmyDrvqdeLLfl+KF5USCn3s
	 K+c0I/7lUrRMdlnNESwdim79JNapbrbBzVn9hGxL+ow54bMFnA9Ikz93pLPfucT6Ot
	 n2O8gGuMdfDhZyMc6IBd9/t9FoP+kDYcLTf272FMpldMcy6dxkahu0Xl9hZyuvBdui
	 Xma4du46kjwMQ==
Message-ID: <sashiko-outbox-235124@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: microchip: sam9x7: Fix GMAC TSU clock
 frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mihai Sain" <mihai.sain@microchip.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126091809.13012-4-mihai.sain@microchip.com>
References: <20261126091809.13012-1-mihai.sain@microchip.com>
 <20261126091809.13012-4-mihai.sain@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:24:21 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: microchip: sam9x7: missing Fixes trailer for GMAC TSU
  clock fix
--

commit e08604f20c8a6ce19e494241d87354c098dba453
Author: Mihai Sain <mihai.sain@microchip.com>

> ARM: dts: microchip: sam9x7: Fix GMAC TSU clock frequency
>
> According to the datasheet (see link section), chapter 64.6.2,
> the supported TSU clock frequencies are:
> 8,10,20,25,40,50,100,125,200,250 MHz.
>
> Set the clock frequency to 200 MHz, allowing the PMC to derive
> the required frequency from the parrent PLLs.
>
> Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/Pr=
oductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>

[Severity: Low]
Since this fixes the unsupported GMAC TSU clock frequency introduced with
the SAM9X7 device tree, should it include a Fixes tag?

  Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126091809.1301=
2-1-mihai.sain@microchip.com?part=3D3
