Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F938BDD3
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303856; cv=none; b=JeQcfY7JpRdLzBc1h/D/zaKxMA6cIsblO2/I57VKoyuR2ICgl677tGXncuV65lCQD3Z16C1rILwE9bDvYqw59SDaMBqA7+N8MO61445XNuoDWXLPhj5hYXGMemGyR+ec25erqfKUBnBih9gS1UUNXsWIpcgurYRcgc0+axsAFoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303856; c=relaxed/simple;
	bh=f4wVU9QaczKT/9p32vT2mvG6pfkyMA13UZGXDs37Bbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bQSto7HaFIPzO1GCj11OvcSOxmaxfnQa1zXoEdk/UFAou7BMdD+jHYz9MD5OC8c5ktvCyDjqkGpCUiJNs5n+yiUGSr3GtZA/mMfX7LujH8pTfL4rF62cS5kGtlc4XUyJNkvosAqTu6hGPZvkalkRPozRrvPhJDJU2c8fbuu+jpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypiZBYLJ; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypiZBYLJ"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso9571457eec.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 03:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768303853; x=1768908653; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f4wVU9QaczKT/9p32vT2mvG6pfkyMA13UZGXDs37Bbs=;
        b=ypiZBYLJwq4M61y/wA3xFHM25YVqCiYHbmqaVnS/UQwheMZI2xbR9i3AKLbSwNVj6j
         t7xOHInIbvA4VQ2NB/2OCtrlwqpkXuSTBOG+Hbi6Ctt+SO/u9swUACxHJbqWN+v/BhsL
         Q7ovqaNQyVDLLFTg6e2ly+RaAr/Yq6zeIeSfBq5FywtC2EKoAYoWTxXjuDekTBWHNoCE
         3osTqAeAtdXugZAzSDZzbNeCe8ii6Pw6MWKOlkXdEF+ZMAWV/07XMFXGTa+CX8dY4Pll
         /gII+WoWN3Eq1suql8MfTa7gl3UX+zyNJoB02iaATV4hIblqcb33Ayuk0EiXFDNZVOul
         xaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303853; x=1768908653;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4wVU9QaczKT/9p32vT2mvG6pfkyMA13UZGXDs37Bbs=;
        b=Sobs6CLdKit18U0cD1C+fcZdE0vZCS1nnyMaUpVcTJqEu8RHp4LEx9JJqAJGxlIwnT
         A5b2HJ45qwvlSQkEkW2O9G5XIoFWPgZ+WbdCScr4R/Gntjnve8LQ3SR4CywEpkbGac6n
         ps+j0FTyVupORyKJPsXKIQjI7GqNMQ2+kcyQSbRhTyKmaSymCX0+XvARG8Sh37Z5mhb2
         E7001lDxUtQgvRGf4Woxp4/g4Rrw0wTdw40/MMP3BCmeNQS9rqsQxmYufKY7Y/ZLoI48
         kt04TclZY+0QergvckQ/UFiLbbB/hq1i6t6NjAGltuiCnOFeSuLKWdv1mxxKM3znonQ0
         tZzg==
X-Forwarded-Encrypted: i=1; AJvYcCWsYTMGForK1HtX9xePMFhA50Jr+PuQLyDQn5lQhEJaUI/epnq1pfcfmWwovdiwIB08BytWj3kOPvU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9kJgWR0SM65/KiRfnjtRzxOTqdX6U4ar/MkOB9uPtVzv7fRQ
	zrVt0aD458lxH8tggnSjcNTR9CbfOR7P976aixwQI9woQad6ucW3DogfO8Ker0eGZH8=
X-Gm-Gg: AY/fxX7bMTKYeZQMwvVZuy3eeJD13A83uq0S7RWyraaET3NNe3O9+zPJ0C1PdKLKIJR
	apCxmM9OE09rcPwMsENd8eqbnrFTJEQxAWWKNm/33eBwjjCaMzswXC+ds8ns5GLwbnfQfkOZg4R
	4/AUjqWBTFL5KYIsnDFAGHUT1l/cWHZEaKXWtey2XCiTl8n9gvsRV0z4ncy6N37mYy9kvpGmEpy
	hg2cKqkoTDtd4AtaBdoXVUunLM6zzXFfL6HKDWgZMRGf2G596oKSnf9pmf+JHs1rPv7A8krEKYo
	3K9B6vJ1f+WyannbeNpOHh2SPmhum8xAx3FMnlH/+4gBBv7PIqb/tZv0al6rO8N0bFFpnJMyU2T
	BEoqYVclMV9u2Gkaqv+diWb7cSvgRwnyvOkUqefGNkijiyV6TNbyeJZoP+qMrkMkkHWlyPICXkv
	0QQWfPF9HwjJRoA3GacOfoybvSjDM=
X-Google-Smtp-Source: AGHT+IE2PQGkBRDHh0wt/RR1JmU3vgEQYzdNyA0r5cB4mfroq+TTyqSFY3sc0gpnweUJAe3hVTED4Q==
X-Received: by 2002:a05:7300:cb07:b0:2b0:3d03:37d4 with SMTP id 5a478bee46e88-2b17d1e4d38mr24451146eec.3.1768303852511;
        Tue, 13 Jan 2026 03:30:52 -0800 (PST)
Received: from draszik.lan ([212.129.80.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078d9b1sm19000610eec.18.2026.01.13.03.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:30:52 -0800 (PST)
Message-ID: <ca6de8e5aa0dbd99c74481a9dba9ea9f1ac61a1f.camel@linaro.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Tue, 13 Jan 2026 11:31:28 +0000
In-Reply-To: <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
	 <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-13 at 10:58 +0000, Peter Griffin wrote:
> Add dt schema documentation and clock IDs for the Display Process Unit
> (DPU) clock management unit (CMU). This CMU feeds IPs such as image scale=
r,
> enhancer and compressor.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3
> =C2=A0- alphanumeric in gs101.h header (Andre)
> Changes in v2
> =C2=A0- alphanumeric placement (Krzysztof)
> ---
> =C2=A0.../bindings/clock/google,gs101-clock.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++++++++++++
> =C2=A0include/dt-bindings/clock/google,gs101.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 ++++++++++++++++++++++
> =C2=A02 files changed, 55 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
