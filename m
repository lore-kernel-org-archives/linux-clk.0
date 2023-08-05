Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF36EB64DD
	for <linux-clk@archiver.kernel.org>; Sat,  5 Aug 2023 04:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjHEEvq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Aug 2023 00:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjHEEvn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Aug 2023 00:51:43 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A354ED6
        for <linux-clk@vger.kernel.org>; Fri,  4 Aug 2023 21:51:42 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-564af1b3a9fso1278990a12.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Aug 2023 21:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1691211102; x=1691815902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gbgtCB+dOAL/DzPR70s7i6VCNzOXTUe2Hu+VGOpYqD0=;
        b=L1UizfHMs8JegWzlReek7QLosNeMwx0v7qyCF93xiH/VTH6LZ0G0gRFm8SHf/IAFle
         96lL6srpuO85BLhsgHS92+6PQgkT/CjT/mf3bNOdAL2xOlXk/OoLDZJ+q2Dc1t8xBF7w
         grbJw7l6fB4o4UbaqxkFia0LavgrOCR/x/fUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691211102; x=1691815902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbgtCB+dOAL/DzPR70s7i6VCNzOXTUe2Hu+VGOpYqD0=;
        b=bSxotEDoUN55TNahniiHkEy7hv7SOUhDoYP74TlyDrLkdvWx4Jl/qgOLBh/wQaWs8k
         b3wJszp0WKqlURoHmlF/TS2d2J+mqd2nGcLMAqIa2eXI9lsSrhJqwKx5a8Fypo3TJK1r
         5EBaKOaEF34zm8WAnJ1gV22pZ9onViebnbaJbM9hHhRztZFMxh2fY8pHNSGk5HXj+sJ4
         UwZgZ1fUGfoLvnLHRXOW3lXaigC8+aWL45nX4ADHI/mqKEU7NISNvOYH5bMXdL3KlHAm
         w5EOaJX5/JIM0xBW/S3Zp3tL2Lb4d3bBiRCzz8FxvXm/XfZs6MApV1jx2nszWHXAbCz3
         UJnA==
X-Gm-Message-State: AOJu0YyrvtPwwiXb2W1cTuIN/Sgo3Hk7I4mPKI1bsYSDqaY9DXuaaci2
        98kNj1UyhwuV1bU3Pjj1pZ4K69Y4uIM+UC6OAl+7/Q==
X-Google-Smtp-Source: AGHT+IEBCdJVNWA3yX6kF4Qk8ek7RVxnJa5MFdkQ9iLj3i0xpkQaSp8M+g+EldFKI5RxVQJnzpZzkoS2vKTR1TFFjc8=
X-Received: by 2002:a17:90b:3e88:b0:268:c5af:d253 with SMTP id
 rj8-20020a17090b3e8800b00268c5afd253mr1873977pjb.8.1691211102079; Fri, 04 Aug
 2023 21:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <c1e89c69-3ddf-4a02-bd79-72872e42c01a@moroto.mountain>
In-Reply-To: <c1e89c69-3ddf-4a02-bd79-72872e42c01a@moroto.mountain>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sat, 5 Aug 2023 13:51:29 +0900
Message-ID: <CAFr9PXn3rYJh3n2v9xauCe-sQ12WKkFOFZFXbscG5P1G9M=sRA@mail.gmail.com>
Subject: Re: [bug report] clk: mstar: MStar/SigmaStar MPLL driver
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dan,

On Thu, 3 Aug 2023 at 19:28, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Hello Daniel Palmer,
>
> The patch bef7a78da716: "clk: mstar: MStar/SigmaStar MPLL driver"
> from Feb 11, 2021 (linux-next), leads to the following Smatch static
> checker warning:
>
>         drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
>         error: buffer overflow 'mpll->clk_data->hws' 7 <= 7
>
> drivers/clk/mstar/clk-msc313-mpll.c
>     106
>     107         mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
>                                                                                ^^^
>     108                         ARRAY_SIZE(output_dividers)), GFP_KERNEL);
>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ->hws has 7 elements
>
>     109         if (!mpll->clk_data)
>     110                 return -ENOMEM;
>     111
>     112         clk_init.name = dev_name(dev);
>     113         clk_init.ops = &msc313_mpll_ops;
>     114         clk_init.parent_data = &mpll_parent;
>     115         clk_init.num_parents = 1;
>     116         mpll->clk_hw.init = &clk_init;
>     117
>     118         ret = devm_clk_hw_register(dev, &mpll->clk_hw);
>     119         if (ret)
>     120                 return ret;
>     121
>     122         mpll->clk_data->num = NUMOUTPUTS;
>     123         mpll->clk_data->hws[0] = &mpll->clk_hw;
>     124
>     125         for (i = 0; i < ARRAY_SIZE(output_dividers); i++) {
>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> i is 0-6.
>
>     126                 outputname = devm_kasprintf(dev, GFP_KERNEL, "%s_div_%u",
>     127                                 clk_init.name, output_dividers[i]);
>     128                 if (!outputname)
>     129                         return -ENOMEM;
>     130                 divhw = devm_clk_hw_register_fixed_factor(dev, outputname,
>     131                                 clk_init.name, 0, 1, output_dividers[i]);
>     132                 if (IS_ERR(divhw))
>     133                         return PTR_ERR(divhw);
> --> 134                 mpll->clk_data->hws[i + 1] = divhw;
>
> Off by one.  Why is this i + 1 instead of just i?
>
>     135         }
>     136
>     137         platform_set_drvdata(pdev, mpll);
>     138
>     139         return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
>     140                         mpll->clk_data);
>     141 }
>
> regards,
> dan carpenter

Interesting. Despite writing this code I don't remember now how it
works so I need to refresh myself.
I'll get back to you.

Cheers,

Daniel
