Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DEB29E0E5;
	Fri, 23 Jan 2026 02:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769135324; cv=none; b=bUsd+T8lVSCrdesuH3FkBHGSTZyEDlbzghFiur6MxwCW9C45+0bAT9PjjHNtQ+FCG25p8DPN9Gkvg/F9gRBjWlCBiezZbxn2dMGlH7Cr+/Vr+uCxSsytgHXN2k/Q+dEVbrWImwL0dcn8CTbQKPfYxPfpGe2+3BFV5FAPcZDKPzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769135324; c=relaxed/simple;
	bh=ImYCBDxcwa6xUZaU3Vt+EOCESXER0tcEn3gxhCtxGY4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=o94FyuOJ9LRRZL708pHCX0yxhzcZrFtfR+Slj0ORJniHGZ6riAr0RezMgK1XELN80gzl8TyAzYp4wSp4h/YjqTVKR1WbKTS2/cyPjr2RvN4NPWR1rogRZGLcEVr1pAgWcyFgf+8FtS22PGd7LmEK8shkzj8D3DI76PUpR2XiuD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c81k/N8k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c81k/N8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1D4C116C6;
	Fri, 23 Jan 2026 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769135323;
	bh=ImYCBDxcwa6xUZaU3Vt+EOCESXER0tcEn3gxhCtxGY4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=c81k/N8k7h6SQi875WtEfXYBXJGUoyTzS/ho9z/4qH8+IpQesy+tvXxWkO1wG9A6R
	 5hzhmZ+qMw3xdMO2CVyG7vKkGntj+VUocsz5248TTvjZ3UUXIQ7Wi4UzQ+UrskNUBH
	 e/ipUmFzKSmtSAbR6ogop/0sTnphiJAJ7HZfCgi9x1+sblRsbI3aD5TZ72UFaTrERb
	 iW3TwmYUAL/5mdvEcIf8MUMVT7dMdshue707bdpC7NyJ+JdrUs9ZjVaAWREEcXOUJu
	 qFXJ4Jgn+FsHowxaKkNDZwnhp9JR/fj75d+Vh8RMlMLssKFx4gn0Dcvsc0rr70EYUE
	 otWx9TPMK+I4w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com> <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com> <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
To: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 22 Jan 2026 19:28:41 -0700
Message-ID: <176913532114.4027.15108524142710620193@lazor>
User-Agent: alot/0.11

Quoting Frank Li (2026-01-05 12:50:11)
> On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> > Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx=
6ul,
> > which input from ENET ref pad.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
>=20
> Who will pick this patch? Abel or rob?
>=20

Should be Abel.
