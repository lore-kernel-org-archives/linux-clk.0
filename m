Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CD11DA3A
	for <linux-clk@vger.kernel.org>; Fri,  8 Mar 2024 23:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709939968; cv=none; b=knxaRRu16TwGLA57uvjujT8mCfqKAlFy4LlttORwMe11RZQRvPOakexXLgPq3ygsflr78V0+o3Ob2CwDDSnYySlHWsCXp111xXhNinbMbdl6J8X03Yox8wZMxILAMNF7zxyH4p2MgbL96T37rbHxfliSg+AZdhCpRGQOU0/89jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709939968; c=relaxed/simple;
	bh=VfYcHYz37FfC8fIy0RYtV/u5XKQDIyLKS84NhSzFfVk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ugfkV97lYfq6XFVMZj/YMFd1eHcI98+CLM5UwR4eN68WO/5s3H6tbalSJ0O9nr02VOQ/T+0f1oz4gjyTnAkw09V7dY/sl5EeKXCuoZYQMQQRii5GGCPgQYQNuWY/mi52VEl4NMGp+P1j1suSvdeV0kmW8Fi7fe3iS+cjkN4QzzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0KPpjQP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0KPpjQP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C53C433C7;
	Fri,  8 Mar 2024 23:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709939968;
	bh=VfYcHYz37FfC8fIy0RYtV/u5XKQDIyLKS84NhSzFfVk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=p0KPpjQPjRCvwgA3jZ4nsrKDld3gXU1kxO8JR+7OSeinmhT8OvHnDmPmcDUHw6/6V
	 qwByd1myCkacsA1W48+GTEtSWUbfQksMDAtvFdSyB/aZ72ia6j4l4DxhtAb8TjlDIw
	 QYl/5RirF+iD8V+BvaJUWyGLmyYixn7+Y5URa39gUp0b8i1CvEZlQB+OWwenRT4dK1
	 t8ym203c213BaS4nH7sdTrbPov+8Uej51nUn7IgxMRWAJdfZaUUKwQ1TuMVC2raEsy
	 7JUIVQE8L8Hi/wtY5Opf8Pbc9z8yDWNKEAHoi3F2Z5qWWBWpVXYFiiiqksLEQuHJAm
	 zPFh+qntJCFeA==
Message-ID: <5f0d9608b698ff4aa898514d3e8b57aa.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <90054b8b2e118bc04ec37e044d0ac518bb177cf4.1709721042.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709721042.git.u.kleine-koenig@pengutronix.de> <90054b8b2e118bc04ec37e044d0ac518bb177cf4.1709721042.git.u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/3] clk: starfive: jh7110-vout: Convert to platform remove callback returning void
From: Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 08 Mar 2024 15:19:26 -0800
User-Agent: alot/0.10

Quoting Uwe Kleine-K=C3=B6nig (2024-03-06 02:38:57)
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
