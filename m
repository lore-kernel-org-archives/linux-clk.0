Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4790C433FF
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:09:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BC642184E
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565276943;
	bh=B0eHh/WZOcD8xWHkwc6hMMbCfT1pvVEPY36as1jU25E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=XzMWki8Cqn47LEoSGMT/RMUhSWbG6tPx1vQJavG5MslJlOh8c79EodQZ8wcoxrboR
	 xJsaX3ROSRsnFdaa+3j0k6ml7X5QnZeTfswiKVc4Hug4s7IUmrAfzx5JTlSS7TSxph
	 nkTaXuQyZCjyudNFVevWMpbkAQSlMkmp+SAWYxps=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732698AbfHHPJD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 11:09:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:43390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730678AbfHHPJC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 11:09:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6C932184E;
        Thu,  8 Aug 2019 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565276942;
        bh=B0eHh/WZOcD8xWHkwc6hMMbCfT1pvVEPY36as1jU25E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LY4/j5NsBljPXpzM+7voo5j3o/JQvsHPjUzE2MyIMMZ6fFgSApQN4B8u3zRB5Y62S
         6eshUcHuq6CXBchpm6zAdWLn9knVy/7rINWnDsE4ei6LBUUmDG8F6jCMnxh17m0+mK
         dQavqSCriWOMHTi3kWksYxE2f7gpYmuTUOPkPLuE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726092332.25202-5-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <20190726092332.25202-5-govinds@codeaurora.org>
Subject: Re: [PATCH v5 4/7] clk: qcom: Add Q6SSTOP clock controller for QCS404
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 08:09:00 -0700
Message-Id: <20190808150901.D6C932184E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2019-07-26 02:23:29)
> diff --git a/drivers/clk/qcom/q6sstop-qcs404.c b/drivers/clk/qcom/q6sstop=
-qcs404.c
> new file mode 100644
> index 000000000000..b6281986b077
> --- /dev/null
> +++ b/drivers/clk/qcom/q6sstop-qcs404.c
> @@ -0,0 +1,223 @@
[...]
> +};
> +
> +static struct platform_driver q6sstopcc_qcs404_driver =3D {
> +       .probe          =3D q6sstopcc_qcs404_probe,
> +       .remove         =3D q6sstopcc_qcs404_remove,
> +       .driver         =3D {
> +               .name   =3D "qcs404-q6sstopcc",
> +               .of_match_table =3D q6sstopcc_qcs404_match_table,
> +       .pm =3D &q6sstopcc_pm_ops,

This got some weird indent.

> +       },
> +};
> +
> +module_platform_driver(q6sstopcc_qcs404_driver);
> +
> +MODULE_DESCRIPTION("QTI QCS404 Q6SSTOP Clock Controller Driver");
> +MODULE_LICENSE("GPL v2");
