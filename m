Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2523D2F5306
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600068; cv=pass; b=ZkKcbGYe7XgiTuBdY6BcMOncOSe7owSzq7xODyDbUyMspsXPd7AOqlHkWCN6sWuGd3BqA9B4Qyr4OI7eEbpFPnEuQE2WE8QlwRVT3Z5cZp6+n+/lY+Q7cGgbxMLwylTN8yBC0JiIAdB+IQCkixnZ5TISG3arCszC9kfWTMDGH0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600068; c=relaxed/simple;
	bh=tsi2Uutd+qnFT/ht+Sd1qAbadQZ8wkdaqUZCkUYgK4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPagKqWzJytCigjNRoP58keCPoPvSmSEHH5bsRrWSrGSoyh9mwYR4rP1jGBTEWWxf0+mhVBOMFXvs+M1D5VQBt9+Bghhnp/CFXMh6h3xJIhoPWHoPCvf/6PbYO8Na4nbSGb81CQmLk9z8Qb3OWqdoo+EQkGrFPFT808YThDIAAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=hkCKxUxg; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="hkCKxUxg"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6446d7a8eadso2353910d50.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:47:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768600066; cv=none;
        d=google.com; s=arc-20240605;
        b=jad2mpEGC/KXU6g+2JDixE6LuM7xSSh19zFSLThyg94/Pc/QNjiqh8zZjQlHSnVWzm
         HeUXG3Wap2zFNmhU5rJxDe7JYbRT8hppmMTTUSuSbwo8XO86esC3uh1qRwWsxb9S1ngR
         do1XRk9bHw99bIN2nW3zRo7a0XvOVZtm+YmUoTm9obWrPdxWj47+dNcyLYdbyOr8opOD
         8qDCXxo/jNEPFkFwVFfnpws+GZmDQospjbu6BM364CAM5lJHAQL0W52kcgS0KdqByuRk
         ajSxmGK2CdHFdLXAMDJ7k3DV/wku2F/2PE479jKbf+KcT3yCPmOGpePUf6piJco20VUH
         5c7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tsi2Uutd+qnFT/ht+Sd1qAbadQZ8wkdaqUZCkUYgK4s=;
        fh=QtCNCb8kI4sFJ2Oo8vhFeCsmDwMdUl3QREcfcJk2ick=;
        b=NlRS6mEoNXmvpJWP/M96RVWrRQpfuGDGPlmZ6g0yh5FdaITyjGqC8YhHI2IJxeNm7B
         kpL5GEbrYpZHRe+FdZGBgmK5NlcHjQkuHXkBl+bhLY+FJD4n9MdhH0Rz7biQFL24NvWZ
         j1R6jGmr+JpEwu0a0PLug1GXjxfhWBxehiEVWa7Dm1gdzM+tOdRxqR7yy4MOYXQXOD0B
         mYIqJGS7tpZpyvuT0pt0RjWIqdficzy4kzXRfkrL14Nb2neBclyb4I+RKUrsZFTFaOA9
         mECClNcqmMjmDCMg3OSfyQLcDo4w7REkt3h5ubRqGnIsvOGNjpXqBgtfO5r4AbwLv0lh
         uNqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768600066; x=1769204866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsi2Uutd+qnFT/ht+Sd1qAbadQZ8wkdaqUZCkUYgK4s=;
        b=hkCKxUxgZRpUStfLYvUVcV6goumk5vlU/kHMAoeW0lEoFIBN2CXn2MFj8N4Hu8Yf+N
         krYgqjpylqZAZmNNs1FOp186VkwBxK8braLmkVLAbhDN8A5+NqkyIEbnyy4AJvVKwl3J
         e0HKFfMTEmD8U8C5ZUpAaOUmZNKp8sqP/pfD0iu34Qm669oXebgoaSbY16ObQT40yiho
         URgQ/AOwcqWZXkq7tpZw9hNt0zdWYYCIk15zgby/aopF0wDc4c/wW/ehnIIcbHb0hoDt
         7iEKYiqT08lJWrqWMfHXo1fkE/LuP0g8uEVEv6QjzWbIEXzYGy7zBEHH4gvf8hNkpFOF
         QUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768600066; x=1769204866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tsi2Uutd+qnFT/ht+Sd1qAbadQZ8wkdaqUZCkUYgK4s=;
        b=MEC0TqdRVlysZ9/iBSeQ8nLKTUkmeIlbBttf25TEkGAt1fiVVlE/fqBaapoj4Irj5Z
         ToyyNYURGWb1TV+14Niz2TGw2GVrXhvhuCKWe+NUk2nc/SgTOwpcc5s/hNSqfUGaCryv
         Vq6Smec/jQqHqIaB+gnxX6tQtQ+9PYp2WsFPaBVrNcoJUpkwJj/AosN2dMUCCsxIxuf6
         IL0vN/LkCSQqkxO0QuTHASVf4/kNk8UPjqYtbxrbHlpeqGsLu/WWtNpzjcBc54PCSvam
         BGniD9fM+HQHX/XeHizt3zggqsR+VLrqkTN5b+jhbuhZaMu4kjnoKmuqpmFcWyoJxNly
         /7cg==
X-Forwarded-Encrypted: i=1; AJvYcCWIr0yKtTnIkvbo5KDpRpBjz49zlZ1ufG2OQdcC6Qxx+5LkB7UjHHG12jSMTIq0mf64t8M0HtcIFZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/8aoOEkEwXKw0YqTifbdWr8nf8KEY4RriWP7IIZj7tTcAipRg
	MrK4FgKdH24YPnKJhyyFrJ6G7CS5/sMD7HINzkO+Aru4L1tIn53tQOmK5/D0Oplwhw4wku3U3vx
	YUNBanaJzMZqtbojkUxMuN6aJ+wl3pnHnn4P7fUriRg==
X-Gm-Gg: AY/fxX7v+gWm0B7oo72QsrTmIdwjlIX2aw87mJLCKj37iLaZOwM6ulpQOJ+1Px7BnAu
	ULfj8NgRmjySHxSj+OA0RMS2R+fozLDyth2oa0+q+z7lDAoHdNUVZXiGnhzMM3aILl/HKdHMMEk
	+JnxmCYvtPnpLJ4kVv+hJNLxGoms3AdwqK4auCto5Vpgo8xIpxwr1qZev+yMniMbynyQpkTR2ct
	wjoVUdGGxCDCRhkmMkd6LvDrmkJfZnfIupjfGoXqkoHrhvhqcreskrwUvJjsnuVDx/2KFQ1b9u6
	+VOqFxVacwif7TOTD3TQBqTs5EbdfUY0eviAgGu7iQDA6aEuyiKC8iCUDyr6
X-Received: by 2002:a05:690e:b8c:b0:63c:e3eb:20d2 with SMTP id
 956f58d0204a3-649164f7687mr3897690d50.52.1768600066108; Fri, 16 Jan 2026
 13:47:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com> <20260116-sloppy-daffodil-ferret-b5cebb@quoll>
In-Reply-To: <20260116-sloppy-daffodil-ferret-b5cebb@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:47:35 -0600
X-Gm-Features: AZwV_Qj2Tu0a6isqrKjnGKdfFtIqrr7An-1ySaWl55wpht_7I4E-0awxisTnF4Q
Message-ID: <CAEev2e9wHvVGAhQJidpTNLyWPuMD91_p25V6QeCizm8Yh-qtTQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Jan 16, 2026 at 3:04=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> So not really a system controller, but maybe a clock controller - place
> it there. Otherwise HERE you explain the rest of the functions of this.
>
> You should post complete bindings, complete description of your
> hardware.

Understood. This block does both clock and reset. I will add the
complete description of this block to the bindings in a single commit.
