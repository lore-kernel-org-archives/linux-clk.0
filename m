Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1CB4369A;
	Tue, 30 Jun 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804211; cv=none; b=bK9633FP6z+0AbAFqR1B1MjmasN6+Q+2EseZs2IZoSDCEOGmtq/WudZnYwqD/OPdv9ch4vldNd11dnzNt7o4ciHCTmNVRzZJBVbDydprJF8liP0hVTG/YFaxHaTl4Pq1oOlocYsKkVrFaKfR4xQYc7MYkz+uMcR5TtcAHNvXLiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804211; c=relaxed/simple;
	bh=q2RFJvMDBuqW6a23HXCD3/Yd6XxV6jXX4kM/tbNUiUg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HLwU8xQizBGsw8/iLOyWtugRgwwQelLRuWMx0miciW3qlqZjQ3gJXy4Iq3TQigouBXBU62oxE0/CHqms3wy/UfJ4KBvRf8Lr1LzpJEbjDT2J3KkTdad/b03I3JFmckS87rFFS5g5MpWjNgJhDL1tEMfBlENVKHTch9zaKiEjVVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 8811E2007C0;
	Tue, 30 Jun 2026 09:23:20 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weSoS-005NFc-1V;
	Tue, 30 Jun 2026 09:23:20 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weSoS-000000002RU-1a3o;
	Tue, 30 Jun 2026 09:23:20 +0200
Message-ID: <0ccf83ca31fe30a77099aafd8fae31e75fd276e3.camel@pengutronix.de>
Subject: Re: [PATCH v5 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Brian Masney <bmasney@redhat.com>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley	
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Date: Tue, 30 Jun 2026 09:23:20 +0200
In-Reply-To: <akLcbHYKJfvZzf27@redhat.com>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
	 <20260514-dr1v90-cru-v5-4-34f3021aab51@pigmoral.tech>
	 <akLcbHYKJfvZzf27@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Brian,

On Mo, 2026-06-29 at 16:58 -0400, Brian Masney wrote:
> Hi Philipp,
>=20
> On Thu, May 14, 2026 at 05:27:20PM +0800, Junhui Liu wrote:
> > Add reset controller support for the Anlogic DR1V90 SoC, which is an
> > auxiliary device associated with the Clock and Reset Unit (CRU). All
> > resets are active-low.
> >=20
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>=20
> I don't see a Reviewed-by or Acked-by for you on the reset portion of
> this driver.
>=20
> I'm gathering a pull for Stephen for various clk drivers that were
> missed during the last merge window. Does all of this usually go in via
> one tree?

When both clk and reset drivers depend on the dt-bindings + headers
patch, often all of it is merged through the clk tree. For this,

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

> Or Stephen merges the clk part, you merge the reset portion?
> Who usually merges the dts changes?

In most cases clk is the platform device, and reset is just an
auxiliary device. So if I can merge the reset driver on its own, dts
usually goes with clk.

regards
Philipp
