Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538670;
	b=Qr5w46TRgqFFem7e1S7VE98uDk/2/Az2Ep1RuTnKQcomQ/FrLkv5LOCE57Xzl/pv79i0
	 X3Zx5jRelSmw9Oj4ZE2+AyK/Wvl4yYjgxmz+pgt7GsJPzUpU7E918r5mYaKGqzdLMLar5
	 kfaWQotc0ts4a7AqTOHQu659QYOmD2EdQEspMfm90DFjv9GvkD0wkkWhT3MPtlvt5KNMO
	 thfqsyhZss7voFjwoFqBouFVBP+SUHHHaEb3MClESBm6dnA8ghHevV4zdFqWBvjWZpaBm
	 uDEb4U4EeYkdDSgxPuWRsqjtzlwjfDCRgZYDAtdMl/1/spPBlqtWtmqfzgtU1nsFefg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538670;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=53M/jNU7gvao9zbUz+MPtUuoMg3rbooohKcY2RF1rFE=;
	b=BzMtXHjUIfvRikNKEDzvFvyh1WZEhACEl8YZvaUW3xvGp3c6uMo+6JHlGA9bSaTNk6DZ
	 6HHoKR1BQPCjBxd3njX3RsgW0ACEUHCq5ip+EcmCSbEvezpEfL/+SUh5Cu1eUck8zZuAp
	 UwZDS843K/v280leW2iAXpUCiRzd5FY2SNk3xRnhVW96FVicjl7ws6d0f3larbRR2mRus
	 lc1pEb+WsnKi5MJv/1Mmw0PFW3X6Ul3DCbl9v7nM035X3691Sy37IWy/Yunk2R0ye1R7u
	 wWAxT9/qbXvJeuCMxK0BwEX+IokJAydaPkyPY/MAWlmk4S4OkC3Asr7jEv/l98JIvUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lLrpdG3Y;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0BF606A327;
	Tue, 24 Nov 2026 16:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0BF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lLrpdG3Y
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E9A7E4E41746;
	Tue, 24 Nov 2026 16:44:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA401601E1;
	Tue, 24 Nov 2026 16:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5BD011E69A74;
	Tue, 24 Nov 2026 17:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795538666; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=53M/jNU7gvao9zbUz+MPtUuoMg3rbooohKcY2RF1rFE=;
	b=lLrpdG3YSYonKsqjZ0nA4v/luC/lUV71hkWM0DMSi1Ut0YO3tpa3cvoqynxNCaoMzUu59p
	XibZaxK6u94QFBrZOu94Dvi2gNXxAZ4gTtAVdvriNTG/55I7Pqy1NrDfxCX+WIkOSzmX6f
	ScdRBDRkFB7dYJU4SutHy0rRYSABMxX8JeyMNWwId/jrOufL/rdbuszoslllhDDBeFxah0
	ZbLayFiNzZNjTcJKomgKeB4uwH+D559Jt4Goj5tjp6oHx0Y3MClE/5WbPg02Q5FyuPpb0N
	lL8Q+pAeGEjfDpE3g7RH0OhB3qY+KGGoRzjTfr4Mv136UL3b1tigVv4EOix67Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v12 02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as
 mux parents
In-Reply-To: <179519171774.3795820.3637822831411003847.b4-review@b4> (Jerome
	Brunet's message of "Fri, 20 Nov 2026 17:21:57 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
	<20261118-perso-ma35d1-upstream-clk-v12-2-bee2c8dad4e1@bootlin.com>
	<179519171774.3795820.3637822831411003847.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 17:44:16 +0100
Message-ID: <87y0aiqivz.fsf@bootlin.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Jerome,

>>  static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *na=
me,
>>  				     void __iomem *reg, u8 shift, u8 width,
>> -				     const struct clk_parent_data *pdata,
>> -				     int num_pdata)
>> +				     struct clk_hw **hws,
>> +				     const int *parent_idx, int num_parents)
>>  {
>> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
>> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
>> -					       width, 0, &ma35d1_lock);
>> +	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] =3D {};
>
>
> It works but a little check to make sure we do not overflow the table here
> would be nice.

That's maybe a bit more future-proof so I'll add it, but at the moment
I believe this is almost dead code since every caller passes a static
ARRAY_SIZE(). But not a blocker for me, will be added to v13.

Thanks,
Miqu=C3=A8l
