Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A86288C2C
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427426; cv=none; b=hnvS/qTgI20bx207lBBCKcg1y7swUN+5/uKzWFHUVBrQMHNdyAoLhLeYWxFW4nZHN0VUNvCe8jmQgQQIZW5rA8LwHIJa2idsuoGgjLUZUtPg+I31yK9xaicfgvKwqiOLObzhPaiSvBCrNp0LHFWtqrqPljm56y4i1Rx1mfpzmhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427426; c=relaxed/simple;
	bh=TD0YhLzB+CGxi4OgDLT1PJN7VV4RBY73o0ETtm/DdCw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LQ5P5eCd4BMU5etHlNgOHaNH/vYgqktuvUvcjkmF5yXSiULFBh3wuEw0FJiXnZB1Vh+7SLyCRD9sQ4qTnhyD5an+XrsXA/LWwx+RUYn4eK2PhL+B57+XG/5vtRDpYVmTZeCVARa95T58xZ3/qyEP0qNRTYP/6JFlYmOMGFL9jgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvMhQGlg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvMhQGlg"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45eee266c6cso4276422f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780427424; x=1781032224; darn=vger.kernel.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S0zzvbfZAvOScRpX547nrGje+Bx4UMfhVoNGg/gjqDE=;
        b=QvMhQGlgDsGakwzPrbgzaAP+lX+t/h7M0Eo53ZfMNMyTF0ArPvj/yoZk1IqRVs9Z25
         JTNGIdvcxh9ywves9e8+mXrQJqlCp+Ewss33mI6ZVjfIgbt0B5b1NgzKK8RooWntBVwL
         nkFtvyXjomzoT4HUWu/b7hfnt/t1zoleQyi9CbJBNfNAW1r5FJE3BjUUOVrnkEWRjeAM
         xU3PyoghOo+IQf7v5CxCbzCMb5mZ5u3icZOjGFr5p8MUsQ3Fx38odbmNpZBTgz4MK4W3
         BP7RmIWHoNBrfGamNajcAmEYUxrtPf4d3ChGLzkv3FZAEKqEltOewq7fMgpHjbu2AGaR
         d9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780427424; x=1781032224;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0zzvbfZAvOScRpX547nrGje+Bx4UMfhVoNGg/gjqDE=;
        b=FjtOxTNIuRQCjC4Yj0RspkvTFe8S44t8pwoAuW9uYkGHbVYM3CutT6ngqdc+8vCTpC
         W1xT2WBw/B1SXyqQs2wj/QwPRS3yOY/zcrWLqDHosgVJTz1pnxvQU4GCs7uBZZGEeCxz
         UhAUmqGxiOgIG4+Q/B+/yFG/aoot7oy2cVRBZsJlMDj02Po3eKwCMi5esKMmLIjJaRLR
         KHuabm2y1Z/IYavOaoV/HvR0fdCrb1oKHN4Jjdskv4aeNKTMgVIB1mVBrgsIfkWT4BzR
         +75kPlNJ/Q6Gc/K/IAtBtEed1BQ07vBP4LzwNKAl/BusNX0efY66n2iZfcLtsaQxGHaT
         wZEw==
X-Forwarded-Encrypted: i=1; AFNElJ+90ndblzwRg8MMdJKid4ZFqaRzXI7yJhZe5Ogk4PUlhfDTPAOUVfTD0SBtHg30iSUOGbQ3zIlU3CI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0qw2QAqXxwIG4L8u9PK5hwmvwprtaJlRVUziIHDV3G7hHO26v
	ZJ+NgTHExtErFD1jA6qe06fpkp30YrkMdQZsBsF0ikYTkkvkzQ5sTayV
X-Gm-Gg: Acq92OHPUx+/odpNqaQUOrCV9ubCdreB5Is/9hqOdi82JdWTaoLNbskQ/iagq7LgRkI
	aoBiNhh/szl7EMLhJmgRljQv1gNqe+eQmJX+CjlTufL4pUPVvWfElnA3XASfyZ17xLO7XxZZrLX
	ztQvyu4pZjzPaJg0W/Jo65/+03L5fkQI3+Q5AH7nNunwS7/qJbFkwqoIDhFkpcHDn0KcA8ZYZbH
	uL35rG4ydti1qNmZN8a8AcXMSYqPBqBrk4IaowqrsKVrJq3v3y9pHfXspRhRFBJISDFxDtG/89e
	x6a0ZK4tN4yZJi9Lu6/y+6VVgKD3hTiCR5gcEG6/ONof/orrBCfeSwxad6WxIKBcrzMH+6HxJEw
	H0gH7aoQarMab5/xSfkWaY2sefMdwwNkyW0ikmw8iQ1Ss7hZYtXx5dmimCnUH5z+odVqxleqOi1
	qoGFtYLP2poDFgv89vj6PMX1tCOl1ONpDt6eDE+pf+EDWXNH9ATAdZ32DWKlQ=
X-Received: by 2002:a05:600c:46ce:b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-490b5edcbe3mr1787645e9.25.1780427423575;
        Tue, 02 Jun 2026 12:10:23 -0700 (PDT)
Received: from smtpclient.apple ([197.250.226.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35f2e6sm1277361f8f.32.2026.06.02.12.10.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2026 12:10:22 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E0943733-4F8A-4BC2-B622-410231B14464";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH RFC v3 1/5] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings.
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260529-multiply-engraved-aab583ea4519@spud>
Date: Tue, 2 Jun 2026 22:09:57 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <B8509E97-D235-4373-B29F-B7C79B96FB93@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
 <20260529-multiply-engraved-aab583ea4519@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)


--Apple-Mail=_E0943733-4F8A-4BC2-B622-410231B14464
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello Conor,

Thanks for the review!

> Am 29.05.2026 um 19:48 schrieb Conor Dooley <conor@kernel.org>:
>=20
> These are not permitted in bindings, please remove them.
> Half the time they end up changing because people find other clocks, =
and
> they never actually get used in a dts. If you need the definitions, =
add
> them to the driver.

I changed the drivers to derive the number of clocks from the clock =
tables in the driver, as seen e.g. in mediatek clocks.

Before I resend with your suggestions and more Sashiko findings (that =
thing is good!): Do you have any advice on the questions I raised in my =
cover letter?

Cheers,
Stefan


--Apple-Mail=_E0943733-4F8A-4BC2-B622-410231B14464
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmofKoUACgkQPRO8yFRP
GiJLRQ/8DWvBJEkB0pj1TwBA6vRKN/gVM52XaK0fq+1i0LHKwHDmbsuLsZ/e80kV
MboPf7EdrxD4yx9eQcgVuANC2Vc8IhEIeFmFyxGqta2IXDf+I8r77pSX1/a3vRLb
SA8wMnAh32+w6uvB4VWb11tvunPhxMEcYcEaNEbQHDAf3kQGOyZM+Panu+OwpY0i
0TL/2fERKEaj0zJFYQ0Nd7E7tZ+7Gw+AoUgWz9sN5aFEBVzL1hYNEN3XG4Oae5Z8
sq+3U6i8SS5WPXPYBimzY9Adku1/wLmM/iBUf3+Lw/QuIiPk+KNhLp1v7ZvUzTDL
mHob0PZcdnszCzmrE8Adv7TdBkiW1E38ZWt1/znTDp2uv1WW2nbiAjvcrAOhB3D5
IT4l3o6q4trEWePt0IzzLST9Dx+KPsThJDVdYe1bSCQWn/HM7re8yunOp1WOhy/x
hZncx+6x+eVp1mV8fxl2ULbKVfL6oezFKz9hqLurmo2NHsKq39lqK3Q4ARdc0cLn
lS/Nc/bTYANuxQ2XRYZ7mIlpJ1jqBL5Hnmj4K77ziPhHJK/SnCJvTIXrn37jTB2W
0ex8RhmtoVpaO2eoNsyzuk+Ki+fqVI/rEOjI61l3U3t02mV+lcH0jhJhcxxYcbhk
NWLTHZHVslsuAJGxus5syoDzlF+fSJXTY7VWrDe2gWo4iFY+A7c=
=hxh9
-----END PGP SIGNATURE-----

--Apple-Mail=_E0943733-4F8A-4BC2-B622-410231B14464--
