Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7089F3F39DD;
	Tue, 26 May 2026 16:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813923; cv=none; b=U4WwaqsNT4mO/ElZ/rEJzm4Yw52lQRr4on8+Fs/OZG5pJP0jlPOd1WfxtAQN7ftITjzKMJ19x1dQg0SZEUcrZesX0taXazcHLDChYbqhBbu5vYFFsCmD6JIpSTzHblOKQsdoxuEiBOugU07k6tF+fYu3TF3JAGlV+3BpC+mfqBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813923; c=relaxed/simple;
	bh=4YuWWIChWk0yUgGUXU1F+I0lhuLlhRPeMLXGEXAPs28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7FLQteFylTfr6n7kvW8UkL1wzrO9RCrYf+Z5qbHmw75JdPutyFvxFwknMe31BdcPTqgnl6CvlZ5h4lYadQjL8Pid7L6ILJG5WJm26TX8dUcByJ0jw4c0LTEVph3s38H3u5L/ckF8UyPu6Qsix5Uwi9Eh/iMrY41ifK5PYaJlhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kU9oDuNc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kU9oDuNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771461F000E9;
	Tue, 26 May 2026 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813920;
	bh=4YuWWIChWk0yUgGUXU1F+I0lhuLlhRPeMLXGEXAPs28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kU9oDuNcoTuvDqZ9Wz0Ekupccbo+RQmdoM8U0EVV8yQjju8SNIxYlqY026mKu2E7y
	 WY0IS7ZDgmHo13iaRn6a2dhZf+5xwoBTE+nqyM5eW5OzpQzJ2Mp5ZJQZj+ofSvtA7u
	 63/TZhl7XbX8LHL/4ZvGbr/2UJxrpXooPOTzhOk6lbm6F7HEwjWg63RVecI/AJW2rX
	 vKZl35OosHQmjgophyUgD1h8YMf+JNh0BDvhu5nhs/zu8xOL2EDuGt+grOHwm5DwE4
	 OFoz2gAyh6AJSn4LOqsWBC4hveIZoPAKlLNHpoMFspXP+NIO41/a8918N74cQcj2rT
	 Y4CU7rU/zPaeg==
Date: Tue, 26 May 2026 17:45:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add header/doc for Siflower
 sf21-topcrm
Message-ID: <20260526-outbreak-triceps-48ac74ceea05@spud>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
 <20260524-sf21-topcrm-v2-2-4527aae05c3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FzGP7dsmN1NUJIaP"
Content-Disposition: inline
In-Reply-To: <20260524-sf21-topcrm-v2-2-4527aae05c3d@gmail.com>


--FzGP7dsmN1NUJIaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 09:13:07PM +0800, Chuanhong Guo wrote:
> Add the device tree binding header and binding doc for
> Siflower SF21A6826/SF21H8898 toplevel clock and reset module.
>=20
> CLK_ETH_REF_P is a clock name that exists in the vendor datasheet.
> This clock connects directly to CLK_PCIEPLL_FOUT2 and there's no
> clock gate/mux in between. An alias is created for this clock
> to make available clock names align with the datasheet.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FzGP7dsmN1NUJIaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahXOGwAKCRB4tDGHoIJi
0sPuAQCmij/iq15WxKbT7Sk29Pt6Mx4jeETaq//KaAOiasXL5QEAiTcmMKmssmw2
6N4ZR50/hHMSMwZfyHd4FvdXI+pa4QY=
=TsNU
-----END PGP SIGNATURE-----

--FzGP7dsmN1NUJIaP--
