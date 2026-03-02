Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30A1212B0A
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437815; cv=pass; b=DfrLs05P6OZfk1HexL86peTr5nxQzUhQBIp01htOnzDRvr/DiKJErWzDl0lcjWVkeK7Za3gR55McyS1xqrP2ZIEHNfqi+8lND3XaEFubETcPFZhWhQpJSUKbomsblQGqexdoxvpQPqebCSYzDJCd+si8mBPxTo5TBDphDQ9tk40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437815; c=relaxed/simple;
	bh=F/VV1DFtnaQKIRkN02cTJTQK152TFL2Dj4AAsGC/asY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nL5GoU6Tel6IaVwcT45XO7+GIW84l1j71X1NsHjII3zAuixRTSsG7O6sHwp3nwra/xvHwMcR/g56HKAI0dxim+F4M7fN6cKuPGXY2ePBdtMK7umlJl64qGYzZoCatWN8/FzEGWPLpMiTTMq2P6CD+3d4lbeinL8+ctvg+DZVnxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jW4BaM8m; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jW4BaM8m"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439a90f194bso1077958f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 01 Mar 2026 23:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772437812; cv=none;
        d=google.com; s=arc-20240605;
        b=iz/dHyRjL2/EhbyQYtzQBs5tGh77vuOf/Po0El2mZPitfp4vWPW2Mbdr+6nHn2qr9T
         OhPf8GNfyQ9qlM2IUPM9ld4YNVbO5MqvL+tUgfCB/H3woY/Fa1aCl291j5KZYSh5rM77
         ddWi16xLxun8FcSoAOzOfgv28/T2thjxZlJr1w/5LbLx2ii0qF9oSMp2+yqai4HXJAEN
         m+QMQz6lM1mqhB2Xsge75p/8wHFDbIG2g0Q6Mdu17X6yD6+AFdStiNX4sP+QqZYttL4l
         GzhGwPlpZVVFTqoDKnV8yFyUqDJfp2tLIqmaM6030B/xxIIUOcEqZH4rWrAsXYqdVJpU
         366w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zj1CxeV9l7MoGLWsD+FwhPWg3W7JQXZ2Vc9xQXfrdf8=;
        fh=16eCHstcJYX9l4RgevNNR4auZ4B/xC3l4HUfUo6JPQc=;
        b=kgDUhJYdR2IIkrON4dnxoaUZi812Z/uBXa3dYVJAAJGYOSNuFBQfed1xAZqQq+xlE4
         G8LPL7gW+yAG8kFrnJ+u37Q8DDqTZUZghnxKMoR/R8frBpUuLafpu1WqFrjcI4s4/AlX
         z59br1Lo+b+U1ZOi7kcz1EOSopwl3mJn5QEVjWY3DYTYIFdP8SIWNHFh6ei0jSnEoFtR
         rZfTzdbC/XEZGVGP5h+z1p2A9+yBXG4ynMzOHMwlNQfxA7r52V3hROB3viR2/B1KKrm8
         bzs0IAgN0rzeOhKBzyBe8++yTbgX4kXoG6ZsNjGJUO/7foP1Nt2yBiA+r2jiPRnTPSqs
         1xaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772437812; x=1773042612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zj1CxeV9l7MoGLWsD+FwhPWg3W7JQXZ2Vc9xQXfrdf8=;
        b=jW4BaM8mix8Kprfu0g3fbtY5YUJdAzjjka3t2vuBSMHNwYuQxcGAz4x5Boza5VmCAY
         npuZtXi4eBrC01ygs3hXNNIGL7d7r0eDUP2WwZPPlbVntcphW8PwPRzumxSTVNYK/XBQ
         uuKiUPI1namF6wCaF8U2X4gOkmL2mSe1YzXZpNdSn9TZk2BKKO12tWwi9rXmwVTcvvmY
         C12kHoD39I1JoIF5DYDhWK3ZX8vd1gwkiMakLF/Wzvx/RhQvRCtdct3W+YQ4qFnE2v7P
         Lm8OTRjMyg4RcaGGPAi58l/Jc9hsdFjPyw6WAjsPnQv6fV8gJ/7t6xj+z4C1fI10AhNC
         XudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772437812; x=1773042612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zj1CxeV9l7MoGLWsD+FwhPWg3W7JQXZ2Vc9xQXfrdf8=;
        b=kqrOC7WQRuWIZroJRVLswOU+QHT40zQwa8lo6hbWksVVCwTMkGPrxmGbmkZbGlaA8e
         7lXf7CfjNsgqHN+iy0l7S3sRambkUqokucYr6UskYeNs+aw+qdKunZ79m19ZEB+1Vqw8
         yLjk4UhD9rjeKQtBtEogDenIlI5D4OisPbiEZxhxTunM4rhVpZBbHFGs+UXs32tza05y
         WWYaux9MhkuxlVe+PvPfrzgVi95cGk9oCmhpYFbUkNPOZdz/rYGSr7xSjAdJGof92Rld
         sqGSuti0LElNZU5pcDuK7ykLbGCwdcNVQJ21zvFaqL/rad2vILMYTvzSBcHvs8FZJrPf
         /JBQ==
X-Gm-Message-State: AOJu0YwD3cZfxukTX3m9Qyn/puU0ATi8MZmaP3V/ySjEF/i5/7tcZyKA
	LACip5a1nbaYuL3e3vn0tujIkXu0hLlnIgvtJ7uEsckvMTiSkFce78ITD+4dAqccDNOKp4qHSUk
	M3YSsR09cU9cUXeg8IoOiWLoTAW6rIxA=
X-Gm-Gg: ATEYQzzAGW95f3JN3z0zHslfg+P4cWdLFAS/iUxf0ZHounQzQRqOIsNHhrmKPU9+2Xx
	YW930/FcEuTwvk5B1zJwfq/i2W/Hxvek8UVktLjl1MNc/kB9HpjiEH0Y2x0oMkep6mBgkFrBHDc
	7+b4aYrIgDDfFl9TIjdbBy1WzUX05lv1HdPZx8ebTE0O8bqNvaeu6rTx6XmCQSvzMTfbBc//Rxz
	x/7Wt3t7Hj97CS/zsIqI1dvuGsT0xf2epMqUYUSP3CW1jV6Ie+4G99KOqtC4opCwbiBXPMSz2BS
	cjweqH5H
X-Received: by 2002:a05:6000:2388:b0:435:9690:f056 with SMTP id
 ffacd0b85a97d-4399de282edmr19383856f8f.35.1772437812160; Sun, 01 Mar 2026
 23:50:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126185818.78003-1-clamor95@gmail.com>
In-Reply-To: <20260126185818.78003-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 09:50:01 +0200
X-Gm-Features: AaiRm53sask4yOh7EkJW4oiGP_P-KE9RiiY4x4fThKivWv0vfwt_zCIKqJJLzmc
Message-ID: <CAPVz0n0jgM9+PxH2wHJO+SQY-3ZveuzPPsOQGR=XyTCP0M0q-w@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] clk: tegra: set up proper EMC clock implementation
 for Tegra114
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 20:58 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Remove current emc and emc_mux clocks and replace them with the proper EM=
C
> clock implementation for correct EMC driver support.
>
> Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.15=
8860-1-clamor95@gmail.com/
>
> Svyatoslav Ryhel (1):
>   clk: tegra: set up proper EMC clock implementation for Tegra114
>
>  drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
>

Hello there!

May this patch be picked if everyone is fine with it?

Best regards,
Svyatoslav R.

> --
> 2.51.0
>
