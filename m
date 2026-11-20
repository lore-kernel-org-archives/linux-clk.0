Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172758;
	b=O+xjOaMdWxoobKnCwY1wCNyuNszszLoE8V4CIG1DACvZWvhwUx8CKps6kDXNUaKHH+ci
	 J9xhSSsQEFUK5W6tyZEydLnDUGCK0DnJYexoJIhOT+6C/Lpe2ipPGfyHzlcxEVGFcXzw7
	 gicJFYtR6GrIL31pHUaZODPFQXfd7FMajjsSsNpZGg3MyJFoCip5Z+KKRbnbpVRwvEIBf
	 5z7BWPIp8i3zehePHrONr1Q9XiGQW8G8l3SvVL6uSTyn/h3QUCKS0UWyEB5Wlk8/JeGch
	 MEDdNv59QfCcLqXQT3W/JRStwY4upQJR6s03yX2DXPbuUUQQMyjKVOZrP86kpBEScsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t5AKTHXlCqIuWDfB5gbPvSysRhBo74t8qpIPPyXGwtU=;
	b=oynnXQp+nQ+it5w2R5HDFIHU0hY6Tyi3/Hz1JGtUe+DhI+LnWkaWf2iVPUOeA4bkefZi
	 kqTRvQIqcr9a9ODtToscLO3NmJvIjeEnGghgJwrreNVDUi6iPvlHjY/TvTwQDvHemjDoj
	 GrZE9S8CIJIZOTwl2u9lHHl4Qdn/BVmaBc6gkhSxLJYp/x8OKLw/uoAD5haM3brkqgFZa
	 bypt1Ev/Mkwf/ILeXN3lY0lq9JXtRd+ExTcsvyTTJmBsGCpZsDLU+9C+75okwn+O4cvoQ
	 +nHgBpxeIZ9OUdcJ5Qr4HjZCbAKn7k9RLLLr6momrY2urruk1fAiJBMVGSaKianVXCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=hPPqVMlH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9273606A32C
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 11:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9273606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=hPPqVMlH
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b30cbfa628so5499187b3.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 03:05:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172756; cv=none;
        d=google.com; s=arc-20260327;
        b=eHaDUyOh7VWJyLIp7RocyeBUwEUfGlVDJsuSCPsxM5PZvGSM0vPeDuk8HAKxC4DCUd
         UKbZr9VfAH9o80egYtZ/uq105nWR2aluC5wTCk9Kf7rTlA+zYzBhsu8g6vkaNrkduv4B
         hWhiWttlUtngWs/Zf/QMvhNKzjH66b3gT3wkHjQ1wKs3gVthlG30rEwaYb/QLjRsV0KZ
         Acxhy4fBKKHeXFNHOrWjII/QSn4uqUoku9SM8B9k04ERsKXFfKS7aF9A2f2LvBH4Q0IA
         ib2zr1wxEMouxHr5j8kkXZDiFDgjB6oaXHoJ80XjsmzJEv9m4yctYO/BAI8/AtXYsN7b
         tUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t5AKTHXlCqIuWDfB5gbPvSysRhBo74t8qpIPPyXGwtU=;
        fh=lXpyQZBCQl+ZwX9bZnzMvN+t+szO8PVfFfwnrls+aE0=;
        b=X+sI46e76/xc2xKZPiZvvTdGUIgs8BOR/64WVIUmVZABintb7oRt4KmkxyQ0FDoRPK
         wJinb4YNmO/6uZML8rbS4JnwVSfuDEH+otcx8QFyJhp7efSfFN6aviIlh1GvZ4w3G++q
         LGw74qLCo7zVXJigTOUrfWSx2ilftqahPXkFWLioPgIpa1KWjLw0RUhDhmmk5+Q+KZ7S
         aahzSImmRXwDijDny1rJ5pmMnuCpsxYKqtSLna5wgO1dNedTOIMcbpBZU8qNwxopV2tB
         zdBuLOWoEpbcayCk1zAW6rAlqm7lrvbtAwVUmNd71JsuvwpjoTjBH9KcYF68EGJ7EYtT
         Abbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795172756; x=1795777556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t5AKTHXlCqIuWDfB5gbPvSysRhBo74t8qpIPPyXGwtU=;
        b=hPPqVMlHiTm/6e1bIBD2c6uAY5naMIEUQFGYTbSVJoeaIHL8a6wSmDQ9X4bC1e619o
         iEF2HNRmj1CcltkDiAY+Lcxn7O43hVHAkNes3LV+9dd0uqKr64lfekgLJs9WUxX2Nurg
         PEhxfvgaskfX9RORgH+az/6mzI4mk947KL0wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172756; x=1795777556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5AKTHXlCqIuWDfB5gbPvSysRhBo74t8qpIPPyXGwtU=;
        b=Uiva4myq8vXTkuB5xXIqLico1TKjmZbtpWGqrq2L693rPPk1GXSs7kHtzqaRfZyXcJ
         licfYd9gSAK6BtuHPLOkHGIp61HUjqxCqc29yyFi/chcbxV3ABfMtZxWpqNSyWQOt3Uu
         ULnpiIzvg5ozOrN8Tgjcgb+OoN49Z7ECrGckouO/5WAMpC6hH8Ojxdvo9o0YG9dD5VLR
         jfFSIwDXLzTSPFgCyNKQTrVVcfg+nKKihXmhJjZDlBCJuPVzd3S7RScfnVKF46oqaF4T
         D8u6KLC80Pwv2JBfPeJtvFs4icNU0J+HOat58MeDRLtrm4DejkBjxH5NXaYH7BxW4+dc
         9dyw==
X-Forwarded-Encrypted: i=1; AL+hErGnE7ezy+xcvqZwVJ2nyYV+8lvpHLyaWVTjG1eWQEcfTnpPglfHGXQZ6Ya+tsETi4ja33ENRyihZ2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CAkiCDwxnTwXLzJMG5tqDi2hGvwubAY4nqNZTGVemZJguJ6cB
	xDSp0k/xP92UVpVefw9shK2YkGa5JbAaBQ6VlZpcxomjOqq7xwvOfNRnDmaBMkuuETN2YelpjvP
	0KyT7d4chxgy2s6K02GAnm1gzxOt8tLiPhnKokztQ4w==
X-Gm-Gg: AZFdTZeW/GC1liiGBHdYPSXe8NkDZhH8z1d57BuuZWlNe9OBK5oMEmW6nePC1Tro4Zp
	3Qt3X+wwqalBkP1mgxLzESfIusEzJL/uq9DCGj8Qwgy5LhUlO1TDWYseV3vVUqiEKobZeK/jezn
	X4J1aAzo00v5Dz+nTE+FJh3T8AeadG5g83SXZxkU3Z4IXw1i9y97hHQTQFL80IjrBlHGiQM5yq9
	WcWQDd5nlR7rgvELGLlFPMAlMIvcz4BdkdehaDb5edTxOo2mqy/BtjRz202Hd2j3MYu2excWJml
	N9bBi+CugGQrYxebxMp5jGnuPfw5vJrXi2fE9djyiMqRX4fuwXmF6DFqM4DEsuyDktPMvn1LfYB
	gokJvp3ejAayKWMwMVr2WyJEvA/x9WDcu6hlITZoIWQzToTOKuZGIRzFQ0w1X0Pkpa7a8jL+eta
	x5jlkqYVlXIdvz
X-Received: by 2002:a05:690c:6b81:b0:8b4:d0a3:dd64 with SMTP id
 00721157ae682-8b520456d74mr12517987b3.12.1795172756538; Fri, 20 Nov 2026
 03:05:56 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 12:05:44 +0100
X-Gm-Features: AclHuK8j5lV0ZPwyCvHflp982Xer6I8gVMC44Ov4SpRq9SvLhJ8sxGrzvqdlJNI
Message-ID: <CABGWkvp-fBTjTZKxkUTiTFzUYn70x1OTQxe81Jh=ScPEye94TA@mail.gmail.com>
Subject: Re: [PATCH v15 0/2] clk: scmi: fix the i.MX OEM spread spectrum configuration
To: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Brian Masney <bmasney+clk@redhat.com>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>, 
	linux-amarula@amarulasolutions.com, arm-scmi@vger.kernel.org, 
	michael@amarulasolutions.com, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

Cristian has reviewed both patches [1][2]. Is that enough on the SCMI
side for you to pick them up, or would you rather wait for Sudeep?

Patch 1/2 is a fix for 7.3 (Cc: stable), so it could go in as a 7.4-rc fix.

Cristian, your reply to 2/2 [2] has a "From:" line where I think you
meant Reviewed-by. Could you confirm?

[1] https://lore.kernel.org/all/avMog5kzJpsiUhXn@pluto/
[2] https://lore.kernel.org/all/avMtgxmGXTbTKG1t@pluto/

Thanks and regards,
Dario

On Wed, Nov 4, 2026 at 11:36=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> These are the two patches of the v14 series [1] still pending, as
> patches 2/4 and 4/4 have been merged in 7.4-rc1.
>
> The first one is a fix for 7.3: the i.MX SCMI OEM extension converts
> the spread to the wrong unit, so the hardware is programmed with no
> spread at all for any valid configuration. The second one rejects the
> configurations that do not fit in the OEM fields, instead of silently
> truncating them.
>
> Brian is waiting for an ack from the SCMI side on both patches.
> Sudeep and the arm-scmi list were not Cc'ed on v14, as
> get_maintainer.pl does not list them for clk-scmi-oem.c.
>
> [1] https://lore.kernel.org/all/20260904101243.412006-1-dario.binacchi@am=
arulasolutions.com/
>
> Changes in v15:
>  - Drop patches 2/4 and 4/4, merged in 7.4-rc1.
>  - Rebase on v7.4-rc1.
>
> Changes in v14:
>  - Move the fixes first, so that they can be picked up separately from
>    the new patches.
>
> Changes in v13:
>  - Add patch "clk: scmi: reject SSC configuration out of the OEM field
>    range".
>  - Rename patch "clk: scmi: fix SSC permyriad conversion" to "clk: scmi:
>    fix SSC spread conversion".
>
> Changes in v12:
>  - Add patch "clk: scmi: fix SSC permyriad conversion" to fix the
>    permyriad to percent conversion in clk-scmi-oem.c, reported by
>    Sashiko AI review.
>
> Changes in v11:
>  - Add patch "clk: Validate spread spectrum configuration" to reject
>    invalid parameters in the clk core before they reach the providers.
>
> Changes in v10:
> - Drop patches 1-22, superseded by the generic spread spectrum clocking
>   support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastruc=
ture
>   is no longer needed. This patch is now based on the following commits:
>   - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
>   - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
>   - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
>   - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
>   https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/
>
> Changes in v9:
> - Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
> - Fix building warning raised by the kernel test robot for patch
>   v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
> - Add patches for imx8m{m,p} platforms:
>   - 23/23 clk: imx8mm: support spread spectrum clock generation
>   - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
>   - 21/23 clk: imx8mp: support spread spectrum clock generation
>   - 20/23 clk: imx8mp: rename ccm_base to base
>   - 19/23 clk: imx: add support for i.MX8MP anatop clock driver
>
> Changes in v8:
> - Drop the patches added in version 7:
>   - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
>   - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
>   - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
>   - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
>   - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM
>
> Changes in v7:
> - Add and manage fsl,anatop property as phandle to the anatop node with
>   the new patches:
>   - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
>   - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
>   - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
>   - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
>   - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM
>
> Changes in v6:
> - Merge patches:
>   10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
>   11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
>   12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
>   to
>   05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
>   now renamed
>   05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
> - Split the patch
>   15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
>   into
>   12/18 dt-bindings: clock: imx8m-clock: add PLLs
>   16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
>
> Changes in v5:
> - Fix compilation errors.
> - Separate driver code from dt-bindings
>
> Changes in v4:
> - Add dt-bindings for anatop
> - Add anatop driver
> - Drop fsl,ssc-clocks from spread spectrum dt-bindings
>
> Changes in v3:
> - Patches 1/8 has been added in version 3. The dt-bindings have
>   been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
>   anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
>   syscon, so it represents a memory area accessible by ccm
>   (imx8m-clock.yaml) to setup the PLLs.
> - Patches {3,5}/8 have been added in version 3.
> - Patches {4,6,8}/8 use ccm device node instead of the anatop one.
>
> Changes in v2:
> - Add "allOf:" and place it after "required:" block, like in the
>   example schema.
> - Move the properties definition to the top-level.
> - Drop unit types as requested by the "make dt_binding_check" command.
>
> Dario Binacchi (2):
>   clk: scmi: fix SSC spread conversion
>   clk: scmi: reject SSC configuration out of the OEM field range
>
>  drivers/clk/clk-scmi-oem.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
>
> ---
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> branch: imx-pll14xx-spread-spectrum
>
> --
> 2.43.0
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
