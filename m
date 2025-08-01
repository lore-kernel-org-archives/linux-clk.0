Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF0B1925BC
	for <linux-clk@vger.kernel.org>; Fri,  1 Aug 2025 06:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754031227; cv=none; b=XDQEosPXRPYaGrBmDG8tYinx9ET0pIX4C7dURt9Textsxvnb2aug5Sah+T/kZhAqQeom1ZkyCvmboUejPbzeKKieGMeeA8B/dj9WZClXj1CIV8iiY+sl795kXncNNKXixoeq9Mrcgv36blGTmwZXRe/AqojjTGW1Ki2jc+0FITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754031227; c=relaxed/simple;
	bh=z6wu97Qx4PzZUGN0HFq5lg4ouDZclHIXmcME0ndtly8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qlvXXGuJcVWuIUWP+i6kM3rmWVihlfrNLkj3Ge6JY3X5+kpSq6wgsQO3Y3SfjN1mHhABA7A4raIw4f/VNn1f9XoNDvwxKwGGjgExtu9o1fPNYOJrHY8hupBoi4l/xJRAtzNFfPrEAG0Qp3Olg6fdHW8JQmDLdlqJfU9vbzPgg2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uhjdw-0004CA-3q; Fri, 01 Aug 2025 08:53:28 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uhjdq-00BL9o-2k;
	Fri, 01 Aug 2025 08:53:22 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uhjdq-0002fD-2S;
	Fri, 01 Aug 2025 08:53:22 +0200
Message-ID: <ba9fe144a8cfdf62eb6cfb5044401b1083d1e66f.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/5] drm/v3d: Allocate all resources before enabling
 the clock
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz
 Julienne <nsaenz@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Maxime
 Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, Iago Toral
 Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list
	 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Date: Fri, 01 Aug 2025 08:53:22 +0200
In-Reply-To: <20250731-v3d-power-management-v2-4-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
	 <20250731-v3d-power-management-v2-4-032d56b01964@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Do, 2025-07-31 at 18:06 -0300, Ma=C3=ADra Canal wrote:
> Move all resource allocation operations before actually enabling the
> clock, as those operation don't require the GPU to be powered on.
>=20
> While here, use devm_reset_control_get_optional_exclusive() instead of
> open-code it.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
