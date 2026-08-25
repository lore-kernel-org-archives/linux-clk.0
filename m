Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378846F4A0;
	Tue, 25 Aug 2026 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693664; cv=none; b=TGHahHLTnRxvQKPZVh3XjF+TCHqPmh4ifpR7/PvM6PXvUINUMM/5M56erhBvdlGAxjn4bFelSkMTn5IAS2mJ36+5LQCfUrewR1K6HstIK+3SEMuJ5rBibq5vokqMOHRN8yZRYf1YRKUx4li89q5qviKNdrEZJqHuUs2BAyAieVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693664; c=relaxed/simple;
	bh=8xDKKGm9wVNaCBwP5NxFRJaA5DOAbVh297mRMYHDmJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jLH9TVd6dNLesIe+ZsGiggnZkzPOQ6ebOCRhJxdNKmZ7DQcnDSkn5HOLf7QQFui2x8WUgRuFKz0fjfogXrlhc/Ceurr+3EfkMCgkfWbQdkkxzMtIfIDRyT40TlHk05/EfT7bumUuaV3JcTypqb2yLqZLXF0cQVVkZLN20Pzu9zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TF5x4iyZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TF5x4iyZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F731F000E9;
	Tue, 25 Aug 2026 21:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693663;
	bh=8xDKKGm9wVNaCBwP5NxFRJaA5DOAbVh297mRMYHDmJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TF5x4iyZBUqfn4mUsPKLNke5g4Z3Jc6v8pgRjMJQy2a/wbfbjGwfhs/VzypanBTzf
	 XuqT53OcA0gPyqe4XHXR/KLEzRO2cAettf6EMs/zXNsdvne+hemGpIJpNhUeENEVHH
	 xtk1zfuH+5OkYnCjr/ekzd9DHLUft5YHQYR2zqeffxhfxs/y9l7DncoW9ur8T5xosG
	 1mBalDScNBu5xeWcP7+Q5ka0Cxz4KqlPZS1TCGx/nVO6YjaMKEk3+uG5up+jlAAlX5
	 6WzTbzz6u3pHaY0l67lI8hzlgPQ3dPKXdcRIXhePkNS2NnbRh/kJ+xOsE17gKuHu4G
	 YPs39hsZvctuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 11/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: olteanv@gmail.com, lee@kernel.org, linux-clk@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260826-zx29clk-v11-11-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-11-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:34:22 +0000
Message-Id: <20260825213423.31F731F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D11

