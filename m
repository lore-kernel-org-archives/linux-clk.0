Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDA7220698;
	Thu, 24 Jul 2025 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753395379; cv=none; b=hsfqHRvWQdRrX90TPe9YBIQ7Fdf2ybinBBU/gYNPAAc56H2PvM+msp8bCno4EHg6A1iiCt5qoCRKvvy9TrUgXhA0jNFyz8jUMd9D4reYwxIGAyM/AOej1N0wkn9erAsXKGpaNDsi0+PQOXWZLpBYehanSddHHe/R79fNxnUjqDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753395379; c=relaxed/simple;
	bh=3L3Mit1dr1E4S3bHgoJxCDbceOrm3lMkpt/MDBwFasI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=M4K2aDaepT5TBjrvQLwqLNSob21drNA2tVCyS1Ewislh78wCwz1lLxVljQtt+D9x84cT+eZn5EXUV31hTPK+EBMx91U09l4A1bVoPDksJbv8+Q2oXa9fmgNKt4Rxi0TtftfEJzdw9Aam44oXToi5zpkNcebWRGCg2WW9o7cKytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZ9hGX7T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZ9hGX7T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B9AC4CEED;
	Thu, 24 Jul 2025 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395376;
	bh=3L3Mit1dr1E4S3bHgoJxCDbceOrm3lMkpt/MDBwFasI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bZ9hGX7TFoEbmFRxa+GlLtUm1x9+uz45iNRu8jSsgIOHubZjwMOI0cFguerCF88/6
	 MmFXhgOyANNij1ZCdqQVULFt6FQcWbV1ghD0ZzG7HdJfa38eD14QpuCl9SbTuTqwx9
	 MC/bYOWcRcCqJ7v0syXsRB+aPHAVQsaHtmMxgxZt7JuKESIfCUo1tnkBAfP2cFZadU
	 CT12pprEPWzdqzqZyGDXxWG6SHTuw7EBTDcDsMoVMz1O7i9A5/52uWgE2T4pu8iNDZ
	 0K3SM328TC6qo0VzLg4cDgupWAtY5f8/bgly1aay8dvnQ5zOFQT8PZRkBKad+TwxSj
	 WxYgfGgFTmoyw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-1-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-1-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 01/13] clk: imx: composite-8m: remove round_rate() in favor of determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:16:16 -0700
Message-ID: <175339537615.3513.10122327980339269667@lazor>
User-Agent: alot/0.11

Quoting Brian Masney (2025-07-10 14:10:33)
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next
