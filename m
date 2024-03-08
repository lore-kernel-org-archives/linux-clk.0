Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4922C3BBC7
	for <linux-clk@vger.kernel.org>; Fri,  8 Mar 2024 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709940174; cv=none; b=UJF66iFlxjT3n5I8pzPTKEq271oQyomIIfeTmjGkr7IEmUt3LZYd3bPTiTYhMjYFBTf9iygf4TjJ4gBfYbVpmv6eEIU0RK9L/qhbqm67qxT7Uxluj1O6oYVhDphneO9JwXLFy6iU1ccgMnSLHRke/fyvwwoV219NAHsab1XEI6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709940174; c=relaxed/simple;
	bh=tNSVR/L0aBF8JQZ97y0m1Qh++B+fAVFWjI1Y0D9kZm4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=O0loacdPIfgUX74NuwBrJNcGuqSz7EUAkDEaVIXT6ehri9Y0QyB0uT+/9XVbPP21j1KwuuAoesMyjEMAki+djExMkgY0fuCK9FP74/GvyfTYAklZBqcPVrGE+gsAZWc+6Dhs1ncx6TCV8RiiSy3L/pZh+nkjz7SXNY42odOirzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMjFRhq3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMjFRhq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00157C433C7;
	Fri,  8 Mar 2024 23:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709940174;
	bh=tNSVR/L0aBF8JQZ97y0m1Qh++B+fAVFWjI1Y0D9kZm4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NMjFRhq3a5kvCl0C9aOA7Dgqb0nqX5BSVvX7GjazXTKLGUxKTGihAVxMpMbq+D3oa
	 ehSlrf0klRqbpW7LGzW31/pij0blhpylDoRhJLTea1/2MNlOhW0GBW9K1idabKDhJO
	 3238HH3P0pyzNJZFPXcYfXpbzrTQKOg4WytBlDXHy1+SYQl7HoYs86WqMlD39pVe0t
	 lgxkwoAoDK8T96fS4eHkxNrmcgp7OKwNKv76N0Wd2lw4riI1m07rckfYp+YRwee/Ke
	 eHSjqS0Z2d/qP5VSGQt1/CrGYMzaedPg8G/wxM0N7/cMpAtozkwUVA0T0PxrFkvqig
	 D+JgducdXX/oA==
Message-ID: <743ad6455f98345e62f505ca8e773d7e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jle70se0s.fsf@starbuckisacylon.baylibre.com>
References: <1jle70se0s.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic clock updates for v6.9
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kevin hilman <khilman@kernel.org>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>, linux-amlogic@lists.infradead.org <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 08 Mar 2024 15:22:51 -0800
User-Agent: alot/0.10

Quoting Jerome Brunet (2024-03-02 10:04:03)
>=20
> Hi Stephen,
>=20
> Here is the amlogic clock update for v6.9.
> There is just a single fix for an Oops happening on the axg when listing
> the clocks through debugfs.
>=20
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:
>=20
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.9-1
>=20
> for you to fetch changes up to ba535bce57e71463a86f8b33a0ea88c26e3a6418:
>=20
>   clk: meson: Add missing clocks to axg_clk_regmaps (2024-02-05 10:06:21 =
+0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
