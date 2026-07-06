Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B5144212A
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332976; cv=none; b=dgIWQPJP35ZFdh47AWJa1/5Oo05QTnGSJoPJO1TajxYj4jZlYK0s2GqF8c0+tC/wX9DEJQkLc2EZYqwsWjwnr/4dTpteeRC7IRLWMXARm4oiZ21etvQKx6QHuDNl1Ci/xept8vQ8q63hq99gnlHTVk18UE58+tYsA9gA2BYkD/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332976; c=relaxed/simple;
	bh=OuqZyyZKufM5tKG1k1Tw0fhDCDN6LUhX/VwEzqtgzzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiMi54mzTe7hgIvpQCXiwsiY1+ngnjyrFq/EwSMG2ZvEBL8zefCbWZ/oNxvjFnn/PQH0pugZVjtSPd5mZ1hJlwYDqEtsCpljsZTfxnoBNk21WACIP4jAGuib8SXFiEag/ghWZshhIeV9EnsrSezxOAjBztqZrCUeDoIRy3gsiMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cae1a3a744so20622055ad.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 03:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332974; x=1783937774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Avfylhoyx5tqif2j0s7EGdPplSscPo8mEJ2UKFsFj5Y=;
        b=e3u1BBjfE2zmDG6XGCyRojma2QfFQwyE4t6eHFIDmgDCu7+XqSNcmE5WAWo/mn7OiN
         9kWwBelLykasZfKibOqMEaSOMbk0JdSyJVJRjsMX8wH21qTP9GHiKyimGqnCkb7pTGOe
         cfdZBEnsMvnyJUWWiu/QFp9a5qgzygPJ6Amx/Iwx1bnG34Tfi0uroIBAMa/k2lnXhUCo
         ihpo7nRrQKHLjh5j4ywvUwoPpdZNn2vnuYyDXxSr4vQ0a1ulWZ7vnSGYG4MrZZrXvzc0
         Gm5qD6QxvrIqRR6QXPQhW8oGmCcMnsaPi2C28HywjAFhQN35jFbULYqndbwI64sNJgJ7
         mD8Q==
X-Forwarded-Encrypted: i=1; AHgh+RptnoMC3tVG6iC+mUY5d4QAQOlXEMs+cr6ZnCcpuHZFXwLEOUd27/tcgAjkKMbM6IAL519kajEfvFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWcS5sJ+/c/iotItkma/vLXZse2PpoeBhza9LQsBBI1mRuOM+y
	kDTGoUlSPV0rqY285ITbR+wKcJFO80+XQEo3BJMR6qEsqs6ijw3bd3SC6aaIM+hT
X-Gm-Gg: AfdE7ckLTCL5vD3FTpk0fLzAnoriWRx8Ui6lyIXUHaKGGko+/3jkKQCtRefaVLF6jCP
	OmJluNmcO+KSA/MxUV4VGRPXcUHHk92FkiqfaLZrlkjZQZOyHaiagG6DBzOFN5j9H3AV37U2ulR
	eB/+L5EUkYK0QGtuoAc3H6uaOKKLviUUzHAuI1DzdDWW8TFAdiBB+8+rmnSDt3/2Z/jk0ecX+I1
	IIGWIYZ+3HVa1PRYyOwC1AZq3uxA/0cEbwBLKQQRwGiTr3imuOn4cMuLaVEq6MLPZ27rzA9L8Tc
	Q8BQ5xRDoDC/EJO9sioWxl5KQAs6BESSnmv96zqY6B3crmAVpd5hUJpxEyD9Vy1MTQ7oK86HZNA
	gEbLoCFgVHX0c0Mz/ftKqNAYd7GPiICx07BJpGy+ELBs2Hqqz/dMOtnHtLMtvGXDOw/TRocNttc
	bMkm6LBT0tr1i1iVxhH5ZRP7W83v3M58kLES/JXwT1yJfrG4YRpQ==
X-Received: by 2002:a17:902:db07:b0:2c9:97a7:3289 with SMTP id d9443c01a7336-2cbb9f40fcemr101820325ad.43.1783332974295;
        Mon, 06 Jul 2026 03:16:14 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7870ff3sm46533605ad.58.2026.07.06.03.16.13
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:16:13 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-385b78b44a0so900424a91.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 03:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq5BPEcLsn1k3RwMtaH3G5dcQVUePYz4RGx9RaBAQBLEvUIZrIhX8FnyngJEdtQ/7W7shraAe8WI2g=@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:73e:9fae:5844 with SMTP id
 ada2fe7eead31-7427f7c09f6mr2718808137.27.1783332490185; Mon, 06 Jul 2026
 03:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 12:07:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
X-Gm-Features: AVVi8CfVUZe5-SeycxEAnrifXns0jujcFQ6mtVZEjh3x46p1vCjwJsZir-4zskQ
Message-ID: <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add System Controller (SYSC) regmap support for the RZ/T2H SoC.
>
> The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
> low-power management and access control. These blocks are defined as chil=
d
> nodes within the Clock Pulse Generator (CPG) address space in the device
> tree. Implement support for creating regmaps for these SYSC blocks.
>
> Register the regmap using of_syscon_register_regmap() against the CPG
> device node so that consumers can access SYSC registers via the existing
> syscon phandle.
>
> Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
> initialization of the SYSC regmap.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Made use of for_each_child_of_node_scoped
> - Moved sysc_init() to the end of the probe function

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> +static int r9a09g077_sysc_init(struct device *dev)
> +{
> +       struct device_node *child, *np =3D dev->of_node;

error: unused variable =E2=80=98child=E2=80=99 [-Werror=3Dunused-variable]

No need to resend yet.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
