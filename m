Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60731BC9E
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 01:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132002; cv=none; b=HLnkqEdxtv9oG8N8zXiyXaixXU07rx0q16ilHd8iKfDNWvaXn5rjvoWbY6UQhfF+Pc/0DFVFKnvL8RXgLVZppUW4tPGDLJ4hvaMddUin6BD3Hkao6HOK2x6Mr8EYJu/VD6VOa53CBK7M2LwFD/ysED7yZfE666v94S0K8eU0mrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132002; c=relaxed/simple;
	bh=PQQVLZrANJopNzNLiscot5WHRsHgjNjGnt5jA62cKYI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QJLQWi20VO0QMu7zZdTgjvhI6L0+JRZX8kb7MhmXbtRZxGMJ7XDTMTvnFq+q0Ijuf4KmT/c01OYecoi0Vg9ofUq+2+qzespDsykRfA3g8bHCtyiZBiuOU2UxldKrEjPc1oAU6PJs83q05p6d3amcLGxWy50wfPmLEQu2bGrtOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alnRdBMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alnRdBMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542F3C116C6;
	Fri, 23 Jan 2026 01:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132001;
	bh=PQQVLZrANJopNzNLiscot5WHRsHgjNjGnt5jA62cKYI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=alnRdBMW+rbkID/guufqmZSo1PBMeC922pZz6BKyFGN0NBai9UCD+UqrE5d+MCLPW
	 wxroB1ns4iN9CiHZdnUGTZk7E1XWoVCiz+wFIGsqH/6WPLnVRNA1f2tsm63b0Yya7y
	 TjOxQ2f8Kb9BJdksaVKIVYLRkZz2PNHv4b24oEiK5SzfiZJHZTdn4vfzVSY69nMdwI
	 Gbz4oLa8Os/VwLuw16/UJyCgIhzIAALjUqivKhG1H1/Bo05bzA5xWZfiahSC0ANmbR
	 I1Nm0SeAatxLUyYhdfv9muw7Ufk2i6wBIVhr6r5AWjx2uvvWSSgWrhyM20xVAwcWWm
	 U8QnelgpierGQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jjyxdvq9k.fsf@starbuckisacylon.baylibre.com>
References: <1jjyxdvq9k.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic clock updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 21 Jan 2026 12:35:05 -0700
Message-ID: <176902410593.4027.8253899949727908188@localhost.localdomain>
User-Agent: alot/0.11

Quoting Jerome Brunet (2026-01-19 03:41:11)
>=20
> Hi Stephen,
>=20
> Here are the Amlogic clock updates for v6.20
>=20
> Just fairly usual stuff this time around, a new clock controller SoC
> support, a few clocks added and some fixups. Business as usual.
>=20
> Please pull
> Cheers
>=20
> Jerome
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.20-1
>=20
> for you to fetch changes up to 2fe1ef40b58c2256f4682594f48bfbd584501ec5:
>=20
>   clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro (2026-01-06=
 09:52:21 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
