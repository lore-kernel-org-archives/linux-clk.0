Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A6F3C141F;
	Fri,  4 Sep 2026 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538292; cv=none; b=Hazd7K+X2apesPfAUBq7Aae6ABXBXpDKxosgJk+klJn4x8jpcglY0GxZi9G+TQKUb5A1uSbY20K184ARAsDv/qvAQSQWmgMj/P/AVo4Tvvl3K1xj8AjZBVY85ibcTTQQPK2dJB/pq5xBAtlK7RXAOLJQDuXEjcwDaLnGLEzwuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538292; c=relaxed/simple;
	bh=qsGq2P+kiJN/b/vD7hZ4BaPg6aQP1KVB3Bg2P7HG2yU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XAyZaqB48i0c5O5SL/6BgdbqhgyQrtxt+xchVcP97Ys+hm/EMblUmJsMAGknfEpk6vt+qSeydxOhHMsfC8UCd4rx4Afcy0JGzIfbuyoBsFR0VdJ6z8LNYY+OwrMqHa/W/euYma1QeWCr66IiGnmw/+fvxrRPaeTP9X80V6pNmj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xa1UqG7f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xa1UqG7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245DE1F00A3D;
	Fri,  4 Sep 2026 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538291;
	bh=nelZe2JKKD+n4puxlXNb2kakMC39MBlRUNCUFcP/3Rw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xa1UqG7fbZQpWONbx93PHel/9NjpyWqYgMXT13KTrZ4J6xdrfnul6Q4vuMPuixF9/
	 +hOebfG1wm4i17l/1yFauffAZNiqmctyIaV9fBeUer9+H5BuyokdnyBDpvNBg659NV
	 7+9LWz5Eu46BOnklYmqTs+PCUlcoRZxENjVt8pEMqMLACaC0SEz7NkbADrjXWroo0u
	 1q69LJFtxoqUPnRs+h5M0B7+okHxLppl5ynrugi9pVq+BOnmSfjuOx/Cio1eaWxeJM
	 Ay3w1ENPytTwxe9MqRu/lbB3nLryLKSAcyx1zDDaZdKSENiJphbdXVGNcU/UebBOO0
	 NiEzMVM5OzFPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/27] clk: mediatek: pll: Add PLL stabilization
 delay definition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-12-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
 <20260904-mt8189-clocks-system-base-v6-12-5df247f56938@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 16:11:30 +0000
Message-Id: <20260904161131.245DE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Comment retains a hardcoded delay value, defeating the purpose of t=
he macro refactoring.
--

commit ed78802d4853a74588db6e1da90538ffeb9ae7a6
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: pll: Add PLL stabilization delay definition

This commit introduces a new macro PLL_STABILIZATION_DELAY to replace
hardcoded 20us delays used for PLL stabilization.

> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pl=
l.c
> index 2aaf2871ecf6a..9a197a657dce0 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c

[ ... ]

> @@ -306,7 +308,7 @@ static int mtk_pll_prepare_fenc_setclr(struct clk_hw =
*hw)
>  	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
> =20
>  	/* Wait 20us after enable for the PLL to stabilize */

[Severity: Low]
This isn't a bug, but the comment still hardcodes the 20us value that the
patch abstracts.

Should this comment be updated to remove the hardcoded value so it won't
become stale if the PLL_STABILIZATION_DELAY macro is updated in the future?

> -	udelay(20);
> +	udelay(PLL_STABILIZATION_DELAY);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-mt8189-clo=
cks-system-base-v6-0-5df247f56938@collabora.com?part=3D12
