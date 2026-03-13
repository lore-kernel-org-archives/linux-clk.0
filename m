Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3932E3CB2E5
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422154; cv=none; b=QjhkJPTkgQHk5xZ77jvd+zzGOlkcI8eA1NUqm2B9z+jFxxGUrNQJxNNbSz99tXMFyri2uW+U+MJvTfbuGA+1wJyl3DkEEPj3595+yH+gluGLX9szXrytDk9JNf3Fi1QQwuzoHjTbtpXwatlJkkTUIih7gRi0VXqpz8gE+sACvYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422154; c=relaxed/simple;
	bh=zyT6Zx5rNV50Rhh8bUFkFd2y8cLIMemeRqCKnGHnYiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHSHqZ29o/npAddRIV4/RQ65aHUCwiFNZ6z/oIM4HZBC3vR3msFGRefOa+wn57J4ILrIJHfIP7DFiN9mlcciV7zT67kGMT4S57gUFzPrD9kAFfSj2ypWZwZgxEj/08YCiHzSfqweZ2+yqawUF9DXd1VJurTFpCHZwex5aGzcKp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OU08illl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OU08illl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0PcF
	b+tQ9rRKPaXrmOZYoCpIjOKlfnAZ5E4w+nFuegE=; b=OU08illlKHQcsueH3JMt
	DNh9BpDX0/WjFbo5UUL8/sLlnSROEfaTzLnDq2X/spq4UtxWOW/x0ysWn6RAIO4C
	hk1j1pEaa9BcKcGvVrwE0rdPZRrYz/JG8yy7HlS8JgENsPvzpE/RhAAIzoit8H2E
	4TQ4vOtJiLQVwa/BUr+9pRrLAD8CvrSVEve7/xonMAB3z0puspsMCQVCciKLQoTR
	Drgs9EfYGKbPLaurruTY4JHnSTz9FPPUg+8vYKU8vCBkYo3FOUcLq3WrA0PAVvXd
	Gtcjj6BHy06ph2urYklpJssmEF/Itwmy5YKpLVoZUFyg/CN+jP176kAtYmDkpot7
	dQ==
Received: (qmail 389448 invoked from network); 13 Mar 2026 18:15:49 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2026 18:15:49 +0100
X-UD-Smtp-Session: l3s3148p1@8Lg4BetM4LoujnuR
Date: Fri, 13 Mar 2026 18:15:48 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/3] clk: renesas: r9a06g032: Enable watchdog reset
 sources
Message-ID: <abRGRJwSJ8fxh9ep@ninjato>
References: <20260313092417.294356-1-herve.codina@bootlin.com>
 <20260313092417.294356-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6FdmM20lHNxqtsr"
Content-Disposition: inline
In-Reply-To: <20260313092417.294356-4-herve.codina@bootlin.com>


--d6FdmM20lHNxqtsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herve,

On Fri, Mar 13, 2026 at 10:24:16AM +0100, Herve Codina (Schneider Electric)=
 wrote:
> The watchdog timeout is signaled using an interrupt and, on this
> interrupt, a software initiated reset is performed.
>=20
> This software initiated reset performs, in the end, a hardware system
> reset using SWRST_REQ of RSTCTRL register.
>=20
> The watchdog itself is able to control directly the hardware system
> reset without any operation done by the interrupt handler. This feature
> allows the watchdog to not depend on the software to reset the system
> when a watchdog timeout occurs.
>=20
> Indeed, when the watchdog timeout occurs, the watchdog requests a system
> reset using its own hardware dedicated line but this reset source is
> disabled at the reset controller level.
>=20
> To benefit of this feature and be robust against software issues, enable
> watchdogs reset sources.
>=20
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Yes, much more elegant than v1, I think:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> +	/* Allow software reset and watchdog resets */
> +	writel(R9A06G032_SYSCTRL_SWRST | R9A06G032_SYSCTRL_RSTEN_MRESET_EN |

Super minor nit: I would swap this line...

> +	       R9A06G032_SYSCTRL_WDA7RST_0 | R9A06G032_SYSCTRL_WDA7RST_1,

=2E.. with this one. Feels more ordered if MRESET_EN is last. But I don't
insist.

This patch should have been sent seperately, though, IMHO. Mixing
watchdog and clock patches without a dependency only calls for unneeded
negotiations of involved subsystem maintainers.

Thanks for the series,

   Wolfram


--d6FdmM20lHNxqtsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm0RkQACgkQFA3kzBSg
Kba8LhAAnELBg2B8m8ROgz/VCsYjX/d3Ud/iSsGQYxQyvYUSRm0Eqjry42Nr4EZC
4rrTPPxHBKntLHykoHhRBV7XN+RUF+5BoBNP7GPZxtu5EJKIxETdiC0rOvaBy3Py
zYZ6kQFc9RMptFJ0w/OXItyqLV4sqfwztGcWKj+KyretLARVN2rUEKc85QnFA2W7
zg+GyuG3b9Viwp/R82IbyGRdm0J+LKU9zqbCyk8rtrugjLWoRj0CQRh4kxvXltck
mTDG4sfEg/4OpNolNLetcOTc6eHdufmGohNvzYrfLwC6HxP0aMT0DOVQckXvxKG2
3qE8EYML1LmGJMBTbXdV44B6lmHOfAPVPoR+5/NG5Lr+qhp/3AqDXSb6ptAG2uf0
wf6Jv7/z7CyLtfrw7aQHYnUyfqOYtrCqSKRoi4dsGIyg9pfLboBp9eYjNfmm1nbe
i7VI1u/zeIRAhIAyB+sLOuIMAH31ZOw53jyR+OexQjmWKRvNGOtN6pF3ifetIL22
HEnP1Tomdereawef9zjDd2iKdj4mh7+lUeiWl8v7azswl9DOeyZ0tlTKcwK1jYBC
4Wmr4JiDVGbNPvOkkZwBSmTEteTMNgtDznW7FYZaoeVCM+wkB+dxvbBzMZEQHVVF
v3YcFEeHGyhZZ/7Obwj9RKfVfUsm2w9VnKq3ILNQxrtSR8uotao=
=PS6Y
-----END PGP SIGNATURE-----

--d6FdmM20lHNxqtsr--
