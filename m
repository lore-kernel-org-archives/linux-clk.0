Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6A1917F3
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730932631; cv=none; b=kaFAgUiz3oMLlyj59zWJ4/9xZJ7ysZ4FFRVHTq2EIiPIcBwyk8THqCzBrC0xiUBYWcReVlp5Xq5St71pYq8OR1HFKcxGCg5+n480Lkmsg1nWN5D7rqC1zoqvsSrbqwgpJuw+e1r+qKJDe/akMBiOGxwGfT2qnfR/kIVqKLdqmvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730932631; c=relaxed/simple;
	bh=PClIa1H/8+JNgFkWXB9z0cua1IWmQCMhs0JPiLYRciM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Xjezxwmc4ngik06u8/xazVPd8r1oSNZ6zkr6FH0q/8HD5zuanpISFtSR+SjY0I2wwHn/jqUO+xZJUpntUBOcPQSr+ndwUWamW1XOPvJjXZbsxiMK1cxGC7XkSvg8SLxfqt8ss3x9Sci68CeVy0Tj1wJ8GoGqhOoTitvaswHbAgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Um5u2Lak; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Um5u2Lak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1A5C4CEC6;
	Wed,  6 Nov 2024 22:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730932630;
	bh=PClIa1H/8+JNgFkWXB9z0cua1IWmQCMhs0JPiLYRciM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Um5u2LakOvgC8mgwlmfUebdR/nTYgNmR55GIFn9LM4XTFAHlYXem2uZeB3/Nk+LDb
	 jz74foOavjYN1kB7zadnDNlPDQS3VEd6M5kCjoYjQsS1UlkBRDw/pRALgI2Q81Fs++
	 jRPX3iWrdqpDa5dbN6/CA8Y8gg4iYeZY2xrNQ6NnGKU4+HEZhsm/X2NFfenFf06GKE
	 5auz3ma7gJxAgiakGeERkxFZvvJAU8mYyKPZDTVVEr5asm7q7olP8e5Iy9PdJ2PAkk
	 dk27B2AZ8wfrwSDOK6Z/Kewf+uQmm13Ejacu3I7kjFBLZPlQ3Hkguoo5mZoDgCSmiz
	 uN8nAG0H+U96w==
Message-ID: <7a8a23851e6e156718e48ed1ef67aeff.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jy11w307q.fsf@starbuckisacylon.baylibre.com>
References: <1jy11w307q.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic clock updates for v6.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>, linux-amlogic@lists.infradead.org <linux-amlogic@lists.infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 06 Nov 2024 14:37:08 -0800
User-Agent: alot/0.10

Quoting Jerome Brunet (2024-11-06 06:28:57)
>=20
> Hi Stephen,
>=20
> Here is the Amlogic clock update for v6.13.
>=20
> This is one is a bit out of the ordinary. You'll notice a fair amount
> change in drivers/reset. We completed the rework to take the resets of
> the axg controller out of drivers/clk/meson. This code will now be
> maintained where it belongs. This will also allow to not duplicate reset
> driver with the new audio clock controllers coming up.
>=20
> The reset change present in this PR come from the following tag provided
> by Philipp:
>=20
> https://git.pengutronix.de/cgit/pza/linux/tag/?h=3Dreset-amlogic-aux
>=20
> One of the change present in this PR depends on these reset changes
> which is why I pulled it.
>=20
> The rest of the PR is business as usual.
>=20
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.13-1
>=20
> for you to fetch changes up to 664988eb47dd2d6ae1d9e4188ec91832562f8f26:
>=20
>   clk: amlogic: axg-audio: use the auxiliary reset driver (2024-10-14 10:=
11:05 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
