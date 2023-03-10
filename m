Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573AEC64EC4
	for <linux-clk@archiver.kernel.org>; Fri, 10 Mar 2023 17:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbjCJRXk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Mar 2023 12:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjCJRXS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Mar 2023 12:23:18 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110B611CD5A
        for <linux-clk@vger.kernel.org>; Fri, 10 Mar 2023 09:22:35 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id l1so6002943pjt.2
        for <linux-clk@vger.kernel.org>; Fri, 10 Mar 2023 09:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678468954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/DE4BbFE+cxAZN5gN/efxtiXFGQR5+c7FHCyJNvBW0=;
        b=lBKfb9q0r7vkZYNRlLOjcEmf6VPf5rwijNxOF//+Xy4M3xBeF9HOtVh0eG819F2Sev
         NnnbLf8PDG+ZdoYiUrAC2qeUDnwFEp8CQAfkuRHSPd2ovw5P26p7+2+CDJ70+tXr1/Eh
         iLtwr5dZauN0iESvOyUcL+zgmCETUoyN6hTzAVjmTmKUtCBEEXURVcGEBAZEOA8QJXqg
         XeZ+Z86HTwPiBDusp+t3f10kzftM+lNeJbQD88zibtEf47xAeWKTTGFe7PpZVYflLe3U
         WJCL2BRMaurSlT14jx1hTDrzzQH7o+86mTNxfRkrCmSywPD9DkL1RUJ2GN0t/hd01bW5
         PVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678468954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/DE4BbFE+cxAZN5gN/efxtiXFGQR5+c7FHCyJNvBW0=;
        b=NlcPfIy5/Lc2eNV6GA+eiMWKZozB3CCuXo4m0zKJ4yWitC8dZq5hugzMFZIJKhm/C0
         ugkQEJefqcFQUymx2GTbQwdQY0kleeNHrKzCC6ay4+Hj5cqTqzkG9FN4kdCyGiBPK0xd
         Fzgj6hDnUHMDN1zTnZJDHiqX9ljZwFX/HPuWwwpqulUoU4C4NPvaWcghhjxyC6bvwU9G
         xbupAqQa69WElvz1DWFWxmyh/gNPahzkXntrPEjOaffYftNo70/v/+Oh2+UG469JLh5A
         G2NX8vLaCdsHgzSvgM5B0TbACz+CM8XDeEmyQ/+gfsYizxgJFEV+Ek+Uyae26CDumOpA
         eiVw==
X-Gm-Message-State: AO0yUKVldm0b7qCJdpD/11w8z/Bl/cwSKRuJocLTvFTN/dHSxlvSgYCQ
        zHGMCa6omcMX+kR7rpFneIzmj4IBsgHhIUYy/6oh9w==
X-Google-Smtp-Source: AK7set9Hv6Hx+AVNj9NYlD3DaqMoPARFDlR4f7ayZ9t8PEJeytSyInKXiN8NL1CElZFLbGIGgLslyKMEbbMELLNtbOg=
X-Received: by 2002:a17:90a:dc0d:b0:235:1fb7:393c with SMTP id
 i13-20020a17090adc0d00b002351fb7393cmr1198503pjv.1.1678468953481; Fri, 10 Mar
 2023 09:22:33 -0800 (PST)
MIME-Version: 1.0
References: <20230310140218.326626-1-arnd@kernel.org>
In-Reply-To: <20230310140218.326626-1-arnd@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 10 Mar 2023 09:21:57 -0800
Message-ID: <CAGETcx-9PDaWc7eFQ5ajk0BFY7HRhvf30R6uR0Mo1qb+6Af0jQ@mail.gmail.com>
Subject: Re: [PATCH] clk: avoid build failure on CLK_OF_DECLARE() with invalid name
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 10, 2023 at 6:02=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Generating an init function function from CLK_OF_DECLARE() broke for the
> 98dx1135_clk declaration because that string starts with a digit and
> is not a valid C identifier:

Nathan already sent out a fix for this and it's been picked up.

https://lore.kernel.org/lkml/20230308-clk_of_declare-fix-v1-1-317b741e2532@=
kernel.org/

-Saravana

>
> In file included from drivers/clk/mvebu/kirkwood.c:15:
> drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135_clk_of=
_clk_init_declare" on integer constant
>   358 | CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",
>       |                ^~~~~~~~~~~~
> include/linux/clk-provider.h:1367:28: note: in definition of macro 'CLK_O=
F_DECLARE'
>  1367 |         static void __init name##_of_clk_init_declare(struct devi=
ce_node *np) \
>       |                            ^~~~
> drivers/clk/mvebu/kirkwood.c:358:16: error: expected identifier or '(' be=
fore numeric constant
>   358 | CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",
>       |                ^~~~~~~~~~~~
> include/linux/clk-provider.h:1367:28: note: in definition of macro 'CLK_O=
F_DECLARE'
>  1367 |         static void __init name##_of_clk_init_declare(struct devi=
ce_node *np) \
>       |                            ^~~~
>
> This could be fixed in the driver by renaming 98dx1135_clk to a valid
> C identifier, but it's easy enough to make the macro more robust by
> reversing the two parts of the name, which makes it work for other files
> that may have the same issue. Since CLK_OF_DECLARE_DRIVER() has a very
> similar definition, do the same change in both.
>
> Fixes: c7296c51ce5d ("clk: core: New macro CLK_OF_DECLARE_DRIVER")
> Fixes: c28cd1f3433c ("clk: Mark a fwnode as initialized when using CLK_OF=
_DECLARE() macro")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/linux/clk-provider.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index c9f5276006a0..3586a029db05 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1364,24 +1364,24 @@ struct clk_hw_onecell_data {
>  };
>
>  #define CLK_OF_DECLARE(name, compat, fn) \
> -       static void __init name##_of_clk_init_declare(struct device_node =
*np) \
> +       static void __init of_clk_init_declare##name(struct device_node *=
np) \
>         {                                                               \
>                 fn(np);                                                 \
>                 fwnode_dev_initialized(of_fwnode_handle(np), true);     \
>         }                                                               \
> -       OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
> +       OF_DECLARE_1(clk, name, compat, of_clk_init_declare##name)
>
>  /*
>   * Use this macro when you have a driver that requires two initializatio=
n
>   * routines, one at of_clk_init(), and one at platform device probe
>   */
>  #define CLK_OF_DECLARE_DRIVER(name, compat, fn) \
> -       static void __init name##_of_clk_init_driver(struct device_node *=
np) \
> +       static void __init of_clk_init_driver##name(struct device_node *n=
p) \
>         {                                                               \
>                 of_node_clear_flag(np, OF_POPULATED);                   \
>                 fn(np);                                                 \
>         }                                                               \
> -       OF_DECLARE_1(clk, name, compat, name##_of_clk_init_driver)
> +       OF_DECLARE_1(clk, name, compat, of_clk_init_driver##name)
>
>  #define CLK_HW_INIT(_name, _parent, _ops, _flags)              \
>         (&(struct clk_init_data) {                              \
> --
> 2.39.2
>
