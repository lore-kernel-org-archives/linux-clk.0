Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="eZJuU83r"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661DD198C
	for <linux-clk@vger.kernel.org>; Fri,  8 Dec 2023 08:52:43 -0800 (PST)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0760D3F62F
	for <linux-clk@vger.kernel.org>; Fri,  8 Dec 2023 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702054361;
	bh=/Bd1WbAs6qqomxx2kkYhHR+Yd/EnW7VyJ0zhFUm1arc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=eZJuU83rxpPiWxX+P+ajGITQxKZHOQtfRLxcy6cbzoFne7YP1iYSFqDEz9t4pMmkx
	 9p5cra60oKIlLMS4Y5etIPyY9CVv8efGfQ8+ZOAxA/tb9Wag2cyTGZNx4MnuKWxjk/
	 d7RBcWLGceZwX6Rx3uqo2/SPRMwYsIu767Y44lgFy/m3Bk1F92CmTzB2Gc4X8omI/q
	 M8rj15cjXhACModITMvfug+kBgKEPs4KaHfJseL2B+VxK23Nes6yqurJkc/LZmcI//
	 FHF9VRbiIYqISlTinogaGWTU1uBmH6kC3/L+5P3E2WjrCXDHEwbnkxvK+WiecyFgpY
	 C6I5bZizgs8DQ==
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c9fd9c1bc3so19953811fa.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Dec 2023 08:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702054360; x=1702659160;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Bd1WbAs6qqomxx2kkYhHR+Yd/EnW7VyJ0zhFUm1arc=;
        b=PqHMvfH32XLd7aoJB4Afzj1q3mPpFlwy3FuZMC/b5xRCD2q4UGcOvbsdlFp5r2lWv5
         DYc5WJu8W30fvCqEBEYXdhV1o/MjuVPRzhyhHnSUSuhWs++zyTTXD9cfiju3gcYZQpPx
         8zRZRXyQPTtZYbp/kYREhgjncIpYsJXkukxMSUtWng6Hp3Cmx2z48FeZyYMnFzV54BrY
         WiMFy3laVm6sbV6Nb0f78hm29XfCzk/sNxxKdw8K4dsysuMKB85tany9vJGEFxFnAc/Q
         PZkPxk1HCYoXFRQPcMsRn93ZrEObFL17g+Fpa3e7IxxuPIozRx3bEMVxFhyftnqiymSV
         DIow==
X-Gm-Message-State: AOJu0Ywf+wKQ958EkroWjaa3nw6momns704vu8cli/OTNU6+U364Xeet
	fQWIgz0DCx2usCRrX8HW2nArejuHgTkAtffRoFNiKLYvpM1YGXDv0aSzFfF8cIbVRuJTdYFnxgs
	XaSTQsLJOf+SgJEGsrTxYzmWarnLuAuNAPpLOqTV+4vKVMyfdQegVUA==
X-Received: by 2002:ac2:4c3a:0:b0:50b:f2f0:2b0f with SMTP id u26-20020ac24c3a000000b0050bf2f02b0fmr84003lfq.133.1702054360232;
        Fri, 08 Dec 2023 08:52:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0PijjlqLMVDLUKgcONltdJP4HQSQPKwjj3DWwcCvbfjgx6I0eC4m1N1xg0Tj+6jTQMSHxMH3QI1YkxoNxO2w=
X-Received: by 2002:ac2:4c3a:0:b0:50b:f2f0:2b0f with SMTP id
 u26-20020ac24c3a000000b0050bf2f02b0fmr83988lfq.133.1702054359905; Fri, 08 Dec
 2023 08:52:39 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 08:52:38 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 08:52:38 -0800
Message-ID: <CAJM55Z_nnrFcU6N8ZELUoGLe6Dp358aXH7VGf1i+USbZOsbpnQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/16] Basic clock and reset support for StarFive
 JH8100 RISC-V SoC
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, 
	xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	leyfoon.tan@starfivetech.com
Content-Type: text/plain; charset="UTF-8"

Sia Jee Heng wrote:
> This patch series enabled basic clock & reset support for StarFive
> JH8100 SoC.
>
> This patch series depends on the Initial device tree support for
> StarFive JH8100 SoC patch series which can be found at below link:
> https://lore.kernel.org/lkml/20231201121410.95298-1-jeeheng.sia@starfivetech.com/
>
> StarFive JH8100 shares a similar clock and reset design with JH7110.
> To facilitate the reuse of the file and its functionalities, files
> containing the 'jh71x0' naming convention are renamed to use the
> 'common' wording. Internal functions that contain the 'jh71x0'
> naming convention are renamed to use 'starfive.' This is accomplished
> through patches 1, 2, 3, and 4.

I'm a little sceptical all this renaming is worth it, but if think it's likely
that future starfive SoCs can use the same clock drivers I'm ok with it. Just
know that you'll look a bit silly if your "JH9100" can't use these drivers and
you'll already need different starfive and starfive-gen2 drivers.

/Emil
>
>
> Patch 5 adds documentation to describe System (SYSCRG) Clock & Reset
> binding.
> Patch 6 adds SYSCRG clock driver.
>
> patch 7 adds documentation to describe System-North-West (SYSCRG-NW)
> Clock & Reset binding.
> Patch 8 adds SYSCRG-NW clock driver.
>
> patch 9 adds documentation to describe System-North-East (SYSCRG-NE)
> Clock & Reset binding.
> Patch 10 adds SYSCRG-NE clock driver.
>
> patch 11 adds documentation to describe System-South-West (SYSCRG-SW)
> Clock & Reset binding.
> Patch 12 adds SYSCRG-SW clock driver.
>
> patch 13 adds documentation to describe Always-On (AON)
> Clock & Reset binding.
> Patch 14 adds AON clock driver.
>
> Patch 15 adds support for the auxiliary reset driver.
>
> Patch 16 adds clocks and reset nodes to the JH8100 device tree.
>
> Sia Jee Heng (16):
>   reset: starfive: Rename file name "jh71x0" to "common"
>   reset: starfive: Convert the word "jh71x0" to "starfive"
>   clk: starfive: Rename file name "jh71x0" to "common"
>   clk: starfive: Convert the word "jh71x0" to "starfive"
>   dt-bindings: clock: Add StarFive JH8100 System clock and reset
>     generator
>   clk: starfive: Add JH8100 System clock generator driver
>   dt-bindings: clock: Add StarFive JH8100 System-North-West clock and
>     reset generator
>   clk: starfive: Add JH8100 System-North-West clock generator driver
>   dt-bindings: clock: Add StarFive JH8100 System-North-East clock and
>     reset generator
>   clk: starfive: Add JH8100 System-North-East clock generator driver
>   dt-bindings: clock: Add StarFive JH8100 System-South-West clock and
>     reset generator
>   clk: starfive: Add JH8100 System-South-West clock generator driver
>   dt-bindings: clock: Add StarFive JH8100 Always-On clock and reset
>     generator
>   clk: starfive: Add JH8100 Always-On clock generator driver
>   reset: starfive: Add StarFive JH8100 reset driver
>   riscv: dts: starfive: jh8100: Add clocks and resets nodes
>
>  .../clock/starfive,jh8100-aoncrg.yaml         |  77 +++
>  .../clock/starfive,jh8100-syscrg-ne.yaml      | 158 +++++
>  .../clock/starfive,jh8100-syscrg-nw.yaml      | 119 ++++
>  .../clock/starfive,jh8100-syscrg-sw.yaml      |  66 ++
>  .../clock/starfive,jh8100-syscrg.yaml         |  66 ++
>  MAINTAINERS                                   |  15 +
>  arch/riscv/boot/dts/starfive/jh8100-clk.dtsi  | 180 ++++++
>  arch/riscv/boot/dts/starfive/jh8100.dtsi      | 115 ++++
>  drivers/clk/starfive/Kconfig                  |  49 +-
>  drivers/clk/starfive/Makefile                 |   3 +-
>  drivers/clk/starfive/clk-starfive-common.c    | 327 ++++++++++
>  drivers/clk/starfive/clk-starfive-common.h    | 130 ++++
>  .../clk/starfive/clk-starfive-jh7100-audio.c  | 127 ++--
>  drivers/clk/starfive/clk-starfive-jh7100.c    | 503 ++++++++--------
>  .../clk/starfive/clk-starfive-jh7110-aon.c    |  62 +-
>  .../clk/starfive/clk-starfive-jh7110-isp.c    |  72 +--
>  .../clk/starfive/clk-starfive-jh7110-stg.c    |  94 +--
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 523 ++++++++--------
>  .../clk/starfive/clk-starfive-jh7110-vout.c   |  74 +--
>  drivers/clk/starfive/clk-starfive-jh7110.h    |   4 +-
>  drivers/clk/starfive/clk-starfive-jh71x0.c    | 327 ----------
>  drivers/clk/starfive/clk-starfive-jh71x0.h    | 123 ----
>  drivers/clk/starfive/jh8100/Makefile          |   7 +
>  drivers/clk/starfive/jh8100/clk-aon.c         | 275 +++++++++
>  .../clk/starfive/jh8100/clk-starfive-jh8100.h |  11 +
>  drivers/clk/starfive/jh8100/clk-sys-ne.c      | 566 ++++++++++++++++++
>  drivers/clk/starfive/jh8100/clk-sys-nw.c      | 268 +++++++++
>  drivers/clk/starfive/jh8100/clk-sys-sw.c      | 136 +++++
>  drivers/clk/starfive/jh8100/clk-sys.c         | 455 ++++++++++++++
>  drivers/reset/starfive/Kconfig                |  14 +-
>  drivers/reset/starfive/Makefile               |   4 +-
>  ...rfive-jh71x0.c => reset-starfive-common.c} |  68 +--
>  .../reset/starfive/reset-starfive-common.h    |  14 +
>  .../reset/starfive/reset-starfive-jh7100.c    |   4 +-
>  .../reset/starfive/reset-starfive-jh7110.c    |   8 +-
>  .../reset/starfive/reset-starfive-jh71x0.h    |  14 -
>  .../reset/starfive/reset-starfive-jh8100.c    | 102 ++++
>  .../dt-bindings/clock/starfive,jh8100-crg.h   | 430 +++++++++++++
>  .../dt-bindings/reset/starfive,jh8100-crg.h   | 127 ++++
>  ...rfive-jh71x0.h => reset-starfive-common.h} |  10 +-
>  40 files changed, 4485 insertions(+), 1242 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-aoncrg.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-ne.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-sw.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg.yaml
>  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
>  create mode 100644 drivers/clk/starfive/clk-starfive-common.c
>  create mode 100644 drivers/clk/starfive/clk-starfive-common.h
>  delete mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.c
>  delete mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.h
>  create mode 100644 drivers/clk/starfive/jh8100/Makefile
>  create mode 100644 drivers/clk/starfive/jh8100/clk-aon.c
>  create mode 100644 drivers/clk/starfive/jh8100/clk-starfive-jh8100.h
>  create mode 100644 drivers/clk/starfive/jh8100/clk-sys-ne.c
>  create mode 100644 drivers/clk/starfive/jh8100/clk-sys-nw.c
>  create mode 100644 drivers/clk/starfive/jh8100/clk-sys-sw.c
>  create mode 100644 drivers/clk/starfive/jh8100/clk-sys.c
>  rename drivers/reset/starfive/{reset-starfive-jh71x0.c => reset-starfive-common.c} (55%)
>  create mode 100644 drivers/reset/starfive/reset-starfive-common.h
>  delete mode 100644 drivers/reset/starfive/reset-starfive-jh71x0.h
>  create mode 100644 drivers/reset/starfive/reset-starfive-jh8100.c
>  create mode 100644 include/dt-bindings/clock/starfive,jh8100-crg.h
>  create mode 100644 include/dt-bindings/reset/starfive,jh8100-crg.h
>  rename include/soc/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (50%)
>
> --
> 2.34.1
>
