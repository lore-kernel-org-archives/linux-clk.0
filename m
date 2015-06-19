Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:33615 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbbFSQB3 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jun 2015 12:01:29 -0400
MIME-Version: 1.0
In-Reply-To: <1434464615-9080-2-git-send-email-matthias.bgg@gmail.com>
References: <1434464615-9080-1-git-send-email-matthias.bgg@gmail.com>
	<1434464615-9080-2-git-send-email-matthias.bgg@gmail.com>
Date: Fri, 19 Jun 2015 18:01:27 +0200
Message-ID: <CAGhQ9Vx3qxvawiUYtEjr7z=o6mS3TirCzRd9-UZ0FP=equWEaQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] clk: Add regmap support
From: Joachim Eastwood <manabian@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: mturquette@gmail.com, Stephen Boyd <sboyd@codeaurora.org>,
	henryc.chen@mediatek.com, s.hauer@pengutronix.de,
	jamesjj.liao@mediatek.com, Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Matthias,

On 16 June 2015 at 16:23, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> Some devices like SoCs from Mediatek need to use the clock
> through a regmap interface.
> This patch adds regmap support for the simple multiplexer clock,
> the divider clock and the clock gate code.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

I think it looks fine now and I have no further comments, so:
Acked-by: Joachim Eastwood <manabian@gmail.com>

Hope this can go in for 4.3.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe linux-clk" in
