Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ED5471D16
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758902; cv=pass; b=nqkboHkP5LWS/WPWPR6Ke5CT+7yD8ZjEehvKOyDInC0TjUZGSFO6ATX83plpeaSkreSDlxPyxFPu/YljEYVc/+fASuwxQP9OOF0NHfQf9BaukIa6pbu3FwgATUg48+3cQ0P0TLycFEagSgPeELpJjYwSUfLtjW9vlg4wLjGF7IU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758902; c=relaxed/simple;
	bh=qbQjUe7LqGgZ1fLLEceiU6XcKlk7J9op70NiSeuioXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPJXN7TSRWSVZu5gfqEt3A2biMm6SMGAhCTOMQ6FNcQMLJcNTdwvgZmfFh5mLvs41aboqsjNUH+wr/VwMU4+f+OZA1QhzJxadiU5kn0z+0wAetUY4MppXW4SrpTtxqdDaaAPotVJP1G6gruw2y7Ix6duIGoYDlzrJcHuAVTstyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UhkxKx25; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UhkxKx25"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so5333030d50.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 02:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758899; cv=none;
        d=google.com; s=arc-20260327;
        b=VC0THVRlT0mjvEzRRxh3Yq1JJIGtTMXEzm5JaV7Yk+Ghlw4Zi6ASehMmaTXzgaxMxO
         VLYLxosvQ9lTxvADNJcAuUMFDYcZYf4OiZvIjoGlEyUEJqh13VLdDqDeFFA5ZEhDfDvd
         gaAH/YvGS2Po7Ivft13gWaRUonLvySjYIwGAiDXxG066kOCfi7CIi34LnjBrC2LH82jY
         3jtCK92KO5IGicy4m0MWJLexxM+SEdR5/KbqLvVjv1gxBynywAkxsDev3143707x+xiK
         DnlW2U/u9NAkov72QTQkl78fWb+1XY1eacbJSXKSdwVn14nSkznUjmAeB8gqetpkkmzY
         Jxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        fh=ak2Lpupc/R49FMuYebJLVlMgKQ2jMtkYHPu0ThZ+icw=;
        b=WO5FO9j+D/h+7jXCMMNG0cGJPWHGEzxyDwRIm8FKD00frBs/N3Nd12R4VQeqXF1d+z
         VcX4KPwClU1Pdl+kkAduS++XHu35YUP/wnsIWShowiwyOWlMHZ5VnRbmr2RGjnD/vBmY
         CJITbYHyxdZBQZyiuTFjbriWnQ7IL1QmacTNpkyoKUWaMpDpEwloUgTIINOkIQLhntdQ
         uxsW9JV1hgIrMrEjUgz+UZe7P7Qgw+D0n+SAUN6xm26JVoWjp/VfbcoRgP5TOGD0xXEr
         Anil6pws92bIz7UXBp64MvFaKJLcmqJmCA2O+jQ+/bmYwWKt/NZnCnw4yoe1/j0pUF7t
         W4Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790758899; x=1791363699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        b=UhkxKx25B9IxaUuVdx+KkaznfgbuukEwi0IeBDA4lx7+F9J/pnvx9im6JhJ1qfPMQW
         t+DRKqQrRb+wW4tG/uX7HSmTfdcwN4HNgU/xHE+GjPm2YLlO8xPVsiO31OXiFZw7IzYB
         jNqxoh6zwAKdMDWdHeZhV7DIpv29Y3E0TnAwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758899; x=1791363699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        b=fqhN7mxnatredFR2Q0IyFGx62W4bjhsXBHLanCJoMtDe/uxTvL9UwL11WCie/u4VnB
         Fs4GfkPXGjDt9G/SHv95s9O3akJBeNwIem+/A4v4WjOyyZ4On9CR9dTP48KkgfNR7swV
         pZGmhgPhPlpflDd74jA0FWxTHuOo6EW0nbmXKJFB2wnUy5BRJst0GDsjgOsVNwd7MmjM
         jheNqrHqpLN2KhxPXOvzMqULVtxLIFSy3o6grWHAU1cpvSZTz4G7p9G3UuAgVIuTWIlp
         jEDxwnWW7wITMRt3cefskTERSfELQYSLbk4mUQFzOqIcVLvSzv5PUDMnX3Yw+EzZL9Uk
         vyzQ==
X-Forwarded-Encrypted: i=1; AKwUvBykq7YGrlt1Cqa1v0SoCBjJMMea0dkObmAsPDkdK3XfWlaUKzD2MrzCnZm4UBMGNHASm+QVrJiffE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkudxaA6EMsstUMJXnx2gOBhWDDJkMYk2eiAWavWwpD++7C5BE
	OiUSe5eLIRnl9YhPlH2ijH9/YN+Ub1BDJ6T3IPc226AysndKEayab6aEA8zrVRoTu5/IrgI823W
	s/U3wqWmSeg5/I7LQNSzQtWUn4aI+KP/6o9/mG/UBKg==
X-Gm-Gg: AYBFou01NQjqsHcf5W5iXId3hCwFN4/1fnw9dK0ceWbLVeZvUI66+YBFqwLsSbBMALa
	xoQFuLcEjwQgttSYy/jsgc0h1gECFdfO5tpj5m+5UKdWtiszlltZstOxSSyWmwK39O/vVXCqX+h
	uts8E5joimPqSDWCa1bKQXke56joFLl6rMZUElc7BEz4R1M2AlqGKoToL9XGLizBGxq46e1WmtU
	fr7JDYyA1ZQYs+P+dHgmbj8LKFI5rD9uuZLyJcno89Bcju6N8tBARCKrSlT4689uNvq2McN4LAH
	fJEvDQ03k9rZ3OqBaCbT97QdSHOXNwRySdwh6BQ0k9LkEAqrBOwJTWJ4BnLgwuKWvDpWMcwJK1c
	eMr1XRyMaVFu7RzvikzGDbK88i1+j1bbdREVff+/YseI=
X-Received: by 2002:a05:690e:144c:b0:675:5fec:681d with SMTP id
 956f58d0204a3-6768346ceb9mr330443d50.78.1790758899672; Wed, 30 Sep 2026
 02:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com> <179070048452.199845.10870046832708018931.b4-ty@b4>
In-Reply-To: <179070048452.199845.10870046832708018931.b4-ty@b4>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 30 Sep 2026 11:01:28 +0200
X-Gm-Features: AclHuK_jgSkzAP6aG0bqXQrp3Gg_ntpz85heYxuGMY1RMPkv--ExXYz7UZJOjz0
Message-ID: <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
To: Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Tue, Sep 29, 2026 at 6:48=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
>
> On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > Support spread spectrum clocking for i.MX8M PLLs
> >
> > The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > boards using i.MX8MN and i.MX8MP.
> >
> > While at it, it validates the spread spectrum configuration in the clk
> > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > extension, which converted the spread to the wrong unit.
> >
> > [...]
>
> Applied, thanks!
>
> [2/4] clk: validate spread spectrum configuration
>       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88

Thanks for picking up patch 2/4.

I put the two fixes at the head of the series expecting them to go in toget=
her.
Am I missing something for 1/4?

And how should 3/4 and 4/4 be handled?

Thanks and regards,

Dario
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
