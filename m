Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F3F1A707A
	for <linux-clk@vger.kernel.org>; Wed, 26 Mar 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742980799; cv=none; b=ltVt5rUA1ewZqAbVS/xDpDTvToDeE51K5759Jp1vmZP6742PzyYJ1rTS51YvI/Qt9v41C8TkhgI2fC69DjMlbhs8kL/OXV+CetK2GUBulK7sI0owgGsTvJmPLTIgJJp/onhuEky0JfPfAzG827L1dNm2ne+qKuZLazeqCWfVXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742980799; c=relaxed/simple;
	bh=vv+ysNhuxY3ikjLOktcTQGdujTO/tv4t8ztEeTYdJ4I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M4iu+0UNN++0gRv/iEPOzBSg9d2BhSK6uVbwIAwEBAaKmT+3nvnrJ3Apx6fVeTPZ3/goRE1lAgqpfsAQGINlKq5I/4PH16uE9rdxROl70GLqYzj/nldHWHr18/8s2bw0mMDf6fPq74yS9yNHrDsy17mnUws/oW3wImxyr4hi2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jqbjhubh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jqbjhubh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391342fc148so4554121f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Mar 2025 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742980795; x=1743585595; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xQ0qjLT5jo3q/gpm8poDUSRXpTxAB+PQfhlD12KVxh4=;
        b=JqbjhubhfeEfIMNzE2UY81wFJ4/6cyejFr+EjI0Lm1FuPPwpd9AEv15RSMf09NbrcD
         OSG26KV0C7eMU3CDWiEsdm4asvFvLKNNRxnCSENqsOaLfCP0O+sPai2b7KWwwMJFY6Wv
         ekk2BGni5kNRLNPtcT6i+Hu3Hh5f6fOhmqYIXKvGR/ROCOemuQ9raoKg08JrefYFd5zi
         DIb8XMhd5Jlxmw8CMw5ybCqqIOl+U10u4w3Fl3TEN45+r/IBO4+fB138SLtM6nwHlcLJ
         qKZkYOLCgE7GQlz4m9UUE9oeoigmThHZbhDW4fDg1/FfvPD4RYPuGzkn0jC8mI1w/M3P
         /vPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980795; x=1743585595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQ0qjLT5jo3q/gpm8poDUSRXpTxAB+PQfhlD12KVxh4=;
        b=j/zQq/OTqk16J/ZoDXk76Hr6pOP/fOUBtFVVPbo8mARyZziRnVweGbjBVIcgbTTcV3
         e4OJ8Vq00E+WNhAnsSfkMmh09ZYcd0agWcVtYZ7wRFBLRfDc80e5DhaGsCtmvxWcI4YL
         JQElJEz1QPUs5VqAFfEY0e1lUn4jKizHTfCOv0NiYXzIdGOK8tgHBTzvYz+V9JcbU1ht
         AamX+LWk4IQe6BtGSLEAWacLepUd6xNt+/XjuuIHMIn6X6wYMU82HOvHKMvTSFZo8euI
         I0SaTI7csJQmIMAFSE6/Un2dgPN62Kthu9E7QAiSJIHGK2yKGODJ0VsUmsnAf9WzRg6Y
         eFlA==
X-Forwarded-Encrypted: i=1; AJvYcCWcPE5nZiVNV6DM+Jdneeca/STNZ3eiBbNQi6AjJvmi80GMxwx4QFMpwq9p0Gbh7wNyVzw7kpJ16nM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKys0dED5sXDgRN+9vukrq5Ph9ilQwtEA/EX7vt+7b6cN80Eds
	vgWh4JFj3JWXQecyHB7UQLmac7dtGSDSQn+edA1uuoHsa7pW2JXf1N4lZdec3Wk=
X-Gm-Gg: ASbGncsD4U2Apt+ZWgmlKMZilH0nn9lH3o19x7oZ73304duxrcyZ55cF7YdQ2Ym1LiC
	8myuI51BsDUpI0yKvmgqMzp/qDs6dQ5xeom30/X593dsk4xq90vm4v+RAD2AG8EOFzlfm3n+y1D
	78EJSfX5f78T5ynrhiLDNUp1MAS7i1ribimaliFpd8NBbaCK6IJ4K2HG4/T/bv6BGzpyIZgkOJr
	0eObA+16CbcmLKJ7iZxoTw4Lt404LWYnw3TvAqMDjBjdBIFPLH4lhm2GFcYftJTQnPFaM4b93D+
	KxjyZehZPof6Xntu9Iy7jvMosKrLDpiJBkyhqTkzFvidAlnY9Q==
X-Google-Smtp-Source: AGHT+IHdYeX3HXK3HliuVZenB8pY2eBivucP0XkMIaG7LHTPqNsbiA+5ps8ir+J/tmMzC0VVoMgrVA==
X-Received: by 2002:a05:6000:4027:b0:397:8ef9:9963 with SMTP id ffacd0b85a97d-3997f93d54dmr19401353f8f.55.1742980795153;
        Wed, 26 Mar 2025 02:19:55 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440ed5e0sm224956845e9.37.2025.03.26.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:19:54 -0700 (PDT)
Message-ID: <8c167b83a469d24373486af5936b466d44319409.camel@linaro.org>
Subject: Re: [PATCH 03/34] firmware: exynos-acpm: export
 devm_acpm_get_by_phandle()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Wed, 26 Mar 2025 09:19:53 +0000
In-Reply-To: <f1e24507-7cf3-4e0d-8989-05ef3aaa2708@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-3-d08943702707@linaro.org>
	 <f1e24507-7cf3-4e0d-8989-05ef3aaa2708@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-26 at 08:03 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > The upcoming Samsung S2MPG10 PMIC driver will need this symbol to
> > communicate with the IC.
> >=20
> > Export it.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/firmware/samsung/exynos-acpm.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/=
samsung/exynos-acpm.c
> > index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..7525bee4c6715edb964fc77=
0ac9d8b3dd2be2172 100644
> > --- a/drivers/firmware/samsung/exynos-acpm.c
> > +++ b/drivers/firmware/samsung/exynos-acpm.c
> > @@ -741,6 +741,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(=
struct device *dev,
> > =C2=A0
> > =C2=A0	return handle;
> > =C2=A0}
> > +EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>=20
> If binding changes to parent-child relationship, this might not be needed=
.

Indeed, I've instead added devm_acpm_get_by_node(), and clients are meant t=
o
pass the parent node pointer into it.

Cheers,
Andre'

