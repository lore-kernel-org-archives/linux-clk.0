Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD6D2F3632
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131342; cv=none; b=OTk68yN5xEVm2eblrW6hnKuQY/7cqAJR6y53qdI+Eh3qYD/6jjNTgTF506Rhyah36yDA6Ls7mH3l8ovXy0AyjvvqOhr07L887N2vj1jVeBlsm4UeRGd6gKgnIMhuLFSvMn2aiACpoDjtQqc4g3mIQZTL64Aeru3eVGVJbgUVWS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131342; c=relaxed/simple;
	bh=q5hfUmnX5cI2moI5VNKfCuehyKZytH+0Gd0A3JKIhQ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cRIIP9jFEfxsnS9GvB0Cd6C8FcT6g4VXgI0BBDx0b74EhJ//SmZXmix6IU/9E43HF4pUgzzmDs3+9F6B/PQTGs4fOJB5j5kA+SM9nyCNbB+b6cRJGBA8FeK983qrrjPJrRneMGGUH1O0bQUPGPGNX/AgYE5VJrAKV7x7Ogx8Aag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l712AHn6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l712AHn6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0e19300cso4615295e9.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789131328; x=1789736128; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=l712AHn6ZQlA87zJAL+6vDSvIafCY05BuvIWVrZgNDNMfnK48n9G4OYqhQyzlEW8h9
         eM2PqI1DyXWsSSWBy+BmmEc8JOXmfvM5nqD++IJJXwoybolslwIfs7OhWpT9kPziAQv/
         SsrL2lsOvfB91snEpGIqxPVI21eRRHTfovvY2piaD/O4risdWR2ksl6HUAucATPyZmYL
         8GznCPHvTYeeYlqD+r6W2y2a3CMrDmdqSuRPv863IErlEEwGuxtunmiYnxUJ6RlIPIBD
         R1YY8fGJLDOM4ai+7+kWl+M5U1JFISKTQaKpbIBJdCm75Ky2X6XzK8Ivn5cJ5wIPf7g2
         Gu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131328; x=1789736128;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=seDJx/Uyfy10lCe45bfQeLRun0bwOR8Nws/Zawq4JLfp5ALbDd1tSLfcKVBAuDUDZ2
         PEVzJ2zziiG5nAUDazRlc9QwGWJE3V2brAPheatAjtWRRQLEfTq/dirWgGEyQawIQRZZ
         lQMfMgLdZ4ei80LVUor/Cs9/9Dy01Q/DW6ILEoqvFnVKOgylO334yyNHj5JqMbtC5Dt9
         gnl71BCUkK37CBIencNpT1pezY7rEpPozchY/ry4DA9eHBYg1SL3SdCXrgb84GQMyZBa
         L453VtDxuuop3xzqLnucBsKEdDj3rue9xqhokD66Td9IRwPiV5vLPDzsxZkwS9lZHVKO
         0A3g==
X-Forwarded-Encrypted: i=1; AKwUvByu/k5QWgpn8F3BY+CMTHi5vI+gXSzvwlnjFNLm8Jrl8PVqB61phijhC9D5LtEVhlJRYA6KkOMzwkc=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ0uTFBfndz6rxGTYfQt5AuRn8xtPKHsSBKODhqqzlDIMmk6Bm
	+MU5YrUYOt/qHj/E6yMFIbOkxVaW7U5hZHEcnlwCKRdeAuTxMM4lvVpneStlbQtoRd8=
X-Gm-Gg: AYBFou2v8STOPDApxmF3pcaN1gyyyju0pMFebAscTABEVbrPcs8Szo9UuAX+Dk5c5Az
	bfgbClL7ePMFTqMXpTLiSoKR7iZcpOauobgeS6edzAGZBz9NKviHZ6dvc3Y38RFVMCnTC068UNq
	6yh5rPYXhtx/0tzyEI3g00LT4dpWcBis7jyyknz9HpcG9VRtklm6y4geDzzBcEXhiumb+/42Bk2
	KKgQ545gEjA8CILqgOBBpxb0SRnVK9AQS/iBsQxQ0L0duG7WbiVNrCUbdKrczhhXHCfpRpT65Zl
	gmuusQtdSaiGtAT0e3fdCXrRbdGnn7cdo4RA6ERH7aN0RbLfKWqRfKpiAm1WPa0uN3CGSiOpVYv
	C6K1o/I7zDj1WRi6EmNbS2aR6Rmf6g+6VRKWsmL/r7Bo8C4KyZJuXKqWdPVjKwudCgjBChdLUON
	eiE93mf8CGeWGpl+R3qOj6ZUl4ht4nyG8j0q8lCGhIP27+9J8YQCp380z4Gcwyx9tzP9GpIoih1
	fICHBlj61I0AmgWM/I=
X-Received: by 2002:a05:600c:3ba9:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49e619c0558mr56438145e9.20.1789131327727;
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a34cacsm41600045e9.0.2026.09.11.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Long Zhao via B4 Relay
 <devnull+longzhao.ambarella.com@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvi?=
 =?utf-8?Q?nen?=
 <ilpo.jarvinen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao
 <zl020895@163.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/13] Ambarella CV75 SoC minimal bring-up
In-Reply-To: <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <1jwlt1ld6c.fsf@starbuckisacylon.baylibre.com>
 <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
Date: Fri, 11 Sep 2026 14:55:25 +0200
Message-ID: <1jld986j7m.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 04 sept. 2026 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/09/2026 08:54, Jerome Brunet wrote:
>> On ven. 04 sept. 2026 at 14:38, Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org> wrote:
>>>
>>>  .../devicetree/bindings/arm/ambarella.yaml         |  24 +
>>>  .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++
>>>  .../devicetree/bindings/gpio/pl061-gpio.yaml       |  32 +-
>>>  Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
>>>  .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 239 +++++++
>>>  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>>>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>>>  MAINTAINERS                                        |  14 +
>>>  arch/arm64/Kconfig.platforms                       |   6 +
>>>  arch/arm64/boot/dts/Makefile                       |   1 +
>>>  arch/arm64/boot/dts/ambarella/Makefile             |   3 +
>>>  arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 +
>>>  arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 +++++
>>>  arch/arm64/configs/defconfig                       |   1 +
>>>  drivers/clk/Kconfig                                |   1 +
>>>  drivers/clk/Makefile                               |   1 +
>>>  drivers/clk/ambarella/Kconfig                      |  13 +
>>>  drivers/clk/ambarella/Makefile                     |   6 +
>>>  drivers/clk/ambarella/ccu-cv75.c                   | 296 ++++++++
>>>  drivers/clk/ambarella/ccu_common.c                 |  60 ++
>>>  drivers/clk/ambarella/ccu_common.h                 |  25 +
>>>  drivers/clk/ambarella/ccu_mux_div.c                | 234 +++++++
>>>  drivers/clk/ambarella/ccu_mux_div.h                |  35 +
>>>  drivers/clk/ambarella/ccu_pll.c                    | 421 ++++++++++++
>>>  drivers/clk/ambarella/ccu_pll.h                    |  70 ++
>>>  drivers/gpio/Kconfig                               |   2 +
>>>  drivers/gpio/gpio-pl061.c                          | 342 +++++----
>>>  drivers/gpio/gpio-regmap.c                         |  24 +-
>>>  drivers/pinctrl/Kconfig                            |  15 +
>>>  drivers/pinctrl/Makefile                           |   2 +
>>>  drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 +++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.c                | 761 +++++++++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
>>>  drivers/tty/serial/8250/8250_dw.c                  |  34 +
>>>  include/dt-bindings/clock/ambarella,cv75-rct.h     |  15 +
>>>  include/linux/amba/bus.h                           |   1 +
>>>  include/linux/gpio/regmap.h                        |  13 +
>>>  37 files changed, 3439 insertions(+), 138 deletions(-)
>> 
>> That is a lot of stuff mixed into a single series that could easily split
>
> Well, not easily, because each split patchset would rely on non-existing
> CONFIG which could trigger warnings.
>
> Contributors follow here the correct and documented process of new SoC
> platform, I don't get why now only this patchset has to be split...

Are you referring to this or something else ?

"""
one patchset containing new arch/foo/Kconfig entry, DTS files, MAINTAINERS file entry and *optionally initial drivers* with their Devicetree bindings
"""

No problem with that, I was merely trying to say that mixing 4 or 5 trees
in a single patchset is pushing it a little and it does not solve the
dependency problem you've mentioned, it just move it.

>
>
> Best regards,
> Krzysztof

-- 
Jerome
