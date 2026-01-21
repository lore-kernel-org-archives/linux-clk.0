Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6944ADDB2
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014665; cv=pass; b=QRzavgCRheeQM7I2PjztbtVNuUnGbijl76gxO+2iRfLGIG0FoV1w3tAIM2bUOIRM0Qx96X0/Ru7cdiG86VqKsOu0wynVoWr/IO6iFVQwaaPNL6bMFb5oN1fLEoVhXmNKaEU24uosEAIrhhAZ6RR/UsDxfXgfV9lWNuVYtnJhnUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014665; c=relaxed/simple;
	bh=n9LGtCCoNWJYT6s8g8s+u64o/APoDWxPMT01RQqJz/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gfzwb6w0jiIVnEoXcH+FYF4r06wUzIK8aKqebq2gT7m6bTLbbG7c1MjA7TPU0ViZS1/iBaX8xy+peuNuUJ6uLMqa6ccrKN7ybh2zwfwUAT0XY1bGWP4+otyPVtVaz4Mfx1xFUPhX43FCEX0kZI56nnaOlHQIGoZgqYUSRLAQUgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKz09Hgl; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKz09Hgl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801bbbdb4aso8656905e9.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 08:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769014660; cv=none;
        d=google.com; s=arc-20240605;
        b=WuFQ0EUGEoZs11fCnkjD6WSAqQcwOE+iyYzQS6JDMVa+u2/SkC29t4RRHXeYLyT9J5
         KTjg4oMzBp8mWEJlEg+wX8A6O2nUpJsF/ir+AE6BuimHxUiVH4xwtz2HCgxMdCAeXg7R
         RtAmIL4hTbiibok9EitBIH9CA1pZsdOk0jhru7q08BTFtlqWZQcbcTzDPtQZbCuDeQPV
         VzAntxn8yihhCEMh/FFhE12BKt0FA/ocNtmPfbFhovIy8n/QwnItWxCkZCSAibPYjwu4
         XhMUWoDRmyUbQpOOR8zdxwcyImVJgK08lPuIi4QDFvIs62qbz8kJBDZGcRsfciLCCoq4
         06PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bnUdOq88S5jzPpVoyj19K4zXbAbMVOiRE4Y/7ikog0w=;
        fh=N9VxRljhUINZC/dqapPUt6MZYzEYpzWEJ8l/n3t6a+4=;
        b=f7pz0XRuDsXgGDXndtmt8tLiSs5JmGtvV7E7Adf0be2jDQJhsI4c21IOYrxXpwrlP+
         oM6uxbFScO5ohlzwHxifRfXe75SMZiifHVk8bcBIFPYFp2yikGMBnQUInRp2I3G/NkAG
         6EE7gz9tGzSHdiH180CwzL0I9DdMHVLWfUw7VtQGIF6VXpHmuUqqQsZjA0MNE3QEfkgs
         8pKJQRDxJ8Kegmeub1X348SAbO/FvMeBSJNUiVvGKEZ/UKlHH61gMB8oSVILBH2Mcjxl
         H95BLlOOxVrmvr6QKKwE/br1mK658QGdZ5yMSD1xIfKB5jRy0tFAw9+P8D4MdyK7AQ9a
         D+Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769014660; x=1769619460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnUdOq88S5jzPpVoyj19K4zXbAbMVOiRE4Y/7ikog0w=;
        b=BKz09Hgl3lIelVXmMkIqX51HjoGjTyR2dhIE4AhhoglxZ5zn1Y4dJ2dkNgJw9DHpXc
         40UJVULiUxwCH5WMZqOlaaTf+OswEQUN7TDnLsay4Aqkcw6CFtLmKix+5lIzoHtk79kv
         qZggeVrVpC3hWqBlMM5K9hpgyut79Gv0uTDHyvEyh/idpZrBMDRaYsFDxolodney3tKA
         AzrHabBYwzjNEeEWJcw7KMhybgAx+OvE7ex3wTPfqgHiuBHjtx//INyhBmaTNJOATNr/
         5PzIGGAio2YjyEaRFSIMoZINuWMERWCxVO6tlMZnScnM0P/DTqhbJN3hWqYk+l/nLjUI
         BH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014660; x=1769619460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bnUdOq88S5jzPpVoyj19K4zXbAbMVOiRE4Y/7ikog0w=;
        b=RN7TPzOZSXecn55DH+r+hzaxGu8ypOJ/k8vrLXY+mZp7aIqBL4GJ6mwjOU8YdYn6Hc
         qqeUhwy31e3fZPC5ubnOFtrjbizldOwDvPxy35S82Bzu1G7WoxEgUvJQTOgmSC7PFMeq
         K8i27AnX9Gpu4JIuK33oLqpIqrLesQ5yFwPzZwN6cazKN34VlZoL3lPbvkMtGHaBgTt/
         MP8XdlZ2yOxRq/ghB/OlxcueqT1XcKhMd8BCy/O1uvrZ/HJeaTebybXJw2vWCAN8hf+L
         3hK6hRnnmc8nRjS3PCsBEXNYkQP8hJp6zMxRgT07uJx+q8ExpoeoRQpy7o4jLWN2Swld
         GHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3KC6gTq1lwFfOoXEZXllWSmTF3N3XFHwWtBQ9juTaEadHcfmHIiOpoTU55aOGdKWJ8RYKe7A6BA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+9xIJP0/rgBirujgvxbLP6dTmYM7BlbFK/sOF58rx0XvIeqqw
	yCdVhxT5J7ITsbw69dgMMnwVQUyxVvSbZuVyrEax9cZhvaHXP/81Z2/ttuZf+82Gi+hRdoRrO+V
	zyRQKN2UMfBoQDFRi1n3m9EYDlrfMhPU=
X-Gm-Gg: AZuq6aKP4vEOyZKUk1b93R8mMhixj9cJA1y6VIPYIqwAuiAvrHvmuYEQkntkagIKqds
	loSGSrWYi3shgcpC5iP7Rrn4eJdEm7M5/fwBpA5wcgeW3UD1NahfVBY29O7ibjtdFFODJ9qSxn0
	2+Lp6A++6pprrK26UOBI0HJ7z7FyIztFXZitmMqseFAHS1OuV/xEir1Xc30pwlBDuz79Sk/9Td6
	VCtB8pC15k5/VhWv5XlRP+tczl6VTVt82FAoUc4VFcTlW+1s+T6mJSR6wxunlokWDmFJGMP
X-Received: by 2002:a5d:64c4:0:b0:435:9144:13fe with SMTP id
 ffacd0b85a97d-435a5ff8c0fmr101536f8f.26.1769014660302; Wed, 21 Jan 2026
 08:57:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125120559.158860-1-clamor95@gmail.com> <20251125120559.158860-12-clamor95@gmail.com>
 <4370037.mvXUDI8C0e@senjougahara>
In-Reply-To: <4370037.mvXUDI8C0e@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 21 Jan 2026 18:57:29 +0200
X-Gm-Features: AZwV_QgURCnhkWoxVxcJP63yhkPm-ScQ-p0XP69L3txSPXMFGvGuHj06hr84FTs
Message-ID: <CAPVz0n1zqo1TyaV=+fc6YzOKH9TqOBEatruZTAVGg9hFEWmXsQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] ARM: tegra: Add EMC OPP and ICC properties to
 Tegra114 EMC and ACTMON device-tree nodes
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 21 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:56 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, November 25, 2025 9:05=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add EMC OPP tables and interconnect paths that will be used for
> > dynamic memory bandwidth scaling based on memory utilization statistics=
.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 151 ++++++++++++++++++
> >  arch/arm/boot/dts/nvidia/tegra114.dtsi        |   9 ++
> >  2 files changed, 160 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.d=
tsi
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/a=
rch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> > new file mode 100644
> > index 000000000000..1a0e68f22039
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> > @@ -0,0 +1,151 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/ {
> > +     emc_icc_dvfs_opp_table: opp-table-emc {
> > +             compatible =3D "operating-points-v2";
> > +
> > +             opp-12750000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <12750000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
>
> What's the source of the opp data?
>

I have used tf701t (T40X) and tegratab (T40S) kernel sources, to be
more specific board-*-memory.c files. Timing struct for each clock
contains min voltage field which was used to compose these opps.
1390000 is the max core regulator voltage, taken from tegra11_dvfs.c

I have converted an entire core_dvfs_table table from tegra11_dvfs.c
and I am planning to submit those later on too along with
powergates/domains configuration for tegra114, but that is for another
time :)

> Cheers,
> Mikko
>
> > +
> > +             opp-20400000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <20400000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-40800000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <40800000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-68000000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <68000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-102000000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <102000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-204000000-900 {
> > +                     opp-microvolt =3D <900000 900000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <204000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-suspend;
> > +             };
> > +
> > +             opp-312000000-1000 {
> > +                     opp-microvolt =3D <1000000 1000000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <312000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-408000000-1000 {
> > +                     opp-microvolt =3D <1000000 1000000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <408000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-528000000-1050 {
> > +                     opp-microvolt =3D <1050000 1050000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <528000000>;
> > +                     opp-supported-hw =3D <0x000E>;
> > +             };
> > +
> > +             opp-528000000-1100 {
> > +                     opp-microvolt =3D <1100000 1100000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <528000000>;
> > +                     opp-supported-hw =3D <0x0001>;
> > +             };
> > +
> > +             opp-624000000-1100 {
> > +                     opp-microvolt =3D <1100000 1100000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <624000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +
> > +             opp-792000000-1100 {
> > +                     opp-microvolt =3D <1100000 1100000 1390000>;
> > +                     opp-hz =3D /bits/ 64 <792000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +             };
> > +     };
> > +
> > +     emc_bw_dfs_opp_table: opp-table-actmon {
> > +             compatible =3D "operating-points-v2";
> > +
> > +             opp-12750000 {
> > +                     opp-hz =3D /bits/ 64 <12750000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <204000>;
> > +             };
> > +
> > +             opp-20400000 {
> > +                     opp-hz =3D /bits/ 64 <20400000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <326400>;
> > +             };
> > +
> > +             opp-40800000 {
> > +                     opp-hz =3D /bits/ 64 <40800000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <652800>;
> > +             };
> > +
> > +             opp-68000000 {
> > +                     opp-hz =3D /bits/ 64 <68000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <1088000>;
> > +             };
> > +
> > +             opp-102000000 {
> > +                     opp-hz =3D /bits/ 64 <102000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <1632000>;
> > +             };
> > +
> > +             opp-204000000 {
> > +                     opp-hz =3D /bits/ 64 <204000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <3264000>;
> > +                     opp-suspend;
> > +             };
> > +
> > +             opp-312000000 {
> > +                     opp-hz =3D /bits/ 64 <312000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <4992000>;
> > +             };
> > +
> > +             opp-408000000 {
> > +                     opp-hz =3D /bits/ 64 <408000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <6528000>;
> > +             };
> > +
> > +             opp-528000000 {
> > +                     opp-hz =3D /bits/ 64 <528000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <8448000>;
> > +             };
> > +
> > +             opp-624000000 {
> > +                     opp-hz =3D /bits/ 64 <624000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <9984000>;
> > +             };
> > +
> > +             opp-792000000 {
> > +                     opp-hz =3D /bits/ 64 <792000000>;
> > +                     opp-supported-hw =3D <0x000F>;
> > +                     opp-peak-kBps =3D <12672000>;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts=
/nvidia/tegra114.dtsi
> > index a920ad041c14..6221423b81d1 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
> > +++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
> > @@ -8,6 +8,8 @@
> >  #include <dt-bindings/soc/tegra-pmc.h>
> >  #include <dt-bindings/thermal/tegra114-soctherm.h>
> >
> > +#include "tegra114-peripherals-opp.dtsi"
> > +
> >  / {
> >       compatible =3D "nvidia,tegra114";
> >       interrupt-parent =3D <&lic>;
> > @@ -323,6 +325,9 @@ actmon: actmon@6000c800 {
> >               clock-names =3D "actmon", "emc";
> >               resets =3D <&tegra_car TEGRA114_CLK_ACTMON>;
> >               reset-names =3D "actmon";
> > +             operating-points-v2 =3D <&emc_bw_dfs_opp_table>;
> > +             interconnects =3D <&mc TEGRA114_MC_MPCORER &emc>;
> > +             interconnect-names =3D "cpu-read";
> >               #cooling-cells =3D <2>;
> >       };
> >
> > @@ -655,6 +660,7 @@ mc: memory-controller@70019000 {
> >
> >               #reset-cells =3D <1>;
> >               #iommu-cells =3D <1>;
> > +             #interconnect-cells =3D <1>;
> >       };
> >
> >       emc: external-memory-controller@7001b000 {
> > @@ -665,6 +671,9 @@ emc: external-memory-controller@7001b000 {
> >               clock-names =3D "emc";
> >
> >               nvidia,memory-controller =3D <&mc>;
> > +             operating-points-v2 =3D <&emc_icc_dvfs_opp_table>;
> > +
> > +             #interconnect-cells =3D <0>;
> >       };
> >
> >       hda@70030000 {
> >
>
>
>
>
