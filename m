Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B334C98C;
	Tue, 25 Aug 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693784; cv=none; b=tL9ORsxeCKe5yIvlhjiZ1jvCoxecTfCtTT41cqNnoOtzqsmOLfIpMXJH7DpyBhxx0MS5FE7eCpcCCjYLF1wq292sqyNivQsNXveNsMi3knoX1Lr/2XGMHuT9UTJuqXwTnRzv7plsAKwtIbEJGyH/Eh4a6LXeWVO0+Bv2Q97Zs/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693784; c=relaxed/simple;
	bh=o5YeD70/ORnxydtKowMsMEI3YukA1ESa4sVb8PGk4Ns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SzRNeUpS0nWET8gYSEorBGV1Y5n7I+1s3Cy8cpf3/seFK9rES1MVfV4ie+Yiqx5vfqIOZg0FZIqB/gofzsEXOcHdNXU6em29yMvRuf1Sp1AhRN1PSGnYUjzpunAjoiIOB18IbJUkB/dlpct3utoNOA/qdI7JJSu5xlvcWoWyP8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJawlffB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJawlffB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050081F000E9;
	Tue, 25 Aug 2026 21:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693782;
	bh=o5YeD70/ORnxydtKowMsMEI3YukA1ESa4sVb8PGk4Ns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eJawlffBifyqvGtp04z4QzX5gMpHP4CIdOUYp0vsXH702mY/ihqoL3+xYAq8Eb0ks
	 bx5EkzLXk946NSQ9ytEok6MSRDYn7hLl8gQNOkEfYokTymms7/Vc4tC4Hk61lx4MVO
	 QXa3vuz6ytx/0XhXo76RHCYySYMEfNVZQ/j7xd0CB8Bl3Rq1scyOx7dz576s/O5+wG
	 5jZrcv6gCcz6BOERjAxip7rI1T4f7+vjbwMOR822YB/qCc2c1J1O+7SU85WeJoyYPm
	 rhrUHyDoD+iV9HXE9OsLtBz0emZdi5fmkG54c7gxJ2H9YOxrNoK7eUJk1/Dp9EWgjU
	 WrvA0hWcI02Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 10/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: vkoul@kernel.org, conor+dt@kernel.org, lee@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260826-zx29clk-v11-10-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-10-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:36:21 +0000
Message-Id: <20260825213622.050081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
> Ethernet. The only non-clock, non-reset registers I have spotted here
> are hardware spinlocks.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D10

