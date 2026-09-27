Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0804035A3B1;
	Sun, 27 Sep 2026 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542795; cv=none; b=Aam4cUdzWTMPgEfvt6E1zy7FoJxtizc5eb7An56uLg4ksdy0iFQpgdNXOX5M9jISguyLvpRqeNuIMwMzs49gl3zC4cGc8b94YB2Luxp7y3aXwAmREJlCv5Nl2t31zVs8L+3RdeiICKhOogREGbSM4m1Gy3ATZxL6rk4FJP77J/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542795; c=relaxed/simple;
	bh=uZJC3u/e59+JogXEuTPL9E+ANzaRd8epWClATpQe50c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GI3T6TJZHY+bEZGMQkQhI1AYXSt1H/YMvRtT1wnZn4rtZWKDgmwiSsGohoh++Gv5hA5s/yZTd6SzIsTlNWQlDcyuE3LExryiUb/LrLLdVtn3nFXKjIA7+u+eYCsKX2eH1Bu9WlM5p1Yv1j7nveq/vAoF2iujICKNlfS6NuoO9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQ5H1r+v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQ5H1r+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E781F000FF;
	Sun, 27 Sep 2026 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542793;
	bh=uZJC3u/e59+JogXEuTPL9E+ANzaRd8epWClATpQe50c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQ5H1r+vZxMbROC3tJUyFid1AnLkJvT4F58T7RLI/Sm+CDcecnRFrkwAi9tPlX6xm
	 kwGdRdNqd3lrbM8Sxx+ee1oLVuoj0IGhNr87XKSng6OXxpNhmFxE5/hTcw1n1uX96l
	 vcwWSLYjXN/jMv0lY6i6DkwngcJUAZlQbWZ0IltwH4pNh7ymBV3Vdte6xKKCDnugOP
	 zIbElpeF/gzljmLdzuyueccyip3ma7R3FXVpqXLnIdpdYwVIEvE3Zf53nYOfPYzFIt
	 HFHNOK5TFYY5O232STOoENjCkQUNh0SY60g4/vCN8+xowsjUdM+GkH/ASv24LO1NxB
	 gH4bRO/fEoEfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 06/13] clk: zte: Add Clock registration
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927-zx29clk-v13-6-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-6-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 20:59:52 +0000
Message-Id: <20260927205953.14E781F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D6

