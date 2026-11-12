Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462029;
	b=H5Dek2CDYhB/idQ2H3zirVKTgK1T4WjRrjs7MWhhtFKBfydvqpVUiKYMWou/uymJmN6V
	 cEcQS764nEAj05LSH7xEEcf0r0qjZL+beWewEEBR1UapSAE0KbMLhJx970+r9WX3NfBS2
	 jRqC7zNUfr+tVE2WrDdIVEhyb/ZpJvXUJZZoRStLeTsHqGgXYXt6Q2Ya4VzEYFMu72WxB
	 wdlglt9IjFhuOm6pXR0hNcfP8bloopOSxjDwnNQSp2BRUQvm7P54U77FZn8pv06k1/kUC
	 fT7JjcZZNv8PWrexQp2+spr3fVyeOahrJqbozJUnRKaNPYkhyWQw5xAFp2b8CXTlqvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462029;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lYdL7jrYYii1WZ2z9xES6pouJBvuGmUd4y+dHMiQKmc=;
	b=PZJm44vuOOguVcSewktTtRGZeyStB1q+42CGO3UUVZeYZQHb6N+cAQp07sWdz3+yVsBU
	 rNivaIO9Vvc/dgwAxaOBJha+w6rN9KRLZbcmmQkiO5FRfuiov2i7cWgKhE+4WoTXaWKvO
	 PP7yd0jV96h83DMug9cqPTi7VPIn5lMiQYSWe0wHgSO+/BJ0tmGUZbwNoTYpsS8VHXYe0
	 EV8Qf3fmqXweOUgDSmBRUT79LFWPVqtcAIjtMQLpMCjZqtuuJ+MTl3cFqg0HGVf2+ud/0
	 t3QjH1DhHuYoX6BJKf7yG92fnE5C2YMmQTeO2+plLVs5RAmVZtTADY7iBySCKqsBoZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irde78kZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB30C606A33A;
	Thu, 12 Nov 2026 05:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irde78kZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC381F00A0A;
	Thu, 12 Nov 2026 05:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794462028;
	bh=lYdL7jrYYii1WZ2z9xES6pouJBvuGmUd4y+dHMiQKmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=irde78kZU5KKterB8ScjXL1ugOtBjMPpX7xUi1MY8cNw4Pu16/p4ej6lqvO2GVT+0
	 1KEq6HiKt6WZ++kuUSANb0Mwhr+BBtdM9MlnGvqM1Z0Y8++QvwU9YSWAaAYgDiEo2V
	 XmPQXDRv3SbDqpXqx2757sQajncFw3btWezNdQDzc3UJtE65RnCDuXGhbeZmab59Op
	 zCLiVNg66acTEcErqyp+FRZ57i+1eFtJrsztLnw7W75HLb/MoE9q7J28tegKXLB+kS
	 O+bg/f0Fx9rpMXZ8KTdZVAT1oaUksARaO3AcY/IyzO3KL+rTolHHye49ndggkXKAvi
	 ThCWCZby7Vd7Q==
Message-ID: <sashiko-outbox-210468@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 3/9] clk: realtek: Add support for phase locked
 loops (PLLs)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112052544.555563-4-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 05:40:27 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] clk: realtek: missing linux/limits.h include in freq_table.c
  breaks build
--

commit 05422d9707f4d9d5ef01c91a7d3ca363d63c729c
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for phase locked loops (PLLs)

This commit adds regmap-based PLL clock operations and frequency table
lookup helpers for Realtek SoCs.

> diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_=
table.c
> new file mode 100644
> index 0000000000000..0f977a3fc9021
> --- /dev/null
> +++ b/drivers/clk/realtek/freq_table.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/types.h>
> +#include "freq_table.h"
> +
> +#define IS_FREQ_TABLE_END(_f) ((_f)->rate =3D=3D 0)
> +
> +const struct rtk_freq_table *ftbl_find_closest_by_rate(const struct rtk_=
freq_table *ftbl,
> +						       unsigned long rate,
> +						       unsigned long min_rate,
> +						       unsigned long max_rate)
> +{
> +	const struct rtk_freq_table *best =3D NULL;
> +	unsigned long best_delta =3D ULONG_MAX;

[Severity: High]
Does freq_table.c need to include <linux/limits.h> for ULONG_MAX?

Neither <linux/types.h> nor freq_table.h pulls in <linux/limits.h>, so
building with CONFIG_RTK_CLK_COMMON enabled fails at this commit with an
undeclared identifier error for ULONG_MAX.  The include is added later in
the series by commit "clk: realtek: Add support for MMC-tuned PLL clocks",
leaving the intermediate commits unbuildable during bisection.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112052544.5555=
63-1-eleanor.lin@realtek.com?part=3D3
