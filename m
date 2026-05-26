Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59BA3BB109
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780801; cv=none; b=gwP62AYH/8TW3qpHWLBGl9oMJ55070A5EMXfQPUkdo0ABpdf+mlXn+NykHG5stq5UZzgHwA3ZwB4+LcFmiY3m9jbAP1jPUNOTOScVInFROVuHjODyXx1FhDLrfzrFjD6zlUg9wFy1OkU7c7ZMy/VXKgftcAmlPYOodgkN9kRB0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780801; c=relaxed/simple;
	bh=2hbhZXzLpi5I165u4S49bvc8ONnLlZfI2JGZBoM1j5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ivmbVfsWp0k742Xovo01qgvA9FmuBY2UA1NroqQ3j03C36L0thDLoq084DdqSl1Zb/OsKy+CDk6jchTeNjQXQZ67hSOcbz8XoAmCn61+hftdlixr/qeuOiGuFtG4FRBY5W7vLvbYJvUHgoMt9Kx1QvbDioXdDmlz4Lq0KYXR+Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=O7tY04ud; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="O7tY04ud"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49041e84237so31068455e9.1
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779780796; x=1780385596; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WXRNNHPyXQvvYNRb7UDQ2d4k6RO8dKZjGyn0hWbK7M=;
        b=O7tY04udqNns0hdT3Dwo4uQeyppHfUXnFZjOj9U5NghaMEiKWveKmqblOulk9ns1Ky
         9n7TcKJstbDu6PxyAJhmY/TZCCLvlue39s0a3aeqpNIx8ojLrpICaS3VrG/M6mZJX+b5
         NZL/M90Zk4qI4SzdvLoTAOeJypJrOm2hAcLwcqJnxMTL5AaMO2/XhXI7+LZ3TmNFGIZX
         LjRdKKQ9UHw7VrPhjnfPOK3o/8ID5HcXHU5e08u9L0aL8Y5oZga0sqZWkPsbAYZLNXAo
         DKgGpzXutCT9BhsmUnhFVbLBHMq2iFx6GC1hfaR8zmhiULEepBU9SuL8ysmqc31B9q3R
         Iz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779780796; x=1780385596;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5WXRNNHPyXQvvYNRb7UDQ2d4k6RO8dKZjGyn0hWbK7M=;
        b=eRL/7RnQxT8hDuGbJBoSBMRhuC2xTmPDLaXq3bo1D2U/1r8s9NEBohzP47TeBCyqjW
         sEGK/YrwqyPy0/JTSzPw75yJvDPlbr0V3TCWQ1vo8z1N3Mn8At8pYJFzXKUzd9dIW2eJ
         7qS7JrRUVAtOw7vZXMaKj3DBYvw/WyfG223MGmUeHJZixFAAVhGlZp2wUTC0+v1akNVn
         n8dUKBFhYU8Yip7B28UzS5yTFckFBWCbk5au7A1fU7c1A7yBxhEHpuwCdsI5j0gKSrEW
         l3afDxOK/cYkzImLg1AYKzO7Z22ftJw7FLdCQVHtY2VOXcqOjS3VRL5gCwAbninIQMKx
         s3qA==
X-Forwarded-Encrypted: i=1; AFNElJ/laudS5nYJyXtyDdgCBniQBkzPGSidYc3t8hyyL0cHYo7GpLrkzhUJAEp19KlOJBKMHwrfWdwTnqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrxBuqveFDXCJ9NvwKgoS9naOfvtA48rRk+Juot25grK36DAYp
	E6th4eDpHsGhMkKx5zC4+oxO//QYgvkTIKiuuJtlwclGWPywvWX83L5ipCdjcxNMs5A=
X-Gm-Gg: Acq92OGrZ+mMHc1yVRrwUom/lxO5aQh87oZukKb5TfLx+qmvKMpilUK05iy8W4wiN8e
	8SUgpxsS9VB72TrZ/MspkAD7z7nc8Z253Xe2ZrJP+BLKolrf9gYlIPPdvlNfP+T/xYWyH7csRTw
	WpDiB43cmD03MO4YoTiZ6D20U1o38jr0+4Gs3VkeiWyn/UPBB6MAoSbf/w4np6OBC4ahnSTQWMv
	O7xkeYxlsX5rhB9HD2Pm7UBjZdDdb7vyN0GedBUBZb7pD/vh7/NIOSve5UAHMNQbzVmNxDzsOch
	Dyo1cy9NJIUtu+4p1CO2sRAOm4heKR/OGdjcwhzzzZE6HNtiordLqQuF4+lDF4I58XDRQTyfzk2
	Mudr3o8vZrghOn+Dz9B2iU1kjw9UBgSaCD1Eek5S8YUGRiZA0ZteqL89jCGnIpQUcoxJt9TNNfb
	TJ6OGSToSsI5/Ni3WV8jS1Bw==
X-Received: by 2002:a05:600c:8599:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490426ade02mr179110335e9.15.1779780796190;
        Tue, 26 May 2026 00:33:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4a0c:b15a:3467:f4ed])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490454ea134sm338481635e9.8.2026.05.26.00.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:33:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/10] Add support for A9 family clock controller
In-Reply-To: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:22 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 May 2026 09:33:14 +0200
Message-ID: <1jldd662x1.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> There are 4 clock controllers in A9 SoC:
> - SCMI clock controller: these clocks are managed by the
>   Trusted Firmware-A(TF-A) and handled through SCMI.
> - PLL clock controller.
> - peripheral clock controller.
> - AO clock controller.
>
> There are reserved register regions placed between individual PLLs, so a
> separate driver is implemented for each PLL, similar to T7.
>
> Compared to previous SoCs PLLs, the A9 PLL controller introduces 4 new features:
> 1.PLL l_detect signal supports active-high configuration.
>   Previous A7 and T7 l_detect signals are active-low.
> 2.PLL reset signal supports active-low configuration.
>   Previous reset signals are active-high.
> 3.Support POWER_OF_TWO for the PLL pre-divider N;
>   the N pre-divider follows the same calculation rule as OD.
> 4.The PLL input path includes an inherent divide-by-2 divider.
>
> Implement the first three features in clk-pll.c (verified on A9 and T7),
> with no impact to PLL logic on existing SoCs. Add a fixed divide-by-2 to
> A9 PLL driver for the fourth feature.
>  
> A9 PLL is composed as follows:
>  
>                        PLL
>           +---------------------------------+
>           |                                 |
>           |             +--+                |
>    in/2 >>---[ /2^N ]-->|  |      +-----+   |
>           |             |  |------| DCO |----->> out
>           |  +--------->|  |      +--v--+   |
>           |  |          +--+         |      |
>           |  |                       |      |
>           |  +--[ *(M + (F/Fmax) ]<--+      |
>           |                                 |
>           +---------------------------------+
>  
>   out = in / 2  * (m + frac / frac_max) / 2^n
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
> Jian Hu (10):
>       dt-bindings: clock: Add Amlogic A9 SCMI clock controller
>       dt-bindings: clock: Add Amlogic A9 PLL clock controller
>       dt-bindings: clock: Add Amlogic A9 peripherals clock controller
>       dt-bindings: clock: Add Amlogic A9 AO clock controller
>       clk: amlogic: PLL l_detect signal supports active-high configuration
>       clk: amlogic: PLL reset signal supports active-low configuration
>       clk: amlogic: Support POWER_OF_TWO for PLL pre-divider
>       clk: amlogic: Add A9 PLL clock controller driver
>       clk: amlogic: Add A9 peripherals clock controller driver
>       clk: amlogic: Add A9 AO clock controller driver
>
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          |   76 +
>  .../clock/amlogic,a9-peripherals-clkc.yaml         |  150 ++
>  .../bindings/clock/amlogic,a9-pll-clkc.yaml        |  110 +
>  drivers/clk/meson/Kconfig                          |   28 +
>  drivers/clk/meson/Makefile                         |    2 +
>  drivers/clk/meson/a9-aoclk.c                       |  494 +++++
>  drivers/clk/meson/a9-peripherals.c                 | 2317 ++++++++++++++++++++
>  drivers/clk/meson/a9-pll.c                         |  831 +++++++
>  drivers/clk/meson/clk-pll.c                        |   79 +-
>  drivers/clk/meson/clk-pll.h                        |    6 +
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      |   76 +
>  .../clock/amlogic,a9-peripherals-clkc.h            |  352 +++
>  include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |   55 +
>  include/dt-bindings/clock/amlogic,a9-scmi-clkc.h   |   51 +
>  14 files changed, 4609 insertions(+), 18 deletions(-)

For the next version, please split things up.
There is no hard dependency between the different controllers. This will
ease the review.

The PLL controllers are bringing a new contraints in. The global/static
nature of the controllers is something that has been bothering me for a
while but there was no real reason to address it so far. Please give me
some time to think about. Feel free to re-post the other controllers in the
meantime. 

> ---
> base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
> change-id: 20260511-b4-a9_clk-67652c1ae56e
>
> Best regards,

-- 
Jerome
