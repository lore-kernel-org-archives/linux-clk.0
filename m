Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B31B6556;
	Mon, 23 Dec 2024 18:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734979106; cv=none; b=YYyHH2OwxLal+X/rBcPdzpV0YuVkN12gQRZxwGMLllaaLv8tzZBaxEqitVxsEEIh6paFbLz8oyywn6LIkD+sa0ioOsIWxGnaEr6/VQW7jxt5CGbro9qjiDfXOU2Q3VlNaw1dHaetPR5JUxTU7ilnItynYArwf6MGOhWI+b3HvRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734979106; c=relaxed/simple;
	bh=q5bZB9tN6Ej5m8fd1ZE4u2Ym/mpu03gi79bnPoBZCto=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BKvHlVM+y3l9Ykvwi/+IZtZsCYPlMwpy0S+duGbicTLZyzDg6CW/bADv8lS16/mKz8d00Kq8VphYE1EvJC92+KNJZ2yD4PBr/xlAqPYk/1MSRhx2YknPv/4Y3Lasl+FHhhOzdi7IOGi41wPI543XWUOn5ZfLrHJisgZtmEqnCTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AEPx8jWE; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AEPx8jWE"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EDC2E0002;
	Mon, 23 Dec 2024 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734979102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5bZB9tN6Ej5m8fd1ZE4u2Ym/mpu03gi79bnPoBZCto=;
	b=AEPx8jWEsJxPYdnDQzfB8/CNI5cobqCAzbcuBIKwuH7AiTDdkAkZqNcIIIxmP58+epXv8L
	kEJJ8N3BI9y8tQyvVcwWb/Bd39aLZrP7JZvOoOycQlxobAzMhq3iLCPdj7yzhI71TQtzOq
	GY10Ulp4TwgoaFPbnLcGQCezegpVUm37z+kK5BBhJibptU7vUDgy6BNEwirZx4RCVf8I3h
	pAKQv84nw1J5JySH2a1viZeZy0g6aiBtT8pT6oxm3/WsxJlA0pkRRUIb2AU+bQzjoPiH7v
	mjdLpmzyYbPRkpSwCvqtbzprLhUMOxoL+DXaE4NdBJ1Va5H9u5jxReDFjPl0Rg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,  Fabio Estevam <festevam@gmail.com>,
  Marek Vasut <marex@denx.de>,  Michael Turquette
 <mturquette@baylibre.com>,  Peng Fan <peng.fan@nxp.com>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Shawn Guo <shawnguo@kernel.org>,  Ying Liu
 <victor.liu@nxp.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Abel
 Vesa <abel.vesa@linaro.org>,  Herve Codina <herve.codina@bootlin.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
In-Reply-To: <fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org> (Stephen
	Boyd's message of "Tue, 10 Dec 2024 14:44:19 -0800")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
	<20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
	<fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 19:38:20 +0100
Message-ID: <87jzbqtfc3.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Stephen,

>> +/* do not passively change this clock rate during subtree rate propagat=
ion */
>> +#define CLK_NO_RATE_CHANGE_DURING_PROPAGATION BIT(14)
>
> Why doesn't rate locking work?

Can you be more specific? What function from the API is supposed to do
what I need? AFAIU, none of them is properly locking the rate during a
subtree walk, but if I misread one of them, I'd be glad to drop all this.

Thanks,
Miqu=C3=A8l
