Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859620;
	b=gJL0MimX6gxtV0vTImlNrU8k9E5Et4mZE+s4aJWpUpFIOksurEneCFMvUhLzJhvh3mOI
	 lijOmqVlnSSs3G2Xu3cFwl0q7MP//IrijL+hawih7geUZoL/eONHpNxudmE4WewPfOXQH
	 E3raO8SI8+4xA/JlB2WPnvVKqN06kL3TpCaSgP6JG5gI03BQO93mDuLe0zjJgDxdKuftD
	 iTL0ThFTL1rnLALBTojSUqOEBFrshbAt3bnJk7gEZlZkdlpuMczug7C+tuhPIsry+RnMN
	 YUQKAKNa48zPpa2ybGNqa345eTRSFwHABZrUUtxBkU5Nog5S0hqeesAGxMJRxFkPP/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y/AUs9VpkRgj3lHMPUhRqqWPwFc/FZF/cn7StR/QCY4=;
	b=P8qZOqtOlFjhzRzdVFYA19dTF/pEdqV1+BlABx2faZtnoc8KfKDZpoAEISKHthmwOqZE
	 jc4Hoqc9kj/zDP7YXb+iUW2jn7GXCYS/kF+Hiqt/SukgdB31jDAIOx/4D4cxQf74Mks6M
	 OKcD85tz4NDM/uu89k9l/rnv8/OGdWv6Lx8CjQ9nFqPGXedLNvUWoCx8FfuZEjxJaqGQe
	 6nqHIuWl0KiZV92ln/PZ0yvmpmHj+rRIX0ZA5D8ixH41KsEOkkJYI/2dZHCUsQpLI0ayr
	 KnY9PEFpykQoPDHfaYWJr1eq0nR9BBauQdO7Tji/ysVSVLJnWL3/+yvI3tQmhj8KcVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JctAoNIu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81035606A336;
	Sat, 28 Nov 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JctAoNIu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A3E1F000C1;
	Sat, 28 Nov 2026 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795859620;
	bh=y/AUs9VpkRgj3lHMPUhRqqWPwFc/FZF/cn7StR/QCY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JctAoNIu3d+aB22ruzleYyUf0piGouqQs7UUvooSvuOrF+04IvjOw2mNZdcyy7A57
	 MdbZNkn03UBgXtZBgyAV1BhwRwo7cUpdGzj+djemmkOAlqVUZAVf1oB4PHzDR4QgdA
	 fyijUuL7iIxjY4C4urkMBshnWBXIQLnuVJxmiNUFBdaviC6uDsfaiVaE/VH5RrzYoH
	 xdOUOZs8FNR1Fw5ZiTs56qlz9qZR/I+O+6y8+sP/tGk56FLj2k9UciaVliktTg499v
	 doRTP0f01y11mBgXO25hjQF4p8W5p+F4jMEtt/eI3H0gWmJSbmmJNhkhYI9CyCP5q8
	 4yYbL6602xC9A==
Message-ID: <sashiko-outbox-238614@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: imxrt1050: Fix potential use-after-free on
 unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261128-f81b700d6c-u08-2@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
 <20261128-f81b700d6c-u08-2@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 09:53:39 +0000
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
- [Low] clk: imx: wrong Fixes tag in clk-imxrt1050 devm provider commit
--

commit d288c059b643f38eaba3a472f1197d1ef4bc1169
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

> clk: imxrt1050: Fix potential use-after-free on unbind
>
> The OF clock provider retains the managed onecell data after the
> driver is unbound. Subsequent clock lookups can access freed memory.
>
> Manage the provider so it is removed before the onecell data is freed.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: 7154b046d8f3 ("clk: imx: Add initial support for i.MXRT1050 clock =
driver")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

[Severity: Low]
In commit 7154b046d8f3 ("clk: imx: Add initial support for i.MXRT1050
clock driver"), clk_hw_data was allocated with unmanaged kzalloc().
Commit 1b280598ab3b ("clk: imx: clk-imxrt1050: fix memory leak in
imxrt1050_clocks_probe") converted clk_hw_data to devm_kzalloc() while
leaving of_clk_add_hw_provider() unmanaged, introducing the lifetime
mismatch on unbind.

Should the Fixes tag reference that commit instead?

  Fixes: 1b280598ab3b ("clk: imx: clk-imxrt1050: fix memory leak in imxrt10=
50_clocks_probe")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-f81b700d6c=
-u08-0@mail.sdu.edu.cn?part=3D2
