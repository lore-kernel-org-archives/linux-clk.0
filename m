Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526381;
	b=O3YDNbDW76oRNAcLReOFn8XSGhar8WFzTdLQv26sfmLWy3Kg3kfbxCWav6uXbmQjWjCY
	 bTOj1mBBJICE4jvDyyMkv87mo9J8OnIycHRHUr3x4usza92cdhotTC0wO9O5nQgfhhXMn
	 74uAmeNmWqrXsBb8U1xkv4z5oIj2voQZk1S0rNTxSwN8RW6XJBwvH5vqxuzJDv9Po8y6Y
	 JOiX2m5bVw36K4VOidVVCcg8lYMdX1mB0Fax688644lUiSPd6G9RHsg6rjmE08J1kkjlF
	 u1Vvb0zGTQagnvcL9zS0AXneuCW+oMCOYL9hbgNZqS3Y2p3vK1f/sRpeeNkFM26nM+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
	b=1rDFgpLOkGVIfGVkTr/yAyZYerSXaFVAEhZR+eqVQOs1+4bk7Ws+3+G748zLww8vrXCn
	 UK6W3U7e+rSRUr3Z42SM6HQmMD89Q7gpSgIlqPNc/2VFl8hEdkO3S6AVKFRF9zCc39mRQ
	 K7WR2lDLsGu4yzka6b0YFZ04lmvXdUp4ZFT3coUppV/BUi9r0UoGBhTyserQuFD6sf9UC
	 7U2v2Zb9foER67+ZFCeQd0jgwAAAA6qjm6v6MabUyRfKTRzihCtZSJCEru15bihdzGk5r
	 JF/uTIRk0g6eLyChC4FOXUWTmSPF24rxTuStWAYl5XLxNi/VOl6Q/xzhn5wVsaKzs9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eBYWubu2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CFF606A32C
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CFF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eBYWubu2
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so4640156a12.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795526378; cv=none;
        d=google.com; s=arc-20260327;
        b=YC3LVQ/lD1eDkDVoQov54RIV33GE7lBd9uNWbqQQXjZHzqDJUv/eRZyOzG1Pkiozbb
         RhZzzF8u+pgxP04edzM8XjUs8DmJj0NaGHu5dM+j1zjMxYsdYEbTUz3G8TQT9kv3Buhq
         5pHvxuqdT2BjKXA5nFgRYPPRXpoio8+/Ia/brtSaAvoLta1YsK/YElKPq0sQaS3LKQQE
         CaJAv6xd2xfyFlMTrLAwWjlHvxZt77veq+zXzRKWgu3x4Yfghyk873t0L5vhkfg2Z85c
         hPUeKg3rxCeXV30xqQelv3cIKHghyFWqSQSNKGQMHkX1DA5OkSwSchDzmKsJskrawyx4
         Ymtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        fh=8tHToNizjtgV2yd+jPUTCkiJ/X9tXKzo4mlpAC22dH8=;
        b=IVQQDNyHJoUucpsemt/qLblFkQEczuQ7IOFEbwiZxDPYWH3NuYziW1idsXCpp6tjuI
         CTwqunCyRRzSQCgWs/6ZXbLZMaZoM2V3VUc1y+pmUxwaEQnKzgn8p/dRipwTfkeFdi8n
         fhut0TxazgVN4gTCf185ahHGAmezyiJuYtxNsMcpqNncgFKOa9RUwoRosqxqPESXjzCf
         IVBa8C4FmwR4sB09QBaEe7BGeKUN+v0/KDmnwFRTWYzVq4tBV4IfMgS9joMp6celujFT
         93XLvzRV4cJodqNRM5OKgAkxK9wZQYqWhVS0aFTJ4s84doM4nZUm7J6xU5ajyz4JrZp7
         u5ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795526378; x=1796131178; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=eBYWubu2GiEXhpZu6NdOBq+vSwbV2FWVHzzO6RCiBLF3DvcP2g1JrmnU+BQv3R0zGN
         kvvTgrQIAxANAxro5Oi4eaxN11YT4WSo0OGv3sRSFgIFtpq2En16+JONirIcUEETALNQ
         lRVCNoT0kNT2qPFD2IWuVCxhrYBnh5jAlemWaTyIE7hEjR7KV8NybKjN0kUWJdA+sB4w
         QCdLvsMub7B5jXdqoCYHrijtJ+6czKn3vhUqvkpfWmPyXwN3GWPgW6exGBFya7/YtS85
         mfcSZbYjUeSYDWzqhY5Mvgb5gdQiAC4XUEToNNz56GmU6lGixrXnDd5LM/7NDwcPiHOn
         69aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526378; x=1796131178;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=DLMh/cv/RoLlXpkDVpzQ80gMO1NGjwpAQoDgvHuoBJ2SlQAKrpJ6UbdP3Ncf0NbA6v
         vKMkp8Nq8ds8V4rc1tZW1xyYdWkOqv4N994nxJgLu1rcnWbJHejBugRLnR4q905EmCdG
         YZfv8QOP9n3Glasz7AI3oMcGkPXWl6LPQdQJqwH5CQjxUY3GgKlFHvd73VQ120NEVa0P
         GZjPHrS7VmF5B+6u+xBiQQmz+5kfe87J3ixHrgYn/Az4IoE394nQHhI3gG41VHEHE7aE
         hEuP/MKhU+c1F8yb44L7V1Dzq5Pli3uzzGGUCFuGDTvjxPWRu0jpFolTNyx4ixrQMedA
         pGpQ==
X-Forwarded-Encrypted: i=1; AL+hErHC8r3c8Tc93oBW2s6gXyMnVgzwQSBCGEm8lfYaOnKGfYyJgtKWeyw/i/kw6VaMaA8vmB2PZqQpoRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jpADSkH207REDHRWYQbuS93uVNKDCgU2ScbBIfZTvDDKRUzRs
	gd2tYvBmu13qaON37fkVcwUg+bvR0w9ivxwtHi9lUyAXiTQprloIq5XzIUSr1q3urflOA0PgQfP
	KB69MYx+07P7OmGgEbGuw8i+mwy4QjipbhGqniShrZA==
X-Gm-Gg: AZFdTZc1pdVStFGgRVzWtapqMm3tAL96We+t32przcEAEmosjAAcrqUYfQucQzu30WO
	5oXEwFeY7ZLBRQXrQ0pSLJ0vWM2sl1qDcQ80PZBtr+oOKuSjKn04nygnpzirXjkHWvGP8iNGgXi
	9FXm0CGZf6ibBBgE1Oa1lVb1pTua+nAscnu/l1fyVOExwxVQpha3AssWxNWHx1qH89g9QW2w7nR
	nSYkOKiAsWiy9gGeixRjYvh2Mg53cUp1ok1KU3yZu8LdCzXbdPUf4mbufiKffEYy2fMXG9HSosx
	4f2+XM1HNyZFLHjPRsBZYB+2/Xd2Wp1CM2TuUOZsIteXXkeeB6Wg0UnLmlKGHHei49sKDo/mm7q
	ny7gGsmByMOKevbGWzv/hdK/0FNPKmfda4SD6T/LsLFlnVnCk6bAyPagc
X-Received: by 2002:a05:6402:1596:b0:6bb:6c8:c4d2 with SMTP id
 4fb4d7f45d1cf-6bb06c8ce30mr940474a12.31.1795526378188; Tue, 24 Nov 2026
 05:19:38 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 13:19:24 +0000
X-Gm-Features: Aa3M54ooVkb3f-H5oJfKOqKUsi4VT1Jkh00xU7wD3yuOn0cj9WC5t6c3w4KgoWc
Message-ID: <CADrjBPojS5tSJw+7E99AYec6NY46QLcM6iv=i3xodNJvvxKJRg@mail.gmail.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
>
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
>
> The Application Processor communicates with CPM over a pair of mailbox
> channels. CPM provides clock, power-domain, reset, and interrupt
> services.
>
> This series adds device tree bindings, DTS, and drivers to support CPM,
> and several of the basic services provided by CPM. These services are a
> minimal set needed to bootstrap many other components on the SoC --
> e.g., I have a working proof-of-concept PCIe driver running on top of
> this series + pinctrl (not included here). CPM provides some other
> components not yet included in this series (e.g., PMIC, RTC).
>
> This series depends on the bindings and mailbox-payload-definitions from
> this series:
>
>   https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
>   [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
>
> So this series cannot be applied as-is yet. However, v1 of that series
> was under review for about 3 months, so I'd like to at least:
>
>   1) demonstrate its clients (this came up at
>      https://lore.kernel.org/all/CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com/,
>      for one); and
>
>   2) start review for anything that isn't significantly impacted by
>      potential changes in the above mailbox series.
>
> With luck, the general design and DT bindings don't need to change, but
> even if so, I expect any changes should not significantly affect:
>
>  (a) the CPM DT binding or DTS (apart from #mbox-cells)
>
>  (b) the CPM interface (cpm_request_client(), cpm_send_message())
>
>  (c) any of the CPM clients (irqchip, reset, clk, pmdomain)
>
> Thus, I think this falls somewhere between "PATCH" and "RFC".
>
> This series has been tested on a Pixel 10 Pro XL (a.k.a., Mustang) both
> as-is (plus the aforementioned mailbox patches), and also with minimal
> additional local patches to get other components running on top
> (pinctrl, PCIe, RTC), to prove out some more realistic use cases.
>
> - Brian

FWIW, I tested this series, plus Doug's mailbox series on my Blazer
and Frankel devices. It was enough to see USB come to life as a gadget
using the already in-tree tensor USB glue and phy drivers (see patch
here https://gitlab.com/LinaroLtd/googlelt/linuxlt/-/commit/b7866f74743fd6828036bae570ca6d022e23c4ff)

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)

Regarding merging the dts/dtsi (arch/arm64/boot/dts/google) and
(drivers/soc/google) parts can go via my Tensor SoC tree. We will
likely need an immutable branch for driver/soc/google part to base the
other drivers off.

regards,

Peter
