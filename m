Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72562C001E0
	for <linux-clk@archiver.kernel.org>; Wed,  2 Aug 2023 21:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjHBV1E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Aug 2023 17:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbjHBV07 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 17:26:59 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5ABE75
        for <linux-clk@vger.kernel.org>; Wed,  2 Aug 2023 14:26:54 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a3b7f992e7so160480b6e.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Aug 2023 14:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691011614; x=1691616414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUEKuWb/qRWGPcwpGm7URWDdQ7oovJb2rcmtaobVWAE=;
        b=RtvSGxJ+mav+wPCHXdVYU99ayoscEV2EM98/HQ0bElZBkBhCnY52dJk3jZmCfir+bQ
         L8eAzwIAR2sBr3vw3uj7w5jHFASc0kRvhRLops40/wOaRkGdBtQZL0B2JXDVUq/DTidq
         UwYpDpC3VbqG8FBd2+huJtyaBTMmNB05ZP73hP+qD1Exlyqr9dr1fWYofRcuCA2WmTzd
         XRXdvyboVi8POQ/f4NS95xvWVD4BwvCCGv2lTwbCaaz6EbycEglhuXXD6usNr6E/nU6f
         gM0GDl24nkATrFuswOptpea2z3rdCPAdNGFYtmJQnrRsSO3UrYwln4f4QN4w4WrqQg+Q
         GYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691011614; x=1691616414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUEKuWb/qRWGPcwpGm7URWDdQ7oovJb2rcmtaobVWAE=;
        b=aO/1mulHL7cTz/Y+Jf9JxeK6nX+SI/iL6Q6LWEljLdQyZtXBqKXdHWrPxW7R+CJLru
         UBCWYAu1qZsMSV/CGQP4SLK4nFRqFN1ivDLPbRnfJAeavG+1OPygvBbMZHn6766plrYD
         RDFc949j9+kfeGASljmjbFfcTGfdcX4D6oOkbyRx1YM2VQtQvIOkE6GDzHpfr2WCMJJX
         vS/Ydfg/4mitHS2z+P0pR9Od5lTcS92zoAZiayy/gs4oMjUQx14NP0T/DIZ8NwKvGEdB
         ASN08/6HEf8K2omomlY11wi+3mNabU+phgE9kZAYa1kd6byUIUzHV8bnhqAIbylttPtW
         SOtA==
X-Gm-Message-State: ABy/qLZSz+xm9hc5GZzaCn1QC6pKIV1a6nEVMprm0kS2m0a/9XuGXB8u
        sKXPOHRT6kl67vLE4kuGVutn77br2HrYOwjc5KJrYg==
X-Google-Smtp-Source: APBJJlEfMzUewc9dWiMhV1sSjAHIMUeF38rrKJ7dqV5L8zFEEuQ4WO4ftfNL1eREbhXHWSw8qo+hdp/PdFdD1O7e0SY=
X-Received: by 2002:a05:6358:6f8d:b0:133:eff:39c with SMTP id
 s13-20020a0563586f8d00b001330eff039cmr6979151rwn.20.1691011614061; Wed, 02
 Aug 2023 14:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230802092647.3000666-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20230802092647.3000666-1-sergio.paracuellos@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 2 Aug 2023 14:26:43 -0700
Message-ID: <CAKwvOd=SvHUPd8+sWtqgxghPEciD5sqPiggZx+OOEqxtJrML6Q@mail.gmail.com>
Subject: Re: [PATCH] clk: ralink: mtmips: quiet unused variable warning
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     linux-clk@vger.kernel.org, tsbogend@alpha.franken.de,
        sboyd@kernel.org, mturquette@baylibre.com,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 2, 2023 at 2:26=E2=80=AFAM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> When CONFIG_OF is disabled then the matching table is not referenced and
> the following warning appears:
>
> drivers/clk/ralink/clk-mtmips.c:821:34: warning: unused variable 'mtmips_=
of_match' [-Wunused-const-variable]
> 821 |   static const struct of_device_id mtmips_of_match[] =3D {
>     |                          ^
>
> Silence it declaring 'mtmips_of_match' with '__maybe_unused'.
>
> Fixes: 6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS =
SoCs")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307242310.CdOnd2py-lkp@i=
ntel.com/
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

I think this is fine; Arnd or Nathan do you have a preference? or thoughts =
here?

If not, thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

(I have a slight preference for wrapping the use in `#ifdef CONFIG_OF`
since with the approach used by this patch, if all users are removed
we will never get a warning for this var. But it's a weak preference;
it's more important to me that we don't have -Werror promote this
warning to a build breakage)

> ---
>  drivers/clk/ralink/clk-mtmips.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/ralink/clk-mtmips.c b/drivers/clk/ralink/clk-mtm=
ips.c
> index 1e7991439527..6716394b28a3 100644
> --- a/drivers/clk/ralink/clk-mtmips.c
> +++ b/drivers/clk/ralink/clk-mtmips.c
> @@ -820,7 +820,7 @@ static const struct mtmips_clk_data mt76x8_clk_data =
=3D {
>         .num_clk_periph =3D ARRAY_SIZE(mt76x8_pherip_clks),
>  };
>
> -static const struct of_device_id mtmips_of_match[] =3D {
> +static const __maybe_unused struct of_device_id mtmips_of_match[] =3D {
>         {
>                 .compatible =3D "ralink,rt2880-sysc",
>                 .data =3D &rt2880_clk_data,
> --
> 2.25.1
>


--=20
Thanks,
~Nick Desaulniers
