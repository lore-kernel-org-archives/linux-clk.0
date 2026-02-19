Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D185270830
	for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771493618; cv=none; b=rVyLIGQC2verpagbyFRHBAZY4TiEl0wV8jb/d0BhfSOlt8fTngI7QYZ7VW50tmIvNRmSNxNjGfns4rRc9hY91k6GiB7AiSxezh2aa6cJ1n2Xdpno9kUjvN7wYI6OITC9zlv02d0uVk21Fh5fP4p8QFlliG4WMaLmtceJyYvoKkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771493618; c=relaxed/simple;
	bh=7r0dI/NDhO5KOimLguNOEmUEH07RDuzdphKOPAKb7+w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/5Qb+YoyQbhiYIw1Ko8bP+fOBvlBL7csr/DHJlf+vjlAKCiMlLdWd1dCdJn6+APpwbaTUpB0zGOqWUi8Ceag1QR8n1K1/Dx82TBibmYGFAb07np0onOealXf1MsyGM6ZmOMMPCBWmokEUHlemR8eV3PUCCIm/uYAKCsXb90IqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vt0PX-0005vL-Tk; Thu, 19 Feb 2026 10:33:27 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vt0PT-001YRg-2L;
	Thu, 19 Feb 2026 10:33:25 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vt0PU-0000000050U-47c1;
	Thu, 19 Feb 2026 10:33:24 +0100
Message-ID: <d8bbb0a2c3619fcc3734d3840834b59e442f8d80.camel@pengutronix.de>
Subject: Re: [PATCH v6 4/6] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Michael Turquette	
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz
 Julienne <nsaenz@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Stefan Wahren	 <wahrenst@gmx.net>, Maxime
 Ripard <mripard@kernel.org>, Melissa Wen	 <mwen@igalia.com>, Iago Toral
 Quiroga <itoral@igalia.com>, Chema Casanova	 <jmcasanova@igalia.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list
	 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Date: Thu, 19 Feb 2026 10:33:24 +0100
In-Reply-To: <20260218-v3d-power-management-v6-4-40683fd39865@igalia.com>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
	 <20260218-v3d-power-management-v6-4-40683fd39865@igalia.com>
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

On Mi, 2026-02-18 at 17:45 -0300, Ma=C3=ADra Canal wrote:
> Simplify optional reset handling by using the function
> devm_reset_control_get_optional_exclusive().
>=20
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
