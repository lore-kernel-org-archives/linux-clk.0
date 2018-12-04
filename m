Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C3C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 15:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C239C2082F
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 15:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5S11r9C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C239C2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbeLDPLH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 10:11:07 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40706 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbeLDPLH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 10:11:07 -0500
Received: by mail-ed1-f66.google.com with SMTP id d3so14199876edx.7;
        Tue, 04 Dec 2018 07:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EiAuwGdXxqVyFaM/QXN0E/CNsdsOyesjSsZb0+N3pJs=;
        b=n5S11r9Ci1FOFT7P/kITlBOAE6SpKg3fAG8wS2XxuLHaO+rC4O9zuGSAFwwYNqi9N6
         sEYlaGwK8QNIDJSuRUvKvd74ECG/PcephRnv0BUnumC+2wZ1lbbFKdDcI97cEvRUCnoi
         cKybvnq3Dshsbg5t6krqsxCDR/MGmWF1r5MJNVxLa13h+tn7273Xv9piEowRjVGMGvHs
         xaX1FxPEqG61uNRlpIm9ph2AtNhFS+2jZHKVa0G3RH4LxDlJ2hwoV5vUApSAqvx0EZgU
         4ItmVYgp6WhYJsMrcMJt4cVa9Vgy5vPf5gNtFDT3DIhSww/cKV2lHX1C0GyHD8jti87q
         CD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EiAuwGdXxqVyFaM/QXN0E/CNsdsOyesjSsZb0+N3pJs=;
        b=CwftSxuOYpR74WMmjBqb8y0P3vpFaHMfs9ld9xbXMquiwfGaXF+3/WzlgXrL3RJb/N
         MXuGGDmtz3O5r6m181icGXshgfJB82qMq3qzgMKgYJfrOrXG87/FCgkuUzI1qh4h8NAc
         C5e9sUiSE/+TICKhzW3W45uitr6Qeux7WClELeD0hgLELj097TLv3gxrUQyaxyXPViE6
         StVpxFuLy2uEvZhO5pM/os6bds2SHowykhgrGVWKuW/sbnkdbEqtM5iSEUKuzyVKkrcz
         bJ17XjfPd3FELPB5gFfo0nz2HRA6GmycNsUS4UZeeikq5H/2oNuzueIRAeIv5u7KCPUR
         F2LQ==
X-Gm-Message-State: AA+aEWY3g3GaTh4HmwhpxWZh2jdoee3WipO+Y845rGgF1J19Vylw0C18
        Vd/AolsTD7F9igYqUBlVS58g7V+l
X-Google-Smtp-Source: AFSGD/XbTlJd7cixRdqOR9KOY07CPxNWYYKxb/VIdCwRWGNl5/PYHot2Ride5BNgZGLoQdzYa3jPfg==
X-Received: by 2002:a17:906:4447:: with SMTP id i7-v6mr16019926ejp.190.1543936262950;
        Tue, 04 Dec 2018 07:11:02 -0800 (PST)
Received: from localhost (pD9E51040.dip0.t-ipconnect.de. [217.229.16.64])
        by smtp.gmail.com with ESMTPSA id h47sm4914095eda.8.2018.12.04.07.11.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Dec 2018 07:11:01 -0800 (PST)
Date:   Tue, 4 Dec 2018 16:10:59 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 00/19] Tegra210 DFLL support
Message-ID: <20181204151059.GA23827@ulmo>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2018 at 05:25:29PM +0800, Joseph Lo wrote:
> This series introduces support for the DFLL as a CPU clock source
> on Tegra210. As Jetson TX1 uses a PWM controlled regulator IC which
> is driven directly by the DFLLs PWM output, we also introduce support
> for PWM regulators next to I2C controlled regulators. The DFLL output
> frequency is directly controlled by the regulator voltage. The registers
> for controlling the PWM are part of the DFLL IP block, so there's no
> separate linux regulator object involved because the regulator IC only
> supplies the rail powering the CPUs. It doesn't have any other controls.
>=20
> The patch 1~4 are the patches of DT bindings update for DFLL clock and
> Tegra124 cpufreq, which add PWM and Tegra210 support for DFLL clock and
> remove deprecate properties for Tegra124 cpufreq bindings.
>=20
> The patch 5~10 are the patches for DFLL clock driver update for PWM-mode
> DFLL support.
>=20
> The patch 11 and 12 are the Tegra124 cpufreq driver update to make it
> work with Tegra210.
>=20
> The patch 13~18 are the devicetree files update for Tegra210 SoC and
> platforms. Two platforms are updated here for different DFLL mode usage.
> The Tegra210-p2371-2180 (a.k.a. Jetson Tx1) uses DFLL-PWM and the
> Tegra210-smaug (a.k.a. Pixel C) uses DFLL-I2C. So two different modes
> are verified with this series.
>=20
> The patch 19 is the patch for enabling the CPU regulator for Smaug
> board.
>=20
> Joseph Lo (16):
>   dt-bindings: clock: tegra124-dfll: add Tegra210 support
>   dt-bindings: cpufreq: tegra124: remove vdd-cpu-supply from required
>     properties
>   dt-bindings: cpufreq: tegra124: remove cpu_lp clock from required
>     properties
>   clk: tegra: dfll: CVB calculation alignment with the regulator
>   clk: tegra: dfll: support PWM regulator control
>   clk: tegra: dfll: round down voltages based on alignment
>   clk: tegra: dfll: add CVB tables for Tegra210
>   cpufreq: tegra124: do not handle the CPU rail
>   cpufreq: tegra124: extend to support Tegra210
>   arm64: dts: tegra210: add DFLL clock
>   arm64: dts: tegra210: add CPU clocks
>   arm64: dts: tegra210-p2597: add pinmux for PWM-based DFLL support
>   arm64: dts: tegra210-p2371-2180: enable DFLL clock
>   arm64: dts: tegra210-smaug: add CPU power rail regulator
>   arm64: dts: tegra210-smaug: enable DFLL clock
>   arm64: defconfig: Enable MAX8973 regulator
>=20
> Peter De Schrijver (3):
>   dt-bindings: clock: tegra124-dfll: Update DFLL binding for PWM
>     regulator
>   clk: tegra: dfll: registration for multiple SoCs
>   clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210
>=20
>  .../bindings/clock/nvidia,tegra124-dfll.txt   |  77 ++-
>  .../cpufreq/nvidia,tegra124-cpufreq.txt       |   6 +-
>  .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  20 +
>  .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  14 +
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  31 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  25 +
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/clk/tegra/Kconfig                     |   5 +
>  drivers/clk/tegra/Makefile                    |   2 +-
>  drivers/clk/tegra/clk-dfll.c                  | 455 ++++++++++++---
>  drivers/clk/tegra/clk-dfll.h                  |   6 +-
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c    | 536 +++++++++++++++++-
>  drivers/clk/tegra/cvb.c                       |  12 +-
>  drivers/clk/tegra/cvb.h                       |   7 +-
>  drivers/cpufreq/Kconfig.arm                   |   2 +-
>  drivers/cpufreq/tegra124-cpufreq.c            |  29 +-
>  16 files changed, 1095 insertions(+), 133 deletions(-)

Hi Joseph,

can you highlight the build and runtime dependencies between the various
patches? For example, can I pick up all the arch/arm64 patches into the
Tegra tree without breaking anything?

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwGmQEACgkQ3SOs138+
s6HGIA//QprwVZ1gLLeej9HHBlkKBlBSrNsrvmcVHsnuRvHPFEcKNgCQ60ubl7cL
KQAYcTjV8n1wZXpMo6oCRdEuk9/I9ZnOixaLp2b0XoQYetFwC3h0oHTKTyAR7Qol
KVOyeHFpleCEHhuFcePJqdg0a2SSVD+FHFc2DWut2IPS7UhLnUYB7BnimwCOmpEO
lQ+0+wj+w4P922YcZgc66VUgyi+pbeokAwu1h890sUA+VdeimKXQZ4Cd8zz/kJ79
3QO8z5Lcp4iK0Pswjv/hoW/z+VA2ZpXK4BRKwq00e/xhVVb4LBgJZAxpkm1uki7d
HcacuVPAEWygMmwRPbIviHeuNreMVbgt9pC8qOrzjcYu6vbW10drxSfUtiXFclYh
kw8yjuUlw1kdMWCfHUvcF3YKjQZYvrvTZ2b5GpG/7/N+hEGWj0mWVct5kDCO/tZP
jNGGsqBmdepHH6fVrhFE9rdIsrN/nhCFsgWAVJKh0wj/CT/GbemjrHgX/4lC5T+k
tOsiv/xtAxy2F9aVpNar6EBlo0ZAhRdFa7vcQFjfrloPSTkxg/6Zri3cykuIx7N9
R8Zy/oxOsAWObP+geZmMH/FP4/MCUH/lM7buoOj4OtKY1KYHavjcU9OBdmG/a+m6
6Cup6sxChs84o43SpiFf+93A6KHFv3Fq28lAnJ9rWAxIvJRs8M4=
=PgS1
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
