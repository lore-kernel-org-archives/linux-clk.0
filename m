Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996621;
	b=dBX/y++xlxKbNvY5xmHoQtHTi7984roR0nBPdrvwdXK3C3F8zuq9mkjJ8Sag/lz5RBp6
	 cMl59pPkPqx6xXvwr2BjLjSI1EPsA9hWYnbh2suC/AR4Rz5Pct+yfaY21JETAA7lH8dWB
	 a6SJik1KkOIQO44UCdGiGvkzYpGN9MItVpmJPXFw0aFXBom0gC5mx7sdiCBjvoCLK0+0L
	 6mABlJWDYUPx4Yzw2N4VKX0spxKy+kvn7Peq/qFXQVLYKxWJ5QPFXxpqzehq84XwhvSuK
	 D6ZBo7xs0YDL3Suw3Df+4yLeESvRvZmZvHNnDRtXfoipAlDHj8GK9rh411ZRGVguEmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996621;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Aczif4B9rZAOAKN4N6nvLolnzGpqs5kIU9nain1Q5MU=;
	b=Ij8G13SqAeB7n1NkyMjpNTo4qWBRLZ4GwPZSqOZ2kYPBBe0mKdy6bmyK4rpBDUzDlzh8
	 10GDVoHeZhDQM4KZ6RJTPtvVksquv+LQMYLyEz2HNIxYp6INtAEYO898/H+bBnVFdbVfQ
	 vwxeri530YGcpBxOB3RIxzqgd2daEB8Me497vV+hI9nwWR68fcYvwAS1sWLYnoaWMr1H3
	 QQN/5zZmVmyFl5nXgZk7rdMxzT8Nr6E65Ihy9YMNveUKNX6BS0buzuaJJrJT60OFT9kUW
	 5h4HYbfOYtr+qI8ILOxFPQ+k1c6aK+n4oHWezDk2F1plVzjZb8JitBu0iygS0QYk4Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aVf2+ckr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6CE606A31C
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aVf2+ckr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D702C1F000C5;
	Wed, 18 Nov 2026 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996621;
	bh=Aczif4B9rZAOAKN4N6nvLolnzGpqs5kIU9nain1Q5MU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aVf2+ckrFIoS7931Y6z64uGSCefBdjjqYNtR+tX+Kdp36iTiC5Sw4Ln1qHwW4B/NR
	 tp8nzRFmUepxD1Lf67XJpVPoUp/GgUu9jQf4Fl0mFx7YBRTEprzeN7sEN9Doc8kL94
	 M+6IxqO4SZ2JCmrd9s+UFr8ucXh+MMMZPbnBHC8sbw52QbMWJOufMWX/1+u1292u/r
	 HT2OrOEu/BiH6rVWk6Yx8p9klMrjjtdKixSRj0TbJfstmRTB4cdryAwHnoZcYSnx7B
	 4ifqbokpQ4SXtvQq5e3pPdaupXlgCfbtImswxMRWCSM9KKsR6SeaRrqH/obc8fCBFX
	 cB952XJU02aWA==
Message-ID: <sashiko-outbox-220658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261118100523.11395-2-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 10:10:20 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: starfive: inaccurate Fixes trailer in
  jh7110_reset_controller_register()
--

commit 49b17bd58c076121165de3046693949c43d724d8
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

> clk: starfive: jh7110-sys: Fix memory leak in reset controller register
>
> auxiliary_device_init() returns an error before device_initialize() is
> called, so the release callback never runs on this path and the rdev
> allocated in jh7110_reset_controller_register() is leaked.
>
> Free rdev when auxiliary_device_init() fails.
>
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock dri=
ver")
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

[Severity: Low]
Should the Fixes: tag point to d1aae0663023 ("clk: starfive: Avoid casting
iomem pointers") instead?

In edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver"),
adev was allocated with devm_kzalloc(), so it was freed automatically on
probe failure.  Commit d1aae0663023 ("clk: starfive: Avoid casting iomem
pointers") switched to kzalloc() and moved kfree(rdev) to
jh7110_reset_adev_release(), introducing the leak when
auxiliary_device_init() fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118100523.1139=
5-1-changhuang.liang@starfivetech.com?part=3D1
