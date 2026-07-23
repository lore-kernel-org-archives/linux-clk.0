Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A6340DB3A;
	Thu, 23 Jul 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798799; cv=none; b=ppgLASkVRSYhg29ikgpVkf3doYO3LWcT135zunGynWfp35EXaS0tJ+4aa06vCHc+4BG/p13Q4AgZ6M24elqr4E6UErQW2k9QtSE5Ax//mRZWhHXekXemONHVMB6svF5UxjuO98ZSLBz+enNYTlxGD3jvO1tkjsMWs0rDzqZQA+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798799; c=relaxed/simple;
	bh=0N2675c0NYyWhcFFXd7dcIQh7D8m+rztVPKsZ+SRxIk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YwAeuOQzPMg1REKRNeCLd6Jf39nMSwhmLl125LY9K6lsa1uN3TGPeTunlmpW0iRoDYdGmr0O8CAFIW3lTYMya5eFlNj9H18xiOff5IDikAulDlwpsFRIKpYV9C2UpM7vnbJBGNtGymlzbYW+4doZCy1E4LHToKViQA/ZqtjRIqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6D69520113B;
	Thu, 23 Jul 2026 11:26:30 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmphG-000sKq-18;
	Thu, 23 Jul 2026 11:26:30 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmphG-000000005eM-17jZ;
	Thu, 23 Jul 2026 11:26:30 +0200
Message-ID: <2c0d9173cb7a4c4f407cea51a24a475de3b4001a.camel@pengutronix.de>
Subject: Re: [PATCH v11 3/4] reset: cix: add sky1 audss auxiliary reset
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2026 11:26:30 +0200
In-Reply-To: <20260723090808.1727598-4-joakim.zhang@cixtech.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
	 <20260723090808.1727598-4-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Do, 2026-07-23 at 17:08 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Add an auxiliary reset controller driver for the AUDSS CRU. Sixteen
> software reset lines for audio subsystem peripherals are controlled
> through one register in the CRU register map.
>=20
> The driver is created by the AUDSS clock platform driver and registers
> the reset controller on the CRU device node.
>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

And

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to be merged via the clock tree due to the dependency on patch 1.

regards
Philipp
