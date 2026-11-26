Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714280;
	b=iRHL33FO0Sg9uXMOSJm/m7D9e0gEUkScqC0phY9Gwyu/zRGDNGUV7fy6j5DZKWMp4D7P
	 vP3COZVN2HJPQMWzRuGaGOdVKF2LQS+qgC2Xmw4BUSojViZHmvYsRf+l+m1lW9c+Kguqd
	 Q0Wf/RRPpLVa0i820KCyeravwk/iP39Z6/jSeP+AR4m6A+yCZmJL/WN8/V0eZoXIuij0t
	 ipef8vBD7ITqn45fRuyOZFZ/ZV+QmwYtYOvUzxwyVlIGQ1R5UfXklOwYDtDI4rlVkaAmV
	 4rAF2gzrqcL5Brsl7Pg4siQt8/LrEtCIaxvBgvb2F8KQK+a4r6ZtHhKZjyQZeVRNl4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714280;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=YecqGseBcL1cLP7lyFoMvHPfnwoS0Rz/GtlvIjCbwD8=;
	b=h2/u9Ui6hYZ4oGglT8NfY/baRL+zbm/U476A+yo+kWmhxYSxvl3LQ1jQLzj4KXZ2COrK
	 Up+AlUjcjS1ypgZ49PaUfrQZ/yolDTY1yTSo1aIVenPx+aF1uxIHkaCyZ9TjaRgof9hSe
	 zz/MoAPBIV4XkJa/PzBE84JgBoUNvtefreQccpuIJS0s2M+pnMmmbJSysxm9E9RxExwDf
	 n+Hi1m38jVayzrBLCN4Wmsgw6YHGTLyLJuDZ7BR2sXRVXWUCqpYe6kotxlBDpjsJQxBcy
	 0MeFMYczvDTmbyikOx4AjBR4/bSoExuHM7rlLPyiJ1nssLl9fsLmDnF1L+s2Al+OLlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CVJi9Lec;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0046C606A31C;
	Thu, 26 Nov 2026 17:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0046C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CVJi9Lec
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6C609201909;
	Thu, 26 Nov 2026 18:31:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795714272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YecqGseBcL1cLP7lyFoMvHPfnwoS0Rz/GtlvIjCbwD8=;
	b=CVJi9LecqnAIynvoCNi4PVLz06PiH1kQLR7c0g2CxIdDcLmuWz5tScB7wKMpjXkbsxtGtr
	o9/Y26uOe5q8g+cKgw++O38yO3Q4PH8AkhtILzykhmakoaAcUdh/sykp77WpLjuFYrBcWh
	CcYsAOMnoZ+xykpzI+5V3gGcA9a9KR/xWpPr1tNmaFrU6wIRvOhOn0BuXK/YmqTyoH23l9
	RrOkOrHv8x6UUs/EfMHC1pB3+NeKtKug/ID5AaeEsKxhnDjfP3L/ut9zUb3ypTpwMyC/Z9
	CY7Qa/z02hIlzhmyeDTdMrBBD0Z0KyYhA4IdnMxIXWlV2+yOm1zOnimrxbLF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795714272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YecqGseBcL1cLP7lyFoMvHPfnwoS0Rz/GtlvIjCbwD8=;
	b=Wotd9c05rFte9SLUhCwc2p14oxzsW5Xrf1PCNq0CzaXaNKhHTtJNzVR3cfK00Cbsb0MD/T
	wZWUTY/TuOA38A03qlRtPJnIu9EOzn1wZy7rPGt4CwpOK6QxCIRTAI3G74ReXiJOaHhi74
	mLYKeKwdEzTts8X8NU2Z6lJashQW2aOJ+8lEGj13/lZEPnf3Ao5rHP3MZurkio5iaRqit8
	WS5x5GKQnbIO3DXDLOK7cXREGx5HibCZ8Ba2HmcNO2LKC0xF3Qz9zS24x9jBM6PuJTTpB0
	RIg0gJGZxwHDdmH+zjfARcQs8iWikEHPlj6wYko6fG7/s4JecrmEach33/EKVw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795714272; a=rsa-sha256;
	cv=none;
	b=DAIIYWkTa0GYOk7/j6YB0WAa6tUGay30YvNjCagutVuOA/ccgv7af6FlHJ88dravr0YUg/
	qWYmXF/8fTt2QhqZuB9CvdHngG3LT8+y/M+R+bJOzNUnLFK4zx/QJi7nge6yrF2y/J8NT3
	4AD5XYi8pZLMtzp1cZgKtb3lXPXIvTMyZ86bNXiiEjtmqMyEf8n0J0oZ2fHpZFE9IYefuX
	5eXGcpzUjgnn+CQN+Mh8LQKVCYyPGk9/WHQi39g+Reycwd17LSxxkTiV0Wo5K6bD8Xbdos
	hXV1tMhORSemiCvI7e4FZMiblNLyy8JRIY/CGQmkKC3SGZSVfq36+a7OUAe81w==
Message-ID: <e63d24261b2e544c1e295d845163b33b3ea36869.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/3] clk: renesas: r9a06g032: Add reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: khendry@reliablecontrols.com, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet	 <jbrunet+clk@baylibre.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Magnus Damm	 <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 18:31:12 +0100
In-Reply-To: <20261126-rzn1-miic-resets-v4-2-4f73af81d779@reliablecontrols.com>
References: 
	<20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
	 <20261126-rzn1-miic-resets-v4-2-4f73af81d779@reliablecontrols.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-26 at 08:11 -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>=20
> The rzn1 system controller has two resets that need to be cleared for the
> mii converter to work. They are not directly associated with any clocks
> so they need a reset controller to set them.
>=20
> They are documented in the PWRCTRL_SWITCHCTRL (0x4000C188) register as:
>=20
> Bit 3: RSTN_CLK25 - Active low Reset for Timestamp signal selection logic
> Bit 4: RSTN_ETH - Active low Reset for RGMII/RMII Converter (50 MHz).
>=20
> Add a reset controller and add resets for those bits.
>=20
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
