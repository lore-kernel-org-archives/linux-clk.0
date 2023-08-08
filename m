Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A22C001DE
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 17:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbjHHRma (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234838AbjHHRl4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 13:41:56 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1E74221
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:18:31 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so33898645e9.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691511471; x=1692116271;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=mFOhD8TvrN3kEaAYXPGjF3oU27kR58bUIX2cHeJs6g4=;
        b=DXpN+35+x6ub07pOtOPbDVyB/Cu5z5Sln5usVivcUFSczSLlPMdfGPm7sXnhe0Powu
         33Q0IYCGbtc9+aXdpUnrqZMmhBBQ0BzYea12ss7BAQpkKvbZ1OlqMMVLeQITHi54Y9hW
         Cb66D5cbGlmubI+RpXSy8tsjFNFzOxNg/huUx263xJEplblg8o5m8XuGm5C+TgMwO4ha
         GitavVfiOHvT9l8J+5W22uwwbgF2nGkFosVRpWSDWkY0X/Gm8X22IHjvxygJkMVuoCLX
         xrC43RO7IoiVrX2Wf8Zor9SmHqNvGNaQwrI1Up9iW5LGRPuZzy2ECUztQRrrkBEPEZYw
         UgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511471; x=1692116271;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFOhD8TvrN3kEaAYXPGjF3oU27kR58bUIX2cHeJs6g4=;
        b=Gc+A0pjtMP18oHYGb57G7hO73Bb1jnvWighMlOkwWdmggh4cEeNLsrHz7n7xxdzhOn
         VhsztHl5z7b1Y9DUBhVW9ehOcacXk912UdjjQmNhp/VDLREeJ/s5vQhGRJS+woveWKiD
         m5FY4W+LK4TmtgU5xLBAzZxz1QixPmrylBZ4cYDqfjWk719sNDlFFzr562nG0Em5B2uZ
         mxDHfWDnnSfPNynqFe6Ug6aJm5nk/Ylp9TYt360XPI2OMMMcJTQh5nhN01/vrYcPKh/m
         FUdkEVVKyuSQqhwHgS2EHqeWY76N5RIVRBaH7Mtgj2jxwFzSN86n9KtRb2QGkQsEXo9k
         6Crg==
X-Gm-Message-State: AOJu0Yx9HdY45zS13qdBneJG5tN7Wiwl9z0q/kYnZKXDD5TnX5zJO3Tn
        ix2wHLYUeEfEZ43PWi9B80Us1ppyWPihh+qGhSg=
X-Google-Smtp-Source: AGHT+IFozB535bQ3dsOdzC8ibC2SVAdeAA6xH1Rr7AndjIWl+K+Gm3Yi/Og8fGDBzvdPVLlNGUdwCw==
X-Received: by 2002:a05:6000:1247:b0:317:f4c2:a99d with SMTP id j7-20020a056000124700b00317f4c2a99dmr2600500wrx.53.1691501231461;
        Tue, 08 Aug 2023 06:27:11 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:efd4:f3df:2c50:1776])
        by smtp.gmail.com with ESMTPSA id r2-20020a5d4942000000b003063a92bbf5sm13729592wrs.70.2023.08.08.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:27:11 -0700 (PDT)
References: <20230731042807.1322972-1-wenst@chromium.org>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: meson8b: Simplify notifier clock lookup
Date:   Tue, 08 Aug 2023 15:21:46 +0200
In-reply-to: <20230731042807.1322972-1-wenst@chromium.org>
Message-ID: <1jpm3xoea9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 31 Jul 2023 at 12:27, Chen-Yu Tsai <wenst@chromium.org> wrote:

> The driver registers a clock notifier by first getting the name of one
> of its clocks it just registered, then uses the name to look up the
> clock. The lookup is not needed, since each clock provider already
> has a clock attached to it. Use that instead to get rid of a
> __clk_lookup() call.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Found this could be simplified while looking through some clk core code.
>
>
>  drivers/clk/meson/meson8b.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 827e78fb16a8..c4336ac012bf 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -3793,7 +3793,6 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>  {
>  	struct meson8b_clk_reset *rstc;
>  	struct device_node *parent_np;
> -	const char *notifier_clk_name;
>  	struct clk *notifier_clk;
>  	struct regmap *map;
>  	int i, ret;
> @@ -3847,9 +3846,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>  	 * tricky programming sequence will be handled by the forthcoming
>  	 * coordinated clock rates mechanism once that feature is released.
>  	 */
> -	notifier_clk_name = clk_hw_get_name(&meson8b_cpu_scale_out_sel.hw);
> -	notifier_clk = __clk_lookup(notifier_clk_name);
> -	ret = clk_notifier_register(notifier_clk, &meson8b_cpu_nb_data.nb);
> +	ret = clk_notifier_register(meson8b_cpu_scale_out_sel.hw.clk, &meson8b_cpu_nb_data.nb);

Hi Chen-Yu,

Your patch seems valid, as CCF stands right now.

However, I believe there is a will to drop the 'struct clk' instance that
automatically gets created with each 'struct clk_hw'. This change would
not help going in this direction

Stephen, what do you think ? 

>  	if (ret) {
>  		pr_err("%s: failed to register the CPU clock notifier\n",
>  		       __func__);

