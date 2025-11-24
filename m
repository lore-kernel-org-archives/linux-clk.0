Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66A02F6906
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763977572; cv=none; b=rqSM52Vb6yflBNneMnnHw1EdbQJD/QRzroZ16zqCFuwGnwdP8lRHSQkJBJw2xlVnEVgt46BNpOmsslqBq5QvPN11YtCzuAYsicN5ZJN5CO1B3x8KuU1vPid1cwFclOxutzBzk/Y3YNt3J2e4pExy7PJHEtHPR3mDIHXxfWM6fKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763977572; c=relaxed/simple;
	bh=GvhnLHHW7HBFdV8tBSKTGXczZ4GrdqjqziHr6fuEobc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EKYW/8moLnP83XPSLiKti63bGnkor/Ed/zq6nr+04bAQEjfYRl8HiyarNWJeeLrY7Fm0poHLrBat0n+VLrrLSe/p0gwCQUHB7Mh4vthCfNgTcTlgtO0Ki3WpN028tmpeOGLHOizhfoYF1mqRiDHtKit//e9hIZo6fEooAgwxcac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ujPQW/a+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ujPQW/a+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so2955617f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 01:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763977569; x=1764582369; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+I1OH/e0SJaMpBEtI1yR0MCQld8hsjGMPHYDntH09Zs=;
        b=ujPQW/a+LuPMO0cnx5yf6GZiQ4JvZBYbWrcyLlriKvI42udF+ie3CFXlHnjkdsPMqB
         5kfgmDlBYLp4H1aMbKMbDLSvpptbviFJZTyijMAgboxROLf9YWQ00QoP2meNx37GmL7Y
         qAteXBuJW0kz8b4t0BrZ2WiOutLKh0by+C+XAdbkq1X+kSjduckmyGUdzkgMDExFRtWz
         jGVqqPE9wEdSjEeKBK1HNpmYV34wSsbGHcWOb2A/biDpWNgg1OkhMgOzeXqrNUmHW4U1
         M6BbuzWp+L0+kcQ15hicx8pWjYuUdFRVfiROPiuTLsZ6trPBntS7+N4bC3zjzVNdxupt
         5/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977569; x=1764582369;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+I1OH/e0SJaMpBEtI1yR0MCQld8hsjGMPHYDntH09Zs=;
        b=WCC7VYVET33fRjKVLwRF/MSm/+CdK1XkplnXZq038XOZxFIl1L743hhl6mVAZOHKhu
         Rwt4F8ptCJJTmZnDHTsRUsJK7KubvOCg86fhzeoXBR9phjFe6xSG/q0snVhiWBy3i5ES
         2ORauh1RySIP7mDVxXkqjZt0ePim0kyRn/+wlODPLHSBgcZ3EUjA56E+Zj4YMj+n0rTr
         6ZwyfnOieuanmn14nLJimWz6fkYSKetGou7s6ZjnyqCSmBOsobl3uZddj/zsl9Jl0k7u
         e9oEDAcz3zTPOF1KbvuneqCEBXDLvjUoI4uHHPYUgAaJo373uof/3p9W4VnDx3jnsiq5
         pclA==
X-Forwarded-Encrypted: i=1; AJvYcCXDe8qmULSJ0/JyOOdaNKa2OZCtMIYxWo9GKgTksVfCWAk2SeRZdpa0BqYPVF3IgK8CoZA8zOvMKvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLGEYRlxlckr/nH6RwK6+UdeMxONcSq2zqw85VjweME3Qsdct+
	NNHavTEyTS+4Scp2MKVQPxEoJQywxPEUC4G9gURQYcud/upIJTFZRm0oXqKLhSmBWxg=
X-Gm-Gg: ASbGncvzPf0U01N2165M9oLrzH7d4THU1X929txzUv3oJXm3Qdv0s5ZswE4340iMcUa
	D3UFpavTziE8k6yynMPoGlBg5DNlP1jWlLwQwZKm3NfNmA0y4LVAnuM1ABQQ+GBpo9njWc0vaFu
	6IjFBEINOQkoDhsCKYjcFOk1CBPywRI93TIo8LNEwn53LRLe1rmj/5h5bDARHEir09xxf/AjpT+
	ozogCE4Jd+8kzhKeGuPHUW7X5bv6urqjR/xcNDrOfLNV3ms7ydEE3Qmot+s/wZ34Fzjp9AIcE8v
	G6yt1Qzn2nAFULA4pV3/mu1k4J9LUxGZeVaBaLZGbUybWguoG+3vtdy3D0+RSSB/EfnZsjT3UAF
	MVPB7P5Sw4Qu+be16rG7+TIPSS0TqiminqkVEVrC3c3oZFl+8l8FJUYTwuOol3aAPL3So9gkNtX
	UKoBn/gwUc1w==
X-Google-Smtp-Source: AGHT+IHffWkX/Jj2vv2LF1SqqQ/0xrDubJ3urk0u5EZ0rxXKVAimRLIjEeCTq1HtkDUWFcvXmAc7fg==
X-Received: by 2002:a05:6000:4010:b0:42b:3dbe:3a37 with SMTP id ffacd0b85a97d-42cc1302285mr12809439f8f.10.1763977568979;
        Mon, 24 Nov 2025 01:46:08 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e2e:74ae:77df:106f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fba20esm27521911f8f.37.2025.11.24.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:46:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  "Dmitry Rokosov"
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 0/5] add support for T7 family clock controller
In-Reply-To: <20251121105934.1759745-1-jian.hu@amlogic.com> (Jian Hu's message
	of "Fri, 21 Nov 2025 18:59:29 +0800")
References: <20251121105934.1759745-1-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 24 Nov 2025 10:46:08 +0100
Message-ID: <1jy0nvu5jz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 21 Nov 2025 at 18:59, Jian Hu <jian.hu@amlogic.com> wrote:

> It introduces three clock controllers:
> - SCMI clock controller: these clocks are managed by the SCP and handled through SCMI.
> - PLL clock controller.
> - peripheral clock controller.
>
> Changes v5 since v4 at [4]:
> - rename rtc and cec dualdiv clocks
> - rename dsp clocks
> - rename anakin clocks
> - rename fdiv2_divn to 25m and fix its parent
> - add flag for T7_COMP_GATE
> - use T7_COMP_SEL/DIV/GATE to define glitch clocks
> - add CLK_SET_RATE_NO_REPARENT for t7_eth_rmii_sel and rtc
> - move module_platform_driver after clock driver

Looks good to me, just a few minor comments.

It is too late of this cycle. Please check the comments and re-send on
the next -rc1

>
> Changes v4 since v3 at [3]:
> - drop amlogic_t7_pll_probe, use meson_clkc_mmio_probe instead
> - add CLK_DIVIDER_MAX_AT_ZERO for pcie_pll_od clk
> - add frac for hifi_dco_pll_dco
> - add l_detect for mclk_pll_dco
> - drop v3 5/6 patch, and use MESON_PCLK
> - drop SPI_PWM_CLK_XX macro and use MESON_COMP_XX
> - drop the register's prefix
>
> Changes v3 since v2 at [2]:
> - update T7 PLL YAML
> - add 't7_' prefix for t7 clock name and variable in t7-pll.c and t7-peripherals.c
> - correct v1 patch link
> - add new macro MESON_PCLK_V2
> - update the driver,header,yaml file license
>
> Changes v2 since v1 at [1]:
> - add CLK_MESON import
> - add const for clkc_regmap_config in PLL driver
> - fix eth_rmii_sel parent
> - update T7 PLL YAML file
>
> [1]: https://lore.kernel.org/all/20241231060047.2298871-1-jian.hu@amlogic.com
> [2]: https://lore.kernel.org/all/20250108094025.2664201-1-jian.hu@amlogic.com
> [3]: https://lore.kernel.org/all/20250509074825.1933254-1-jian.hu@amlogic.com
> [4]: https://lore.kernel.org/all/20251030094345.2571222-1-jian.hu@amlogic.com
> Jian Hu (5):
>   dt-bindings: clock: add Amlogic T7 PLL clock controller
>   dt-bindings: clock: add Amlogic T7 SCMI clock controller
>   dt-bindings: clock: add Amlogic T7 peripherals clock controller
>   clk: meson: t7: add support for the T7 SoC PLL clock
>   clk: meson: t7: add t7 clock peripherals controller driver
>
>  .../clock/amlogic,t7-peripherals-clkc.yaml    |  116 ++
>  .../bindings/clock/amlogic,t7-pll-clkc.yaml   |  114 ++
>  drivers/clk/meson/Kconfig                     |   27 +
>  drivers/clk/meson/Makefile                    |    2 +
>  drivers/clk/meson/t7-peripherals.c            | 1266 +++++++++++++++++
>  drivers/clk/meson/t7-pll.c                    | 1068 ++++++++++++++
>  .../clock/amlogic,t7-peripherals-clkc.h       |  228 +++
>  .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |   56 +
>  include/dt-bindings/clock/amlogic,t7-scmi.h   |   47 +
>  9 files changed, 2924 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/t7-peripherals.c
>  create mode 100644 drivers/clk/meson/t7-pll.c
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

-- 
Jerome
