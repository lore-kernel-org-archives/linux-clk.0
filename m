Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC82D47FF;
	Tue, 25 Aug 2026 21:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693476; cv=none; b=e1GTa/snZvN+99xq/FMMPddmluf0Oc4ZQR7BQEWopI68/RUJenN5G8yMG8Hbi3HfkCjg/sl/0mHC6xhf63NCHV75f3BT5dKMcExKKgmqrIUWSHK2UdFxlFq6OQ8h4d6cIqSaThACVr9NE16m21Q9sH2jbkWv8w0tNumpLbC3Rcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693476; c=relaxed/simple;
	bh=CkcDxPN9x+COMhvEjvpoKsak0vJaqJV305Yrs+E5ab8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sIQ6g4slfgarCALP+SvASJK9YDUG56LBmY1G+Y41TvvmjBgzec2yZ9UIm4LwqsAaYSwluYHwjPjzrdWUeIL2D4ovMCdjlKCpfNrgJZIomR4NacBamUXKHadHOjqI6+TYAI1wwcyiYPzc6BLUuGCCWTDHU3hRXIac5xNH6mmLgqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzLwTNI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzLwTNI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03E41F00A3A;
	Tue, 25 Aug 2026 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693474;
	bh=CkcDxPN9x+COMhvEjvpoKsak0vJaqJV305Yrs+E5ab8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dzLwTNI8poar3fxOQwAMABLC6A5+6V1l8HpW1lPY6z8dxFzNbXjWeUVXoPQEeCbOn
	 Vvz7xQrwQtBZSE6jqpu5Xhs/vT/fzy+GAXHS41lQSjx1RgRgLzDI4ZHqkm4Y4CXlPH
	 DYWwjaIh39q9AxYRfwNkuHwGd6xPQNE1O2hcnsQIzwYwrgB4+qqtm6Va+c6MgKxXrq
	 zI+3MUjnBBItKBFqshZk9X/5Mpvj7AlK/naQVToXd0/eBvG6T+2UAywMR4sbQTn/t6
	 5wfDDV66IY3hezAF7c1gVhMh6wJhbsAzjB1uzZC+K88sE82YTtqLfNYCZAqJW4EwKp
	 zP048kQwXjH7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, vkoul@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260826-zx29clk-v11-5-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-5-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:31:13 +0000
Message-Id: <20260825213113.E03E41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
> the next patches will drive the respective functionalities.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D5

