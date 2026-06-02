Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6134384CF6
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389161; cv=none; b=sxpbVZokw1JN7qeCMnOsq+tBbzOIv4GlCnQS1wEt4GA0/Hh/JhuBeD7AQdveDVBxFl5/zQYZQU67fnRa43sTIsrMr/ZJGqKx0a7Ue++JTsBID5WgjLyWxJHXD3j6gZ8nQCoET5M2OahYfub4QbDEt/92voAvE3BuuwSvlYhu1E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389161; c=relaxed/simple;
	bh=5m/I6ObPsAr0809Ls4ilHXhGgewAjICXeQXnZ7d37Zw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L+kO51xfF+4LcCEkwjMBUHRKQuELsJ2TzreMCbRRrpuofkl2jLHy9dF9ZM5yI3Mi0u8Tjj4GJUmTnu/4+RtQy6LXfxonGEojj+s5KNUqy7R8wnCMQHy+f/NjYL0lykB8A7QN1cPb2NQVKApmRCZKNvhJBM7NBsFOPRy5C/LVNiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUKY1-000263-AQ; Tue, 02 Jun 2026 10:32:29 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUKY0-000iaH-1p;
	Tue, 02 Jun 2026 10:32:28 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUKY0-000000003hr-22vP;
	Tue, 02 Jun 2026 10:32:28 +0200
Message-ID: <1a1513afb45636a0d42e5521585f35ebec05bd3b.camel@pengutronix.de>
Subject: Re: [PATCH v1 5/7] reset: cix: add sky1 audss reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, 	broonie@kernel.org
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	linux-sound@vger.kernel.org
Date: Tue, 02 Jun 2026 10:32:28 +0200
In-Reply-To: <20260530021642.64059-6-joakim.zhang@cixtech.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
	 <20260530021642.64059-6-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Sa, 2026-05-30 at 10:16 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Add reset controller driver for the Cix Sky1 audio subsystem (AUDSS).
> The driver controls software reset bits in the audio CRU register block
> via the parent syscon regmap and registers a reset controller for SoC
> audio IP consumers.
>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

Apart from the register tables and the way the regmap is obtained, this
looks very similar to reset-sky1.c. Why not integrate AUDSS support
into the reset-sky1 driver?

regards
Philipp
