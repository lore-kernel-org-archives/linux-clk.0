Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55354E80B3;
	Fri, 25 Sep 2026 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354547; cv=none; b=RC3xK+9YiOSZKwycNJDjyvjrEEJs9DKboQ0ajMB4lwhEUGOo6DqS0hnjlVwsw8xp6eizSiU1WN//YY8GRYrXScdfJu1Fx5WKM2D9gpz28mVu5cSwILOrC+1dKnn/Goe9ddrmC45KRaoOMyK48/eP/41csOPvHuNkPqRh5KsfMdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354547; c=relaxed/simple;
	bh=gyLkXDnbrXJEc0OaM1PjirQMqHWiD+iuadWmNBjeA2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvZiyXoP3GXUUhxMVdEqawqCfMQceTvN+LFJfAzu15yvoq93W93d5JAos5K4IMsRnByO+orogZA9OJzZcmno1NwlUWWKr1Ml1X/Azop9GUPqxqiTNmb8ElKtStmmMdRmzb2F93LAwn7ck7pnUfJCabPLq/5+/78Oj0CGH1BqD0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3z20XMQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3z20XMQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3A41F000FF;
	Fri, 25 Sep 2026 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354532;
	bh=gyLkXDnbrXJEc0OaM1PjirQMqHWiD+iuadWmNBjeA2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a3z20XMQmSM1lABjCbciu7pjC7e9zVg+7qPG0oYNr780XVrmUQkldgdporeBXCi/M
	 oAq24xYlAvFjOuBEgNzFDl8F5aJPLOQ1WabMioBlzUEdPRwqr9mc3d1fQTXJrrl7XR
	 xEAooSj/VqbzCdIj2JuJjTlaRghHlni1A4mf3AKFJm7JwJq+2+9n6lLTmIInwEWouv
	 iCrXD1AQu9kXzMrf0AhGYDhBpN5NE+Ns0kgZI2fubEl/WNA1z0/6sfWPP++Yj+7h+x
	 UwArp1tL7VbEpLaDgi0CxZtSegnoEYelBIrmqnfk02TWWhlR86Fd/QFkGeyY4lVNGv
	 hBCi8S2KyVUSQ==
Date: Fri, 25 Sep 2026 17:42:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/6] dt-bindings: clock: ma35d1: Add missing WDT/WWDT
 parent clocks
Message-ID: <20260925-blatancy-swizzle-cf68e2238861@spud>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
 <20260925-perso-ma35d1-upstream-clk-v4-3-f3697553391f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9g7vGttGi5KFY0fB"
Content-Disposition: inline
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-3-f3697553391f@bootlin.com>

--9g7vGttGi5KFY0fB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9g7vGttGi5KFY0fB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarakXgAKCRB4tDGHoIJi
0sIGAPwMU8FEvVOqYnT8J4KS45EZceVo0rtv2fXdjguce/XKqgD/RF6w9eFtMGkM
+ZqUe/H3GmKa1XFwPg913cljeBOTfwM=
=rGSs
-----END PGP SIGNATURE-----

--9g7vGttGi5KFY0fB--
