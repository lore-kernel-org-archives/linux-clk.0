Return-Path: <SRS0=q34n=U2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E91C4321A
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 23:19:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFDE22086D
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 23:19:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V0o8aHJf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbfF0XT0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jun 2019 19:19:26 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45332 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfF0XT0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jun 2019 19:19:26 -0400
Received: by mail-pf1-f193.google.com with SMTP id r1so1953060pfq.12
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2019 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dcwak1hKcOO0mZc8QWnsef5QeqS9i+/5PrOgW4qPWe4=;
        b=V0o8aHJfjwOLLXWKXP3+WZKZnMDY82FMmJkgq0sDhZVWNm4fMt7ft/7CI8w2RhN1gE
         pet1zc7HZPwwC46ruxmBJxG31Uxo4rqRXMvyBNJ7BL6vupG/+RR/XqonKVcu8XmndUsZ
         mrOjv4xKgtwPp+30mLd6CKFQnk2gkxQhwgZF9267Vc89Ky2UtPQUv3vHQ693Fjx8uo1y
         G/4kMRCoseOn7VDRhFU+As3DtNFMgfhDEwZvhDLdstfNiopMAu0nC5KvYZdKmTZO/iwr
         mq3anUEZ2WRnCt6lijuvZVj7k1rpzFC6L9UpNySovsc6Vb20Bm67vtHpiaviGanbCTIM
         z0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dcwak1hKcOO0mZc8QWnsef5QeqS9i+/5PrOgW4qPWe4=;
        b=XjJS1sKPBGHsYDSFk9g/IEJPljMOoMLF5ZvVMEA6cac3c2uIBlNzBsImlVLBnXgNAu
         PSu/iMi2d7XoT8ph9yKEt08RHH8yZ93d6lr7wrfIrVXP0EXQcOTSba0W1ZE5mtnMHka/
         9bjUXri6p5In7VdFoKFRDK7+XB3Y9oSqpKhOVqp2f+e7IxL9lmdbIUod0qSP8VqAbMXM
         afG3qY1icTiAxgLCjtv/vvxokSD3WR187ZsK0crB1k0ld2a1mbrDFgyzzHeaRYwaW8PR
         DpnA05IR0ZhDh5aJczjq3RGpADqI3d0M00BxcZsrzPmsJlEnI4QRNiOPABh1Vrfxs77I
         NKEQ==
X-Gm-Message-State: APjAAAV5eqO5JJc1k7cG7q+53BMS5iWkwRAk8OCZHjfsYxCjSkCHpjew
        1oornWq+hBsAD+JMHivvU3cFcqKnkBOcj6JRPhIvFQ==
X-Google-Smtp-Source: APXvYqxXobXDpd+FCzeYvr0ctf8iVulxIMamSVsKM6neTWNkLJrveZQ1qWxH9dhc27nmWu++mJTS/QMP+QbhGt1A1EI=
X-Received: by 2002:a63:78ca:: with SMTP id t193mr6150985pgc.10.1561677565201;
 Thu, 27 Jun 2019 16:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190627220642.78575-1-nhuck@google.com>
In-Reply-To: <20190627220642.78575-1-nhuck@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 27 Jun 2019 16:19:14 -0700
Message-ID: <CAKwvOdmaPgdDyhE1uws9DpynS97pUj6BOzS9g0XRWB7YshR_Ow@mail.gmail.com>
Subject: Re: [PATCH] clk: qoriq: Fix -Wunused-const-variable
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        yogeshnarayan.gaur@nxp.com, oss@buserror.net,
        linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 27, 2019 at 3:06 PM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> drivers/clk/clk-qoriq.c:138:38: warning: unused variable
> 'p5020_cmux_grp1' [-Wunused-const-variable] static const struct
> clockgen_muxinfo p5020_cmux_grp1
>
> drivers/clk/clk-qoriq.c:146:38: warning: unused variable
> 'p5020_cmux_grp2' [-Wunused-const-variable] static const struct
> clockgen_muxinfo p5020_cmux_grp2
>
> In the definition of the p5020 chip, the p2041 chip's info was used
> instead.  The p5020 and p2041 chips have different info. This is most
> likely a typo.

oops! Further, the definitions of p5020_cmux_grp1/p5020_cmux_grp2 are
subtly different than p2041_cmux_grp1/p2041_cmux_grp2.  Definitely
looks copy+pasta related; I agree with your assessment.  (Also, it's
interesting to see this sparse array initializer syntax).  Thanks for
the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Link: https://github.com/ClangBuiltLinux/linux/issues/525
> Cc: clang-built-linux@googlegroups.com
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
>  drivers/clk/clk-qoriq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
> index 4739a47ec8bd..0f8870527940 100644
> --- a/drivers/clk/clk-qoriq.c
> +++ b/drivers/clk/clk-qoriq.c
> @@ -678,7 +678,7 @@ static const struct clockgen_chipinfo chipinfo[] = {
>                 .guts_compat = "fsl,qoriq-device-config-1.0",
>                 .init_periph = p5020_init_periph,
>                 .cmux_groups = {
> -                       &p2041_cmux_grp1, &p2041_cmux_grp2
> +                       &p5020_cmux_grp1, &p5020_cmux_grp2

-- 
Thanks,
~Nick Desaulniers
