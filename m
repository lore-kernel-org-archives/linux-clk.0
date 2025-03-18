Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFF318E25
	for <linux-clk@vger.kernel.org>; Tue, 18 Mar 2025 22:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742337043; cv=none; b=a2ezH5szzcb70RH7q26XmcwAgYM6UzH0sUZhyKpk0VSwhhpnWaNgbtew05HXBPGQU10ABLx8I2Nx3J/yLFZTD0fF7IhGWuDXwP8v4nMGsad4YHCjz9XPEz2kiiiOwGB+9oAmaIewXUBCEJnH1UBJhUYZ5OgT8fVbGd3XK70Dmto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742337043; c=relaxed/simple;
	bh=m872xVM1kixyrUBbMrPU1JscAYon4mXziGcAgMf+V/8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=E6R+aLELiVTFxvLaCXvS+RmZt8hOb2VTdjDMS33iIjg7IczpAUKCq+Ywcp1Tks1e5KSuyVPIi3ZSm1bC5AQZ3XhKLThCdR3VARVxacY7jbQ9V+ltm5+YJQfsvtbg/G3/GyXZbb50NBb9PPZ0GShCc0dG6YM+bs96HWTtQvAqwGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYgfUGQ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYgfUGQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFE7C4CEDD;
	Tue, 18 Mar 2025 22:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742337043;
	bh=m872xVM1kixyrUBbMrPU1JscAYon4mXziGcAgMf+V/8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sYgfUGQ4gf/ee4qnfUhP5/KoFqNFpezOyqIxh594fyD3atAXcik/VpdJ1sRWAN8ux
	 zzdehlzPATZLnyYUmZn8xfg21K0eB/isZ5nLzfqXTz7A45v+TiEK5yrUGnBI6ru+RS
	 zX5BNmWyNSexKLWsHyAf0H1hqWe+3kCrWl3OryCe6cujQ/o6GjWhO9jC6PoGCG4SQ0
	 dSwsfYYdEKp2e4U95YdUoaqg3w9DixPS7C3xq6RZ8J3JDX1mYYKxZdPdb2kJAoRVl9
	 xZuJD5J2sKCgDgxIo7EB3ZqWNuot87wVYB6EJhahjiu5vueP+8B3ekRE4dkXed/ClN
	 ghY/DP6MbWHtA==
Message-ID: <12307eaac58f0dc901510b62667938d3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jr02z39mo.fsf@starbuckisacylon.baylibre.com>
References: <1jr02z39mo.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic clock updates for v6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: 'Neil Armstrong' <neil.armstrong@linaro.org>, 'Kevin Hilman' <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Mar 2025 15:30:40 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Jerome Brunet (2025-03-14 08:38:39)
>=20
> Hi Stephen,
>=20
> Here are the Amlogic clock changes for v6.15.
> Nothing out of ordinary this time around, just a few fixups.
>=20
> Please pull.
> Cheers
>=20
> Jerome
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.15-1
>=20
> for you to fetch changes up to b3c221e752c4e46fd86d6e15153fa8c38bc3f250:
>=20
>   clk: amlogic: a1: fix a typo (2025-03-14 16:20:23 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
