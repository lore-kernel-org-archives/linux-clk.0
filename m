Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793362078;
	b=QD3ffsr0xUdd46bZdw/+5B7MaQUXXC9qJ0rteHtcLB36FFXQNfs5MSyNkQ/SK8jMOUZx
	 nkhAqwYs+r2ETmjpBodmWEvTZCDS359KUQJ/JGHR9Alrv8xMMY+wIxdwz1wyqyQqZKNDa
	 lO4B3mtFFJD8Yj3PMp6yuubQLb/cqdZ9b4HFVh6t+OxM2Obpz0S6hGWhsean7SdnmAgi/
	 6uKAH5RYiRY8NKeUzHcWTINRNNk/g74EcgYxmmd9Srij1oTMO1tVVyUw1HaAQFn7coc23
	 FJcD5BNjJLrHzbwRvkR6fJRxDFQ8VGsh2ZxdPQYJQpVHM5RvZKvs5F/rcavWI7OFnQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362078;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=x1S44Gd3bkRw1trvloAtMhdCb8IDY/HgNqZBXiQtrcg=;
	b=SSSEL+gbLxgNotkbpCeoEoq0No7oZkZ+FIexRX8xGmvqS0eBTWyN4ntQPYhc8q+rF5AC
	 s5r2og3idq0nr9MKVBmTGb7wpW1WtSyo+t5U1wBsXI2R5OTn5QQ6URCA/XoUw77s32mG0
	 rDt8znh+Wsd4fQ36YjGGozi21xqcYcoXec4hLBiRXq13dRkUkUiK/9VohW3rNf31qUzOJ
	 2kmJ+BCcOn28LD3aGn/JCnrb0Gc8WyWTHASsYKUkgFjvrwaTW4o/QVZCJaPEY5HWWaHZH
	 Iz/YsdL1VUnvVzIvygCbb8IvvCVKD6HPK/ppzbTf69/ebZ5tCaqRZXW/rAUk3CwV3qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=PpJTGwco;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=v6qgZt86;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.22
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44BD606A31C;
	Fri, 30 Oct 2026 12:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=PpJTGwco;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=v6qgZt86
ARC-Seal: i=1; a=rsa-sha256; t=1793362035; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kKTd6wCEsaht8DbjluO95Vu6WSDHJ6o5troCPVmvsYJq8FSY0Optbt+eu0arUPBPRV
    2iqdhH9BRwBc5M507SxDoP0e9qu91YdkDBEY3NFhSxD1yaXWH3L9dV4OMiJ5i0TrJy1k
    wVtOD8G4L6Smt76F7ZfowAl9L34eN4AtuzJmsLFt/33z3kcfjgds4K3OPJWbBiuf3ALo
    fUSawWjqsHx9KiiY4C+op7BRh99hkIDicwthyEV2XE+EOUJFCvoEdbBddkCB7/0p/7xi
    u20Io1Px+tNJziR/m1qi0tL+qn0na4K1owoB7erXsCUV8I9Ec90umb9xEAjG0WXkUlLj
    Edpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793362035;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=x1S44Gd3bkRw1trvloAtMhdCb8IDY/HgNqZBXiQtrcg=;
    b=Bf4DjswHC0fUbXiR0xn4retlmRuehiE/ZLQPywtkBVVCwYeH0Wb8hH9hg+X+0TFQMH
    Wst/QcjHK9CPFj/plrziiWmibyjQlGupMlWXWZjQmSTss/zAd+dQVZ7xrpEDYL+z11jH
    JgW9EdYGEq55n7fc9cJ3i+dBE43lUJau6W0gV0UnxC5FMQ0e3OiCxZN88PtUmqr1G++3
    FmgRVao9UVc1obHrrXUe4nGyUVlAN/s3xj5nHprIt1LUxP8q7360xZA618qJ21OdQo0r
    P7V6XspKR6PJ314aNxTOGFJ1GF+zH3YYQ6hg1KjQo7daeyBjwC1GcRRLKfjeClxl2pVa
    Wveg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793362035;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=x1S44Gd3bkRw1trvloAtMhdCb8IDY/HgNqZBXiQtrcg=;
    b=PpJTGwcolYfx2nhhfO/kzOu/NjUgT2Uz/zFooNukjIdg5T/4/RXKJPbhMdaD7kp1XJ
    KJX7Os6Cjf9urwpdkZzjcN5q9a6nMmtXkvuBf1jajfWdEo5lh1xHn8p/fsJykW8Xst3e
    WbnH+sw7sl74PnZTsyQY9zKV5V127MaHopb053N6wsvyw8zV6/0/qL41hs/sZ6Zr9suZ
    kfFlrFpnCjxihocqloiSm2O600bNbOLdJTIJEgqTNECr6GwmQLuCmUixqgIljRSaVgTf
    881qa0Sahi5l6gc+OmO9vN/m4uCu2OFWddCBfZaZpOpKtvqOLWHkyHvQ39KGTe1RDRWK
    I/fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793362034;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=x1S44Gd3bkRw1trvloAtMhdCb8IDY/HgNqZBXiQtrcg=;
    b=v6qgZt8616eIV00fEc7N64eRxtN+OyU6Jk+wf2PQma88enlaZ6g9HZg57IXgf11VmD
    4Dq6BBhfAvvsrJDkJKCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2poKmsiNhq7KtjfW47fObhZWSYR4XVi/U0fw"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229UC7EKvi
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 30 Oct 2026 13:07:14 +0100 (CET)
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
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add Ingenic X1600 CGU bindings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261030-zippy-crocodile-of-enhancement-9fb0f0@quoll>
Date: Fri, 30 Oct 2026 13:06:43 +0100
Cc: Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org,
 kernel@pyra-handheld.com,
 Paul Boddie <paul@boddie.org.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FE4330E9-6C27-478A-9097-3588D9DB9897@goldelico.com>
References: <cover.1792955907.git.hns@goldelico.com>
 <13abd95aaab56ce5c9dc565db7f0198162b0c166.1792955907.git.hns@goldelico.com>
 <20261030-zippy-crocodile-of-enhancement-9fb0f0@quoll>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Krzysztof,


> Am 30.10.2026 um 12:24 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
> On Sun, Oct 25, 2026 at 08:18:24PM +0100, H. Nikolaus Schaller wrote:
>> Add the device tree bindings and the clock ID definitions for the
>> Clock Generation Unit (CGU) of the Ingenic X1600 SoC.
>>=20
>> The clock layout features specific I2S handling. To properly support
>> the I2S controllers on the X1600 without relying on complex compound
>> dividers that are not yet natively supported by the drivers, split
>> the structures to explicitly describe the additional I2S divider
>> fields. This design accounts for the current driver limitations
>> regarding division encoding while matching the hardware's internal
>> gating architecture.
>>=20
>> Furthermore, introduce dedicated I2S0 RX and TX clock definitions to
>> allow independent and precise routing for I2S stream usage.
>>=20
>> Co-developed-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Co-developed-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>=20
> One more nit:
>=20
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> =
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/=
bindings/submitting-patches.rst#L23
>=20
thanks for both suggestions!

A V2 is in preparation covering the previous and this comment
and other aspects as well.

BR nd thanks,
Nikolaus

