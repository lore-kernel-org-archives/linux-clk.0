Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E217B30101D;
	Wed,  3 Sep 2025 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905786; cv=none; b=muVSbcBCdrzT/3E94XiIcqR1S44LjaK+EwFNYLaEtsWmz4Q5c5Uxsu4HcTJClFmP/l1eiPZVItpbepVCAd8dzUg7caT4cMAEjhWcaLJTM8WBuOgGfigTXwl97x5Yt/ErQDDpPY2uMRf93qBy7YMp8Z3hCoVubGOd6sMttIO0qzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905786; c=relaxed/simple;
	bh=nHcgIku0KtaFMYNLh4blYq4QiR038mlXkofwptYR7Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jt2MAIaZYFzkWRUtgtQQu0ABb+l70SDu1wBHxhnm3kSpFJ01n/bVrhuyPsFYsfRkCVto15O3G75Af0u7Zkb2p+grrMKcgu3+saqlch7npHJuqv9FmW9Qfe87iTfnj8CEZNy/tQNXRhoYgrBz92S3eEbKY5mDrSBZEq6SMTEIMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1HyIYLu; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1HyIYLu"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so7135211a12.0;
        Wed, 03 Sep 2025 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756905783; x=1757510583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHcgIku0KtaFMYNLh4blYq4QiR038mlXkofwptYR7Fs=;
        b=f1HyIYLuKdNWMqKfGLpTr/XtSdUkd38WQ4j1XFXHlIUr00LYKHzqYCrHI0/BLc1mla
         syEwxWf9TmUwk6b26wn3YozbvuHTjhkkHB0Hx+CBSdTDer8CLxxPY+h74O+6j1SEUo+w
         JLGNVwcIDxv+GfqgfAcUTFUAUUq6s6f45qk9hw+zjQG7RQcDvKH3uMeigynO0DzIP7Bi
         twfgA6Rai3BLIxjXW3hd2rfCPPDRpLDDMmq0h/DfZRTDU/095VCpDeIxhQCoKR25mUlE
         iaqoG0h+h1bxBHpfKt5rbiyKcuvJV4zYLOT2qJCx2KN/zfaItEWAwuqJBKcaApLrPxjD
         NErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756905783; x=1757510583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHcgIku0KtaFMYNLh4blYq4QiR038mlXkofwptYR7Fs=;
        b=Vp+04FjIq/UuQerXachdU14UPz/6izCdrF9ieXD6icgYvPa8nppue1J5ScZUdCHv85
         mmTsiOjYDZ3c/4IkMqLXvumqMruh1NoHVfTVDMrgDqmkYg0YU6Log8GysCVdZnHwwYq0
         2yPejpedsEodTnaJHVUmOK1OLqjSxn2jR9bLF7GiDHKRCiT7wWejxIJhTobF+4/mCJTz
         3FCRaO0tTpGdJpxuFgslC41QF/53Bc+SLIrxYbhjAopV+kOfrg22ujcaOUDqWESYt1ZA
         hFUPYo/UUwXx9lGGoEgr5aRXKIvzS9W3wJkbzHcSDbDskxvmhJNGPDaLSvOT1vVTT0FD
         MBGg==
X-Forwarded-Encrypted: i=1; AJvYcCV8N0Sg2xlYVc6C6RZha2H1zX1sm8N3GQ37cCidIUmhUshQhjWkzFfw/t+zCrDzZvvIUoB7sukXFV1a@vger.kernel.org, AJvYcCVBeN8bM6u8m8RG+h38zWv61zeeFANKIW/Snyd0BuehH3bZCm8OoG83OBAsl/6h4f4NMt0ZILwS4sSa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5dGQ9SJxXH2TFvnhn5gWVIA4P+vUwY7A1FkCWyZ8ok4mPFIHE
	9xmRiziFJClPy+5WMeGopPnqggxkNGp8Sf9li2xSKMWNYRlqYE8xJK5HafPO3hn/A11rSH2lC9o
	pGsx2giIdlKRpJT8mfF1HpO1S6yYjYBw=
X-Gm-Gg: ASbGnctImTNHav4o6y51vhmVRecGocW+WG96avQkuvHW7GZy7QcwDm9b+WDT0ZkNuqq
	8tcO0CkPLqEw5wvhQ1kAZsNsLk3wZi9Mq4pY/fpXHgWRenOmPAddD4g7iI+8G+Rz/M2pX2SK87C
	rpD7Lr02BV9h8xCtPgKq1tSWnF0VBys8dL493Jl07Pa2VNi5AqGvE6q+Wgxcz8RAIKX4Y38eASV
	GOjaxgIEjS39g1+ed0=
X-Google-Smtp-Source: AGHT+IFx4TgsjIdX7221cyH/VERuTiLtGl1nmyNXlK5sfPZGceWTVv6FHkr75y9dprEOFMQNGBF7y7RaQWiL9wKyXig=
X-Received: by 2002:a05:6402:4407:b0:61e:ae59:5f07 with SMTP id
 4fb4d7f45d1cf-61eae5973f6mr7216065a12.20.1756905782989; Wed, 03 Sep 2025
 06:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <2235041.irdbgypaU6@diego>
 <CAPEOAkQYA+XSx9QJSmNFLypH0ifE1jvui=MHiEHZ+5a3SR7=uA@mail.gmail.com> <5052759.PIDvDuAF1L@phil>
In-Reply-To: <5052759.PIDvDuAF1L@phil>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Wed, 3 Sep 2025 21:22:52 +0800
X-Gm-Features: Ac12FXxMbXuoikWFpJo4sV8u7OeNSlNP3JsxtdSLpPCiAhy0OcRlc2pHpLo5RYM
Message-ID: <CAPEOAkQ1haNBYsY_AG9onC7Mu3-52PvqtXD4fNvJErqNV7qn9w@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B49=E6=9C=882=E6=97=A5=
=E5=91=A8=E4=BA=8C 14:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Workflows differ, so when submitting a patch you can't know if maintainer=
s
> work from patchwork or directly from their inbox.
>
> So it's safer to include more people than not enough :-)
>
> Some trimming of the list can be done though, for example your drm patche=
s
> would list the core drm maintainers who most likely do not really care
> about individual driver patches ;-) .
>
> get_maintainers.pl thankfully does list the role, so you can decide based
> on that.
>

Thank you for your patient reply. I understand now, and I'll try to do
better next time.

yours,
WeiHao
