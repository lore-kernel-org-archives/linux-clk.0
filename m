Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE753C7DEB;
	Wed, 16 Sep 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550685; cv=none; b=ge4t/JbtmNIcNsVheijAlC8SjDHkZ/FqEPscjAylAFPHqxjyM7XOQqHaV1PI6xAKVp+evBn21aCsjUAB8074MrlTK2PooPXLK3YcHFDePdFprccKD/0S1DQD1y2LtPkqcC51b0O0YOZPoAZbGNhZ1Bo9WjClaggUbjZH+3+UHf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550685; c=relaxed/simple;
	bh=A9JwTwuDQ5QttnP02TNC41x4pm8yecah2SUjsrG1TB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjcfStxuj9UPhFWQapIS2uaPNvXcIk2B43FsCVdZ7SG+jwGBJ7S2Hv+musEPomIJbqfnKFfljYhnC9+kPPXdagNcIAIF7iB5z8bFImPvwqPElj/QN34381BVSo4fJIiXxWF8wd0zxadxTmLgSt3woOw9q2PG6JU2rNACZsqO9Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO1oHkpg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO1oHkpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F981F00899;
	Wed, 16 Sep 2026 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550674;
	bh=A9JwTwuDQ5QttnP02TNC41x4pm8yecah2SUjsrG1TB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mO1oHkpgZNSPMaMd3iRubcijUIt+EKBvyhrVcrlEFX2GHAsQknMLnpNeoBygQtoM+
	 +hceLGVPCG4t01fSh3wmCMgu63si2FLo6u8+ViMajioC2+4HnZvqzHe78TVj0Uz1ar
	 e8xtCaS+PyhcZJWNjrSGxgYprYeYNv7x4qy4LlAvgpTsX4xJtY0WEqFGUZXrwatDyQ
	 JzFI9XP/bHa4ZlyihYDKaSnHZTT2Osss67Lc7P2iE/JDj6JsDdudW6DbHUYGbvWOgU
	 HiYKvZI8ngWxeIbEbYSzRriwxjCJN9ICpyPntZb3N46nx/Gny3vOFj9houTefC3PCO
	 G7NbrQAu0pT+Q==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1x6lsW-00000005xdg-1DYO;
	Wed, 16 Sep 2026 11:24:32 +0200
Date: Wed, 16 Sep 2026 11:24:32 +0200
From: Johan Hovold <johan@kernel.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915103345.1334-1-joshua.crofts1@gmail.com>

On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:
> Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> on teardown or error, causing potential resource leaks. This series adds
> the missing calls.

No, as I've explained repeatedly elsewhere, it does not cause any
resource leaks. [1][2]

The autosuspend setting leaks if you will, but that only matters in the
theoretical corner case of someone rebinding a different driver (which
will soon also taint the kernel).

So don't exaggerate the impact, this is essentially just a cleanup,
which is fine in itself.

Johan

[1] https://lore.kernel.org/all/aqpd3viN1UoZBkgL@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-iio/aow51Nk-cet9qaUQ@hovoldconsulting.com/
