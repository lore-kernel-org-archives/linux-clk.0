Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33412 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757840AbcGKIO1 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2016 04:14:27 -0400
MIME-Version: 1.0
In-Reply-To: <1467987300-31450-1-git-send-email-s.nawrocki@samsung.com>
References: <1467987300-31450-1-git-send-email-s.nawrocki@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Date: Mon, 11 Jul 2016 10:14:26 +0200
Message-ID: <CAJKOXPcGSj=fxyMM8KZQ3rCLaCP6=VWowg8xb=w3PDO+TLyEzg@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: Allow modular build of the Audio Subsystem
 CLKCON driver
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	=?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
	<b.zolnierkie@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 8, 2016 at 4:15 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Any clock dependencies can be properly handled with deferred probing
> so we can remove core_initcall and switch to a proper loadable platform
> driver module.
> This change has been tested on Exynos4412 Odroid U3 based board.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/clk/samsung/Kconfig            |  9 +++++++++
>  drivers/clk/samsung/Makefile           |  2 +-
>  drivers/clk/samsung/clk-exynos-audss.c | 12 +-----------
>  3 files changed, 11 insertions(+), 12 deletions(-)
>

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
