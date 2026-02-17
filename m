Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51DC31B122
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 23:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771371010; cv=pass; b=Ik9XvNBxWwWRUr4fnkKBFRoBnbCosYyx6mMol25o2ktCTkpU5+j847xjjjFo8WLxd2OVwdqhAZ7yMlWj+PBWGPZIrd8Rif+vmA0W2L/fXuRQOiJQmKY42NzLauYiWtmXdk/LKtOXPeH5xlYYo3GoBapP7z4uiBbizTMic1ZUJ9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771371010; c=relaxed/simple;
	bh=0iqgQ0iC08pETndYz+OYiMyT+2bia4CvGsqBmREgTlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXB9AXLnaFgVNfvGKx4Vzml+X5HZsQiqhezVYk2Qb6OSQ1E7yo4HfqqxQSdtzWiiSIFobndUM61AJLARwNwWEexN9KOirdxshLAfTjl2NlvmoAK44oPLgNCaEtPvsCNixPJqWm/Z350Fh4WqnOrhjTZcnQhRmC7RtWeLFMzWMwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Q0/v2xlB; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Q0/v2xlB"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ae222d87dso4899957d50.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 15:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771371008; cv=none;
        d=google.com; s=arc-20240605;
        b=iFB2qL9O26ttevppxVCmoupAlMJ7aowcjfkEpCwbrYvfDRsi0qAS4VyGt2GKe/56Bu
         m6myZWge/V+eh+FdWnjs3quR93g5psMZx61vC7oW59gqpRd9ZRQVBoLoufDY0QHVJ+lW
         leWze9ee2t454l2MEL0rqV86jOr9OkDpvmkXvy419t9yXb/GdfLDeT6uzIivu3yGBgK1
         raf6LQA24IpWaUG2jUMyU2KM55MdRFUYMCJSjBgmWX2kxqfrwQVkygIpzPva/Mt36FFX
         DaXxO4PLmVbbFewKHCxcLNA9wn93q1LHZ8XYtqAKXmzeAEGEtS9tIXQS6EeWmGhm3x6P
         Y7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RTnOou82ckQE54SQrVzimf0IaJoxyiz9fz7f1nWejVk=;
        fh=Su0eoq/h7pmZUObwY5l0SUvEq1+EzbS7bmehvvrGmg8=;
        b=CreNLV0gVKp1mEF1GUN5LhQpsP1c9WG2snz5TIfhBp1pzW1A5ItWbm062RoaYqYxjU
         BmNjFRbY4nifN3D1OOzic6VaMXrxlv7cnnCQuRP42e6ZWgiM/ra4xpIGiXFSvPkE/F4b
         z4zcbXIXt0UxY7iN/ZvIEiZq/KV49yrz/7TpXoBcdZbUuh4qpzxZsoxD/Ou/mE4eEVUz
         HJ4et/L6zaW1nzznLU8gaEGi7DGg5N8HqsrZpPs+T7C5/5eURE9dp9+SWI53eCtXsOoz
         fwggt8G1dej3ksKmV/ezzJfaSK0xI+eStkHgYVoQZ8pQITL2ibCjiqUrdh4yGbHlCqAN
         dwtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771371008; x=1771975808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTnOou82ckQE54SQrVzimf0IaJoxyiz9fz7f1nWejVk=;
        b=Q0/v2xlBcwXuN2qEiSfa/RBNxfyYfzg55GYWugN2GbvxUdO3INYhg655GKRGSCfheq
         rmibYSyY2wknPIuDKPuyNEzyFbiOKGh+7CyH3U+it5al/w4FG2dE/wugPTOuu1Z73+56
         oQl5J08HGqNmDsdwwo8TkUdAOcvIkJ6MEdis45spAsc+JQMpqXICEyD7I75An2XK+xFk
         ysqxkoVHe1TPBSBGUY70UD6h0MENoDlKvswr5J3S67HQAImRRkfqK4zkS1qoaL0Y90yV
         aT/nxShqg7AR/Ocpw1KU7Pz7e1SKUZsBKICatRBgr7ksXHRV8Hz3J8N3NPRewsIvxeiX
         ySAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771371008; x=1771975808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTnOou82ckQE54SQrVzimf0IaJoxyiz9fz7f1nWejVk=;
        b=ev8hTJlzHuvDe2ZK3iNCn/pKKTfVCE8kLKGzWmc60az28yb82hmYb2wpl30PWEGNd+
         UyEKwQK+jmMJf/1DcPukyEK+cfMXtBPEY6gEUKZ4Qi/yUHOtPVNBaH01aEgv/dXuAuqV
         mih3LvHxPaoJ09v60zxDqaXtn55G9q3tlwHYaMlLEcjn3/33hPHlitA9o8wZqX26XI4D
         hY5M8HjoJIxN5auDuETc31Rbd/hlJ5xZ2YCIm7dBD6Ax5Oqszm4hL8mV/SXlAUmoivPa
         y3CuubZnsC4T9IynJhj2k2NcAxbX48bybN/Vmqqq2W/Hh44OZWtzJ6v6Kq4rY8pPNHX+
         +A2A==
X-Forwarded-Encrypted: i=1; AJvYcCVJOakMZV+tnJWhyQ+G1ocdJbBnhLAHjCXUELHZWmYMhtFjaTDcaqkOILjB/n+VO1yX91gN/8ac+8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoey/yjP8KxdvrS+FTMeX2pojNGX3Fr21QN4Fgvhj1+t9tdok+
	/HP3gNWANtAyVmbaHEbtRB/oUQGa2HFqhtF3TanQLlmAseDWoRq5aV9Cw3ZMTbR6n44zLCGp4XW
	LuKIlwWOGfbDo9reMirD2qPX5GkKbPlsF8YvVnCXhog==
X-Gm-Gg: AZuq6aKS+CeoepL73WdeP8q5VukWA1e5892oT+ClMKUXTvjO4eU0Y1gza0hyfvNurt+
	GZYcoqI1tdOdLa8T8qcSXPTcKQHwTUXYkrpCbIkyIsKXpRbuWRNyGmCPQFIS6WmBt+nh7CDmhwQ
	LpM9f+7YnAB60H4dyjPbMOHKNlohL+CEhT/9bu/uheQk8OQ4NE/VLgLnYuYk71r8Sd6bsZXiJ0a
	zXWZXcynXxwi0hBtqDAyFF9V/J85x3jU2jhPrJPz5qldkoNlU9c1atQJT2H2lcbFcLCrAHXwXmH
	f4V+DzdUv9uX0tqE/T3qZLZzC/N3/3vfuYIv/e1T1nIHin127fR6czT8NnEYsS2CSJSzfxYW
X-Received: by 2002:a05:690e:400a:b0:64a:e543:cabd with SMTP id
 956f58d0204a3-64c556c9ad7mr114487d50.70.1771371007641; Tue, 17 Feb 2026
 15:30:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-3-cb46d6a59c73@oss.tenstorrent.com>
 <aZST4Yywv09u65MP@redhat.com> <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
 <aZT4RsGnu1qlZl-l@redhat.com>
In-Reply-To: <aZT4RsGnu1qlZl-l@redhat.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 17 Feb 2026 17:29:56 -0600
X-Gm-Features: AaiRm52TAk-yyamOoXmwj8fFo7BsCbo2w-ZlTEB2IeiGt4tNj-r_C0lIrKQFA3c
Message-ID: <CAEev2e8hwN1FBR6yMr_NeZrFx3BXNz88RHfHLhSM=GrpExsUyw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] clk: tenstorrent: Add Atlantis clock controller driver
To: Brian Masney <bmasney@redhat.com>
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

Hi Brian,

On Tue, Feb 17, 2026 at 5:22=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
> >
> > We have a group of gate clocks that have a single enable bit shared
> > among them (instead of individual enable bits for each clock). We need
> > to keep track of the number of clocks within a group that have
> > requested an enable, and only unset the bit if all the clocks are
> > disabled. share_count is used to keep track of this. It gets updated
> > by each clock. Hence it's a pointer (and the mutexes around access to
> > it).
>
> The code currently has:
>
> struct atlantis_clk_gate_shared_config {
>         ...
>         unsigned int *share_count;
> }
>
> That pointer is dereferenced like this in several places:
>
>     need_enable =3D (*gate->config.share_count)++ =3D=3D 0;
>
> I don't see why the pointer is needed. Can you drop the pointer
> and the dereference like this?
>
> struct atlantis_clk_gate_shared_config {
>         ...
>         unsigned int share_count;
> }
>
>     need_enable =3D gate->config.share_count++ =3D=3D 0;
>

In this case, wouldn't each atlantis_clk_gate_shared end up getting
its own copy of share_count? Which is not what we want. Or maybe I'm
not quite understanding what you're saying.

Every time we create a group of these shared gate clks, we create a
refcnt variable like this and pass the var to all clks that share it.

static unsigned int refcnt_qspi;
ATLANTIS_GATE_SHARED_DEFINE(CLK_QSPI_SCLK, qspi_sclk, nocc_clk_mux,
                           LSIO_BLK_CG_REG, BIT(0), &refcnt_qspi, 0);
ATLANTIS_GATE_SHARED_DEFINE(CLK_QSPI_HCLK, qspi_hclk, nocc_div2_clk,
                           LSIO_BLK_CG_REG, BIT(0), &refcnt_qspi, 0);
