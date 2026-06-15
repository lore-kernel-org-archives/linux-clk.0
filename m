Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1618330B14;
	Mon, 15 Jun 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516351; cv=none; b=f9LIYtyBsUyF3658PWJGxqLBJXHN+8sVgQ5cmFGpv3B567SDqQ4RCXgx5ZXK+kWW9wYqZnFf3Lete+b3NyvjL1Vq6QMWVkia+zShhBmpsM+P7BQ49kzPVEuRy/gO8jwsBMoH94EqWb7oWbzZFbHI6ebFUCdgHihG5M6xcGqs+gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516351; c=relaxed/simple;
	bh=dnONPYD6XzHhp9EBOgFNHs7pj4H4LDKb5beDVT0zjho=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTozMDUayrxNENwXOkhSt4SrEBxAgEfqxhuYxaiBydEb6KgP3Z1tPBkwJqh0iEgpXfRqlWhei0hqzjG8FTJwDUULhvNjAQJvL6EdNSXbrUEKP+AY0XQFLx9zAmc7RzfS+8xyyWY2Q7o6v7XrK14AiS7Ojvd80WOGvfGuqdhKMT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=cQE6uE/o; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="cQE6uE/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781516349; x=1813052349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnONPYD6XzHhp9EBOgFNHs7pj4H4LDKb5beDVT0zjho=;
  b=cQE6uE/osYndA9+53fxO5LpgJcax07WKMQKhUTfRvf2XyH8EHNV5thVq
   Nx/gzTj8yC+3vrI7bQtVzCXGTvUTrnw9LmtK1/CH0meUpz/5kDlZiDSEb
   D3ebq2kT+MjFMnFkT2f/M9fTXd6tbJtMYX2M8Mj8MFXBVCCnZMVD9rUbc
   CUrGQUoIWJc50Ui9Mkd0yyAuheR9HUw5wj3SCYqCqNZg1bTKr7BSN/HZC
   drBcc3yYDGyRoYH2RuwQcIt7NCfuEou3a3ruihwOX0+bEJQ7tdNEHirLR
   EeQ/zH1YMeL8XKpNultaHNdEgYtc7oGEf8pbQ8sWsu6zkGMo6Edmr3/FS
   g==;
X-CSE-ConnectionGUID: +Wai5PhcQwyFvCCU3De2TA==
X-CSE-MsgGUID: vqn+V4SDSieryT8ypJm+tQ==
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="asc'?scan'208";a="58296024"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 02:39:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Mon, 15 Jun 2026 02:39:02 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Jun 2026 02:38:57 -0700
Date: Mon, 15 Jun 2026 10:38:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, <linux-renesas-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Message-ID: <20260615-undiluted-gallery-d7318905c8fe@wendy>
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
 <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Uh78Vh1VzfEi4O33"
Content-Disposition: inline
In-Reply-To: <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>

--Uh78Vh1VzfEi4O33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 09:28:07AM +0300, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/display/bridge/renesas,dsc.yaml       | 99 ++++++++++++++++=
++++++
>  1 file changed, 99 insertions(+)

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a779g0-dsc
> +      - const: renesas,rcar-dsc

I didn't provide an ack for this FYI, I was giving the ack for the
file being called renesas,r8a779g0-dsc.yaml. Since Geert isn't happy
with what's here, could you drop my ack when you send another version?

Cheers,
Conor.

--Uh78Vh1VzfEi4O33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCai/IAgAKCRB4tDGHoIJi
0lGiAP4i+hsdDIWn5Ob66ARc+soBDeG/vc4lEZHkeIcbNWBX8QD8CvRTmZfRwU0o
J33Zs5Y0tg/53Ixvcqhdm9vClQTuzQo=
=DIro
-----END PGP SIGNATURE-----

--Uh78Vh1VzfEi4O33--
