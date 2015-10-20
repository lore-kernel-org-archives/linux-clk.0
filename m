Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:33333 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111AbbJTMUt (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 20 Oct 2015 08:20:49 -0400
MIME-Version: 1.0
In-Reply-To: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Date: Tue, 20 Oct 2015 21:20:48 +0900
Message-ID: <CAJKOXPcf1V9TEVqYDhHyejhW82A1EeYo+Qn8ksiQC02N=kw+Rw@mail.gmail.com>
Subject: Re: [PATCH 00/10] drm/exynos/decon5433: add support to DECON-TV
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

2015-10-20 18:22 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> Hi Inki,
>
> This patchset adds support to DECON-TV in Exynos5433 SoC.
> The main patch is prepended with few preparation patches:
> - add three clocks required by HDMI pipeline,
> - small bindings update,
> - driver cleanup.
>
> The patchset is based on the latest exynos-drm-next branch.

So I am assuming this will go through Exynos drm tree. Please ping me
if you need something from my side (except dt-bindings I guess?).

Best regards,
Krzysztof
