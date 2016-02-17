Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:33745 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161037AbcBQS6N (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 17 Feb 2016 13:58:13 -0500
Received: by mail-ig0-f173.google.com with SMTP id y8so131178937igp.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Feb 2016 10:58:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455734900-1913-1-git-send-email-agust@denx.de>
References: <1455734900-1913-1-git-send-email-agust@denx.de>
Date: Wed, 17 Feb 2016 16:58:13 -0200
Message-ID: <CAOMZO5Cwed8uOKz6=Odu=jaaBqoNzUxm2Xv3+6TAxKGsa27Mdw@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: correct pwm7 clock name in driver for i.MX6UL
From: Fabio Estevam <festevam@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Cc: linux-clk@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 17, 2016 at 4:48 PM, Anatolij Gustschin <agust@denx.de> wrote:
> Don't capitalize p in the pwm7 clock name.
>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

Thanks.

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
