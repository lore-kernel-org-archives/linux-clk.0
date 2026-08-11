Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5613937A831
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472232; cv=none; b=ZK0Rjckwk5/kqkRcgBmJVaM24RQtMDbLUDeEot/DcoB1vXFKfuT4FWapB2lwNK6NsfFt9vzGUu0kp+UOB3CLJ+MV1/bbs0Ua9moDNSbaws+ehTJU3acwQOSp3JQxfcLDrr01Ls7fdurPxr2CI12DVZsWLdanNeem7ZrXH+EI3vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472232; c=relaxed/simple;
	bh=u0ZvrqjjsThS541Kydvo/C3DlQttF5j9hEIYFJvmNu0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=m4umVXH8lZcKdhIgRkmXtkQtKQtAFFMrwuwup3pb3U8o90zgNr4rgMgW7RfLwyjWL1a/og6odjA6ipKp5dA93si+EQqs0WHN/DGRemJKiSN2nZQYlCU1N0tUq1cOo426WezjSMiy/zAa9ZXVihGEFl2jdml1MLpofXo3YasL5FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTlTf5C9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTlTf5C9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007831F000E9;
	Tue, 11 Aug 2026 18:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786472227;
	bh=W5XrBpVUKV4WztTo9vZTmfxGGynuFCcPzm8dMsNd63I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=FTlTf5C9VwZHaZyoE2bJfPm9L9zCOH6zIOk8URKsvyGH1xmaAcBlRwEw2Sh6PB5A2
	 3RVeJLWuT0ZGtPsSCqXF+I+2RzB3oug8Ti6IFIWfxxlqIc9Lj6ldeN/eUn+n8eYIp9
	 +JfHU4IDvDtGjWR5qCc895Rcct1h+3QDno9QH1xrTpd6RmIDHwTZZMr8sLQETvzlvk
	 D4GKlRA/TSHrHCWd8aVANYMArOnZmPN48/tyemDbZAaubDkQwFIe1eU1SiLaW+3xVg
	 WbIt53XYxzvJnH0DHh8iVL7JXD7zDx+hFDUvASzK7qvNaf9bVbgS9iYnzibwFPeyNP
	 v9EHiiI3G5Xzw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1912648.b8e9qBsS6s@diego>
References: <1912648.b8e9qBsS6s@diego>
Subject: Re: [GIT PULL] Rockchip clock fixes for 7.2-rc
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Tue, 11 Aug 2026 11:17:05 -0700
Message-ID: <178647222530.5862.1116308311544793627@lazor>
User-Agent: alot/0.12

Quoting Heiko Stuebner (2026-07-23 15:33:43)
> Hi Mike, Stephen,
>=20
> here is one of those seldom PRs for a needed clock-related fix for the
> current development cycle, which fixes a regression by keeping
> newly added clocks on, if they're not handled by a driver.
>=20
>=20
> So, please pull :-)=20
>=20
> Thanks a lot
> Heiko
>=20
>=20
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t tags/v7.2-rockchip-clkfixes1
>=20
> for you to fetch changes up to 946352b2f88fd2378f0341312e47dff1e8dc2fac:
>=20
>   clk: rockchip: rk3588: don't disable unused I2S MCLK output gates (2026=
-06-28 21:09:50 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
