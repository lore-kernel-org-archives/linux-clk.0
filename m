Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300C2FCC13;
	Wed, 19 Nov 2025 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763575911; cv=none; b=t5qBr19Ca9rbDx/Eva6CPZxraPLcD11lQsWdxhmon7G2OCA2EOzb5PKq6lL6Fg2ISdEZQBQ5LEiDTceoq4NWY1cZ1djlvYKzCtMTboLBIJ5+ChAm8Za4A5zVn8CKxaqy/y7eK42FN6MbKfPIqJ+tAeRWFnbgnK/bqPicjRTBnao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763575911; c=relaxed/simple;
	bh=+RdYG33iCZuDeD0/VFk7kVc03XXG12WMufrZ2hK5EvE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=p8oj5Fiu9zFug80qHh+2Jd4d2woUcSPdTse5EwGS48ZFoziORWpWG4TJ8+kM4qn8sR61DUlwEAIKkL/qGGNLD11N9Y0/fnSjleSmcGJgt8k4/bA74tFJijaSAyNKFRKBxSwivDsDgVk1i9WbeQI9I0O7DY0f8sOsPfKjW8ffNoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjzGAgNk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjzGAgNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58CBC4CEF5;
	Wed, 19 Nov 2025 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763575909;
	bh=+RdYG33iCZuDeD0/VFk7kVc03XXG12WMufrZ2hK5EvE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IjzGAgNk/ikrJeyppei/IyDnZV/0Fi+ECywG0vlW+2TdT+pjtGcnWFbGAcTKokjwl
	 bqr3YTOta4hG6Fxvk/u8sgmb3ZrGkdQOn3bTUt98Ja2ZTMG0EGfpSmfqK/9Q95VA9H
	 9GaSZJfgYLPl7JfYD4YdF+nVLLcRwm7oIm+LlQP9tvmWlHdjJifUxq55PEPg//v1GB
	 3hk5ky7h/kUqzsLI1AVZIHD3ajsUCq8AA6aq6YWB0TJpn/Tn837RLKZXDbuNqsE5zq
	 VJLzF0j/eebMgj8+RZZNjmSXXrDpdGFe41EpBaYYVGK93KUpsmAkX1+awDCRRiuGRO
	 W0o17HSpfwo5Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251118074055.2523766-1-xu.yang_2@nxp.com>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: imx95: add PCIE and USB PHY clk
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Frank.Li@nxp.com, Xu Yang <xu.yang_2@nxp.com>, abelvesa@kernel.org, conor+dt@kernel.org, festevam@gmail.com, hongxing.zhu@nxp.com, kernel@pengutronix.de, krzk+dt@kernel.org, mturquette@baylibre.com, peng.fan@nxp.com, robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Date: Wed, 19 Nov 2025 10:11:47 -0800
Message-ID: <176357590754.11952.7874373646773229823@lazor>
User-Agent: alot/0.11

Quoting Xu Yang (2025-11-17 23:40:52)
> Add two clock definition in HSIOMIX.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Please send a cover letter next time that all the other patches are a
reply to.
