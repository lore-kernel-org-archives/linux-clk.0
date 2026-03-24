Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698B21ABBB;
	Tue, 24 Mar 2026 00:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311558; cv=none; b=MqIiY0skcg1FeeRovyhQViKn2NGn23M5yFJGEFWX+ngBMx+nJop71eFXXGE6AGmlB5a+yBURX+G45czAANfbqBBOQZ/yR1vMGW81cIMzjqFqKb/McGYhy4mGBGwlw6WxyFvLmyC3V3Ni+1n0/oS4Gayy6IkF/ZTd/nLsNYhZIgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311558; c=relaxed/simple;
	bh=mUbcPZbzh1SAUSPqF1yTFN37JsPz38o6KdXbgYYsN1Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pZ70Jc+krrkmX1dgzHUSIH9lUXb/dGUqLV2ANdA0a4Txne0TEJXTk6agIAE4yct7UXEz9RpqgvmjaF3Yn11BH2UFNYQGzt8MhQ/oM9XBhvJk9oW4S2jABHydKRZ/LExTwSjQWKYJMfzrne5QF/QYp687dX3KPYs4bWsRKh29CRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2aDHLWc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2aDHLWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6E2C4CEF7;
	Tue, 24 Mar 2026 00:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311558;
	bh=mUbcPZbzh1SAUSPqF1yTFN37JsPz38o6KdXbgYYsN1Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=r2aDHLWcbCDL3bVlfoH1A6Y/rOnso+qbKho9XJY1FEU1Mp+5vlIHFDGLA+6l4uM6I
	 vuYO0GjW6Vu552H4wnfwgoUpvMTf0syFJqAERIZezozP8XPzCTyS0IGO4l8SZNtdyK
	 FnpJnsoa50K/9rYO+THMWwwGTl7FJMEHgNev6+sOO/3XkVmoDsivtrgpWFHuHt0j+F
	 4sRZLEoLgAmZd0wE29a46JDwyQXt2eRqOLgPQk7Z62WTg2KiOYv8elXOPO91onl7az
	 rY6+WDQAOmVypri3tJt4ZtrjjOSrjmKDQWxkQTOVh/zlipEfLaAOuMConhZwGZ4+AJ
	 HacIdh9Yv/Ifw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <703be6fe95cad2e738c712877fcdaa63a7809802.1772705499.git.geert+renesas@glider.be>
References: <703be6fe95cad2e738c712877fcdaa63a7809802.1772705499.git.geert+renesas@glider.be>
Subject: Re: [PATCH] clk: Simplify clk_is_match()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 23 Mar 2026 17:19:15 -0700
Message-ID: <177431155573.5403.2205498312354695979@lazor>
User-Agent: alot/0.12

Quoting Geert Uytterhoeven (2026-03-05 02:12:33)
> Linux style is to handle early-on failure.  Inverting the first
> condition lets us simplify the second, and improves readability.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
