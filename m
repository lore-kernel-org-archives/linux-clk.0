Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CDA3B8BCB;
	Mon, 27 Apr 2026 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293284; cv=none; b=cor52NGUcQjBIiT5/k86zO1FWSYZaXc8K4MsJLVzOOJjTX05mm9uIDmTlFZGspZOUFuq/bHskgg23yn93z8Mx0gyyzshk3vqtaKzhITxC1VGX9GwAmzU0wq69B2n2CuCTrd4mGCIVGNAJJjUlTR+tYK0op85YMRiiHrTkT8R54Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293284; c=relaxed/simple;
	bh=sOz8A9YPihzEd99kRu8ucJArY5Hj2NaBY/3RDQjotVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fRVpxM6rgwYGGdsyELA5N51tvASTzSIMloUpn4EKXDk8LStK418d+4ETpIRocbi1jNXHRW/JO/ofd98eYHo9XpRs6u0pvYyIfXzcL/Q1UfzxZWN/NwHEYiV/7vaK1qXqUoIBZ21TwHxdd4luRifxnhVWF5GTRUO1zFN5XkxkP2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=r8ETKXg9; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="r8ETKXg9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=h7oEJShaFloAJ3rLxurIsdLzrXqr4IFYv+DPlRiRe2g=; b=r8ETKXg9r3VtVQBW+/XwowA8Sl
	J4rYTq+XAvlLPnexbb37uxHWyetQAE9qyMveyF8rzTHUlZVkBm7IJ0K8YrKRweiu/X5Rb5Qne1PDE
	k4Cn/A9dRbyQ1axlXa7ly1c8nzuR929l2MCtTt41bOGrVDFTJGBXymhpSIJj6ndPvGlMBaXwEVERZ
	PNy9DGQ/bW59Qf8DqRqVe6tnEaYzXpHt6ylH2twL7udJsO2/FyZuOHOVHC/sAaitEG46cHnEiPaGE
	HLdM/GwKfFty/gp2kQezySTd1rwrS5AYxvZt8KCTOiCbHo9bKuem2s/R6saCYAv1QNNp7PQxeNQW8
	LJujnduw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Hovold <johan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] clk: rk808: fix OF node reference imbalance
Date: Mon, 27 Apr 2026 14:34:38 +0200
Message-ID: <4062384.Icojqenx9y@phil>
In-Reply-To: <ae9QiGGPB9gJ0HhG@hovoldconsulting.com>
References:
 <20260407095027.2625516-1-johan@kernel.org> <10504733.NyiUUSuA9g@phil>
 <ae9QiGGPB9gJ0HhG@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 27. April 2026, 14:03:20 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Johan Hovold:
> On Mon, Apr 27, 2026 at 01:17:39PM +0200, Heiko Stuebner wrote:
>=20
> > Looking at the device_set_of_node_from_dev() function, this is the
> > right move, so
> >=20
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Thanks for reviewing.
>=20
> > It also seems the rk808-regulator.c might be another candidate for
> > this, as it also takes the node without of_node_get and manually
> > setting the of_node_reused flag.
>=20
> That's fixed in 7.1-rc1:
>=20
> 	65290b24d8a5 ("regulator: rk808: fix OF node reference imbalance")

nice ... should've looked there, instead of v7.0 :-)


Heiko


