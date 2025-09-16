Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC0B2DC763
	for <linux-clk@vger.kernel.org>; Tue, 16 Sep 2025 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757986739; cv=none; b=irEtIMHIY+HkK4RmJdcQGYqHLcw3X71ezpE9EFR7UJbs5tr9SNiXuCc9iMm8Nvp41fLHNk/7N5FW1uZOEHD4T1SjLKfyz6ay5DwArZJkLhwuAvZO6lVGMXX2U4unKVQbXSz47S8mS34uZhskVjhkGKon30QAyQ0GxOi8X7MW+lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757986739; c=relaxed/simple;
	bh=8sFoEaMtB3SAvjyszuoCB6AyW4HgU2Zoq6ImsftTPwA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=I3CwHRdIA8bPpyTEB7wwMuhKsdIhaYHWDCUK2Q818laujPnoDIpmYgqseY9OGZ2I7QihB9YqFP/XWuTgvpEjM1K/v4ictt03clNbryF1J/lQLcBp+oSPtZzhgdZ+nX5cJGNLd48ViOVebsoYCebI0ZHOcyWL53KenKt/Fye0gXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tssAsw8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tssAsw8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96873C4CEF1;
	Tue, 16 Sep 2025 01:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757986739;
	bh=8sFoEaMtB3SAvjyszuoCB6AyW4HgU2Zoq6ImsftTPwA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tssAsw8nmknUbBtb8FYPFPee3d0mnYeNgt6A64N/SdHsvhKbrBLylQGUkKZbbq25t
	 eLzv2RfEOB2lNcp7l/ohgtWUB37ZsNr6qcu4Rdhbp5hkppXd/X1/9J+I3hKBnvK2+C
	 RMQC+IRrJ4SXcP0IX/413jOnnBI7M5eXe4FahR5p5kCxyJSUBsWj75B/9HqBCAD1Fq
	 zJ2tyA7x06v/rkUwWe5tOcT5JPL9gIv5oUmmZQKceQG5TmWjQsVt1B5zggXPXDECbH
	 pwxuNOMbHewAJylwiz3xa1sjmm1h4uLADL9+x1G06eq+AUXgW9yaLgeC72AcXn3ZrT
	 yvrZhlnH4gsLQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jecs8hxry.fsf@starbuckisacylon.baylibre.com>
References: <1jecs8hxry.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 15 Sep 2025 18:38:44 -0700
Message-ID: <175798672445.4354.9868549804401398525@lazor>
User-Agent: alot/0.11

Quoting Jerome Brunet (2025-09-15 02:26:25)
>=20
> Hi Stephen,
>=20
> Here are the Amlogic clock updates for v6.18.
>=20
> This is mostly a clean up of pointless differences between the
> controllers which have been accumulated over the years. Hopefully, this
> will help with the maintenance and simplify the review of the incoming
> new controllers.
>=20
> Overall, this is just simple stuff but since it touches every Amlogic
> controllers, the diff is fairly large.
>=20
> Please pull
> Cheers
>=20
> Jerome
>=20
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.18-1
>=20
> for you to fetch changes up to 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf:
>=20
>   clk: amlogic: c3-peripherals: use helper for basic composite clocks (20=
25-09-04 18:27:12 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
