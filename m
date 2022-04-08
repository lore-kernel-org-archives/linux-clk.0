Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E395BC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiDHJiS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbiDHJiR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:38:17 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9611142
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:36:13 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q19so11945696wrc.6
        for <linux-clk@vger.kernel.org>; Fri, 08 Apr 2022 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=cAsY16YzwhRto6L8Yc2ER770YJ5ngAtn6h0/0LijC48=;
        b=k9M1u3AsaMOqunuwJciUBVowSFuw/dljJ+31il1oxy1ILM8vkag30ReObo4EX9twww
         HFg4+CP+Pz6QVzI4nUBFWlPtnOLWn5KlX0BqOnp0g2OJgv3RsKFG9oIrqdPa8yCVhB4d
         e8qISV64DrOuGwC01jnx+nHJFmDYWfnrLo8OS10gHg011PvXaqdBfNKFipAVOYFVBY+c
         7/KA6NMbB5vWyY9hz/LVWBwr+T5XoO7CNVtKkzHHFhhAtVL6Kb+gvH6hNy6Ewg5oz8Bz
         hoED0idMGC9y89RI+8wyJ8lAlqq41jpLCFHEyIFnLsz9c3yMSfZtF+l/WGltWo/ofEKt
         XGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=cAsY16YzwhRto6L8Yc2ER770YJ5ngAtn6h0/0LijC48=;
        b=k+l0siIPAaS+1erWIXeZkzQCeWMO4pYtRabbLZW+A3E0hrPcfjHYalCMmgi4mixSkr
         HC7xwbG84XLFwv0e11kgigICdmLFPfpp/VV3Yil74/i1EjgxRHFe2gMN+fG4eof/W9Ux
         oWaFtRxDad+UrTYFNpLHJesrl9rRlsISz5GKoXMjFDtCQ+YJP9Yk/Owk9VTBPg+bjeWG
         LJcA3WPFohKnotXnAo2y0w2/giLIHrYT/SyCZFS+Z2L3XupICvw4+tVkrkgIW52fZVER
         /jJPbanhgF14dHHRJ16NhebTx8PKsnkzzEvoF9iWc8ige/iE55zd56lKIKCNvxosta+9
         6N4w==
X-Gm-Message-State: AOAM533tUBjc0pasR0wqLh8I8OmE/k/xuwHCAF+r+dp8VTbu0RPe4d4B
        P7QzGeFRC7/VqzmOnaa3ukxSYg==
X-Google-Smtp-Source: ABdhPJyyUuDGn0U/TJFMk3ynbNO1Gu6bfmP17uZar/Z1/o+MoNLOoNksSFCR0w/Y75zV0Uq0E92gOQ==
X-Received: by 2002:a05:6000:1c18:b0:206:1029:922f with SMTP id ba24-20020a0560001c1800b002061029922fmr13602804wrb.709.1649410572106;
        Fri, 08 Apr 2022 02:36:12 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c186-20020a1c35c3000000b0038e6c6fc860sm9874276wma.37.2022.04.08.02.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 02:36:11 -0700 (PDT)
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Date:   Fri, 08 Apr 2022 11:18:58 +0200
In-reply-to: <20220408091037.2041955-23-maxime@cerno.tech>
Message-ID: <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 08 Apr 2022 at 11:10, Maxime Ripard <maxime@cerno.tech> wrote:

> A rate of 0 for a clock is considered an error, as evidenced by the
> documentation of clk_get_rate() and the code of clk_get_rate() and
> clk_core_get_rate_nolock().
>
> The main source of that error is if the clock is supposed to have a
> parent but is orphan at the moment of the call. This is likely to be
> transient and solved later in the life of the system as more clocks are
> registered.
>
> The corollary is thus that if a clock is not an orphan, has a parent that
> has a rate (so is not an orphan itself either) but returns a rate of 0,
> something is wrong in the driver. Let's return an error in such a case.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8bbb6adeeead..e8c55678da85 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *core)
>  		rate = 0;
>  	core->rate = core->req_rate = rate;
>  
> +	/*
> +	 * If we're not an orphan clock and our parent has a rate, then
> +	 * if our rate is 0, something is badly broken in recalc_rate.
> +	 */
> +	if (!core->orphan && (parent && parent->rate) && !core->rate) {
> +		ret = -EINVAL;
> +		pr_warn("%s: recalc_rate returned a null rate\n", core->name);
> +		goto out;
> +	}
> +

As hinted in the cover letter, I don't really agree with that.

There are situations where we can't compute the rate. Getting invalid
value in the register is one reason.

You mentioned the PLLs of the Amlogic SoCs (it is not limited to g12 - all
SoCs would be affected):

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/clk-pll.c#n82
Yes, PLL that have not been previously used (by the ROMCode or the
bootloader) tend to have the value of the divider set to 0 which in
invalid as it would result in a division by zero.

I don't think this is a bug. It is just what the HW is, an unlocked,
uninitialized PLL. There is no problem here and the PLL can remain like
that until it is needed.

IMO, whenever possible we should not put default values in the clocks
which is why I chose to leave it like that.

The PLL being unlocked, it has no rate. It is not set to have any rate.
IMO a returning a rate of 0 is valid here.

>  	/*
>  	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
>  	 * don't get accidentally disabled when walking the orphan tree and

