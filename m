Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D63A7F60
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 04:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789706940; cv=none; b=VXGUkT9eWfiMU6UqlKLXGbKutPNmwmLBW9JBNmwD/S2h7rXX9V9flYHCz45O63BeoWQWH7omchttor1VJmlhiqukFNHTyir0ZVrX9U3g0EYicEqIu02oeWhl+4RgEk3owegYX/FiCaXH6Fgh0DltIZKchAh0CHTbpkFhPrpvQoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789706940; c=relaxed/simple;
	bh=X1ob3WJmnDHyqp3Xde9ot+vpEIag/VUpI8n/3eISrdk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ldB3nm+J1ZZKTndUqFptTqPozgormdJX4dLVI9b6PktD+f78v7vpEE/DNrpnMF0B7TvAqM2KiwKE+I0T1SQR8sAjmGaIYQytSpi3z10DRJNEpkgXS0O59C+DaTU6zi6xlA2oMix1yoSDjbiBz/3M0atHg/vOV1gpE4WfIfEs950=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/Tog2vp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/Tog2vp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F202E1F000FF;
	Fri, 18 Sep 2026 04:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789706938;
	bh=noCiZdFMxsCVUIDKh9LE4Pp+FqiZvyp4LR9Kayt9DQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A/Tog2vpzV7o1lw/c/eKavonY7CcmWB1VyQZMC00B9J53YMMxGaH0xIUtRj35i56X
	 2aOdPFbo8xi/k/j8QO3eK4gOvT6hPtiktbdMAfQEUY75bbJN7Bmh/apbnhRUt1BW5X
	 azLMt7vzugLx/KDE7mwSPvLPPlHIxvD4QT0gFRJThOzedqZY2vPBvsjbrlcaSK0CU+
	 MMP5fRInXxftY5fmxvPg21cdPq/oRBVsx2FLW488mXQmqRM+3IWYT0Xbp85c9HbO4v
	 yT4RFJcIGmPeo3/qWQFSRZ/qiQ71B79TxRCxWHhlhh/rkWEyjWSw1QSqPxhjFJB4Fg
	 L3SD2WOZEqg2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: raspberrypi: Handle cpufreq device registration
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Triet Hoang" <triet.hoang.dev@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
References: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 04:48:57 +0000
Message-Id: <20260918044857.F202E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: raspberrypi: core clock probe fails if optional cpufreq dev=
ice fails
--

commit 9a3a7cc11a038dd3ae191483f044c2febc6c2ed1
Author: Triet Hoang <triet.hoang.dev@gmail.com>
clk: raspberrypi: Handle cpufreq device registration failure

This commit adds an error check when registering the raspberrypi-cpufreq=20
device in the clock driver probe function. It propagates the error if the=20
cpufreq device fails to register, preventing a successful probe return.

> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index f1a99de6de4f1..9882f243d6813 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -553,6 +553,8 @@ static int raspberrypi_clk_probe(struct platform_devi=
ce *pdev)
> =20
>  	rpi->cpufreq =3D platform_device_register_data(dev, "raspberrypi-cpufre=
q",
>  						     -1, NULL, 0);
> +	if (IS_ERR(rpi->cpufreq))
> +		return PTR_ERR(rpi->cpufreq);

[Severity: Medium]
Does this introduce a regression where fundamental core clocks might be
unregistered if the optional cpufreq device fails?

The raspberrypi-clk driver provides essential system clocks, such as arm,
core, and pixel. By returning an error from raspberrypi_clk_probe(), devres
will automatically unregister these clocks. This can prevent other fundamen=
tal
SoC devices that depend on these clocks from probing, which could severely
degrade the system or prevent it from booting entirely.

Is it safe to structurally tie the survival of the core clocks to an option=
al
dynamic frequency scaling child device?

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918044131.6084=
82-1-triet.hoang.dev@gmail.com?part=3D1
