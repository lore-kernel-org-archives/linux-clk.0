Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935486AbeE2QiZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 May 2018 12:38:25 -0400
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com [209.85.128.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 42E5620851
        for <linux-clk@vger.kernel.org>; Tue, 29 May 2018 16:38:24 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id 94-v6so26608703wrf.5
        for <linux-clk@vger.kernel.org>; Tue, 29 May 2018 09:38:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180529150455.17300-4-peron.clem@gmail.com>
References: <20180529150455.17300-1-peron.clem@gmail.com> <20180529150455.17300-4-peron.clem@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 May 2018 11:38:02 -0500
Message-ID: <CABGGisywxqoFjhp6uOwZ-TG-Dv4dKLtZMnq90EcccurAvuwcVg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] Documentation: DT: add i.MX EPIT timer binding
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Colin Didier <colin.didier@devialet.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 29, 2018 at 10:04 AM, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> From: Cl=C3=A9ment Peron <clement.peron@devialet.com>
>
> Add devicetree binding document for NXP's i.MX SoC specific
> EPIT timer driver.
>
> Signed-off-by: Cl=C3=A9ment Peron <clement.peron@devialet.com>
> ---
>  .../devicetree/bindings/clock/imx6q,epit.txt  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx6q,epit.tx=
t

Please send DT bindings to the correct list.

Rob
