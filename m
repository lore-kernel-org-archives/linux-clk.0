Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E39D23A9AD
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599264; cv=none; b=UX7hsmeTDJsnkIolHOEVFXwox5r+JCZci2KhVoEeEzx7ZEfXO3FspFIfSTr1i8ZJEfkcUftH4cBiS033yskqpysPAwqYl6E4+UsZtID2KTIw1E/7ygvd7YjPlyHjRt20oBxDOKr2myR1fM7oE8u9pBVTF9vdk+689pNCKo72Dmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599264; c=relaxed/simple;
	bh=YluS4VvGiisnpPBIbnWwZ0yy7fsXjBMmbe0uAp7E52Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sAVrG5aHN4yMijeJJsRhzY9fIFjaH++vUVAuQevvnKhWOst41vbovvMyaKH11tmnuvoYH9qVZzX4MDRJeenY7gQ1h8LsHE15SQCTh0hu18ql0cVKE1ERdLPHW3s7M0EQbQUyGErEnDER1rFi6x6Q7khI/GZaTZGKR/ohZXfiyLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=VlCbJixH; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="VlCbJixH"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6467b7c3853so1962411d50.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768599261; x=1769204061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YluS4VvGiisnpPBIbnWwZ0yy7fsXjBMmbe0uAp7E52Q=;
        b=VlCbJixHtEZfAFltUKGRBKQMYHMiZqamHprujnqpMMMzAYQRqn2951IdIlb2f8NjXe
         jrCyMZOiqMHejn6UCXvxw+dvtHBhEKC3UVEGp8SXa4ydpxdDp8SRc7ST9FHWxgHPGA80
         lY4hAexbjlksvb3yCyp1KBlfJrZZI8pEOc2cPoa3vqdmGuOw9/CWCzj8o6qqneEZNz9W
         H9cxvLvMbHCHfUfrhl9F63FmRs0JuuR6bTtQxGpeWvhx0ZD5ZkL3mmdInCXOWMlhk37D
         IbiuSDdwDzp9FQ+6CRGV1aPPLBihZoaJfXlJ1su4x1acPXbz6uWLoGt0YDusfVRXxaDO
         wNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768599261; x=1769204061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YluS4VvGiisnpPBIbnWwZ0yy7fsXjBMmbe0uAp7E52Q=;
        b=Q/913v4kwmP25GhaKVNylaL5YqmlnSghqYiuEPC5E3a//ld+ivaACCZ8ySasv4HCxb
         9BCnb2vnY6lXTOhgZ1avwjGIXlrNhg2mDzhR9suUsm2zexXQrZGBX3GcZmr5758/JeJy
         6ZRFp2yi7UDmLxUs6An98S7W873FGB9P9OI6g/dJX3M8ZTGuxAIm9uHAXzConVtJwwW4
         jzdvFn49UNqkZAK6l9Qt68l68E4rpzwFQ5Weo0WN5VqYy8ke8/hLJbAWLOFApiwwNp4O
         NcRAcNSXr5MM/E2Gnh8LqD7aLsrODfQ4hncfGsEWnjsTM5l8guj97MXT0L6fdO9gIDZs
         kJow==
X-Forwarded-Encrypted: i=1; AJvYcCWl8MdzgEpP8swBa78SqKF6r5kzGQmwL2E5sWi/8kEz0a6/QuCL6ie6Rr2SvI87cmLHOH1cpRMkZUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1kHVhx0vu61jL/0f73hlZ8+rrG3C2Bn8tfgysAJhvoGg/H1e
	kCJsvCZCmdpHDOkMK/m+G1tCH7D6/InFCMoMQ7ia2qYGCY1ct665axtAoErLBsfHdU7eeoiM4As
	HEhSj199oV7x1OBxxjFDSSTR8SAuIulvhMi7Gm9kEjw==
X-Gm-Gg: AY/fxX7lJ2I0MLcCViNh+nSFWQXZLcMO5SEsr5yd7vnMYDAPjPdU+GAdQeTJVIuf+nJ
	uuaYn/WPRMeHB2tLOFYQrmdeT/wI3TAAyj7nBX9BKCkrKAVLqVykDJzyBsrYEDtYMBhym8Lyhob
	iEVt06qbKR8NHNiT5FCzPiYBg0k0ZxaQ4uowvD+SMfTA84KMlUX9fYM0bEzjxkCtSkDsE8b9IlA
	18/L9jx230CJhqPuWaIBk6QzY7TAxL+t6Xy1+m0huzmle4dgEGEtLlWP6wjRcxLjgiMWKbnWJob
	5svgTkVvmm61wfRyDLDTbntGEdxPzi3Jre+bUt+Sy5uOUF6a5rsG2C/MeTgh
X-Received: by 2002:a05:690e:4087:b0:640:c9c1:a347 with SMTP id
 956f58d0204a3-649176f1f15mr3163766d50.7.1768599261541; Fri, 16 Jan 2026
 13:34:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-2-7356e671f28b@oss.tenstorrent.com> <20260116-debonair-tangible-reindeer-debcee@quoll>
In-Reply-To: <20260116-debonair-tangible-reindeer-debcee@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:34:10 -0600
X-Gm-Features: AZwV_QgvIVsYMJGT1-ENcxm0LkH6MNSbRl3fGJNIA3UmwlJBoY9B1QGuQ1fIBc0
Message-ID: <CAEev2e-iAN+br0wa8dXSyjTgh=vNCyqwxo42EaksCjXOdzeFWw@mail.gmail.com>
Subject: Re: [PATCH 2/8] soc: tenstorrent: Add header with Atlantis syscon
 register offsets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Jan 16, 2026 at 3:06=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
>
> There is no user of this. Split your work in logical patches. Adding
> unused header is not a meaningful logical split because it is unused.

Understood

>
> Completely unreadable: missing any sort of reasonable indent between
> values.

I had formatted these with clang-format, but it doesn't look good. I
can make it a bit better.

>
> Why do you need to doicument register values and provide them to all
> kernel drivers?

(Including the subsequent commits), these registers documented in this
file are shared across the clock and reset controller, so they're
added here (soc/tenstorrent).
