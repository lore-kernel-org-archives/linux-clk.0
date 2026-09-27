Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C23B3884;
	Sun, 27 Sep 2026 20:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542731; cv=none; b=o8CSp4RpMljvNxxeLGI2uhGXzGkIeea2J9JFLf3CVHJq/Lnud21be3DMcrKBqW9M22VWftqIVUXcYxZb+w7hNTdWCfeSxKAMkwC7LX7Lr+K+uHBd00ZQlSsxMzTud6Cmwv5ypekVwceHK89WptbhbkDe8nECkEy522H06nFI9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542731; c=relaxed/simple;
	bh=iXbcC/Cf4LHMX6pHrQF6Lxpp8Q7lOS9FY/DTUB0VYYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U1BR0n1cHPgcyDDibuskQdWTPw4IgYLlgm76jYQu2Q966sG/pwoOhFHY3WtBN+jESTDTS1jnbC7EHH4ZyX+bVkoATQGdgPt5lV6EvQomwuwfxjlgezG8i60p1+G7lRnu2K5ufQug6iwyuXqI6u0gzldBX/1PIBpNRA8buthFioA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jb1B7jCw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jb1B7jCw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BE61F000FF;
	Sun, 27 Sep 2026 20:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542730;
	bh=iXbcC/Cf4LHMX6pHrQF6Lxpp8Q7lOS9FY/DTUB0VYYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jb1B7jCwzDQRZHmt5xcGDQsJgTccU8OT+DHFjTP3kSTqjmvBTy51UttuxOeq96UwP
	 GDDZ3dTLAJbxOvs674caYRoxPs0ruMTtxzSACEHuqGOuEewC0qPeLKh83svTuloLHp
	 +ZZ9tEzGHUDYuIXmL+r6gapJGb1D07tPGDbjAGxcnlbZC8D4GBJkKtpcsru0m7YBan
	 9ujMh20/Nho0jrLx3SAeM2MrXQQFF1OBQicA76MYqiqdMpUNpgaVOK144m3m7mIfe+
	 0Lg22js+sBpondVU8DLmqNWeEJF3//d6wXJQSyvZa5lw1tpwYcvAV4pGbWNfAcdAD5
	 N49DBJixpY8+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 11/13] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, lee@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260927-zx29clk-v13-11-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-11-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 20:58:49 +0000
Message-Id: <20260927205849.93BE61F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D11

