Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:40566 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935029AbeE2PVZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 May 2018 11:21:25 -0400
MIME-Version: 1.0
In-Reply-To: <20180529150455.17300-2-peron.clem@gmail.com>
References: <20180529150455.17300-1-peron.clem@gmail.com> <20180529150455.17300-2-peron.clem@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 May 2018 12:21:24 -0300
Message-ID: <CAOMZO5DRsYjmmzprs6rCqp76Y0xsnRE46r+_jxBvkFeMux8+xA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: imx: remove inexistant EPIT timer init
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Colin Didier <colin.didier@devialet.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 29, 2018 at 12:04 PM, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> From: Cl=C3=A9ment Peron <clement.peron@devialet.com>
>
> i.MX EPIT timer has been removed but not the init function declaration.
>
> Signed-off-by: Cl=C3=A9ment Peron <clement.peron@devialet.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
