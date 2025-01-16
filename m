Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108A1953AD;
	Thu, 16 Jan 2025 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737063988; cv=none; b=gM/ibrPwrRfgoYDFP0bjKgWxMKKviUzjsOAu2FrrQ1X0V7NAgfhuoiIeoN1seXqyeYrEkYoewj1CiFWBkGnbyrpV7F7A5/ZGWinq51O1m1coy0D6TC1yolWVqeQA8IILaQljzShIPWWSjuIZVjS6l15PGvZ+2yf/SLBQauBtULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737063988; c=relaxed/simple;
	bh=iGQSHGP+4qfyzAWGelUyRopQPJwwdOUx+Xrg4Y30uGU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Jx7TPPGXerWJCz7+S4YVTmeCDmKVwWEew0DUoEAtw3WAKsxZDsAZQ6M4jwePSzH6E/Nz0mqrUPEyEv4iPOpq7yVoZ3iR6gh8vTiuOdlF/Stesyjt7+bYTdAd9aapyoSHuFbWHclKMEeWqnVuY6bw94FMGOhXs6UOSkmHREpxg6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIT0LOS3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIT0LOS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE71C4CED6;
	Thu, 16 Jan 2025 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737063987;
	bh=iGQSHGP+4qfyzAWGelUyRopQPJwwdOUx+Xrg4Y30uGU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nIT0LOS3q2mGIocjkH1dvol3dX+V8ShNb1sItJOTCxTNlzIbWPgKx3AL52CIy07s4
	 MkuaYQXjMQaBHT9Oc1Psm7f3yA1sl2CjDS6Vt4JV+YM6+AePOfh2qHVC6et3B9qt7F
	 vW24eO8HRCPH3e3wgM+xHtklf/sPZEaozOh0wYJ/1m4g2yCHaXL+JAWfocujFEJZa4
	 GX8dez1xG68QZDgo6JSHhA3YI3whwkX7X3QsKzi5dWNuu1mO+NOvllQ5RYafCPYAuM
	 QTG9ktTVQFK7U4c7tkR0vARgxfaVcUmkT1bOX2B6aye+OfYXLAhbDtNN998E0bHt6a
	 FP6Rol+8cMNYg==
Message-ID: <b26a4774530bd59b4e48a36bc6953d55.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240830061639.2316-1-ganboing@gmail.com>
References: <20240830061639.2316-1-ganboing@gmail.com>
Subject: Re: [PATCH v2] clk: analogbits: Fix incorrect calculation of vco rate delta
From: Stephen Boyd <sboyd@kernel.org>
Cc: samuel.holland@sifive.com, emil.renner.berthing@canonical.com, mturquette@baylibre.com, paul.walmsley@sifive.com
To: Bo Gan <ganboing@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 16 Jan 2025 13:46:25 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Bo Gan (2024-08-29 23:16:39)
> In function `wrpll_configure_for_rate`, we try to determine the best PLL
> configuration for a target rate. However, in the loop where we try values
> of R, we should compare the derived `vco` with `target_vco_rate`. However,
> we were in fact comparing it with `target_rate`, which is actually after
> Q shift. This is incorrect, and sometimes can result in suboptimal clock
> rates. This patch fixes it.
>=20
> Fixes: 7b9487a9a5c4 ("clk: analogbits: add Wide-Range PLL library")
> Signed-off-by: Bo Gan <ganboing@gmail.com>
> ---

Applied to clk-next
