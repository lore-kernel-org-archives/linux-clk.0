Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53BD340418
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394799; cv=none; b=Gj5mELLQDTryd3ep3wpCchs+CDDi2nR0kJT+GyN+GyIhWjx1E8Y37hfCPKvIo4obVW5dJgUZBWPea+tqfhqI6LpnYirS0G+UNio5BmlX2fgXMAwUaDwaxhRKMqU3auXJhMWkaPBL1wqlRLTw2XdjGHN6y3hDrGoFZyopyZrqNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394799; c=relaxed/simple;
	bh=S1EkaU7CuKKVG2Q/ekdC1+jPTZxizQdSNp8Wl3uI1PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/y1Q+I5ne+4N/xSqbyWMDrJIQYEP12Gz5xqD8oJxNvfaeLuhDvMuGm+NZtCs1ozF7Jie+ACLmeTXwn0xuNXiHv5NmFKwBnvjtwK1pou+b202kjrrsgE9V+bhZSaQGtGoZ/FRb/Een36mo2Gd+DMJJ8kTiYKqSN2O+F15s09FHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=En6BC+r/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="En6BC+r/"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso6001446f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 10:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784394794; x=1784999594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dz0c3FdjcpiuVW6oJCLp53OXHtRByQkKkOIjTcIPnr8=;
        b=En6BC+r/r7iTn0hqReJF45m1aQJ5nKgYEMC/Gysd5sm2qO6HYXOlNGZrhQWJ8LRPT5
         WaUzdJ7Gd671Nwz320hoymlKgH8ZgaSHWX94HBsY5QEm7PfYbNYdj598TNU3loPbKep0
         5rhCVTl02BLCwT0vEHTflKZFBX7uGiUye2VHKpuK8oZPAEuqRtJPyiU7QwxOCQn406qm
         0HxqQWLG+KOF6RxaCNvUXXXRgqDc1jj6Ab2mP5WSe38zI5AkuDIG97RC9YH2HLuQJ1lJ
         kR8YPg/Fw0Rgo1WoPY+la7IQY9e9N39q80VzN1qRkiqx1zeN880LZExQrmciDu9GlidI
         ui3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784394794; x=1784999594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz0c3FdjcpiuVW6oJCLp53OXHtRByQkKkOIjTcIPnr8=;
        b=RzZvuVVhy6wcj/NbJgWe3ekYKx5z5Ie2XMSS5FyOnvsmsuwZYpPjRnDsQVrUkj7CLN
         jos3uIzd6cjC9jLyNPeg/RQGV6XNFmErGLMEmXj5i54BiLSyygV5SqAxpwKbgbVVE2Qu
         a4UKsg1Syf6cIejmAlXvm0nzCARlm0Mv0MnP3CGiiLXn8biT70vvEWQ8VGKQKZ5Yrw6W
         s+NGSCR9lwih4O0G+8WgVK9RNgQ2rzBR3iOHJ8Qaz3oklPIgnKa5jU2SiEI+tI2Ky31K
         vLLZCGRNBhRtzgqK0Av+9I4WS655K8ARyhejWsnbceskv4Wqyo9VV7dJrDvBA0HLZMox
         OWuA==
X-Gm-Message-State: AOJu0YxCczQAYt7sj+AYr3LMcASADhgwEs7PnU9c5t7tslhSca6EC54E
	oqcTw514BS0E7Wau5YXyEK+dTHJIuumdJI0M2FXPxdGy6LFc8Ebu6CJKh5XU7kKh9AReAHqyZl2
	lDqyb
X-Gm-Gg: AfdE7cnV9rFWjis8iBKc0dZYH0kMcmR8he2OUooZcdFlcINZeNQmkMhC8KLYnVXhUYn
	CPYZVn9Yglg0+14xMK5NlL4JlX2ZRP7dfg8hcPEF078UWeXffog4+WZWEKanQCATLd0LcEYPe4M
	0otaydv+grp3Xioq5TFw61res6qADhINtliT/k80+vRCOUgAfj24AJfqqRodJEQVmPgshkBHr0P
	7SHtcpB6sMYT0Z9OSO5LGm38a817UtHp8cAW2eh71BugGY869j5kon4iD996jqcZR2H8YMEDBQH
	llwxY61KmTYuiDgyUu1nOwU3yocszx8ye+oJxb5AHmhTqNo8tbrDlox+6dA9ib7uQeUDyJ6xboT
	7696VD/h9Tza29iJihYV9pmO3NtHoU9xUWyhjSWkTLjm55929k4BiCv/YsSZoym3rjaechCyGwi
	DYGbZYneg=
X-Received: by 2002:a05:6000:2c0e:b0:475:f0f0:9f05 with SMTP id ffacd0b85a97d-47f62354cf7mr8694373f8f.60.1784394793595;
        Sat, 18 Jul 2026 10:13:13 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63ec7c69sm14475730f8f.17.2026.07.18.10.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:13:12 -0700 (PDT)
Date: Sat, 18 Jul 2026 19:13:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Brian Masney <bmasney@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: clk maintenance [Was: Re: [PATCH v1] clk: Use named initializers for
 platform_device_id arrays]
Message-ID: <aluuES750vojgH3q@monoceros>
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
 <aln6H4A2QTO9w3Rq@monoceros>
 <alpC8l8qPFL955ZB@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ymeazdwlkd7ixoj"
Content-Disposition: inline
In-Reply-To: <alpC8l8qPFL955ZB@redhat.com>


--4ymeazdwlkd7ixoj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: clk maintenance [Was: Re: [PATCH v1] clk: Use named initializers for
 platform_device_id arrays]
MIME-Version: 1.0

Hello Brian, Michael and Stephen,

[I trimmed recipients as the new topic isn't related only to my patch
under discussion in this thread.]

On Fri, Jul 17, 2026 at 10:57:54AM -0400, Brian Masney wrote:
> On Fri, Jul 17, 2026 at 11:51:17AM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Do you still have it on your radar?
>=20
> I sent Stephen a pull on June 29th for stuff that I felt was missed during
> the last merge window and I included 4 of your patches in that pull:
>=20
> https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/T/#u
>=20
> I haven't heard from Stephen yet. There's 2-3 other pulls waiting as
> well.

I only occasionally have clk patches, but my impression is that getting
feedback takes quite long and without Brian's efforts also things would
get lost. (Thanks Brian for picking up my stuff!)

Looking at the current maintainers:

	$ git log --format=3Dfuller --since 2026-01-01 next-20260717 drivers/clk |=
 grep -E 'Boyd|Turquette' | sort | uniq -c
	      8     Acked-by: Stephen Boyd <sboyd@kernel.org>
	     28 Author:     Stephen Boyd <sboyd@kernel.org>
	      3     Cc: Michael Turquette <mturquette@baylibre.com>
	      3     Cc: Stephen Boyd <sboyd@kernel.org>
	     81 Commit:     Stephen Boyd <sboyd@kernel.org>
	      1     Pull clk fix from Stephen Boyd:
	      3     Pull clk updates from Stephen Boyd:
	     54     Signed-off-by: Stephen Boyd <sboyd@kernel.org>
	linux$ git log --format=3Doneline --since 2026-01-01 next-20260717 drivers=
/clk | wc -l
	453

(Maybe that is because Stephen cares for the core mostly and arch
maintainers merge stuff about their clks themselves?)

The last commit where Michael Turquette was actively involved is from
2021 (a331659e32718b31f3a304d7797a77d31610468c) which is also the last
mail from him on the clk list (see
https://lore.kernel.org/linux-clk/?q=3Df%3ATurquette).

I only observe from the side line, but with the relevance of the clk
subsystem I feel maintenance is underpowered today.

Is it time for Michael to step down? Would Brian be ready to become a
full maintainer? Is there a need for more reviewers? Any volunteers to
step up?

Best regards
Uwe

--4ymeazdwlkd7ixoj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpbtCQACgkQj4D7WH0S
/k7fOggAk+XBwBlFxb4/3QNHCeJJQV4i8X5Fd7vmHsTgUI6Ee1GsGkCVCiUmvzFL
IIGYDwXnUMLbyGXPNyc9UQW7QGcvBZ0tGY/xA3nB7X7Fr5MjMq+3jc2s17Pa1MM1
3zRFCjgRpUzyK/eDUspla5mWjbnvEBFnttEEFsnOLovzDIziCF80Zb8zbXNFCAsh
PhPdWH2oV5o7aOR9OQB2lTQ19PmNcXbpDMy6I5qVj9vy2gixXfknPHmVqPRJrM41
wNSBBu1qvUza6OofpxwpH4pMXQj0+SVWnBdrhT6+XEFmvWDrmDtemMgTaOLR5x2i
PiV+CzrbIeF9rGOOspsPnoAi2TsUiA==
=hsDu
-----END PGP SIGNATURE-----

--4ymeazdwlkd7ixoj--
