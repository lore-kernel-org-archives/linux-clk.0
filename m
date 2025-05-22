Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925A21E5202
	for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 22:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954044; cv=none; b=ZQrX2SjhFhRwh5ApTiX6OQrWPqjXfC37T0H5iEh4JNKCo4BwmpE2Wy+LVyTrXA/m0r7Zf+Sh9JYLjXJjwXOwX8RUW8XaSFK7nOvVcUGpRmRymc89ZB3Ry9eZVZJAZQ0CBscfZnoFtLzOCGda3FmONJvRTuaehTInRRD3Lp3nWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954044; c=relaxed/simple;
	bh=Nwm7dVrVcwQecgIp7pe2hz9KIDsJNlfePEB5EQevxY0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=gOcQ8WAWUUqPRrKXxyaXKQ57Ehd/VIgXviGTI6DZ4carvRiqB65xdlNSnr4XOOrCR4toc/DvL/rotUBS3mOA/xVqk+6PQG6XUYkyFp6syL71cJwz7cIH6wB36pMdOL4MHnppyDHoCGNfscoP4tQRsA1tut2CYo4IkD7yIiWpuc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXfRMcLn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXfRMcLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00507C4CEE4;
	Thu, 22 May 2025 22:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747954044;
	bh=Nwm7dVrVcwQecgIp7pe2hz9KIDsJNlfePEB5EQevxY0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iXfRMcLnf0+6WqivvZPkWndHBUeYYkXjWHNlkOnA+NcHtSrPKOegdJXby5DZEqYj1
	 OdvrkdJBwt1UBbBE/HYyUnse3WpRTAclaHHHFpdzXzLg2CBaYhLcS+VjXty0/KPfdD
	 5HoewbHjS7pJ+7f+Yl1bg2HO/EpiUwE7nPCEiKp75zELzIeVgr9ttxP3apMXMoE3o7
	 30urYOuG/B46c92vAPOaKM6CquImK4x4VPpOidTpfbRFseBVd/bhSBJ2TPY62PG5MH
	 uY2SB3xWS3QvIfrbSXKiFiroWu7dlOvdRyoWAl0K1IsLtaV0PrlkOtDDQTchlNQRQw
	 cnmyJ8WLOdASQ==
Message-ID: <d8301387c508bbcf3be03faf7d3fd777@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j4ixmxbse.fsf@starbuckisacylon.baylibre.com>
References: <1j4ixmxbse.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 22 May 2025 15:47:21 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Jerome Brunet (2025-05-15 06:07:29)
>=20
> Hi Stephen,
>=20
> Here are the Amlogic clock updates for v6.16, just a couple of simple fix=
es.
> Please pull.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.16-1
>=20
> for you to fetch changes up to 0afce85ed26c73860bb6e99a0657e1d90d533256:
>=20
>   clk: meson: Do not enable by default during compile testing (2025-05-15=
 14:44:50 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
