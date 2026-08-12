Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CDF3932E3;
	Wed, 12 Aug 2026 04:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786508041; cv=none; b=HTEzc4+Dx2gP5iIOfoqoal19mjSSrvvWNV8m5WlmkNE9eDMG0vzxWnOGiDoMFIIZC2D2JWElSLghieoYyhjdJ3nEVd7lOGhM+rtT4QSZGDBvnPM5nCgcnFoEqYCdxJ1HwJWUYZkuD2ToW6yHestwl+t4G3ZI7ibvo3toA9D/9j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786508041; c=relaxed/simple;
	bh=dtda/krqBTFecyaSRNgRY4LhmMI9/yaruDWhGyIyOW8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=BfzMiORX1Dxl6CYXmJApb0CNOQ+GsC5xUhFr1S6lUibgaHZC8AMOv93iQHsvuckNJ/NBhb3oxe+phj/uil5cl4pl8P74GeQvz+42+AvIsryTiJazAdbZrRh7DRspn/2hrcFg+K1haKuJDS+r+RrH/nFWDAsDVQMXYLDtnNiVKRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDjh03mR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDjh03mR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551551F000E9;
	Wed, 12 Aug 2026 04:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786508040;
	bh=yto3/JFsFoKCpdEEHQ7BjHgooYWzDdoCQE0tWDLthnI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=eDjh03mRSVyTaFZt1lGIsNEcf1Rrb5eTDBn6afW+J8ja0eUHTRmHboLwG1KjROQPA
	 g5/+15HSdyY9h+Ozcdd3fPOPJV7zbSu45lGXFF6XikW1n1Tkkxj1L0JbD8yHzcCkhE
	 I1euA5Ta4Xi3hkW0dO7LRPjDl15gJtLxrceCQsVMOhhyAvJsTlHiPwSaLZ2mp0tTjX
	 CiAABW/Wlvw1KO2HiUqgZiQRmSurJNb5kTQMEaI07BNeyHYaaUQyiVGmmpSucazPy5
	 L9zTXIPXQE1uo51J++DxrWVywJ+o5GgIxWxNZDInEyHrelGbk5kWBN8pEqAZxq2C5n
	 Xm4DVLa5nZ56Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <al/XNcvZgyeGjXFz@x1>
References: <al/XNcvZgyeGjXFz@x1>
Subject: Re: [GIT PULL] clk: thead: Updates for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, =linux-riscv@lists.infradead.org
To: Drew Fustini <fustini@kernel.org>
Date: Tue, 11 Aug 2026 21:13:58 -0700
Message-ID: <178650803856.5862.11176522155684259530@lazor>
User-Agent: alot/0.12

Quoting Drew Fustini (2026-07-21 13:31:49)
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/=
thead-clk-for-v7.3
>=20
> for you to fetch changes up to b2ee00d0bf4cca5dd02702fc339d2b523191966f:
>=20
>   clk: thead: allow COMPILE_TEST builds (2026-07-14 21:42:01 -0700)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
