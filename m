Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82ECC77B73
	for <linux-clk@archiver.kernel.org>; Thu, 20 Apr 2023 07:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbjDTHI0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Apr 2023 03:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbjDTHIZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2023 03:08:25 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9D34C0C
        for <linux-clk@vger.kernel.org>; Thu, 20 Apr 2023 00:07:48 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso3159574wmo.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Apr 2023 00:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681974465; x=1684566465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhuncWQnqL53OVPD8IqXPC3FkGRRZlVikfJFBCGy4Lg=;
        b=WMEpDHV7pbMxZMffcDDIHxhaGkYx2XqFvYHjIoBIBlINf9k3WbufMWyUOlwWN5d0tu
         1RXDC4hl9L8rJFvbFc89UoEM8EX9cUMm/iuXePPQp0fG61AgFR7ABVXC9dRjvGXueC5Q
         GqnLtObmqH/UrrXHz5RH1I5QNVAXMEgT3Mol4uDLRAcXHGPSpG7OVqrK7TOSe0F/sEvE
         mABcwkDCqOLK2+3auuFkjWnJPoxjWZAuKbsZ1/WbiY3r/ckeYRKQEkECPnqWWXLG2Qis
         1zrMZxVE4zReeW19RdKYYDXjwgVn6CplOZqLyoVuBtmirIfLIzF8Cc2S9P3EYJzluPVU
         XGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681974465; x=1684566465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhuncWQnqL53OVPD8IqXPC3FkGRRZlVikfJFBCGy4Lg=;
        b=CsG0pMOyC+xUAA6/SnsiSwss5IxJBOvqsTWjsM0XDlM+pX1+Qrxcwpd+AwQz3QBE24
         rh2h4w014hR6XmK/lg7sz7rAUeWmc98NlCjvj15sR6N2jmaA37hgyy3aBrRxGGX45iZY
         U8nPIkdnRK2SHTQg2+IIQbFtRUHfhHmloJcI1CefjwmCn2MbSmX3T7YrgrAtLOQ9OvQ4
         X0bmaZQMP72Ix4mlvrZhoCCF3SFLUTtW96wDrfUIbCkmc8DiJmStoTDFgnvCk7doW507
         Qp7sK3h4YvxY6nK/F5msTFmLvEEw86Uh0Q/iCrJv2J25iUIFya4e4FZow8KzOL0fjlPY
         pAZw==
X-Gm-Message-State: AAQBX9eqfCWsQ4sNmJPgLXN+UD3vFQY93WtY/8KjZ2kmlLWKu1M9BTIX
        jiST3bTVZsstFnX38AWMtlKIjw==
X-Google-Smtp-Source: AKy350Zo94A6yq/YLyR7BmER4zmeAFkMPDoyvCk/JuFshZ+UEMq6+vN1jWh66hFJIzvEyyUcdr43RA==
X-Received: by 2002:a7b:c5da:0:b0:3f1:7ba6:d5ab with SMTP id n26-20020a7bc5da000000b003f17ba6d5abmr386787wmk.36.1681974465598;
        Thu, 20 Apr 2023 00:07:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z19-20020a1c4c13000000b003f173419e7asm1014486wmf.43.2023.04.20.00.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:07:44 -0700 (PDT)
Date:   Thu, 20 Apr 2023 10:07:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Dom Cobley <popcornmix@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: bcm: rpi: Fix off by one in
 raspberrypi_discover_clocks()
Message-ID: <758c22df-eb9f-48ab-84c1-b24f325d068b@kili.mountain>
References: <9d4496c2-e102-4fc6-afe2-5a917930d15a@kili.mountain>
 <1dcd711f-681a-a80d-4007-b808a29e46b9@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dcd711f-681a-a80d-4007-b808a29e46b9@i2se.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 19, 2023 at 05:55:12PM +0200, Stefan Wahren wrote:
> Hi Dan,
> 
> Am 19.04.23 um 09:56 schrieb Dan Carpenter:
> > Smatch detected an off by one in this code:
> > 
> >      drivers/clk/bcm/clk-raspberrypi.c:374 raspberrypi_discover_clocks()
> >      error: buffer overflow 'data->hws' 16 <= 16
> > 
> > The data->hws[] array has RPI_FIRMWARE_NUM_CLK_ID elements so the >
> > comparison needs to changed to >=.
> > 
> > Fixes: 12c90f3f27bb ("clk: bcm: rpi: Add variant structure")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > The clks[] array, on the other hand, is correct.  It allocates
> > RPI_FIRMWARE_NUM_CLK_ID + 1 elements because the last element is a
> > sentinal.
> > 
> >   drivers/clk/bcm/clk-raspberrypi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> > index eb399a4d141b..d4b43e33035c 100644
> > --- a/drivers/clk/bcm/clk-raspberrypi.c
> > +++ b/drivers/clk/bcm/clk-raspberrypi.c
> > @@ -356,7 +356,7 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
> >   	while (clks->id) {
> >   		struct raspberrypi_clk_variant *variant;
> > -		if (clks->id > RPI_FIRMWARE_NUM_CLK_ID) {
> > +		if (clks->id >= RPI_FIRMWARE_NUM_CLK_ID) {
> >   			dev_err(rpi->dev, "Unknown clock id: %u (max: %u)\n",
> >   					   clks->id, RPI_FIRMWARE_NUM_CLK_ID);
> 
> the change looks good, but shouldn't we also reduce the max in the error
> message by one?

Sure.  Let me resend.

regards,
dan carpenter

