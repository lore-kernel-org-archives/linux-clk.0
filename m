Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7341AC04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 20:52:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C3F220834
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 20:52:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="owhRmhZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C3F220834
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbeLDUwg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 15:52:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:41704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbeLDUwg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Dec 2018 15:52:36 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C50B206B7;
        Tue,  4 Dec 2018 20:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543956756;
        bh=zsNCgo7ji5imTzfmoxXL0yqwRPkiXDi44Xoqgt2H/c8=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=owhRmhZjmsNxb5eXRPlCg1t6SiFQMU7w++WGrFXXxmPuvRVLV+rM6UT2VE+6+SbK6
         b0b9l2c9MSSK19wAHAiZ6gum9g0+sGzIIIr+HGecx8W3jRqbB9NcwGZTpRVZwMA33v
         iyPQE5n73XKVQcEtRNnSd6gxigtrYaSswL/VclPA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Marek Vasut <marek.vasut@gmail.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181204182721.28258-1-marek.vasut+renesas@gmail.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org
References: <20181204182721.28258-1-marek.vasut+renesas@gmail.com>
Message-ID: <154395675529.88331.12886650536645714742@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: vc5: Add suspend/resume support
Date:   Tue, 04 Dec 2018 12:52:35 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2018-12-04 10:27:21)
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index decffb3826ec..ac90fb36af1a 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -906,6 +906,39 @@ static int vc5_remove(struct i2c_client *client)
>         return 0;
>  }
>  =

> +#ifdef CONFIG_PM_SLEEP
> +static int vc5_suspend(struct device *dev)

Please mark as __maybe_unused and drop the #ifdef CONFIG_PM_SLEEP

> +{
> +       struct vc5_driver_data *vc5 =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D regcache_sync(vc5->regmap);
> +       if (ret !=3D 0) {
> +               dev_err(dev, "Failed to save register map: %d\n", ret);
> +               return ret;

Do we need to block suspend if we can't save the register map away? Or
can we just throw up our hands and not restore on resume?

> +       }
> +       regcache_cache_only(vc5->regmap, true);
> +       regcache_mark_dirty(vc5->regmap);
> +
> +       return 0;
> +}
> +
> +static int vc5_resume(struct device *dev)
> +{
> +       struct vc5_driver_data *vc5 =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       regcache_cache_only(vc5->regmap, false);
> +       ret =3D regcache_sync(vc5->regmap);
> +       if (ret !=3D 0) {
> +               dev_err(dev, "Failed to restore register map: %d\n", ret);
> +               return ret;
> +       }

Simplify to

	if (ret)
		dev_err()
	retun ret;

> +
> +       return 0;
> +}
> +#endif
> +
>  static const struct vc5_chip_info idt_5p49v5923_info =3D {
>         .model =3D IDT_VC5_5P49V5923,
>         .clk_fod_cnt =3D 2,
