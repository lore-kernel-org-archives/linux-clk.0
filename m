Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ABD35A3B1;
	Sun, 27 Sep 2026 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542747; cv=none; b=VBiSSq9Gs4OpHHOieW9P0qEjAq/M2ybnPbZQqVmJWjpcpvgDw+YaH59BKT1IXcWM8qHlS6/zyA41KrkesqEmNURImarxcCdraJTMheZaVJXJkejjAcx7aeo3/sVmWak319hettYnVth9BaLDIV8EXIizmsV543SyMB0pKNE+CAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542747; c=relaxed/simple;
	bh=BDM5MbOUOezyajcPRyt6vAUTkmAntOUfKfV/C38k/j0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z5GIjR2ihLUinT3oSzXeJywi98SIOnxqeThYNjGjqKxAmcUUxq5ItvVR6pQuN3VXKI4EgoXFRKfdVttKc9+qHLPrqikj7QF5rtAzt/TQ9yQmZWTJaVG3QaLoI+FRUbPek3YW6y20NceHexDiuS2I3YDx4Ky1uRU0Xh1+ihj1epw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHNnqBDW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHNnqBDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD361F000FF;
	Sun, 27 Sep 2026 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542746;
	bh=BDM5MbOUOezyajcPRyt6vAUTkmAntOUfKfV/C38k/j0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EHNnqBDWWAXqC2c6W264+8xs44qNgyRw8EOfSLs3q9YrUu1xRzwBk1qsgts7FKfGE
	 yjUb7rtdC0VLU31EFahUW+i2z4ZwoX1R/4uGsXJEAzAacLZfwS08VTksYLqTOS8JqH
	 qqoZ27MttbJA7OloDRw85g9QS35xeHY0mVZTZT7Nqr1H0KUXgYQbOXRxjj6lqmoZY+
	 UUlyTXKskzdVMFLJMLg983clW6CS56ohslSkUZHLvDDwEzB3XWO8cGR882TmHJFvU3
	 SpL1tjRPgA/3ocRhV2rkzyuX2Vocrh8r7Ev0wIwZO6QDlo0YxY1Ckj645HyESudMS8
	 n+cFcrFkr1NHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 12/13] reset: zte: Add a zx297520v3 reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: vkoul@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, lee@kernel.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260927-zx29clk-v13-12-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-12-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 20:59:05 +0000
Message-Id: <20260927205905.ADD361F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This drives the MFD child devices created by the zte-zx297520v3-crm
> driver.
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D12

