Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:38807 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752116AbeAEXCE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Jan 2018 18:02:04 -0500
Received: by mail-wm0-f45.google.com with SMTP id 64so5034092wme.3
        for <linux-clk@vger.kernel.org>; Fri, 05 Jan 2018 15:02:04 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: <devicetree@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Carlo Caione <carlo@caione.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8] arm64: dts: meson-axg: switch uart_ao clock to CLK81
References: <20171215141741.175985-1-yixun.lan@amlogic.com>
Date: Fri, 05 Jan 2018 15:01:58 -0800
In-Reply-To: <20171215141741.175985-1-yixun.lan@amlogic.com> (Yixun Lan's
        message of "Fri, 15 Dec 2017 22:17:41 +0800")
Message-ID: <7hvagf29ll.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Yixun Lan <yixun.lan@amlogic.com> writes:

> Switch the uart_ao pclk to CLK81 since the clock driver is ready.
>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Applied to v4.16/dt64 with Neil's tag.

Kevin
