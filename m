Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561E82309AC
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848824; cv=none; b=davCM0PGY+miac8gKle0AYi9+PyXzEOoTgrI1Ba1LvlZSE2F8yBsJOy5yq+fQiaIAResztiQr72WMQjY+syx7VVAWRmILkZCAil65TpQ/WQ2HDoW+j2P/QzpsYVE8903Knd/V3Y4yoHztXaSCcT46WLanKHO4ayigv8pAqESxOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848824; c=relaxed/simple;
	bh=iAUE++zX57tG9v1WvpuDXhxiiEp8IqXCua0qw+tacIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hy6iAoq02Vj76xlJQK4AlldCnnaLunHEd+D3Ds0yk3QFsXw07cFb+n9DtBn6BCjMK6RH/jJkwB0qVoJTFwRDf0AgoSBe+qRYn4qyXVYYuKyd9Vtejmf76i1mBi8evM+zpjUgcLZpzqADsfDQM1PWcgYAH9HG2nS6VmTmWg80PEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=A3OHOGM1; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="A3OHOGM1"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e460717039fso7351479276.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 02:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736848821; x=1737453621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qoa+TnZ+eJVmynifYlg3CNbZeNLJM90IDeQADpEz0bE=;
        b=A3OHOGM1hioM/6ZanI43ED1ZEfu5l4UyqOK+9r09FtA6LZK0N3OwaTISZKFOem0l1j
         IxURnjh9Xt19GsB5uKZfNuX7ssi/GjxK7lc4qxMlcKawC6FqGuEeYDBPrFWDTAw4Htxr
         Resi2pAgLYXJvVdSo5OYHRlsIPp6R4UHRHhFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848821; x=1737453621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qoa+TnZ+eJVmynifYlg3CNbZeNLJM90IDeQADpEz0bE=;
        b=bidXz9AM0W4bbgzT6vLEco7hgr7OOYD7KtaylmqrU9rmgkmwbAPJK54Ad5gljk+Z/T
         P2VFPsZxK0n8KuIsxLFjmPemjSIr515Ygbkz/eh+bA2YVADAAJZ1PRkRVEzYgyMZJ0pf
         ydANyWjelLebF7lKCev+Qubgh0j5iOO8EuD9kqt9uG+Ep9nixJreR8wlrrVbt2NW7dnn
         8w6y2OH4QNEGBW7JDb4aS78V0ceh7u3gSBw0rJvr4kjvu3Xe5EL0yVYgMj3K+Ho9YWFc
         gFvL9BZ3ShMVPWyQeNkXEZJc32TEXYYlc/kwrxtWeFMNDrOLvJen4iPz46QLkAYLxafv
         Jq9g==
X-Forwarded-Encrypted: i=1; AJvYcCW5EoKDIsvMfpUCffljoYxTiWnWh3b+jn1rkqVkusCfV9GJOrrViJ/NrYmtomMyuNZpuY37NqdNHeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHDbOAA82XHtyqW6V4zE3LUmQpT2p3jP0LEqzXggY3Cd4F1/Lx
	7nNd4N6zVkHKiEmhheG0ZzKUtCdWhZ2vl8mx4Rp1dBeEYNP+RVghrE2y3hm+OC9X4dkgcxdmxr4
	s15AMxCdR81gMOW+5D7qjf70gLC2nspGvU8hfIw==
X-Gm-Gg: ASbGncsBqg3if72zvghqf3Cq3GIHdCW+fVoO4VCZb6R0y5kUFnJ0nLFUyBC9blqiPMN
	qprVKS3peh42JFpp+Bn8hf3iiJurQFOw5Hs48
X-Google-Smtp-Source: AGHT+IHHg2Sovq+Z/vvKo0y9q781hVUrhXP9TC8xIJIu4TiqIQanvvQOUqy3tbZsmXEZ8ARVy4PjE9+PGPJyEEUoEwE=
X-Received: by 2002:a25:53c9:0:b0:e4a:fc25:30cb with SMTP id
 3f1490d57ef6-e54ee2345d5mr13391673276.46.1736848819839; Tue, 14 Jan 2025
 02:00:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org> <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
In-Reply-To: <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 11:00:09 +0100
X-Gm-Features: AbW1kvb-e25fGlxc4UPaUwDS8MpzQn87D6z9dSdnvOHiAHJ_tEcZc2pAxesQjxU
Message-ID: <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 10:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 14/01/2025 10:36, Dario Binacchi wrote:
> >> Nothing improved here.
> >
> > In my humble opinion, there is nothing to improve. Any modification
> > made causes the tests to fail.
> >
> > $ git grep st,stm32f746-rcc arch/
> > arch/arm/boot/dts/st/stm32f746.dtsi:                    compatible =3D
> > "st,stm32f746-rcc", "st,stm32-rcc";
> > arch/arm/boot/dts/st/stm32f769-disco.dts:       compatible =3D
> > "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
> >
> > Or am I missing something?
>
> How can I know what you are missing if you do not show the code?

Sorry, but I still can't understand. I run multiple tests, trying to
modify things
based on what I understood of your suggestions, but the tests failed
every time.

Could you kindly provide an example of what you'd like me to do?

Thanks and regards,
Dario
>
> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
