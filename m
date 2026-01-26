Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0D219301
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769412216; cv=none; b=qSdy/uPlEkU9HKuUvopr1EXbKVIZ4DjUJ3cGiaHPBZyPZiSlED3csRTVgvdQQsY82sBLaCS2lx2SHzDuT2sMph8nMDHSKPmZ+RWEA6/23Z9AjKkOxQQZ9IJt53Y6u4nYZRCqC/xdhXTKD/ujH+86ZcbzZDrlVj5jPjgOGqrv3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769412216; c=relaxed/simple;
	bh=JeYD5AtiNqcXEAO9bt0FtHN4bDtIwFuJFUCK3lyjKok=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GQo0ZLecgrnao+GQf/x8nefuxdfXtOReSWqKiiABSpfPHnMrcRuIndqRuJs9eSErCGKPsd8qCtivJEQTmeXZfNqSyTzDtDNJJ6kzy5vkaiJLZF18SUkkrLSA9Y6iHlK1YvAhleXzV7o37lAnBueR6ED0MYQJ4XkZHg5wK+/gyOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vkGwT-0005aD-PO; Mon, 26 Jan 2026 08:23:21 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vkGwS-002XgO-0I;
	Mon, 26 Jan 2026 08:23:19 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vkGwR-000000002hB-1PKm;
	Mon, 26 Jan 2026 08:23:19 +0100
Message-ID: <ca32359d08c642bd68133a8960315a80490f4da7.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley	
 <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, joel@jms.id.au, 	fustini@kernel.org,
 mpe@kernel.org, mpe@oss.tenstorrent.com, 	npiggin@oss.tenstorrent.com,
 agross@kernel.org, agross@oss.tenstorrent.com, 	bmasney@redhat.com
Date: Mon, 26 Jan 2026 08:23:19 +0100
In-Reply-To: <CAEev2e_6PePu3omq-Zf1R-8TYikgz9V1cp6cwn0nZ8LaPHaJ2A@mail.gmail.com>
References: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
	 <20260122-atlantis-clocks-v2-2-c66371639e66@oss.tenstorrent.com>
	 <1adc068bbf1a15b1b10651f6ad9385415f6d4227.camel@pengutronix.de>
	 <CAEev2e_6PePu3omq-Zf1R-8TYikgz9V1cp6cwn0nZ8LaPHaJ2A@mail.gmail.com>
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

On Fr, 2026-01-23 at 10:15 -0600, Anirudh Srinivasan wrote:
> > > +/* RCPU Reset Register Offsets */
> > > +#define RCPU_BLK_RST_REG     0x001c
> > > +#define LSIO_BLK_RST_REG     0x0020
> > > +#define HSIO_BLK_RST_REG     0x000c
> > > +#define PCIE_SUBS_RST_REG    0x0000
> > > +#define MM_RSTN_REG          0x0014
> >=20
> > Why not move these into reset-tenstorrent-atlantis.c, they are not part
> > of the interface between clock and reset drivers.
>=20
> We were considering putting register offsets like this in separate
> header files that are dual licensed. In that case, is it okay to put
> it here?

I see, nothing wrong with that.

regards
Philipp
