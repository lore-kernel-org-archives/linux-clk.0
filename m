Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E3E18DF81;
	Tue,  3 Dec 2024 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733256133; cv=none; b=UPFI/KjRxYCWtiK/K+zs5zJo1KZ5nmZtThCqPMZYdebSXppySmbCOAOGIixgtoxRT7bZWf3qlDH2lfJ7JmPO8y763nK7hM7z/skZ3/K0Ct92l7aEMauysLatctmo20WE1d7wDk1IRD3rQmzfvyoj/VfeJgw0GnNd0MWDK0PbWVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733256133; c=relaxed/simple;
	bh=1Uhxmz8Q4PeGU4DkHt6IvzRq8f6gvaqLNxjeSg6wdvU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ivUvwDIjhT9bnrgjg8bybU+7U38MZsQ8Y/3p9Toxp6wmh+Gpe/AV3qkf+qMUrlR+n2SVooasZoEikl1LKiJXmIOFfNZrD2+kMaBb38/3mOCscj39ECIi8uHl+lJqkMm/J+aGAQ0WT1tSBgMewJ2J9jlleoBHJtCpSj1wMUwaAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLvnkmC1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLvnkmC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D600AC4CECF;
	Tue,  3 Dec 2024 20:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733256133;
	bh=1Uhxmz8Q4PeGU4DkHt6IvzRq8f6gvaqLNxjeSg6wdvU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uLvnkmC15YZP1c4uRWZ2WIQwTv9XQ10lWXx49Za9AmTdxuLWlWRaEII7/XM11JfCI
	 mNmqH3vB15+yxybA7qNQyzHbaBLmpRXGrNQW7YAU4IHLPjOGdtArb0SXU57vDIZD/Y
	 N5WnDJT9+0iNGmuZhHR7bwb/43KVlMbJDTkbW+K2GLkiKHFzaO0XZg+E1QdP2UoN3M
	 43tkLAfuyiKlhx2TlIZWA2m46DqGlyKR+FUCpnnkchlC0nWTe38jIS2q13euvemL2c
	 lGopdM3iwLvlzVpA0WXBxcU3KzmDxY+4Oob54+pmkuwcz50x5TMHwfOxJHCuT1J3bj
	 R/RieY5QKEYig==
Message-ID: <6e7c6886943dfdc77008a382bf316aeb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6155067d-aed5-4799-9e14-6dff7be1cb3a@stanley.mountain>
References: <6155067d-aed5-4799-9e14-6dff7be1cb3a@stanley.mountain>
Subject: Re: [PATCH next] clk: mmp: pxa1908-apbcp: Fix a NULL vs IS_ERR() bug in probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
To: Dan Carpenter <dan.carpenter@linaro.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Tue, 03 Dec 2024 12:02:10 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dan Carpenter (2024-11-20 09:18:44)
> The devm_kzalloc() function doesn't return error pointers, it returns
> NULL on error.  Update the check to match.
>=20
> Fixes: a89233dbd4df ("clk: mmp: Add Marvell PXA1908 APBCP driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-next
