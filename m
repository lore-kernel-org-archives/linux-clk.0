Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:34274 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752183AbdAZOuc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2017 09:50:32 -0500
Received: by mail-ot0-f194.google.com with SMTP id 73so27582136otj.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2017 06:50:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOi56cUrAyqV3e1zW+UGNRfGaueJr9yH1md3DPJT6vVM_zfpTA@mail.gmail.com>
References: <1484762037-10737-1-git-send-email-fabio.estevam@nxp.com>
 <1484762037-10737-2-git-send-email-fabio.estevam@nxp.com> <CAOi56cUrAyqV3e1zW+UGNRfGaueJr9yH1md3DPJT6vVM_zfpTA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Jan 2017 12:50:31 -0200
Message-ID: <CAOMZO5CTrO2kEgxg=-KamZb5HXEoy18T0yDDxGQ4b9oscjU2_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: imx7d: Add the IPG root clock
To: Kevin Hilman <khilman@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Kevin,

On Thu, Jan 26, 2017 at 3:24 AM, Kevin Hilman <khilman@baylibre.com> wrote:
> Hi Fabio,
>
> On Wed, Jan 18, 2017 at 9:53 AM, Fabio Estevam <fabio.estevam@nxp.com> wrote:
>> Add an entry for the IMX7D_IPG_ROOT clock.
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
>
> kernelci.org started detecting boot failures on imx7s-warp in
> next-20160124[1], and I bisected it down to this patch, which is in
> linux-next as commit dde08302c083.
>
> I verified that reverting that commit on top of next-20160124 gets
> imx7s-warp booting again.

Thanks for the report.

Stephen, could you please drop this patch from your tree? I will
investigate the issue.
