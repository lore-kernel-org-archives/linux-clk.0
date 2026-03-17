Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1D390C83;
	Tue, 17 Mar 2026 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732633; cv=none; b=aAf9HiGiTlKDIW+wqHTbm3qL7FCOp3Ut/z99V5vTzs6hw7lXxFl0Vk2c6FKFJHY//R6a9IsQ597fc2o3Y5gYokZkGUbbp14MbkvfNB1VIjaZ3Li9lol6CJZavkZ/tShTHBYCkVdwmxBp0J013Rmf+fKk0ab1zbrAHXCJ3LR/iD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732633; c=relaxed/simple;
	bh=K/TdHHsZVvOzwwVoJGJ+6DNE03u/r7LaLGvjkYX7nGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEbcegt1ANhmEVJXCcDheawDPBJsPs+JO1q2HzqN78MqyEE2FT1kXcIAeuinFy46EOUQz/s9s/+fz8nxGsvmdtmGQsp6tPrlCV+eGijUiGk5ew9xA8nskDLk6Y6gexDuzEsv+1Hz8RKz9qSs+ME6GHdSc85bSr8/4muKKJrYVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qKXi53ac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKXi53ac"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB060C2BC9E;
	Tue, 17 Mar 2026 07:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773732633;
	bh=K/TdHHsZVvOzwwVoJGJ+6DNE03u/r7LaLGvjkYX7nGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKXi53aclx2O/SbRnyVrSRqxzdjdw9pj+RLOGYDHPGFsD0VmK74JJab5v+9i5Jpog
	 Ry41JyZkRu60wcGsscCVP9jQzwI5z1bP7E9TuJweHqpT0Ea9Rkw0jVqIiqvKkR/4gs
	 T9S4Lw19owG3Q5/9zZfeI9enqxbmVFqYI614IBMeCyMr5SOJljLVIViUaSRA0tK+du
	 BjOmVQObf7Sci542FmVXqiAqYVYzVIxABWqpDUrg8Zac41Laf0vel4Yj2LHAII0MRZ
	 KQOX0pNbfnna3g3HYmEhhtnTOJCDjhYK1GUq9k2iB8kCLgbA3XVt+YqABXKFN6NYUo
	 Njvs9GSMHn1mw==
Date: Tue, 17 Mar 2026 08:30:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <20260317-almond-leech-of-correction-2a2ef6@houat>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="meejllfhgqllwyqr"
Content-Disposition: inline
In-Reply-To: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>


--meejllfhgqllwyqr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
MIME-Version: 1.0

Hi,

On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> discussion about how large number of systems need to boot with
> clk_ignore_unused. Per the discussions at the conference, the existing
> behavior in the clk core is broken, and there is a desire to completely
> remove this functionality.

Broken how?

clk_ignore_unused is to a point where it's seriously cargo-culted and
documented as a silver bullet, when in reality it's just a debug tool
for broken drivers, and the driver must be fixed.

But nobody is actually fixing it.

See
https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
for example. The affected clock could be marked as CLK_IS_CRITICAL, and
fedora wouldn't have to package anything, change anything, etc. But no,
the problem is clk_ignore_unused.

Maxime

--meejllfhgqllwyqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabkDCAAKCRAnX84Zoj2+
dvLZAX0T6qAsSUUww2TayTlfYiGbnqpZPBSCdB+PKM1g4fU/dnCRFozIZM1ECTX3
OcnrXJkBgLrx8CP1eHbIXH8kwu1lODASf15w0eyvQ6n2ZnRTHNWzkfLhPOGG0NUD
o0rt6s7qPA==
=Bq79
-----END PGP SIGNATURE-----

--meejllfhgqllwyqr--
