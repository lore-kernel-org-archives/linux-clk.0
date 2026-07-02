Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF91C33438F;
	Thu,  2 Jul 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007619; cv=none; b=Xekyd33ydZKTWK1HOCFpieAFSlo9JrKCyJDi6UYZJzet8bdhBqimrvZXtPHfLWWgtJpBvoZCEUIyRWXGLf5E+ncQ+ehHQYMmvFBtcIPW25Yf4D59k4if7o5xbz8mUi99nBb2pe6hgLOTpqlvXfJ5o8QOLNqG5tqibCml8u/TGBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007619; c=relaxed/simple;
	bh=v969tZW/2hyq8qZnqoyWvimix+b7bWWKmDeqXoG6APA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q1WoweYAmPGCanwyFq0cAfPgbaCmmaBU7hnSUqtufR4VFbL6ecDD94jah8YVXFQAR0p0oXqptwoZfcQ3V/bWZZylh0IW/isw0eLX3DwExKNYqZIsQqBLZrPMkXqVK+fdROq0huKt4ub6tnaZAqgQne2gbnXagpYTpHoj/vw0ycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9E7DD200EDF;
	Thu, 02 Jul 2026 17:53:34 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJjK-005lg1-1j;
	Thu, 02 Jul 2026 17:53:34 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJjK-00000000Fe5-1uow;
	Thu, 02 Jul 2026 17:53:34 +0200
Message-ID: <ae1e67ae363956c1df695213c13f2463b73dfa72.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] spacemit: fix USB2 clock and reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Junzhong Pan
	 <panjunzhong@linux.spacemit.com>
Date: Thu, 02 Jul 2026 17:53:34 +0200
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
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
> In current code (v7.1-rc1), the register bit of bus clock and ahb reset
> for USB2 were wrongly swapped, but this didn't cause any problem, because
> from setting the register bits perspective, the de-assert reset operation
> is effectly equivalent to enabling the clock bit, both of them will set
> value 1.
>=20
> This issue was found during suspend/resume test with vendor's internal
> kernel.

[...]

Applied to reset/fixes, thanks!

[2/2] reset: spacemit: k3: fix USB2 ahb reset
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D1ca22c6aa006

regards
Philipp

