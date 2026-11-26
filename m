Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795688532;
	b=vrcWACfDF8r0nB1AehptnWUbYJYDfxMwUMlfcLb8Cudd564lSxTAcFdpT9tXox6s4xwb
	 I/dD11ZqXwuh8rUCzfw8dCy93A37yn/KprAuJBM/GnIJlCW7YZ2Xq08V7nz0cQRgfBjcp
	 /h1c/JCbS5VV0N0wiqybTzgPe9Hf5ff2ovYaN1Z8quoXaJj//EAGp9CQytuvBmiiaLWJF
	 zj1hOAlxQsc8lYW3B9TLwRitTRyk8IcMQRiIdmy1svn4ZrEPIPLvwHiE4jfq4b4obwXTA
	 9dyYVoTN9m6OYM8RttfgBttDdkytTCaGIX3H4aAkIMoPVYg6YxeihPZzXnAYRCTiXLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688532;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=whzV3Xr10iREQxjF+nRzgp54Rw6K8AwDfOKlDWbslSk=;
	b=u5iJsELHleZZlVaeMYEv76y412VPSlrgzUjijS9FI34HNCvNFD/WxZjuXVpoAuVpmZ/W
	 C0Y8d90vAFw2CKVw4GFN+DOXpxbmYkHJWMUnT4ugef9wKEV8JZs8KmLE3N9tluspdhNkJ
	 eQUA40bj0ODNAarCr0N7vNrk8Q59mmyEAL3nXa6SdX5EVZT4R6bbhCVo7SlcSNuZtzgOx
	 /USsLHiYwhGW7FhM+8+K3TsmSR09ZlROc36B2HPL13pIPPfMo0pYUbaZoKF3Iz0lDUURj
	 fzFExUUoDf6TLseYEgFrtKupPRwKC03Cehqt0jr+Itd4tBnZsYFZQ79Fr8G0xsxBjwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IPIjPh+E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D2A606A31C;
	Thu, 26 Nov 2026 10:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56D2A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IPIjPh+E
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5DF22205A49;
	Thu, 26 Nov 2026 11:22:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795688529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whzV3Xr10iREQxjF+nRzgp54Rw6K8AwDfOKlDWbslSk=;
	b=IPIjPh+E5QAykrdorrhsb2APf6KCt7VHuVqfLuloMGskgjCEyIdp2/kwQkPvxvhRcB3uRl
	ELLP01cz7PMRHRU6J5P9UiwecoE2zWhn8/J3WKlGSlpwOb93mZXybI0o0YYZfEPiKWjEHw
	x41PaKp1eYPOC0Tsl7OJRwd9Ssr0r+pAerDpZAEXUbf5MOHdtWuXt7GSVylAbhHBSmwmw+
	2rNgQIZ8PgezBXA1VT/TLvFxBmuJ4NV7zCGO+e8MJf9qFw6ay68cFFi4I7We7In5x3GVk5
	2gpqEe9ZePnporVMm/CS/gDDkI4IbGTOl0c1iWciJhz1bwCuCfP0+qu0dcGGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795688529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whzV3Xr10iREQxjF+nRzgp54Rw6K8AwDfOKlDWbslSk=;
	b=URHcQvaiV09CC/7JCIPf4zATOGKI3rg2vpKqCEZXH1fcyvu3OcGzndFCNLgZq6cZmp+rf7
	a8QR0J4IL8MmKE22HvC4ui95Gn8lTRYiYZhBOTw0KJo8ZaOZiG/p9jcqzOf+mRvPoQWcT5
	lCd7xiYsDvmnq1XtceNlnNf/Gt1mkDyUwsdHN1p7mtjo+hmwt1bEWhFZHxfLUx2Zogaoc2
	+c3Jm0xGal/x4EZc3gOLTgR3MnH+loFRAH4NehsgFkSZM2rtgC76tK3KNxnI3CJBjoRYZ1
	AAzNRvjhKmVARDpDPoo3+RfTYsuiQjTycT/YWxkuahyDp79tj8R+kDeejWOaEA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795688529; a=rsa-sha256;
	cv=none;
	b=avabpZMBlvb9186UcfxPj2XDqhpCoaRUmzlvy0KwnEW0w3f9JXjSN0nLBL8oi7H11LCDn8
	52jZoKDFJB4nctWtZ/YDJBGlbGQJmshrh9U4k2dv19V1arO8e4e/rch0V8jxtxSDCKR7t8
	jsRw+qrAMIE7YXlAZnsN+5DIfp6bZ+ICvcc6qVGTmJCPDmgKnEO3TiXiJJsBA9q1o01z8d
	9X2xstRwgxT7PfHA6qn070f0FKmg4l3Ht96TOs1QXOffECHEfNfBiI/QQ5Wojbxxp+LQGA
	IQsDXe7Gha3bH9DnWv0BzvPqDDPVeTXRogxmjZfvrTidT2emPrgxWWIE/RBVAQ==
Message-ID: <0385b52e20c0c13a7bd778249fc4e6169ede6937.camel@pengutronix.de>
Subject: Re: [PATCH v6 6/6] reset: Add Siflower SF19A2890 peripheral reset
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joseph@telaak.dev, Stephen Boyd <sboyd@kernel.org>, Brian Masney	
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Chuanhong Guo <gch981213@gmail.com>, Yao Zi
 <me@ziyao.cc>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@baylibre.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 11:22:09 +0100
In-Reply-To: <20261125-sf19a2890-sysm-v6-6-181875c10682@telaak.dev>
References: <20261125-sf19a2890-sysm-v6-0-181875c10682@telaak.dev>
	 <20261125-sf19a2890-sysm-v6-6-181875c10682@telaak.dev>
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

On Mi, 2026-11-25 at 15:24 -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
>=20
> Add a driver for the resets of the Siflower SF19A2890 peripheral clock
> and reset managers. It binds to the auxiliary device that their clock
> driver creates and uses the registers that driver has mapped. Where an
> IP has a reset line for each of its clock domains, as the PL011 UARTs
> and the PL022 SPI controller do, one reset drives all of them, since
> they have to be asserted together.
>=20
> Based on the reset part of the driver in Chuanhong Guo's SF19A2890
> branch.
>=20
> Link: https://github.com/981213/linux/commit/37c81bebaf54
> Co-developed-by: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
