Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA68542EC1;
	Wed, 23 Sep 2026 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188829; cv=none; b=jVbz1bqgECcI/CRqzY2Wu/PwfJw0iLO0DOE7gMfWY4dwgO6mRREIpvWCH8Bs0ZkgEVFjHhtUyJ4uFejwZPXi7p4L6feaoR9Fhlp9MPEnjKh8DnkfRyt2rVlgqGd9d8kLOKesl8kXTfgT/5Zc324xbtyqZuBELW8QxSOO0ykUcDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188829; c=relaxed/simple;
	bh=vV0fvju4+EMTqwsDD6KRaSk1zgkxUgO6ApN7zcO5Jas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=edCn9zNy/iGLyHCpwkdrOGU++rtj1vBVtDOR9um7Dt9DBT+C7oZKQM0JwvKZ02dkTuF/O1Zpnxtny8RP51LMVqLL+gJT2dMh4Z3rpA+r77kLdzU3vsB2BX63NsB/hlWF2WCRg3H1emqzz7Zmu8fHCV3oBf97Zgh60aNisVg6Pe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYRc/Mly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYRc/Mly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B28A1F000FF;
	Wed, 23 Sep 2026 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188818;
	bh=vV0fvju4+EMTqwsDD6KRaSk1zgkxUgO6ApN7zcO5Jas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PYRc/MlyWTfVtmJMwMwzutz5cWs4FFeZOrWjLtTJ0CYNf1KfwZC9XtTI1DsSALlHj
	 S5LKyX9GOvy3mp+MF2f3ALZ3YITZ4iwdRRptYS8TVZOrJGkQuvYKtqcOl1tRVg/8AC
	 u2ZGPhPV/eMAIC83+F1BuwbyAwGKi6W2hF5d43UNrA/YwTQUueimnn1/FIPYdNDc3B
	 Do+o2ecDSYBs3tyztcNiugZRDCOGV4X9uMRkbFs6nz+abqlOddhE/wJ8ph1VzmmicL
	 MGPhPGf1PkiB6D0KMAowPvSkvXUiuHMuVo0QefzYvJuwHM8l7mvbADr0GcklUEMEV8
	 awUqqwaFedSfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 10/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, mfd@lists.linux.dev, neil.armstrong@linaro.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-zx29clk-v12-10-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-10-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:40:18 +0000
Message-Id: <20260923184018.5B28A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> "LSP" is ZTE's term for this part of the SoC, I suspect it stands for
> "low speed peripherals". The main UART is here, together with the flash
> controller and more surplus proprietary timers.
>=20
> It also has one more I2C controller that supposedly connects to a
> battery charger, SPI for displays and I2S for analog telephones. The
> boards I have don't have any of these components though.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D10

