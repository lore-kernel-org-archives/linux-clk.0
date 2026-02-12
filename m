Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB78284880
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 19:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770925403; cv=pass; b=Gp1bIN7OzIWhmh1WF4HmnpNoY6lw36vmM0djJ40rGRYb7AGJjfEQG4W5b+cVK2ogLTX2kYHWgg00915VCBoP3Vg/nKhx6pCrDHbg+tvJLI7tItQibS5M0AP3mlaiv/CGct7zokQ2/FCTW+BVaaDhHlYWxy0c508xH5j98LzGUqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770925403; c=relaxed/simple;
	bh=Kpi8VTuPv12la3hlRcESDDvvbf16Gb36ZcVnMndVsyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHI4MiszKqUJNJelmOls71E6zfiXgbyZbF5eFkgUHuiJWNkzAB17egyrpuCxbzlYl7ROGbYY9XmiuUkV61k1YHUXWLi+CLaba/JPNTCgau5nBJWLuf+IY5Nr80pDTEa1yv/PozNp6Y+qwGx3xwT4V02agGYmgPX68I86jhrGWmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYn3fh3W; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYn3fh3W"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1271257ae53so271583c88.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 11:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770925402; cv=none;
        d=google.com; s=arc-20240605;
        b=iSmue3VWi5jIOIctneC5H4JmKGuzaucK/Jpp842qNcG6ssgIb7WYq3z+zahyyI8o2F
         uBrhUglnYYdfkuFYs4XtKiOXllaGsuWwmQjBiLwUwPLbRTiPdwng5wZY7bQccUuTXKHW
         I3ETad/GxpDxOxnifhEXEvpFAjjD1hmmqsQvLFpi8F8vgng6fRxi9M8yso4Nw1nfCAjN
         geqbLOrJeFMoSwKEYPipurGdEWxqCcl8KWlPx4qmSfPTXBum340Cag3ACIuKUYRlmqqn
         2JiCZFCnM/+Tq6tT2EiU1MkpWgJevkfQUfVwbCUXjMjW3EDloeyfIchibyJVvsaQ5NBG
         7w0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        fh=HKBULEsupflLZn9L9mRBAjIFFR9qFRjEonFZ7VspPD4=;
        b=H1KA+kz2WueR89Hd+5WbEVzvTtkh2EhImblkb7QBicNGmNty8EtzAe4UMDDKTbl2hy
         2K3cZBaB4APmmPh0mhSLIsC2dSNQNOZLETVYNbgt7jD/BwIbNFooeNrYoqvSA/hgkfWs
         ckw/XxGJEOdJHlpC+sT52+v8Yzn8Jlu4iAjzr6Qeum0WsnAwE10tkO3x2Eb4FaqfADLP
         0bJ1MZ880GpDnzvyeBHKxWuHGevdOwkNFb7/AbbfofS07ZqMVNPxCW3WBZMBy2gAsIkz
         SEkGt8fecqNmvplxrBr+Z/qSVwtKnR4B0e0lmricLbA9a2lBqMavlhqXanjUNlR2k1GJ
         m7yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770925402; x=1771530202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        b=IYn3fh3WWF/cMDIkY3CJBbS2t91YIvD5yvQuJKIlYwaj+LTbymcaqxzm8SP98tSJNF
         721fGtdT1/Eke0wkFktPf3kXApd47IhcAUK7u3aB9yjD0QzBtTBMbONRJbOSscGb7ioA
         8MlPoGhwShYtMvvomCkKBiCV/4jq8t5s/+lvHQy6W/YdRw+Ua2I9m31THLeqZE9VCeXt
         rHEWE/gXV8/F47Z1JzTUWOyQ+Ogy8jD/Xdk2JaDJC6cywTTkkvb9ga62r4RRM+hDl7uK
         VY2LHjlzF2zr61yuGkqqyXe1PbXdJvkLhaMmgzs7z4pvKT69ihI/k8zHlR0iVjWtMLFT
         Bpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770925402; x=1771530202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        b=w0nytcKRbU0BKhMDpjcP/uHFWa3bGADny1DjzMfqfjMMVS6Xoi2lcJsanNXJweCZEQ
         LVtu4b8pqFiPwYf2ULXhIeBWITiReIvpjLxo0cHcm0Fibn23fts3Kx5271N6mH+fzZix
         0Q2G4JvsgnAiidZzNOQXJgaNyrgAdRftemNj8JTpkUVU8zWcpQwKVUlixKRCUdPyIAcs
         37ZsazTUJnR7MJRwTFlCv3G8R6pGBEbnPZnsf8dIpVT5H55zZegSgc/5AqQ9VS/KYDzc
         tcODZdlQmOdoMqIDeoUg+PbwpMiIK0IotWZBcsGQBPVH3jJQj5qAUH8rw10+b/epAhNr
         L8hg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Pc3DJB71ixn+oA5laFUhFVjFvacQOzJq6wQP4cnlrAZUQwQOTZY25M5smuJmFU1Qlg6Tpy9wCLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeEaZUm/dzbI8VSRn8GoJhL5c3q+2MI7Crk0tA7xRAjotJlwso
	XV2jQqBhgVxuYmfywQcphhQLiUIKdl8OGXu00gHRM8hFTTAJXGQvRX0o7dIQMM3CH9q5//wZpYp
	jMkuQWozhtuHC8F45AZ2A+q0/44yn0sw=
X-Gm-Gg: AZuq6aK5jX6gH3cm9+XkuEzqF782g0zMVnKTQy3ceq0vrRP5au+uft38fME/oob+mEb
	wmmrn9crLyogRBlmvHXKMhPmQ06OMqbFce7fya6Uho/v4SlBCyNZl8IgC/DwW1GvulrSGuB1ZaP
	RawrKZ05k16XI+7OTIITkpnfZBfxR4xp5NufzY60amk941DZnNQeQIK2N1zN5I/d1dMZMDWZyNX
	PQI+y+PhzC2Uu9FRBVgLhXHUS4EQKoVJXDlmXnYQgAQ+KQBuC/DQ14ucrf3EdxGlcBg88rwqxYc
	GA0Y55bLZ4us8nwv/x37myg5hZvbLD9CiYIoSbtWDMZEfP0cWO8nQU+rPeOQTi93xrUYo2E8bDD
	Ora8hHPtjOL3YLWx1yZULng==
X-Received: by 2002:a05:7022:2218:b0:11b:9e5e:1a66 with SMTP id
 a92af1059eb24-127397b47a3mr48022c88.14.1770925401574; Thu, 12 Feb 2026
 11:43:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211142321.55404-1-dakr@kernel.org> <10809444.nUPlyArG6x@steina-w>
 <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com> <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
In-Reply-To: <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 21:43:07 +0200
X-Gm-Features: AZwV_Qi9zFnWs7AOJZOKq34_yl9qM1YaahPkhWTWEjwtIMb5KBMQENxC_CBtZ3Y
Message-ID: <CAEnQRZDMXhh-V6p6ovtmSTx2Gc2R8p=pHg8jOFgJ8i3TNNJT-g@mail.gmail.com>
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 7:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed Feb 11, 2026 at 3:59 PM CET, Daniel Baluta wrote:
> > On 2/11/26 16:43, Alexander Stein wrote:
> >> Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
> >>> +{
> >>> +   int ret;
> >>> +
> >>> +   ret =3D platform_driver_register(&imx8qxp_clk_driver);
> >>> +   if (ret)
> >>> +           return ret;
> >>> +
> >>> +   ret =3D imx_clk_scu_module_init();
> >>> +   if (ret)
> >>> +           platform_driver_unregister(&imx8qxp_clk_driver);
> >>> +
> >>> +   return ret;
> >>>
> > Also, because the logical flow is that CLK driver is uing SCU for calls=
 I would first call
> > imx_clk_scu_module_init and then register the imx8qxp_clk driver.
> >
> > But there is no functionality issues your your approach too, just a bet=
ter logical flow.
>
> I now remember why I kept it this way around. If we swap it we have to ca=
ll
> imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
> Consequently, we'd have to drop __exit from imx_clk_scu_module_exit().
>
> Please let me know what you prefer.

I see. I prefer your initial implementation then maybe with an
explanation in the commit message.
