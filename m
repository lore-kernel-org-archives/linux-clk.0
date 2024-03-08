Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D573BBC3
	for <linux-clk@vger.kernel.org>; Fri,  8 Mar 2024 23:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709939959; cv=none; b=oXexDVRH6HWxLBFp/7LBxjJQ95NfoYYcZ3vJar3b8WCm+Oiv0Ung8PoyAPOs+wtuPctCqSe0g3jlbgKreXuIeJpVNzz+yRQvkyIaBuc+uxdKeZGUvVD5QSveY+hSX813QSk840eX1tXy+yQOulqoc5cVQwaqsp8F9i1G305VhyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709939959; c=relaxed/simple;
	bh=Kl/CL3TPY5yYfZn3WiVNhbQLZegamTMFDTfFjD1PEKM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=i51j4M/nX7vJKFgmzdGuV0HXovF/LHK5S2DCVm4jVq57VIlCV19//YW4Ctu8qvr6v3htKXqdr6w0Valpifvk+1Uer6HcLtpOGN7pRKCH5wmxw96meeeiEZkD8rT6bEh0BdCOJkO0xXn3SM9XgSqu/xkwA2qXwae3dkxiTLHCSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRKEz1uA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRKEz1uA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B62C433F1;
	Fri,  8 Mar 2024 23:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709939959;
	bh=Kl/CL3TPY5yYfZn3WiVNhbQLZegamTMFDTfFjD1PEKM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CRKEz1uAeB1DB9EP1GzNFpMOF3NvKbxjvsu3t7NNy8+Xl9ZzH2SJb3U/siVwc7GeQ
	 6xqBZAAdXKOQLtzi0ffEZduJ4YoKoJKitz1ySpULagFX9VaX7d2ylUZe/x9WbeoEy8
	 /5QzJ6WeFy3eMjuamJ+QTPDz5S3Ljbnatfyrb9oEsJdI6Ek2PyjQjPGuftCRB9BtXD
	 8QU4K5O0HkHLSfNw5e90I5CpD1GpjI+/03YzuDzQ/W1ScCJjlhvvf/AJ33tIQp3Xio
	 SL4FPzufMugmyV8D7UZTeDHgQCUP0n0h86MGevSwUblGv2KXdZm+kEmeq3OTLKDn6b
	 u5K+F1Dt5ysvA==
Message-ID: <49439db165555c6c03160cb18e30a362.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <312ec7052c4e327c0b365e167a8e86b406cb7dfa.1709721042.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709721042.git.u.kleine-koenig@pengutronix.de> <312ec7052c4e327c0b365e167a8e86b406cb7dfa.1709721042.git.u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] clk: starfive: jh7110-isp: Convert to platform remove callback returning void
From: Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 08 Mar 2024 15:19:16 -0800
User-Agent: alot/0.10

Quoting Uwe Kleine-K=C3=B6nig (2024-03-06 02:38:56)
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
