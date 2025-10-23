Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CDD320CAD
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 13:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227931; cv=none; b=VrR0X1v2BBL0Gpe5mEjzpErehr6b05+IVO1JGo8CPy9Ov8Gn45nfqOtp+U3yJRWc/coHes9N6RkMPnodeUwpaCGXPn7R9zbnDwjTAxuc6owx+PvPe727fGDPTLFLIgGRO1nAsk/UaPWkHxFSfaV5mKcSQS8DEu3Cxf+9rY2Do+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227931; c=relaxed/simple;
	bh=70l9t4VdfE1npK3VaiMwUNG+xoIszb0NPTKI/djYJrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbEsVOWzJS3mS7SHMfKP//2uMJrnf/Krw5wyLeV2YInWAhS6LHR3dpVpFwwahqglN4+RahS64ZItBU4TxoS2DxwICqhPtXxeeO8lriR9AKXrAcxwFBdxerC7TNELFtLF/QKZj5tBLrnO+cpC+HGqOG0Dulrx015aPKUSmhFTH7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54aa5f70513so230449e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 06:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227928; x=1761832728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHznA4IxR0ryi2cJoCEHN+kBwQ2XKkkZXeR8LA/d1QU=;
        b=TxVHW7aPB1z9DD+5xgbgSMyeqsx3wWD9kmNXFw8tabaubtPdgQC+5zH4gScT3MA+kE
         YA9RRVtyq1+DVn5EjXbdaZR93G7si9n1zU/DxaiOqcFdL0wtUefexDLcvbydrSsCwoSH
         J4rE6JnwpfwAcWk+o7Qr/TSCjZMH3KeDeyza6+rSuPdm0FPz2PBeGzEkR1rRbOBqhozn
         1CIYnDZrTu3+eP3adfjKaYGuqP83ghTX0OqA99LfYUaC0UOCWMK6YbABLelAwu0pcovX
         oQLvhzvBdh12/dwH9XRkVKVbMqBQ35yx7wFzjg/RE3d8a46KQCD1qevb0bkowEZLQQF1
         Je2g==
X-Forwarded-Encrypted: i=1; AJvYcCWY5+NA/V6fIyteuRJVntcInezMks4e2W0Mh4DwuFjuWSNjb0+v5bkLHugQo6Rdw0vgy+M3v8uRewA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY+7J35VjCI1uh2XUlJ9JJTPomCfd4X7rFAvZ7dsusvpNW6hv8
	UrWchfLpNFpMGhyWlpOAF43dpwKURjveG2aY+7gbaUKzsDnn7IZw7E68zDoXCFZR
X-Gm-Gg: ASbGnctpMXBQ+OyKaQOL/GgiTrvQebG1XHxHERSDas8uYmnBAHJ2BrdNviqtYKY4u3P
	YuTRAg4n0Uz6dDbPya/iGZQEVEQOBooXKBKH2WO7NtJV+krhpAS7PN7MqpHSwxAvhWaOTmSOoJK
	H33Fa+kD8RjpC9/nR16SsRsW59i6ZEoI91GhnoRA7eNiGk8gv/cG22+yLZKQCwz0H90SCI+HdQO
	ciVypBni3WoHSG8sFG0s/6LeQYQreQScOUpT3orq5gOtFf5tQXXeKo1nHKmCuibaQHkMc3EZfry
	AHAR2Go5XN621YENWfWmUf5/2iu+GDqmod7VwhoHceqWgSHJw1KQrHV/pxSivr19Os9I7gfcwg2
	5h7sBr9ZpJ6H8/N6XiFEb+58wHH4Lyqo8pD2Ah78YvcIUxQC7fELbpzeCKFzS5E7vBguRt0LEwN
	cOsIoZYwj0CMlQ79GCAl8ZlLxIPC6O7QBovNOguw==
X-Google-Smtp-Source: AGHT+IEmGPlUL30f+1i+h6Ljq2vOMU6Pap7fSvcCb/6cUAEtBlzbCtSmVKD+dvGNYcfk+szdvNvvBw==
X-Received: by 2002:a05:6122:1684:b0:544:75d1:15ba with SMTP id 71dfb90a1353d-5564edff0e9mr6485560e0c.8.1761227927976;
        Thu, 23 Oct 2025 06:58:47 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bef1ae0asm754825e0c.23.2025.10.23.06.58.46
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:58:46 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5db1aa8c93eso425968137.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 06:58:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJe5c/BuafmGmzztbrx564/VVNd8lEuWe+r3GDt5OsOM+sbd78sINS30cJLo+XZGAXIyonLlWpeeE=@vger.kernel.org
X-Received: by 2002:a05:6102:c09:b0:5db:3935:1636 with SMTP id
 ada2fe7eead31-5db393518f0mr253967137.26.1761227926239; Thu, 23 Oct 2025
 06:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009-clk-ssc-v5-1-v5-0-d6447d76171e@nxp.com> <20251009-clk-ssc-v5-1-v5-6-d6447d76171e@nxp.com>
In-Reply-To: <20251009-clk-ssc-v5-1-v5-6-d6447d76171e@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 15:58:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-UkzLnrPpBVyMH0DtgubxE_spUYbxtpO+5dmkFFqdcQ@mail.gmail.com>
X-Gm-Features: AWmQ_bl-Wzz5qd5CCY2fSVugSIzDYGwiZQethxZEtHbYBjXjOaCfH3VbWwjwxpU
Message-ID: <CAMuHMdU-UkzLnrPpBVyMH0DtgubxE_spUYbxtpO+5dmkFFqdcQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Peng,

On Thu, 9 Oct 2025 at 05:49, Peng Fan <peng.fan@nxp.com> wrote:
>  - Introduce 'clk-scmi-oem.c' to support vendor-specific OEM extensions
>    for the SCMI clock driver, allows clean integration of vendor-specific
>    features without impacting the core SCMI clock driver logic.
>  - Extend 'clk-scmi.h' with 'scmi_clk_oem' structure and related declarations.
>  - Initialize OEM extensions via 'scmi_clk_oem_init()'.
>  - Support querying OEM-specific features and setting spread spectrum.
>  - Pass 'scmi_device' to 'scmi_clk_ops_select()' for OEM data access.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/clk-scmi-oem.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Vendor OEM extension for System Control and Power Interface (SCMI)
> + * Protocol based clock driver
> + *
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/scmi_imx_protocol.h>
> +#include <linux/scmi_protocol.h>
> +
> +#include "clk-scmi.h"
> +
> +#define SCMI_CLOCK_CFG_IMX_SSC                 0x80
> +#define SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK      GENMASK(7, 0)
> +#define SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK                GENMASK(23, 8)
> +#define SCMI_CLOCK_IMX_SS_ENABLE_MASK          BIT(24)
> +
> +struct scmi_clk_oem_info {
> +       char *vendor_id;
> +       char *sub_vendor_id;
> +       char *compatible;
> +       const void *data;
> +};
> +
> +static int
> +scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> +                                const struct clk_spread_spectrum *ss_conf)
> +{
> +       struct scmi_clk *clk = to_scmi_clk(hw);
> +       int ret;
> +       u32 val;
> +
> +       /*
> +        * extConfigValue[7:0]   - spread percentage (%)
> +        * extConfigValue[23:8]  - Modulation Frequency

What is the unit of this?
According to the code below, it is in Hz, so it is limited to 65535 Hz.

> +        * extConfigValue[24]    - Enable/Disable
> +        * extConfigValue[31:25] - Reserved

Center, up, down, could be stored here, I assume?

> +        */
> +       val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
> +       val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
> +       if (ss_conf->method != CLK_SPREAD_NO)
> +               val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
> +       ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
> +                                                SCMI_CLOCK_CFG_IMX_SSC,
> +                                                val, false);
> +       if (ret)
> +               dev_warn(clk->dev,
> +                        "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
> +                        ss_conf->modfreq_hz, ss_conf->spread_bp, ss_conf->method,
> +                        clk->id);
> +
> +       return ret;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
