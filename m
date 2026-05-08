Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA572E2EEE
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276877; cv=pass; b=OFBYYZlxkh9+AAfByFCXMIkVPtbzeH2XQ7kO4i+jLejUMV908LNxsDQ4K44dDh9cvMbe2ai0hFUbKG2tEnzSgYeCwVc+1aPJ8pBe/EAUu0NbIDzvdY8ntr+ZbdT4gzz+BfcHXQLWekSW3SCnjop9LM1FOcvdK2m4o6BzLH2VyKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276877; c=relaxed/simple;
	bh=ILpME/swS5rIapPVAb/p+qxYsMSdedVPf8AJjzXUnu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKdjiy+WvpxWOWYDsq5D9AB7qd6addG3nxjC03h3EqVlaFeX0JR3wBQhqTlY2TlYAz7G8pb1uRnkWnzSF9ojcdIGnIAjwMQwYJxPQ4JlIe1NXz14pXmQjoO4duF/Tsjc2hdj2L4t06WLQ9y2UlnRcO8tgw3CQst5N5KlgyT8zjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=khD5duVL; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="khD5duVL"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57513ac61f0so808995e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 14:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778276874; cv=none;
        d=google.com; s=arc-20240605;
        b=KioI3eZPYVbK1Xf9OScnA0oLDzQkUQQHFsIQWChBmxQScz86FUWL8hUFbvfL9+HSLS
         uFFdO7RoIF+GwwpeBnRj9xEAMU4WdLpF+cispxz7d/W7JeZzc9i8gTAq8gxj18tWARYx
         WU9zQIAI4ZpIh71iOcNGdqMr7SDx7OtAtv3hYGVaHJQFirn/TpMec70KHcD+3WQH6Pz1
         woyHIjwUI4caa30uqLPOvMi4XYYiGdT2p1/me0gzYg0iNdJCVuIESQ+IMvryNYUhd/Eg
         rmAyrnr4kEtZISYh8QtDO2QsoKIZKXKTrkLo6jq8i68UAqayVxZd4BTrpTfEEZnYZVJC
         U7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=;
        fh=KAE+xUFGDf+Ql0gUC2GtOUvuOTAysRDO7UoF8N2DjYQ=;
        b=JSVx0oyL5zdvBg2azm4AGp9xVXWYAq/OTKSOiJs++l03xZoO/nyIeufAesK3cwYhIl
         Prc4nsvPykdVNPymaRXs7P99Se48MxTu5a0p54a2/3QBjqaYaWcV6cfMuuu3RGa1UZ6c
         CMCdI/6/T/y19RF1mT3YA0SCufEfQp+Du9ISgbPo0QdB17m244RAnNxciMqUURSm908A
         2HIQM4Flioc3/Xzw5s79VVVyodkdFcEyAGMBhwzTGM89nMFrpynlvAk3wNdAU6mF4wOz
         9XI1mWN6xYBFgTxhGVQCiBTSFj2VqYMM0hhAeDg4VTCOwJxbaS1PJ0+B8nPCV8Nu6wsD
         gwfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778276874; x=1778881674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=;
        b=khD5duVLOBsSWjFm1OB+UFEOef7Xowz6QvG83YCtXcupCvdQlu39gZmKG1LMHEFGlS
         gz8Dnz3TJ3+iYJIGC7N5Rk0lvkZdzdjYbIvWKl0UlbCIYCYJu0izJpusSNRQp0/1M4Xa
         U6DuPxwDR1jex7C14b+tnw3OqFgBJXU015xhDMS0xl/JJzOqs4WbTkzeG0A+Z2CCOQUX
         vCM/ki2NfbgBfNJwd6ZMugmG6GLnbngnb9wYKDD/Zfr7MOPQ3OvV2+V3x3/pxWNsEWoY
         eYFhb05W/m9D4MtPXow55dCur45RQtCkjVRGy0Q12EI0ltOWda6idYdyN8cegr48JMJ9
         jr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276874; x=1778881674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=;
        b=ZYW5j1dWpVhaKIBcoPfZq2pvPtYFmiKfzC9+4kWHZtCpBjJ/D0TMryOG7AaDDQ6ymZ
         yVMljVLnccTCnxSlLtQ8kull1FhREiST7VaQIkR+i3Xu+O64qk051DRa3UDV7Cjkfxa4
         CNnqvTxc7YRffk+7FoeZwIJGdCasreQU9M/HtxBQtUsQjVTGPaZWJiPfzBJaPVu24Zms
         AHsucmD9OdQI6hU2IstxVTpU6FdQzMYAzfKSF8Q04ecPIMtL2LMNKDqb802dUa6gDzIK
         Ed2YATX6HpJ+00IdQ+9zNUhlbwd8eXhqMMDR+p2hIp3Cwv2F9HximLfZH6FIqzIKOSS0
         J7Xg==
X-Forwarded-Encrypted: i=1; AFNElJ8kQkaQE9cwqcTwyCcBmqtyAfpEQTTHR1ak4gT4BoN4rFctIUM/iijywufZdfpmKsmACFS/ptren4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWiD+GckCPgK0bGISC1n3OY7dbo1LuS9grZyzpSQE/Kk5djEbZ
	A04nnpUe6PDXxdU7GGGZiVXfIFY4KCTSmK5xyvZ+tKAnVlBakHJDxclZyxY4H4JSESN0hCqaRKg
	FPqYT7LmBa0+Y7SKPypNXcU+kBqa0jN72Ya8xispMfw==
X-Gm-Gg: Acq92OGXAK4L9TEamn4AY5XSeARrIPn3RJLfR2x+UjX0QK6vBdbkpZkRer1MPBtjJqu
	YNe7+Qoc1AwjT+7JxmBetw6Fi33ajE7FdNdcSpVWDMl77EU+vl/MPp0G//XHbt3YPXVTYQyX1Dr
	zTsPcUcQGwMsBMaAPN1dMi7qrzGayQLjh+V19H5MjbQcs3K2Xu1RYiQRnEP1vIXFkMwr4w/UAJb
	cBBiBdO2dyKPF35Oas3Hrvgooi8GMHNQYv4KFIyKhongwtLqeJRzbGD/Iu5GlSs7J7kDD/0qKP1
	nMJDfBAXovSKyx/v3jlMUFtBBP2fpNEjNPZwvzOZOQ==
X-Received: by 2002:a05:6122:d28:b0:56f:1c32:bd07 with SMTP id
 71dfb90a1353d-57599081e26mr75702e0c.2.1778276874401; Fri, 08 May 2026
 14:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:47:40 +0100
X-Gm-Features: AVHnY4Jx9Y0PnI-yLhX3azc912MHhiYNtX9S94HKUZHkESLUhrPpwLh3zoUEOQU
Message-ID: <CADrjBPr3Piw-sQ043EuwdUZTes-9pxoVP4fA7-AX=ssjvniJcw@mail.gmail.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
> through a hybrid model shared between the kernel and the Alive Clock
> and Power Manager (ACPM) firmware.
>
> Add the protocol helpers required to communicate with the ACPM for
> thermal operations, including initialization, threshold configuration,
> temperature reading, and system suspend/resume handshakes.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
>  drivers/firmware/samsung/exynos-acpm.c             |  12 ++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
>  5 files changed, 298 insertions(+)
>
> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
> index 80d4f89b33a9..5a6f72bececf 100644
> --- a/drivers/firmware/samsung/Makefile
> +++ b/drivers/firmware/samsung/Makefile
> @@ -3,4 +3,5 @@
>  acpm-protocol-objs                     := exynos-acpm.o
>  acpm-protocol-objs                     += exynos-acpm-pmic.o
>  acpm-protocol-objs                     += exynos-acpm-dvfs.o
> +acpm-protocol-objs                     += exynos-acpm-tmu.o
>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)     += acpm-protocol.o
> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmware/samsung/exynos-acpm-tmu.c
> new file mode 100644
> index 000000000000..c68d60b4c0b3
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2026 Linaro Ltd.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> +#include <linux/ktime.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include "exynos-acpm.h"
> +#include "exynos-acpm-tmu.h"
> +
> +/* IPC Request Types */
> +#define ACPM_TMU_INIT          0x01
> +#define ACPM_TMU_READ_TEMP     0x02
> +#define ACPM_TMU_SUSPEND       0x04
> +#define ACPM_TMU_RESUME                0x10
> +#define ACPM_TMU_THRESHOLD     0x11
> +#define ACPM_TMU_INTEN         0x12
> +#define ACPM_TMU_CONTROL       0x13
> +#define ACPM_TMU_IRQ_CLEAR     0x14
> +
> +#define ACPM_TMU_TX_DATA_LEN   8
> +#define ACPM_TMU_RX_DATA_LEN   7
> +
> +struct acpm_tmu_tx {
> +       u16 ctx;
> +       u16 fw_use;
> +       u8 type;
> +       u8 rsvd0;
> +       u8 tzid;
> +       u8 rsvd1;
> +       u8 data[ACPM_TMU_TX_DATA_LEN];
> +} __packed;
> +
> +struct acpm_tmu_rx {
> +       u16 ctx;
> +       u16 fw_use;
> +       u8 type;
> +       s8 ret;
> +       u8 tzid;
> +       s8 temp;
> +       u8 rsvd;
> +       u8 data[ACPM_TMU_RX_DATA_LEN];
> +} __packed;
> +
> +union acpm_tmu_msg {
> +       u32 data[4];
> +       struct acpm_tmu_tx tx;
> +       struct acpm_tmu_rx rx;
> +};
> +
> +static int acpm_tmu_to_linux_err(s8 fw_err)
> +{
> +       /*
> +        * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
> +        * capabilities. Treat zero and all positive values as success.
> +        */
> +       if (fw_err >= 0)
> +               return 0;
> +
> +       if (fw_err == -1)
> +               return -EACCES;
> +
> +       return -EIO;
> +}
> +
> +int acpm_tmu_init(struct acpm_handle *handle, unsigned int acpm_chan_id)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_INIT;
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_read_temp(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                      u8 tz, int *temp)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_READ_TEMP;
> +       msg.tx.tzid = tz;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       ret = acpm_tmu_to_linux_err(msg.rx.ret);
> +       if (ret)
> +               return ret;
> +
> +       *temp = msg.rx.temp;
> +
> +       return 0;
> +}
> +
> +int acpm_tmu_set_threshold(struct acpm_handle *handle,
> +                          unsigned int acpm_chan_id, u8 tz,
> +                          const u8 temperature[8], size_t tlen)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       if (tlen > ACPM_TMU_TX_DATA_LEN)
> +               return -EINVAL;
> +
> +       msg.tx.type = ACPM_TMU_THRESHOLD;
> +       msg.tx.tzid = tz;
> +       memcpy(msg.tx.data, temperature, tlen);
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_set_interrupt_enable(struct acpm_handle *handle,
> +                                 unsigned int acpm_chan_id, u8 tz, u8 inten)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_INTEN;
> +       msg.tx.tzid = tz;
> +       msg.tx.data[0] = inten;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_tz_control(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                       u8 tz, bool enable)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_CONTROL;
> +       msg.tx.tzid = tz;
> +       msg.tx.data[0] = enable ? 1 : 0;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_clear_tz_irq(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                         u8 tz)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_IRQ_CLEAR;
> +       msg.tx.tzid = tz;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_suspend(struct acpm_handle *handle, unsigned int acpm_chan_id)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_SUSPEND;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_resume(struct acpm_handle *handle, unsigned int acpm_chan_id)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_RESUME;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.h b/drivers/firmware/samsung/exynos-acpm-tmu.h
> new file mode 100644
> index 000000000000..8b89f29fda67
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2026 Linaro Ltd.
> + */
> +#ifndef __EXYNOS_ACPM_TMU_H__
> +#define __EXYNOS_ACPM_TMU_H__
> +
> +#include <linux/types.h>
> +
> +struct acpm_handle;
> +
> +int acpm_tmu_init(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +int acpm_tmu_read_temp(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                      u8 tz, int *temp);
> +int acpm_tmu_set_threshold(struct acpm_handle *handle,
> +                          unsigned int acpm_chan_id, u8 tz,
> +                          const u8 temperature[8], size_t tlen);
> +int acpm_tmu_set_interrupt_enable(struct acpm_handle *handle,
> +                                 unsigned int acpm_chan_id, u8 tz, u8 inten);
> +int acpm_tmu_tz_control(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                       u8 tz, bool enable);
> +int acpm_tmu_clear_tz_irq(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                         u8 tz);
> +int acpm_tmu_suspend(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +int acpm_tmu_resume(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +#endif /* __EXYNOS_ACPM_TMU_H__ */
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 1a0d98b55439..2cebc5456968 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -33,6 +33,7 @@
>  #include "exynos-acpm.h"
>  #include "exynos-acpm-dvfs.h"
>  #include "exynos-acpm-pmic.h"
> +#include "exynos-acpm-tmu.h"
>
>  #define ACPM_PROTOCOL_SEQNUM           GENMASK(21, 16)
>
> @@ -688,6 +689,17 @@ static const struct acpm_ops exynos_acpm_driver_ops = {
>                 .bulk_write = acpm_pmic_bulk_write,
>                 .update_reg = acpm_pmic_update_reg,
>         },
> +
> +       .tmu = {
> +               .init = acpm_tmu_init,
> +               .read_temp = acpm_tmu_read_temp,
> +               .set_threshold = acpm_tmu_set_threshold,
> +               .set_interrupt_enable = acpm_tmu_set_interrupt_enable,
> +               .tz_control = acpm_tmu_tz_control,
> +               .clear_tz_irq = acpm_tmu_clear_tz_irq,
> +               .suspend = acpm_tmu_suspend,
> +               .resume = acpm_tmu_resume,
> +       },
>  };
>
>  static int acpm_probe(struct platform_device *pdev)
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index fbf1829b33db..08d9f5c95701 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -35,9 +35,27 @@ struct acpm_pmic_ops {
>                           u8 type, u8 reg, u8 chan, u8 value, u8 mask);
>  };
>
> +struct acpm_tmu_ops {
> +       int (*init)(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +       int (*read_temp)(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                        u8 tz, int *temp);
> +       int (*set_threshold)(struct acpm_handle *handle,
> +                            unsigned int acpm_chan_id, u8 tz,
> +                            const u8 temperature[8], size_t tlen);
> +       int (*set_interrupt_enable)(struct acpm_handle *handle,
> +                                   unsigned int acpm_chan_id, u8 tz, u8 inten);
> +       int (*tz_control)(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                         u8 tz, bool enable);
> +       int (*clear_tz_irq)(struct acpm_handle *handle,
> +                           unsigned int acpm_chan_id, u8 tz);
> +       int (*suspend)(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +       int (*resume)(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +};
> +
>  struct acpm_ops {
>         struct acpm_dvfs_ops dvfs;
>         struct acpm_pmic_ops pmic;
> +       struct acpm_tmu_ops tmu;
>  };
>
>  /**
>
> --
> 2.54.0.545.g6539524ca2-goog
>
