Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5EA1CF284;
	Mon, 13 Jan 2025 21:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736805228; cv=none; b=G1fVwbEbR9OTVXwQCsfGqfVkIQ9Ma2meDE9TTnsB/PpLSr/yC922u05NR58j3xEXTz52EYyUXFSSqXq2G+xvA3pBBs/0PhIjZrrFOT+g/SEa7a2CMNAIrfQExtlrlNF8mUA7ra0T9RCcqwh6/CiEucMJLczsEkSnwuLkxF5p67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736805228; c=relaxed/simple;
	bh=VnIKrXcceDK54xMWbjCugc3cFt68YGA1shWeDWLc38g=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Er1K7hp99BlFyfVTFhJTYxV89mkeNI6DY9eVKdWZggWCOzi3FjAbYWCEtnwOy1I0RIm2H+8gZvk0bAM+fzaPo0V8EtH200IhKoRe4W+XyYbrSnZagScxb9JEZ5JyrdSFpqUU8lGhw4qJ86yxE9LWyFwjpvztj9wzMkMHk6kl5mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0k4IOII; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0k4IOII"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBD9C4CED6;
	Mon, 13 Jan 2025 21:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736805228;
	bh=VnIKrXcceDK54xMWbjCugc3cFt68YGA1shWeDWLc38g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=f0k4IOIIO6sHGaPBcno07dM7Z0sv2vpHjejsOwRvh6j0C9nMO+YK7UnP2V4iCWAlQ
	 mkwIi2m3bE9zmtVYQMPfVKax9FF+8j+DBpNaJlK4mCA6xHL8J3sWCJ29zJ3YbmvrUI
	 oVkQ+YpPAJKGsT65t5UQ/ngsgevVb8YXZ+1QRySrRub/U/o3aLLUnXtdBZKe2Z2usE
	 VTnq97b77TJqZ2hvEX6w/PcQAoSCO7bZE+VxfRgHzL0tLWrxFTJsAdK5JuoQ6HiWXf
	 6h3JTi0NzBzLU6VRu/RXL8PhTeecldGYBaf6T0tMwyfPJi1NIj5utr6ZEg37X3C2oa
	 GWUmaWa1nJqHw==
Message-ID: <3b60a7a7775b6bae58d231a52bd9ef10.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <678587b6.050a0220.32320f.317d@mx.google.com>
References: <20250112133953.10404-1-ansuelsmth@gmail.com> <20250112133953.10404-2-ansuelsmth@gmail.com> <15742b3ea7b5ee1cfdeb78657e9dc4c5.sboyd@kernel.org> <678587b6.050a0220.32320f.317d@mx.google.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: clock: drop NUM_CLOCKS define for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Date: Mon, 13 Jan 2025 13:53:46 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Christian Marangi (2025-01-13 13:37:56)
> On Mon, Jan 13, 2025 at 01:33:35PM -0800, Stephen Boyd wrote:
> > Subject says EN7581....
> >=20
> > Quoting Christian Marangi (2025-01-12 05:39:38)
> > > Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
> > > should not be placed here. Value is derived internally in the user
> > > driver.
> > >=20
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > > Changes v5:
> > > - Add ack tag
> > > Changes v4:
> > > - Move to patch 2 (improves bisectability)
> > > Changes v3:
> > > - Add this patch
> > >=20
> > >  include/dt-bindings/clock/en7523-clk.h | 2 --
> > >  1 file changed, 2 deletions(-)
> > >=20
> > > diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bind=
ings/clock/en7523-clk.h
> > > index 717d23a5e5ae..28e56745ccff 100644
> > > --- a/include/dt-bindings/clock/en7523-clk.h
> > > +++ b/include/dt-bindings/clock/en7523-clk.h
> > > @@ -12,6 +12,4 @@
> > >  #define EN7523_CLK_CRYPTO      6
> > >  #define EN7523_CLK_PCIE                7
> > > =20
> > > -#define EN7523_NUM_CLOCKS      8
> >=20
> > But this is EN7523
> >=20
> > drivers/clk/clk-en7523.c:539:25: error: =E2=80=98EN7523_NUM_CLOCKS=E2=
=80=99 undeclared (first use in this function)
> >   539 |         clk_data->num =3D EN7523_NUM_CLOCKS;
> >       |                         ^~~~~~~~~~~~~~~~~
>=20
> Hi Stephen,
>=20
> the same define is used for both EN7523 and EN7581, do you want me to res=
ubmit with a
> better description?
>=20
> Both clock are updated so no regression.
>=20

Please resubmit the entire patchset. It doesn't compile.
