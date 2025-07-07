Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F6728ECEF
	for <linux-clk@vger.kernel.org>; Mon,  7 Jul 2025 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881641; cv=none; b=Jeg+LIoD1d2PpO6YfMet8D2PY6iPLz90qAO5Ay4XraeuuHZIv15fdTSdBjLWBt/0C9qC36H/hiJxg3iQ5gvaqxGZS0i4i6AjjoXLDXaRrtQXyqxllCML0qxnvCy4O6UFelPljdXwwNsTQRzNVPTLF7j2k7tF/P5Cz5ELS94SO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881641; c=relaxed/simple;
	bh=1/be2royPIkQLfr/HcPh/TJaKZHLxpX7JL+qtcyAGq8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l2lXZcJT3dPKaepIP1eCqgTkbCA2Lxf9WqpFlHbenij11PTeZglHGQP4e+MCJI+507gruW++LBQ3bk/j/QwfR+A4YwmPaj26bQMrtM2sZXCMuZsvAnM57Q8fmIhm6bb15eTg/5QB855aK0rJxqr75VJ7roX74vv43JaqFMLq9wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uYiRA-0006RW-Fn; Mon, 07 Jul 2025 11:47:00 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uYiR8-007E6Q-38;
	Mon, 07 Jul 2025 11:46:58 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uYiR8-000IEH-2o;
	Mon, 07 Jul 2025 11:46:58 +0200
Message-ID: <33a20f6abac7400c8b4842b99c14ea118def2780.camel@pengutronix.de>
Subject: Re: [PATCH v12 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 07 Jul 2025 11:46:58 +0200
In-Reply-To: <20250702113709.291748-6-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
	 <20250702113709.291748-6-elder@riscstar.com>
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

Hi Stephen, Mike

On Mi, 2025-07-02 at 06:37 -0500, Alex Elder wrote:
> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
> device is an auxiliary device associated with a clock controller (CCU).
>=20
> This patch defines the reset controllers for the MPMU, APBC, and MPMU
> CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
> and ACPB2 CCUs, which only define resets.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

To be merged via the clk tree, if Stephen is ok with that.

regards
Philipp
