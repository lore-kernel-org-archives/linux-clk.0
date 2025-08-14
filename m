Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA330100E
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 10:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168983; cv=none; b=RHJ4ZhLQGpVZouN9fa9oPuIinnaUKcrgBdQE+2hBM0AhEszluuC6QdW0lgCMlVgQ+zWXVWGjDcp09Zb5+l5aTJz4ndQ5qmw/gdhi35LNBTBE/U2Lp23cj0UqQuyvyZPB0jspw4rW3uYg1SqJZJUjZeuVZt5aomguLZ6zVhtAHWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168983; c=relaxed/simple;
	bh=3+OfW9BOfjYv2yldcC6Z/G9UCY1xuSmIk3TDJoWLvCc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hXWYxzbWedBuvSCOvKSDyJyZbxM6yN/VgDCvJU7v6Df2uOUBzM5LtvoFIqoj3EEtUMv+L3NM3FohJ+EtFPBlOwfs1+P7cWSFr/w7YC6NTDLL6cw3muhjCiYZ4CArDqO+IXJIDyhFCdkyak7qepIFTf0EJK7jd1MwRicmO7hzVFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVcq-0001YI-AE; Thu, 14 Aug 2025 12:56:04 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVcp-000EyL-36;
	Thu, 14 Aug 2025 12:56:03 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVcp-000Hxp-2o;
	Thu, 14 Aug 2025 12:56:03 +0200
Message-ID: <7933061270daa3f9c53021064f92f7431fdac9de.camel@pengutronix.de>
Subject: Re: [PATCH v12 0/3] Add support for AST2700 clk driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mo Elbadry
 <elbadrym@google.com>, Rom Lemarchand <romlem@google.com>, William
 Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>,
 wthai@nvidia.com,  leohu@nvidia.com, dkodihalli@nvidia.com,
 spuranik@nvidia.com
Date: Thu, 14 Aug 2025 12:56:03 +0200
In-Reply-To: <20250708052909.4145983-1-ryan_chen@aspeedtech.com>
References: <20250708052909.4145983-1-ryan_chen@aspeedtech.com>
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

On Di, 2025-07-08 at 13:29 +0800, Ryan Chen wrote:
> This patch series is add clk driver for AST2700.
>=20
> AST2700 is the 8th generation of Integrated Remote Management Processor
> introduced by ASPEED Technology Inc. Which is Board Management controller
> (BMC) SoC family. AST2700 have two SoC connected, one is SoC0, another
> is SoC1, it has it's own scu, this driver inlcude SCU0 and SCU1 driver.
>=20
> v12:
[...]

Applied patch 2 to reset/next, thanks!

[2/3] reset: aspeed: register AST2700 reset auxiliary bus device
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D9c50f99c1353

regards
Philipp

