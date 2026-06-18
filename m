Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8433BFE40;
	Thu, 18 Jun 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777621; cv=none; b=RhwhYdw3x0SayXhFTe/sDIBuUjqO81FIiDjVjIBq1z2JDao/dnp9hOOqYh5i1uhwx0FhWq3zKqT4DYUHrP7JNCklBAlCI4DOhfjsBvwyI11Lh9ja8ZTSY/854Ep1E/waCAwdyNWZ4C6NBRsU6dsCuH1cFXvD+m6i1AlvAqMuqdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777621; c=relaxed/simple;
	bh=LFZmeDKmtCc+B5qoiZfXU+s3/23kifZB9+i7lpykoYY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=THIfhAGufb5LDn6NgKQxcBrVScbBPBkk42AFISHXZB4PN6yrzFVMXYKpI9d9cczGB+DaIpVVIKM5w/ncOKkA0jLOK783zDTdwl7ONg0EbvRptLHK0A5aOXlbt63b14qV4CixV/p10ruDxLBDn+Wm0u0byJ3awxi7bLBjNPeYhBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 768E7200275;
	Thu, 18 Jun 2026 12:13:36 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9ke-003QAj-1B;
	Thu, 18 Jun 2026 12:13:36 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9ke-0000000068k-1BWP;
	Thu, 18 Jun 2026 12:13:36 +0200
Message-ID: <0af47f978c8a93165cbdbe4ca88a186acbb35157.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: spacemit: k3: fix USB2 ahb reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Junzhong Pan
	 <panjunzhong@linux.spacemit.com>
Date: Thu, 18 Jun 2026 12:13:36 +0200
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
	 <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-05-18 at 02:58 +0000, Yixun Lan wrote:
> According to SpacemiT K3's updated docs, the USB2 ahb reset and USB2 bus
> clock enable bit was wrongly swapped, the correct one should be:
>=20
> Register : APMU_USB_CLK_RES_CTRL
> bit[1]   : usb2_port_bus_clk_en
> bit[0]   : usb2_port_ahb_rstn
>=20
> Fixes: a0e0c2f8c5f3 ("reset: spacemit: k3: Decouple composite reset lines=
")
> Reported-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
