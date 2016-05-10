Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:60199 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751244AbcEJMZk (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2016 08:25:40 -0400
Message-ID: <1462883138.9155.3.camel@pengutronix.de>
Subject: Re: [RFC PATCH 13/21] reset: uniphier: add reset driver for
 UniPhier PH1-LD4 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 10 May 2016 14:25:38 +0200
In-Reply-To: <1462873862-30940-14-git-send-email-yamada.masahiro@socionext.com>
References: <1462873862-30940-1-git-send-email-yamada.masahiro@socionext.com>
	 <1462873862-30940-14-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Masahiro,

Am Dienstag, den 10.05.2016, 18:50 +0900 schrieb Masahiro Yamada:
> This series is just for review.
> Please do not apply this patch.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

No need for all these tiny drivers. If you probe from DT as Lee
requests, you can let of_device_id.data point to a compatible specific
uniphier_reset_data.

regards
Philipp

