Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B4E18A6C5;
	Thu, 19 Sep 2024 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726742122; cv=none; b=XpMhWw7xpD47OtQRLFPPB7WrJpSWZeFrWGZpMHVe3xm9vqvBJLpKUhpC6lAXeSH9Cp48DRzItB2U2UleUXCITPZIgCEWy/46P7GNd+o6Abrpzm1iRQatcCMbgPPc2v5X1Br2JpLqojOfAGp4Zya3twz5168yalAUap4NC2rXirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726742122; c=relaxed/simple;
	bh=ssSF/Fjtq/MJa/8CBQ4lgeI0tJWHkUOC2ndKMEAfP9U=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=SduAxtwKauBm37199s4lnDvT8fO1hh5gcDEJFL1YiEF/WnvEQdhLpal7MGqy9lIDj1QSVf23hn3y0Yv//U7EAJf5m2baznTrJXFsg0FexVJHTPbMZJGpUV2poC+hv4rjFcll0g2zbCw1NpMJOxQdXAR9kMSo73C/D6dIJ4zp8YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWRLgADh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWRLgADh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F2CC4CEC4;
	Thu, 19 Sep 2024 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726742122;
	bh=ssSF/Fjtq/MJa/8CBQ4lgeI0tJWHkUOC2ndKMEAfP9U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jWRLgADh8rrWfzvxokRb7brT50ZgBEQlB6RmpvopHNyfGhzynHz1nBtgs+/Gyrmsf
	 1I+UiCrGCmecghVKJ3jaup06zkXy+OgCGU9SI5ABti7MbiXkCqus57N7cqeWZbLkaF
	 2hBHGMMZAZdKmAaApkNqmEjCV9Rv+LeJ5oxbOnqh0L/aa4SofyqhZMNcHEhaDUmkEG
	 tjhn6MZngMuXfQhEVeJusTKr4yMmFklJ9Hg+NAjfi+RbQGvx4Yy9Ar91/lu2tpJaE5
	 WTgzh+ekNMNK/oomXhIsjPZdc+GLDHOE3cPssBETfEFioutMQ35JM8iUuXhEEzAQyx
	 pr+LYa77lzehw==
Message-ID: <53f1cb2aefeb360002cd840cb8997ae3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240917075250.19333-1-amishin@t-argos.ru>
References: <20240917075250.19333-1-amishin@t-argos.ru>
Subject: Re: [PATCH] clk: si5341: Prevent division by zero in si5341_output_clk_determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Aleksandr Mishin <amishin@t-argos.ru>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, Maxime Ripard <mripard@kernel.org>
To: Aleksandr Mishin <amishin@t-argos.ru>, Mike Looijmans <mike.looijmans@topic.nl>
Date: Thu, 19 Sep 2024 03:35:20 -0700
User-Agent: alot/0.10

Quoting Aleksandr Mishin (2024-09-17 00:52:50)
> In si5341_output_clk_determine_rate() division by zero is possible if the
> following conditions are met:
> - rate > (parent_rate / 2);
> - (parent_rate / 2) is not multiple of rate;
> - CLK_SET_RATE_PARENT flag is not set.
>=20
> Add zero value check to prevent division by zero.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: 61c34af50c5f ("clk: si5341: Switch to determine_rate")

Nope. The problem was there before this commit.

> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>  drivers/clk/clk-si5341.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
> index 6e8dd7387cfd..d0d68a5bba74 100644
> --- a/drivers/clk/clk-si5341.c
> +++ b/drivers/clk/clk-si5341.c
> @@ -855,7 +855,7 @@ static int si5341_output_clk_determine_rate(struct cl=
k_hw *hw,
>         } else {
>                 /* We cannot change our parent's rate, report what we can=
 do */
>                 r /=3D rate;
> -               rate =3D req->best_parent_rate / (r << 1);
> +               rate =3D (r << 1) ? req->best_parent_rate / (r << 1) : 0;

This is too ugly. Also, I assume it would be better to provide a higher
rate if the rate request allows it. Returning 0 should basically never
happen.
