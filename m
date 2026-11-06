Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793967116;
	b=CSKwNT1s7kombexokNFkgB9Wp/QKc9Nvh+d6WiF50qJAoF/0930ouhysgAiac0KnAp1j
	 o2XoJwhQ4dmTYTn2YISHnzXITy+F3ov5pCbU1Ed9CVXqxpWTU4DZmodJtcDU60wxAngR3
	 N2fIOIDeBJxtx3sQtq9r2khwXjOvg8VlV1ho2R/W/Bfmg4tOX8kfCcIppvTdxAs68O3l5
	 DU0vX13AaN8pWIpdmx3xmVCEIv8lX5qG5nDZSSgMHlCQRSA8z98y/iFoYHBkY0RDqzLZU
	 ZEf14tlKR1GqytIKi/njLXVeuRfaIZoqBzZuChLm8jMRHjRXqyD3nxbR0D4ihuP9bLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967116;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=iq60MpWWr1FHZNJdGeNZTv+roUBF0vhdran7YFHQ1so=;
	b=xMOOL0/S+bJPEOfO/XDGBVeDIDHba6XqD65YLun8zfiK1GFD5MlSSw+3mrmcG0ZOFwGC
	 vBDyXj3FfSEQhpVys9gFiKC3M8Fq8CBn1zmkHIgWNLU5GZ2u0kQX4ZboKbdbphXcrubCL
	 dNOjrvgVgPZI0IpH1f27CZ1EgEeg3BKz6xuMUUSfVd+z/agfwJdsc2tPuNfAig0n8ODCG
	 M0VEv43NDb+lvccpf+LBmlZJt49EL6cm+4PhgiUEuZAnoVaJQ16LC4oS1cQH5veBYfsjG
	 5TcsOimGOmXOIne0KlDlWOJDIY1pQITvp4gffTYs5G71mn8++h0Yw3Jj6y+xHFUa0oA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=gAMW9fXr;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=QNnH08J2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF34C606D824;
	Fri,  6 Nov 2026 12:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF34C606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=gAMW9fXr;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=QNnH08J2
ARC-Seal: i=1; a=rsa-sha256; t=1793967069; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aKMLhHyAjDV2B0Kd5fN7uWTUYmUIqv7oUH20rrwDJWK4yWpydOGsDcNtTjavVRtn7Z
    03zeLW+aoU5rEt5pGYnIMBtQnavgYvocg98sYDLA0oy5ZL5GFxlmJCpozpcgvifMb3nY
    QJccqrrb3vSWJ9XtuB9pYSaBfR2pzvB40dmNwndtREGllP+BS7e/G56hqf8IYJbq7Vpk
    YsmVkl86/is2bJ0V7V3QOZxj8kGFIRbklr7nF4CrV5N/6lLZV+x5I2YLnx5LOK6VEmRM
    sI6TfAXjvkT4YD8D5e/J019M4+2q0bk9zrTMOcmSSFu/xL4awsva11FQ9IQidE7/dZEs
    QqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793967069;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=iq60MpWWr1FHZNJdGeNZTv+roUBF0vhdran7YFHQ1so=;
    b=MVJkQOBm4cfv+5I02uhULJCU+MBhU636GaWl0lNOawnAK2UD6oO5r1+nokbLVFNPhw
    DYGFq/IKXqOWxJjBhD9D4xH5kILd4Y+/aQU0nDNW180gdo/iwCzyuDe+2bF1GoR/Ia80
    5MXz0FPn/tS681kJeC/rcVTCHQk0rmDIwntvrbGntOJEcr01iWfguSxRk3k7W81UOKEp
    2wVh1Ptk7n9Jh6nYAA0Xo6gdh7IVS7aUYHDb5mp0JBDMtclCk77/wq04TlL6cZ6rWWKo
    DkdlRD+kmXDGvpPEdV//gaQoxu66TPP8/gvJxaFbgzkVVm4RdNdsH/Ocxu1mi4a+qzW/
    PU6w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793967069;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=iq60MpWWr1FHZNJdGeNZTv+roUBF0vhdran7YFHQ1so=;
    b=gAMW9fXrUqZXT4FEQgwE//sTU0b9ZDAoCznBXEg5W9zudQT89Kv/KDTyJv8jIfwU9o
    Fq2xzWb034iJAUaceQdmsiN3qpwN3VUjxhW8OyFmFpNXr6IQsDruqlFxjLGj6VGw1fXh
    2KaWpOZNd1DfIkARye2XnaOJIXg6nQG9xX9JfH5KVl8avHhCnnuhC/LjHPS6muhfDGcq
    8AUT0MlXMB0YUhseE8pcGsAwQL1Kq51F8psGjroeljB0gZJ9OeO9uhvXmHP7njPBIKj2
    R1WzTQILQVl6fywDy9Rp3Cq+Raq4VC9wuajSsO85AZazk/VKM0Ql5m8jKy1bj2gdpMHb
    6BSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793967069;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=iq60MpWWr1FHZNJdGeNZTv+roUBF0vhdran7YFHQ1so=;
    b=QNnH08J2KaocksIeZkmonMhg/dsaysJfwokZuc2yQn6canlLi1NBwz2Yvf22XBD4ZZ
    IWr0clWIUrl9g4Cn4dBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrVjZoMy8iN4frnsPsBQ4l+mfK4O7kvgww6TmAq"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22A6CB7nJj
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 6 Nov 2026 13:11:07 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH 2/3] MIPS: Ingenic: Add JZ4780 SMP support to the generic
 platform
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <55de1cf30758cdc46c38f87520e6570d6e851a9b.camel@crapouillou.net>
Date: Fri, 6 Nov 2026 13:10:36 +0100
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 linux-mips@vger.kernel.org,
 =?utf-8?B?IuWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIg==?= <zhouyanjie@wanyeetech.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA66E3B9-DDEA-4D1D-86CB-1ACDDA1B9434@goldelico.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
 <20261105203243.2292647-3-f.fainelli@gmail.com>
 <55de1cf30758cdc46c38f87520e6570d6e851a9b.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)



> Am 06.11.2026 um 12:07 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Zhou's v8 supported the 4 mailboxes, this feels like a regression.
>=20
> I understand that we can't really test a quad-core system (unless =
Nikolaus can?)
> so I won't object, but that might need to change in the future.

Well, I am not aware that a quad core Xburst processor exists... I can
try to ask Lumissil staff next week on the Electronica Trade Fair.

BR,
Nikolaus=
