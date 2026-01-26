Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FA01A3178;
	Mon, 26 Jan 2026 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769460706; cv=none; b=YEEEL89NhL7/6bemaPZnIwX4AIQ2rm1NuVIaKhV9kJa+Vapqdv4Pw7s7t27se/KSnjusCM3gjwSzFXrGzVrUN2kRFoE4sTD58GyZhYa1yHt90JU2pKWiOL4Rvq6Vtn9A7YzESNwochYNV1XNqnEGN630di5KBx2Z5x55zHivD+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769460706; c=relaxed/simple;
	bh=TWe4EIKg5oFjDmJePJWeSe0PN9sAlqIqtHbuajMROGI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oRNnMojYIrTgFLIvgtQ5UR9rfFAlNbaWpoTAXjNy0y790kbo0grCEH5hwJqYQrxUFySHrs/l52+IuxvS5g30ieyV4g914Fcz8KsNglT4Ee3z3FSg+kNFGqeKCtfj79RFOW75YkXO/7a8Tg44kKHXpJsJj8mtIvvtc8fz1wchbyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XOxuYDiG; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XOxuYDiG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B50F710DE37;
	Mon, 26 Jan 2026 21:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769460702;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ais5eYTz0FEi4g7TDPCp4ZvDHB2QcWvVDHizRUb54QY=;
	b=XOxuYDiGvcqMOW/E7Noo5Lvjsb5ixgU7wvCfIyaTR6SPE6tjRdsX5oTW1FIb0Ck1eAaW3x
	U0BxklQgpYosP6GAlcC9ZhmyygmtsIHoT5gzGYSclaIymmiY67NjL9Wa2/dYMSOJryKYVB
	dH91XMYPLuH7Ez+JbG8V2Sf0f7n+qu79lpxJEAj9+cAZYwm6CMtIxBLS6jCGTiGHX9zxXw
	8FqCw28u1t/NzMgiDU56KTH8/QJ641XWIlyz8yvIK6Cb0GI576X7g2B4756QDuyZqWfM/d
	5N21V6b/TE/KdyWisEgC8q7F3VOF74qVJvpMbduoPoFdSOVTIGKXxK5W1iIIDQ==
Date: Mon, 26 Jan 2026 21:51:34 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Abel
 Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: vf610: Add support for the Ethernet switch
 clocks
Message-ID: <20260126215134.25814c5a@wsk>
In-Reply-To: <CAOMZO5C2Hg06wb08cRDLCXGDS_rmUAq3fC7Jm++kSumjukyuXA@mail.gmail.com>
References: <20260126115349.1750578-1-lukma@nabladev.com>
	<7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
	<20260126203307.6076ba9c@wsk>
	<CAOMZO5C2Hg06wb08cRDLCXGDS_rmUAq3fC7Jm++kSumjukyuXA@mail.gmail.com>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Fabio,

> Hi =C5=81ukasz,
>=20
> On Mon, Jan 26, 2026 at 4:33=E2=80=AFPM =C5=81ukasz Majewski <lukma@nabla=
dev.com>
> wrote:
>=20
> > Conor (on CC) explicitly asked to remove VF610_CLK_END:
> > "[PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2
> > switch"=20
> > ------>8------------
> > > -#define VF610_CLK_END                        191 =20
> >
> > If end is modifiable, it is removable. If you need the define for
> > the driver, please move it there.
> > ------8<------------
> >
> > I just follow what he asked. =20
>=20
> You should still use VF610_CLK_END. Just define it inside the clk
> driver instead of in the dt-bindings.
>=20
> Please check these two i.MX93 patches that explain the rationale:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?h=3Dv6.19-rc7&id=3Dc0813ce2e5b0d1174782aff30d366509377abc7b
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?h=3Dv6.19-rc7&id=3D0af18ba60752e8a4ba34404c1d9a4a799da690f5

Ok, if this is the agreed approach, I'm going to use it.

Thanks for pointing this out.

--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
