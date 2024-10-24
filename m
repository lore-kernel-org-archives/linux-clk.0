Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7047C14B08E;
	Thu, 24 Oct 2024 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729772086; cv=none; b=IwSJrocKSB7Ip3KmQ3XpmuZ54UiJmuKxjUdiupRFDepqx9HBTvJbVnQz/z1T1fw2EFR9LXMXljbZKWHcMla29oTRLkoc4DUJd5/q1istEbDG0St/oGgqMgJx/qYG/2+K5gxGYN9BhYZyjbbjd/Dn80vJt1dlDyKe6l1Qp1gxqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729772086; c=relaxed/simple;
	bh=RwvrfTv5gy55jcjI6bin8pxUAiAuiFQWvOFHXr8Y7Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HB1oAOluZ4IwaTykK//T32brEa2ubNj3JciiZgYILv3oYhotYyAuACvUQDqYZEfuHrNk7YuX993U7qGFbqb5jxfRyNSh2+7k6H2djx1HbKR7aEInIrS+0xkqoS/cNgzW4WGxUCekX9WALrDhw60wGVI2ii9o4sCmyntjOO8GYEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lj2WbXBJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lj2WbXBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554E8C4CEC7;
	Thu, 24 Oct 2024 12:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729772086;
	bh=RwvrfTv5gy55jcjI6bin8pxUAiAuiFQWvOFHXr8Y7Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lj2WbXBJG8ht/k1YpD0VwMgNrwJ2KCjua6xaK8o6D5JOtrD7zh1mKBCcH2SgolDXX
	 +4eOPGye1SYhax6qrs2QStyUecKNqKV+mtE3MKeBcclXhvNWMav+gm3vsUogOaveUT
	 2pjvoh+80OOKNH0qbprOJ4byFsZ6WwWc5YwlZ5VFhFwL2oCcX2yAYk88xebmFj7Usk
	 1QfZBxZDfQBF6szmuQadR1IQv+z8cDgJD9rmDHksZYvARwE+ANyOIJdvFWZpJiSWHC
	 RhW/b8WNbRc9zkAOimh9eYE5y5Ze8P/1zW4GV1cnqQAvSMXcaiiXFFhayq98Z6OeX8
	 qOM9d5RIpflKQ==
Date: Thu, 24 Oct 2024 13:14:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: allwinner: add H616 sun4i audio
 codec binding
Message-ID: <313c922f-9967-4958-a438-11528b811baa@sirena.org.uk>
References: <20241023075917.186835-1-ryan@testtoast.com>
 <20241023075917.186835-3-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wE+qwdJsGOAxZKMP"
Content-Disposition: inline
In-Reply-To: <20241023075917.186835-3-ryan@testtoast.com>
X-Cookie: Real programs don't eat cache.


--wE+qwdJsGOAxZKMP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 08:56:58PM +1300, Ryan Walklin wrote:
> The H616 has an audio codec compatible with the sun4i-a10 driver.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--wE+qwdJsGOAxZKMP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcaOi8ACgkQJNaLcl1U
h9ACCQf/Vm/4V34RBhEzAfgM1hSjkQLktpGxHbr9DlKWSpqCJMx+c+s46N3znXmQ
gVT1WSZB4W3AbU4Qa0wKDG1JKOuaa0bAKxoDAvqFbOBfrlC8R74mDrqPt2Fp3oxn
8hBkr1i+z23WsViKXF4D74+UBctx2NqwSfyj0+OOuouSW33YBCdcyVof8QyzEqWn
kDDJG6GEQFDt+TSCdAOMr+NzeGiuxUVFgpPN9Eg1NxMr5Z4XpongwEo46u/SoA/Y
2+y6+3G+0dOI7oW6ehXC5Tx4RImmtmJUBYFfLnxzC081W/cMkKEgSbcRr8ffzfXJ
OIRUuO+CKBuwnkBKIYOsaa6+7G4Zeg==
=YLIf
-----END PGP SIGNATURE-----

--wE+qwdJsGOAxZKMP--
