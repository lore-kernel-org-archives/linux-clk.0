Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998400;
	b=rPx56zfZjMtlZCf29Vi7CY0MylsCMn+4l09eHeNoVumaQHXe62gM/ZuNxET+x1swLwEI
	 bmJ8TJsVw4EiDXQwmvs6wFGKR/MvyiaCk0Ykb9ZlxZzv09QgbNw3KvNRjsFldShwBgbIW
	 lV2hROuX3zOgHO83AuYt90EtBtagytLL/Qn7IHbvZLZPMu6/YunORik5poafRd3FcrIcF
	 e/tCUqW/hcr/g0HJvSjaB3LKpRItDRzXhtvxJPgqnbF4B0w3YaJqQ6aFiUJC+ZpaUJ3xt
	 aaftcT+Om4hHiyr0X7wUCaRWPEyt2Y/7KCJzoR3A9UQBHJVLo5wdhT3znYiuHjesd3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998400;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=Is/Xjej6ADaYpv7YxcowFZl8o9RxTiehNx4Z4i/N32g=;
	b=Vej+oZyILBWxQQAYqAP1uXwnfEJH1iAjnNqVPaS28ezGMJbawqhEha1frGhyDYfnIW3l
	 bdLubX4zhAkiHkbfLn9sNOowxaEB8kEWYX8XN75eP7ZGJLTKicmb+uBpbhiVJivtdZT9i
	 Ah0pfuUFBL1Rx6f26ReZaHZavGKwNgarzwRBjmjxQMNeBnzcrtub0imsPVdPy7QIQbiz3
	 aAa30ZB8rkldeMPwnhaO4F/UJmoAR/u3/kjKd3JSRRot8FJt8ryIAac6yLBvdFXG9hxhz
	 s3UVGZRfyXmR9rdXFesOaso2wSFPUkCIUMIF0nN1Hv/4J5ZTajFAlCnRJTU+0HpNCWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="E/GnAvcA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F45606A32A;
	Wed, 18 Nov 2026 10:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F45606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E/GnAvcA
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DD95A200878;
	Wed, 18 Nov 2026 11:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794998397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Is/Xjej6ADaYpv7YxcowFZl8o9RxTiehNx4Z4i/N32g=;
	b=E/GnAvcAB7wIoGgCFhZ6ArRkq2vpgI0TEixnQG/sPauxDqX5ginvHdyQn3/Z6HlchzVgUj
	xTctZAYyMhJoHnOg9ToFVIGkVOUKOATzDOv8ip0y6sbxRTrlxmZifbRrGyX8AfTR5BpuIR
	Y/L92mY9WjP1O+JP7HD1POg1An6qPTOE6UO7o7Qc3O9mHUrO1sCWJNwplxuNVrtu6jweEO
	qM68bYilGIK+HpH8Lxh5dt23HgUZb6d9QvsVuE/nLd6VCWsWog3v92hkC5YTGbL5xwAcXp
	A/rVOT7nuV9TZAshsRbhWYjNXu0rRdehqbvoOURWgaFV6qYxuUQSODEIgxVAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794998397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Is/Xjej6ADaYpv7YxcowFZl8o9RxTiehNx4Z4i/N32g=;
	b=G7DOJ0d78CCHrJaRYwLbO83fU8GXwXgL9SO2TxzpFbhQwb4ZeyADi5TbKmvf+ElQhbE1wv
	//6xy79MAE4XNyDa2ftEH+lYCa7uqoI2cvpsgz5lTnJdgRtexIMxRx3+onnpAoLsjWnoeb
	/CJQKRr+fsVc7SET+mk7V7ah2XgJh7zOUhXVguHiZAck6kc5NK823sJTzdEzIOQ3dYWtG/
	kqsgi+5z4KO+tQGjVyoBlSIQJwVtGuptLST+3zdhmmB5JSBnPh/ZDtbO0mjqlVpF8yi7eU
	+iqnbn6Ihrzb9UEbEL3+XzNK5qPkfB6gPXhgttAZhfwReRFeGcSwaz7mEgzQig==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794998397; a=rsa-sha256;
	cv=none;
	b=GzE+QoI/KqlGQ4VhyjAx71km+eSWXKnFhULQcrl+x8amwMnULwo17haGckk0Lk0J9fqdol
	JNVPPZ7s+GiBN2680blVqgOUKf0in6lXSFr0KjHNRnkGMLFzywppfR1bgQIdK/2eYpX5sO
	BF1jGQ3PfAizafEdp1EdGdoEVPdPF97bPqyOYrD/KaFCQ2IB/y9Fqg8/enAO9C9W2km14r
	ogonOVhU7l6/O1WTUzVVeuc1jfrj5Aki+5gsgstM4MpKrDqZqADcSELjtdn4iFH6TtspaF
	9F2hRaoqpSTIqCaOvNGtjv3r07wcci19Kq1RYIC+37Qjh/+L7agLwbiD4RGLuw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <5f38e679926affa46ee96bf431510dd0a0ddf36c.camel@pengutronix.de>
Subject: Re: [PATCH v2 6/6] reset: starfive: Add StarFive JHB100 System-0
 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney	
 <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Hal Feng
 <hal.feng@starfivetech.com>
Date: Wed, 18 Nov 2026 11:39:57 +0100
In-Reply-To: <20261118100523.11395-7-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
	 <20261118100523.11395-7-changhuang.liang@starfivetech.com>
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

On Mi, 2026-11-18 at 02:05 -0800, Changhuang Liang wrote:
> Add the auxiliary reset driver for the StarFive JHB100 SoC. It binds to
> the auxiliary devices registered by the JHB100 clock generator drivers
> and uses the register base handed over as platform data.
>=20
> Start with the System-0 clock and reset generator (SYS0CRG). Its reset
> IDs do not map one-to-one to the hardware reset bits, so the controller
> is registered with a reset ID map.
>=20
> The other JHB100 reset controllers are added by follow-up patches, each
> right after the clock driver of the same CRG.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
