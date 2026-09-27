Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0243C3792;
	Sun, 27 Sep 2026 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542806; cv=none; b=HHb5onMnhbXwkyTPaiWJd1ASPOc7Mdc9D9vYp5RObGEtkWXlCy6Fuk4dNxB7kKHWL7lrlKMsW51qENhupp1RDHdRx96r3lshbqhEGu1zRXPjNlMvRtqMW3XC2FH2jlCyqk/6CcRQNEqc1jcsjF9sAtDN03EDk9ZzUbltIMpXf7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542806; c=relaxed/simple;
	bh=ECHXd0Gx47fFhedt/UnYKtwYHQCncZ3Rp4xDBN0Azvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ERhXlYqUJLJ/Z3vs8XsCxycEMz0VEm6pMUyurEs0LV/mOr08MiKTWBmID3dqObuvpe0BPKfZZksGYJG5hHe3S4GXns1N840QnAgtkPkJfMKj+5nc3dAWn7l9ByYLAnilTfog1EjnW4Qjk5+PMY37zWSurMN2Y0TiFQRQKFulY2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZLjf55R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZLjf55R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CA21F000FF;
	Sun, 27 Sep 2026 21:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542804;
	bh=ECHXd0Gx47fFhedt/UnYKtwYHQCncZ3Rp4xDBN0Azvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IZLjf55RnAVlD9c7Vjf6Zdyeb9JA7nRcoZDVqpYXnK2EeJEa6K1nMxyz0F9qm8KZj
	 uudohVcF4wSWPjn9dLyfFHzKqiCM253xjq46MN1xnKcFyIbok1+OibBra8QIrv89/0
	 QVrOvV1kJWjN3n1Vc25FIOjjii840sr9tUt4Z85+6+n4nYMv9LoGR3luO7bkpkm+Gi
	 z8m8zfX8ZEhEnkpp39+0BHP3370wM/voAmVyooobNDZCPa8jq+cAhck5S1aCtG6yAp
	 t2w0Qz52bFYi/qXwdJWxL7neZv0uJJ2ko7eGV6YeRjaWoj30GRrnHDA8bi7d1mScBB
	 lHJ2Q7dtNRIRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 09/13] clk: zte: Introduce a driver for zx297520v3
 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, olteanv@gmail.com, mfd@lists.linux.dev, lee@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260927-zx29clk-v13-9-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-9-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 21:00:03 +0000
Message-Id: <20260927210004.30CA21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This register space controls core devices: PLLs, the AHB bus, a lot of
> timers, the USB controller, the Cortex M0 processor that boots the board
> and a few other devices. For some reason the LTE coprocessor is also
> partially controlled by it. The main application processor and DDR
> memory are not found here though.
>=20
> The register to reboot the board is found here, as well as a register to
> control whether watchdog expiries cause a board reset.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D9

