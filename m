Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E325B082
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135220; cv=none; b=pK4TVwnPvyt1sNSaq0ZLKPWSuwBE1WJsZnX+3Zzc9yskAb7IxbDxovz9woYkybL1iC6tYYVj6zAoCWvKiiheEb92A8mb7FqjiJ69TwMMuNPir6S8UjNVNPf0jM3IBBd7vd5YKSrXV+P2iMaOjHNaqykuY7ibMjyJiT0wjqYQKUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135220; c=relaxed/simple;
	bh=rRdkht83PecwdZYGF4/EuY654Yjjl+PVaSprnxYvdgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjLdV+oycqhkIeycQynj1ytZqv91ooLvB5l1TCyZ/ZUBfzHghN4dl9DSQfwKvgvdR58BcU+aMC5KEsBMVA364cKKndBOz76+jRZYIY0pA7kNY8CMLhphTTmb81FOL29gJXzvsE0+g+7Hadkl0Y3Mdf2acx0HZwV3x71HK6tulfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R03smCan; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R03smCan"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso3074262f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135217; x=1792740017; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRdkht83PecwdZYGF4/EuY654Yjjl+PVaSprnxYvdgs=;
        b=R03smCang4x83xzy/BOGVSX8QIqyFcS4aAHVCNy3TaKehbO7CxobX/Fz1bEdt2hJQF
         aVTkf+xNEg6IWpWXd9nKsXHbigN6LR64kdUVnmauILeBllZdC+8RwRhmrSR32MF77C9m
         KOT4qyJISzVHaeQ9yxopPDO71YfH2vBD8zcnKtYzo/NIjFZf9PoL96+tPyvvFzNuQEFJ
         xRnuzS2sFfAiHFoSm2ks3CaLSet8HWa4YAsG/ck7P/O/kdBw2P/Kc5sEOBbnLP/uwewT
         dokhPmW4HopPxeJMBCSxAj2IXOtrJ7FMo+na1+GlRnqFAHOPb6+hsRjguxvu88FxPZ3V
         IyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135217; x=1792740017;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rRdkht83PecwdZYGF4/EuY654Yjjl+PVaSprnxYvdgs=;
        b=h+nXkfzuYkuHOjVl7lUIAY1ccRfgTpolFRcmJQTMoG15VJPpOoBZAS+eWzdsi4qinR
         f7FLIb+490TDVALRrvN3tdRu5zgDZP6YTdOtOd6I0Wm3OEMFpeSWYMHu3LDS7IPhYdGo
         o+3/9RpFv8b4gGXK9juZswA4m9nOrt/7VRDq0L6doY/HrNONA7KitK5mkIaHlGNHTPmm
         mY6zoffUyg2ZMoINvZOajjyxAHl9RXE7A+924mvc7tSdPhoVHpyL6MkpvDHEkYhyKZuw
         I4As3ELbuDAf3O7JISTmMA2KELlGuQyHoxulLMnNPd3WDWaTw/Jsbi6VJIFU6T6zr9ux
         FNxA==
X-Forwarded-Encrypted: i=1; AKwUvByWTMv/zDLeJ/tJxBp/vtCPTHL063hblLNL0jXzAdKpZi69OaieDXcOA7t0iPwT83055mq8ZmB4EEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjh6cDPEWAgwP/GYOwmPw4ihLlfVT8DOQuhGIbpMXQIVYNPbqz
	QOkh1wCZ0GyRDCxlHNHLN1XU0XDPzE7XXOr0IkAMJ0pWOVVwZSa0Godb
X-Gm-Gg: AYBFou2OQkhSbP2SmTSob6Q5SAfO39wdYDp3Ct1Vr1Aa2o9kNcQycSj8mzqDQFNZv+q
	IsvflGQ9XYOhphTZBXfhZGgbsJfX3tMQs174GDMl5ETG4t7saV6DIkbpqO3+SHU127FSOXJL+e9
	MnaACiA3u9nQXe6SCI85pvGnUHhjc9h5OhiLBX39MHUcQYd9usdV+NAoNSigE9++9i94S6wMveq
	V/Wl9BNmPsxTULavcvcHeRdjB6vw8vAJdMVkSQ8uUZ/JWaQJ+6VGWG6QgYbhxNHHjCQNBBmG4Ip
	PgTsPp/wDtTv278GZ6mRusyox94SvaWnXjJu+KTxv0s++JKa7+O+K+Un/j7MpIit/HX6u/Y9De2
	ZivS+Qm/GugLbl+nP6bNQrUlsZPOKVPzGniMrDyOskQ0izA7MQsjzNXJSp+ZIMdNdwrjmADCrek
	6JRkWwlowDaYIGVwh94+b8mRaMYIlVbQcQ+Ud1mP0fJEgx9LUK9oRV9qmdcqc7X/9kPNSDaGDvW
	h1ssUTZOSOOZm+lMVny+kqw22HYCJ9BWxlN5abjBZfzrHghQlPQYhnv
X-Received: by 2002:adf:e194:0:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48ddb77d4ccmr30168211f8f.6.1792135216962;
        Fri, 16 Oct 2026 00:20:16 -0700 (PDT)
Received: from silicon.doe.home (194-118-146-41.hdsl.highway.telekom.at. [194.118.146.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d12sm3220071f8f.36.2026.10.16.00.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:20:15 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject:
 Re: [PATCH v13 04/13] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Fri, 16 Oct 2026 09:20:09 +0200
Message-ID: <D_WXy70pRh6G3mLeAQ5LsQ@gmail.com>
In-Reply-To: <179198492486.839288.18023026004912443161@kernel.org>
References:
 <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-4-70d8f673386c@gmail.com>
 <179198492486.839288.18023026004912443161@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartSBEYK6dqR3etXguuqPrywA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartSBEYK6dqR3etXguuqPrywA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Fri, 16 Oct 2026 09:20:09 +0200
Message-ID: <D_WXy70pRh6G3mLeAQ5LsQ@gmail.com>
In-Reply-To: <179198492486.839288.18023026004912443161@kernel.org>
MIME-Version: 1.0

Am Donnerstag, 15. Oktober 2026, 17:34:06 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb=20
Lee Jones:
> --- checkpatch.pl (3 issues) ---
> Line 227: WARNING: DT compatible string "zte,zx297520v3-topcrm" appears
> un-documented -- check ./Documentation/devicetree/bindings/ Line 228:
> WARNING: DT compatible string "zte,zx297520v3-matrixcrm" appears
> un-documented -- check ./Documentation/devicetree/bindings/ Line 229:
> WARNING: DT compatible string "zte,zx297520v3-lspcrm" appears un-document=
ed
> -- check ./Documentation/devicetree/bindings/
> ----------------------------------
>=20
> Is Checkpatch right?

No and yes - the bindings were the first 3 patches of my series. Since you =
are=20
cherry-picking the mfd patch only, the bindings will obviously be missing.

The bindings got merged into the clk tree and made their way into Linux-nex=
t=20
already. I guess we can either ignore checkpatch and the issue will resolve=
=20
itself when the trees are merged together or I resubmit the mfd patch when =
the=20
bindings made their way into kernel/git/lee/mfd.git . At that point I can a=
lso=20
re-add the MAINTAINERS change and it should apply without conflict.

I am still fairly new to this - is there an option or issue I missed?

--nextPartSBEYK6dqR3etXguuqPrywA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrR0CkbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoivEIP/0vSfR3/njgy0m1LUgVO
q+5cFYUtXHEkTjMCC9Q+aMIgABBs0SuqM6RR5Rl3VJe5Mv7oqMFg9y8bAu+8+fxn
wc20CEh9mqrONVRIpI9XleietOAuGLQiOEA7TMLpBJUZcGgAbmmrWR5RFIbff7AX
xTD2LumJqjHDxvFgzTpZCotBjcRdXbz9OdGDZktoolRSX7ytW0EpCMIbtMxHgjVp
kXQs03o4E6LjFU5d72FpIFR2wKLMRah37age3BllAZt/34RtVjPb/KZtARSMAOGZ
rpvXE6CjYhZ336gPYfcqEOFGcrix7X4krLw9HDCukXILHtMIcDAy/9d+42yL3gXf
yqcQ9w9o8BBNpWoLM5FttbLXu+YgkAkdd4nLCnrZDRseJ+EeBRYM38ARM09q5yie
GorF56gygRU5iua1+FzC/cPOsynDoXErJVeqf7uF5kmLjEDkW0HnWRTd4hMJ7GMI
lb61VJSbCft1qkWXgwRbkOKAfjcW8F3oTWfKJmNJV/e/rTlfgiNAxoKjtfQ+SDNG
BYcy06GCOI3ec0pSeGp6wJDr5/+/ULQr04Vm9t0CGvZXXhCy+r+jVa9gpT82iRbZ
f9RTyjHnhjnsH4PZVOyqWQvE2zvimN7AwLp9LjFZosE5vyNOUHSaopJBzLy2En7T
3XFhbOb1zyS57Sj8yBtDKIF2
=pb5+
-----END PGP SIGNATURE-----

--nextPartSBEYK6dqR3etXguuqPrywA--



