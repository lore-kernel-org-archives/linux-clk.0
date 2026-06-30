Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A784F3DB310;
	Tue, 30 Jun 2026 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839362; cv=none; b=W/Nrw8+v/jVL9mUcvtnbrnBeNDpckWEFmuCzSBxisz6IZn5/GbmCd3zcvlxoVh3QmrJv9M5dhl3SOy26SdCWckYPlKehGceO9bXUOXNHOUxvS/aZNGEXwBO9999fepkYKGGM2uw7lbqekWXl30jBKMNLOAvLetNT+x5tYrByGPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839362; c=relaxed/simple;
	bh=ZQ463BWcNQ/hsjfVmxHntb0h6n+WMBn6b+KUF4VdkJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bo8o3yhz+5qq97pZOkjTWk7c6Z5LOXv9aW+hR970WCnGCewpazhei65YQJiQE5Spq1EeFSY1AnOlpwnrT1Yyyy/6TDaZTIZe6squGNUob9pLAakUz70Vi6w3o0EYbmjxv5yxfOdhrGuLLYzr4o45MPv6GLXFMPNugMnlGccheBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJC0kuXF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJC0kuXF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3D71F000E9;
	Tue, 30 Jun 2026 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839361;
	bh=ZQ463BWcNQ/hsjfVmxHntb0h6n+WMBn6b+KUF4VdkJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OJC0kuXFbpCHeFcfZ07jJhUKplyTMiBXEM9OSj/u9f8yTTW396S7BV0YqTO9NPtq8
	 37RTHUZWNEzm8WptAvGvWC5kupdrZ5e8ctKl1It0Bqasiaj+mRMWUKZYdI9PXV+bGI
	 ACPqkKZqpTNEyiM0b4FB6na7X8IFsR+zOJY8XSJ1SDPwchr7vf5LmTA6q2/Q7TxoxO
	 wnhXc05th0hS5uLLZQ1oyeC3xxxdKrwJTqdTPxCMKo9DXuFnWkSRvUYAneDLCVZNqK
	 7lXZxopgwWoB0xOdGrNNiHnMQP9g0958Z8zFcR4dpAjjYxt9YwJMbWIHvjNRV/4JK3
	 Ejizw6JINVrHQ==
Date: Tue, 30 Jun 2026 18:09:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: soc: spacemit: k3: Add clock ID for UFS
 refclk
Message-ID: <20260630-bullish-backed-1790f501d5c3@spud>
References: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
 <20260630-06-clk-ufs-support-v1-2-cf7521d1d0fe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35b+5CeuJkFuBDwY"
Content-Disposition: inline
In-Reply-To: <20260630-06-clk-ufs-support-v1-2-cf7521d1d0fe@kernel.org>

--35b+5CeuJkFuBDwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--35b+5CeuJkFuBDwY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP4PAAKCRB4tDGHoIJi
0nL1AQCAysfwv7mxL9RNVgQOqyZA/A0wbsLRrMZcK/NPCNXj5gEA7gWOJunVrkxY
IOk+VgtGB5f3YAg2sJPX5py6JGPkVwc=
=Y+s9
-----END PGP SIGNATURE-----

--35b+5CeuJkFuBDwY--
