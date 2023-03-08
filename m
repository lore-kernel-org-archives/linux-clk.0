Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBB0C678D5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 22:38:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjCHWiO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 17:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjCHWiN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 17:38:13 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5B926CD5
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 14:38:11 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so4056194pjg.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 14:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678315090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJdbC6w3SG4MYVN7j4d6HyU3EGtnN0pTLcXjZIeQBXQ=;
        b=OPBNp/YttWUDsJFSSe6u6gfNGNjamRUW9J/pyRyChRJll/rzlE+0C4Hgds3FzyN+bo
         fYiPQ8Bkl1Wlr9gIs812CcBLCF4z1asWyNml83uBJb3hrAXOl8eYBrrwzbO5S5CMNLBE
         MKmv04+V3bqqPsHSkMTQR7in9mjpUwfTHDHn2GaX79XG4uHgoLomQETWFSQ8nKYo+B0W
         wl3hgZwRAtBIVA0vEDyiILAvWICKCU5uINI8IGyZLuoPazXYilxQNZwQUgqYhMe+uZeJ
         W1T+D4zyrB9lDHlCUQl84KmfbH4HhTnWeCjFGnnY9LkL/ii4NDDkoWcD65F3z834ZfR7
         0Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678315090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJdbC6w3SG4MYVN7j4d6HyU3EGtnN0pTLcXjZIeQBXQ=;
        b=QGisqYa1c9sWaYhys+ulV/x/+kgW3fBwiM0PeCAfxEIc8PZ7LNLshk6o5DzapeZhUw
         Zv2XMLINcFW7pK4C0HAEXGFcJEyK/nFHzABTbfB3TFP7XjKR5nBAmVTtrobzf9mIYY+1
         KunAPD+ifjfqa0tdBZMhrLoUrCFR7f+YFLotBj48kWYSVunUwTMsvizTbHWcrEo5ZZBc
         Wcomgr+UYboQkp8dcSVm2CtFXGKEW/g/3xNss89+PsfFW3lZHAEowC1srsWD7PVUayLl
         pxqIga2XDd86ftkRSsOJtUwBBVqCmu9kUh2Q2ZhP/xaQeQbGGYX0tD6NBV5u8sEQLeuL
         pobA==
X-Gm-Message-State: AO0yUKVaNtkM++jdsMvnEZvAU7AomOzAms9SrAP4ubK8IFHWOaJMer8c
        HT2iusu3okqPjbgS8hqEoBgMOWuh8Zw73LKQuGliwuk03Q4d+BIMBPg=
X-Google-Smtp-Source: AK7set8/aQu37GV6TlGzEl1hGmKYEXe+8jMt96Eq9dvNK8lqb5Fev/lbf/mMmtT61CDOqg9Qxnegn9hFQivBUKI29p0=
X-Received: by 2002:a17:903:449:b0:199:4830:5cc9 with SMTP id
 iw9-20020a170903044900b0019948305cc9mr7546879plb.10.1678315089908; Wed, 08
 Mar 2023 14:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20230308-clk_of_declare-fix-v1-1-317b741e2532@kernel.org>
In-Reply-To: <20230308-clk_of_declare-fix-v1-1-317b741e2532@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 8 Mar 2023 14:37:34 -0800
Message-ID: <CAGETcx_YSKw56HBJmbhYEpHzatb3YQu_msf6Mq=rJUAY_zXp-g@mail.gmail.com>
Subject: Re: [PATCH] clk: Avoid invalid function names in CLK_OF_DECLARE()
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 8, 2023 at 12:47=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit c28cd1f3433c ("clk: Mark a fwnode as initialized when using
> CLK_OF_DECLARE() macro"), drivers/clk/mvebu/kirkwood.c fails to build:
>
>  drivers/clk/mvebu/kirkwood.c:358:1: error: expected identifier or '('
>  CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",
>  ^
>  include/linux/clk-provider.h:1367:21: note: expanded from macro 'CLK_OF_=
DECLARE'
>          static void __init name##_of_clk_init_declare(struct device_node=
 *np) \
>                             ^
>  <scratch space>:124:1: note: expanded from here
>  98dx1135_clk_of_clk_init_declare
>  ^
>  drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal =
constant
>  include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF_=
DECLARE'
>          OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
>                                          ^
>  <scratch space>:125:3: note: expanded from here
>  98dx1135_clk_of_clk_init_declare
>    ^
>  drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal =
constant
>  include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF_=
DECLARE'
>          OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
>                                          ^
>  <scratch space>:125:3: note: expanded from here
>  98dx1135_clk_of_clk_init_declare
>    ^
>  drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal =
constant
>  include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF_=
DECLARE'
>          OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
>                                          ^
>  <scratch space>:125:3: note: expanded from here
>  98dx1135_clk_of_clk_init_declare
>    ^
>
> C function names must start with either an alphabetic letter or an
> underscore. To avoid generating invalid function names from clock names,
> add two underscores to the beginning of the identifier.
>
> Fixes: c28cd1f3433c ("clk: Mark a fwnode as initialized when using CLK_OF=
_DECLARE() macro")
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  include/linux/clk-provider.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index c9f5276006a0..6f3175f0678a 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1364,12 +1364,12 @@ struct clk_hw_onecell_data {
>  };
>
>  #define CLK_OF_DECLARE(name, compat, fn) \
> -       static void __init name##_of_clk_init_declare(struct device_node =
*np) \
> +       static void __init __##name##_of_clk_init_declare(struct device_n=
ode *np) \
>         {                                                               \
>                 fn(np);                                                 \
>                 fwnode_dev_initialized(of_fwnode_handle(np), true);     \
>         }                                                               \
> -       OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
> +       OF_DECLARE_1(clk, name, compat, __##name##_of_clk_init_declare)
>
>  /*
>   * Use this macro when you have a driver that requires two initializatio=
n

Thanks Nathan!

Reviewed-by: Saravana Kannan <saravanak@google.com>

-Saravana

>
> ---
> base-commit: 89dc65a7cc8a119c395c0931b12d7a514f9d2bcc
> change-id: 20230308-clk_of_declare-fix-4fb89765923e
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
