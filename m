Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0150A7F7EB
	for <linux-clk@vger.kernel.org>; Wed,  7 Feb 2024 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707319735; cv=none; b=szmxhXivyRdyTiJGqNyC7jVNESdaRgYuEO8n93Q5JwiwJ4zWJw2au6gNQiGcn3oOvt+5onx8mV2PkAfwZ+gBCGS0h7G9oORPdFRZU3HZs+ed6bhPmolcR8E1iy6yP8d9SdKv7sEV5VoPjxlkfBuXNPhrrc3qwoa0QQSQcWg9SYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707319735; c=relaxed/simple;
	bh=4aVJBp/wLIvdDCkM39dviVJaPHN8SVlFT6G1Ob7QeV8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oOH4UCk5RoD94JtkslY0u0Ll0hD2ECWyO9Hmt3McYU78KKZWnrcqxpgiG9Lm+lv20v1qEc7N4KYJfe9DIuUk1gCMcxFtVFiYeUxUV+qaEWTzAwcwyIX8hBWsuhMwJY0H/sBeHyVcBBvwVatXl0VIwVxVZxr2zZdfz5uID1umQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYuyXxnU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYuyXxnU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b13332ca7so483701f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Feb 2024 07:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707319732; x=1707924532; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4aVJBp/wLIvdDCkM39dviVJaPHN8SVlFT6G1Ob7QeV8=;
        b=KYuyXxnUGJBw7RUkRTEKXcNYVegcYXvICKOiymcGBctRlL0fXrnI+Zz77VmZWBU5rK
         YDhZwDkkSKdVS/bLAT2GH4Nc+yUNwmz1y5bzX/RAjT3pUFeeKyFujOHubQwBQONFsREU
         RxWoNGaKJhWF/ZJMXr/1mY1P6KZul2XYfaFsW555A82GaRei89cf9RBBQZi0paZ6Gb9w
         0tGQsaVE43Y/iZHwokrUjbsmKtVDQnP+Jcqg7fD0BKh5PvjY1/cOhU9k2r8J63L6HFxz
         RDALO+qYlCnx0M5usC+z1mcA43qOa/rB04C1ML/1tzkYAHOoh30wpR8OyAwXgtvd+FM+
         Ekbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707319732; x=1707924532;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aVJBp/wLIvdDCkM39dviVJaPHN8SVlFT6G1Ob7QeV8=;
        b=mUZEk7q40/6tWNuy2TjDEDwDqpqI3YFQC5rsIH2gcBaCktIolvw0f86Lw+2AvyPeu9
         MEmpb9B5rmGPLxRIKTn7anHV4szp1b0jTosjbJeslXiUyFR1A4dj/Oqr6ZgmFtm0kraG
         GzXBg9+N74OvAPKlY7ykWciDnWYQw0UI7omuYHzAkSS/hlXE8shQw1cJzMZs32yzbVz9
         92Irg955V8i+bJGwuLok6AS/xny+Q9uT86+sKGGhl+NK29OfizdVvyO+lKGQB6yJNNEo
         MkoSvRC1wCx1EJaitQM2hPCRKXP8Hq/g9Oo9iLHiqzVrNgigyvrYa6hdr68epSuJc8QX
         qSog==
X-Gm-Message-State: AOJu0YwXc3VSqxZsinl105DANfGXNJuHbI+oJ+pv0/DxuL9s7GwZylPQ
	G1qC0PiOukUbbs412677DnNVE+rnBlZWg950OaTyR11VgTBPRP9G1k5KgUL1iEE=
X-Google-Smtp-Source: AGHT+IHhKKiM6WYOE+RnOJ5HOeB5U5kN9TtNNR5vF1qHyd+5WokmskyFoDQZRsGAdzFZ2GMD7A5gmg==
X-Received: by 2002:a5d:444d:0:b0:33b:49bb:5f91 with SMTP id x13-20020a5d444d000000b0033b49bb5f91mr3578953wrr.16.1707319732187;
        Wed, 07 Feb 2024 07:28:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpoCgVkazuQyJa8NWpMZC47sGZPhqwA3fI/xCskrYkSEdAdtC/uFqkh05GbdgDmhf9Fcpfc7WBUhoOi/YpRegDqqLtAgHSId1u0K/fpe8z7Foa6rvQRi58giDbjIMi47U0mOyePNVMY+nmx93xBCNCtV22cG4ip4yxDjzVd+mjOf7KdWwgAXr9hLwu6GjgO6q6nMRllNXRlaWrNhsa8t4L+AEjTdbbbi9hJM1cZx2R6aAY40amRRJU6GYGw8DR/jMrLdlKdQj1p+RaAUfFI/HdSXfGfW0FNFVGJlQPotitNL5ZhB/gf2+y3hua95dIavdo5RebInPDrsxxGHd68iEB6o2+aketxoKFXT0FHsMVJDZMcuWS98K0lkQnZXJrJJfDSk+gSoWAJEZ/Da3SuowS0bNeLaF3dN6P067x4LqGF2LbPaFxBEUfkup9qVO60ASFGqfVtuiOyS2zuj4jfzrRW7zf8D8aUveyMM0hUQ+zgyb2OHG3DkkSDwLFpEeIjYNoB699Fk3/HeKxjmNZ9ya9WrZmuSEwlv94BBIkHptXdCx00qjylb02XwUoOoEq4aTJq1xjACHWIcNuVrAp21d59mgvSuRmUtAWI0v4zugrISEjkNlMN4C0T9IqYIDP0WPt/VY=
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id m25-20020a056000181900b0033b4235b155sm1729357wrh.48.2024.02.07.07.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 07:28:51 -0800 (PST)
Message-ID: <5f7e36040a769d92e0cc382c393293bfc8f46d5b.camel@linaro.org>
Subject: Re: [PATCH v3 0/7] gs101 oriole: peripheral block 1 (peric1) and
 i2c12 support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  alim.akhtar@samsung.com,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com,  cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,  devicetree@vger.kernel.org
Date: Wed, 07 Feb 2024 15:28:50 +0000
In-Reply-To: <6feff535-d9d7-4f4c-8e7c-956c4bba1713@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org>
	 <6feff535-d9d7-4f4c-8e7c-956c4bba1713@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Wed, 2024-02-07 at 16:23 +0100, Krzysztof Kozlowski wrote:
> > Changes in v3:
> > - drop samsung,mode =3D <USI_V2_NONE> default assignment in patch #6
>=20
> I am confused. I have "another" v3 with different changelog.

You're right and I forgot to take a note of the other one when I did :-(

Should I send these again, with the reroll count updated to v4?

Cheers,
Andre'

