Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FEA18952C
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 18:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880781; cv=none; b=tmWbblAvQbhZq+RSe9iXuHMPkON/KK+4xW+bxutkkEEwWa6OUVCmwD2xmHI2+qbzVXB+XyZefW1N2/X14UzjyTgpvdVS7OegG/sA+scPvPfyBaGlK9sgxwTQZJIsxGhpbeVt4oAcIqrSifyR4efVG7SDKR57GcAbNbi64W9d7ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880781; c=relaxed/simple;
	bh=arcvPQRaygLd/y/EZtH/XTVjRL9Lu4Bch5hftUjZUZE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=XxWrHgq49fch77vYG1YBy/L2PewqZSr5TlqeQfjGCZKz2LeqjQ45MkgjDQcffy6+qKVYE7OlagxBOx41i4C8scXA9/cMhm6HN0/XRvTe5kLTabxpmNo2ayQvkL+kUWGCxUL03Zf7YnqBySKcAWf21x7wHyXSdAGqjr4YeiaI0PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lvw4v8Mg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lvw4v8Mg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA92DC4CEDD;
	Tue, 14 Jan 2025 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736880781;
	bh=arcvPQRaygLd/y/EZtH/XTVjRL9Lu4Bch5hftUjZUZE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Lvw4v8MgpMQvHGEBNlQjQs8Ap2N3yYK9VkSSq/QtnDQxic9hJD3ji+n2RFzupFsJi
	 BCQ99I5zVHwCO04zzENS89S8/R+Da3j73O6ToT5tcVEBfIfK9pFOtZR0P1TPcTFRfv
	 UdV0Lnbze/qhb6zDK98si6x5pFJIGydba7sJy7UqRQW/uo3GmQ0+WBVL25bCJtj3PB
	 oxBsG5oxy2FTWesiy/qr8dctXux00yImEi2MKh7gJzW+63jetmnhAdr5/ZXBjj6Yfy
	 HNEKuJq0N18849N9vFxI1tlgDMyKP8WSb9hBA6V+EaBZkR12g2sHDzYK0cG+RNkiTs
	 FYknZfuez5hGw==
Message-ID: <07b6745150c7bb671e7355117075c652.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2020465.PYKUYFuaPT@diego>
References: <2020465.PYKUYFuaPT@diego>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.14 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Tue, 14 Jan 2025 10:52:58 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Heiko Stuebner (2025-01-14 05:30:35)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with Rockchip clock change for 6.14
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.14-rockchip-clk1
>=20
> for you to fetch changes up to cd8b5366636bdff0449b789fb2d33abb20804255:
>=20
>   clk: rockchip: rk3588: make refclko25m_ethX critical (2025-01-09 16:23:=
32 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
