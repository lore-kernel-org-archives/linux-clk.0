Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10587433BC5;
	Fri, 25 Sep 2026 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354524; cv=none; b=kxnWI+a+z50cffUJn7A3SyKKtXWlquqKIXjCAC2lQ1zLubT51LVuEztriFsV8gdKQnJR+dubLa6JKFcwWY49ia4CQXC350itL+9eMpai39QI5kCP1o+W6KuVqhyyQqK5zqXiM9Xn2FDEO0kpLfyU3sLtOm4VkW5XdFiwRr9UNV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354524; c=relaxed/simple;
	bh=YRlpI2716yzksWPXXIQtxpp7YNKLHi0X+uq5w96Ah1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtwZDwtX43aLnTymXcUmaX0OT2o33CC1MdC+3q38/qUbkCsD6ZlI9anujqVBiKbXki/SxdO4AOVeWcBq+U55eNNcdbJkVJr5mXrjfClIVFS9wlWy6He6nrPPnpnMzjPpZtoBFPfGPJtMpBafdDRq88HdnnHHlrUrOeVx861PucU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V294LImQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V294LImQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D0A1F00893;
	Fri, 25 Sep 2026 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354508;
	bh=YRlpI2716yzksWPXXIQtxpp7YNKLHi0X+uq5w96Ah1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V294LImQLX/sK5v4jTqHiyy0GICCw/Btx7xgTDrQEOSgNb3nb2kPEvP6oLE9ZidYp
	 B4zgVFImxYfCoaGzp/mdTU64hzs64B9s2O5rPmAWfubR53F2Fy1vktizl1Jr4PHK3t
	 b7zzDOSB2AMab6k1T8frKdeCltp5kW79W2Mdu6+RpSkpJ0Q1T/w/4vc4OW4PvgrKZc
	 LtHkUPCoH0zTeVKD6fIRzlKpvaxLILOpbosECr6fxM2v1QX+4UpNFAWFIkk9Vy/vot
	 6YFm8FFOhLEi2MaAcPbsYdIcECtHczEWYnrXLRre7VbuHoFTt4n/NOyQNlquRe3Rxu
	 5JaygrPPyuPNw==
Date: Fri, 25 Sep 2026 17:41:42 +0100
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
Subject: Re: [PATCH v4 2/6] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX
 define
Message-ID: <20260925-zebra-overshoot-8092235f70c2@spud>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
 <20260925-perso-ma35d1-upstream-clk-v4-2-f3697553391f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="glG0NR2q7tebZ3BS"
Content-Disposition: inline
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-2-f3697553391f@bootlin.com>

--glG0NR2q7tebZ3BS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--glG0NR2q7tebZ3BS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarakRgAKCRB4tDGHoIJi
0lVoAQDLzgm7mNihUnys36ssenR6Ful6fCx/okkkTDAZAY/iNAEA5otLZwGvz+++
7ERwZrI/Dxar8hFGdEbuGm4v+vZ+4QQ=
=OMog
-----END PGP SIGNATURE-----

--glG0NR2q7tebZ3BS--
