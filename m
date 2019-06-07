Return-Path: <SRS0=Ii/d=UG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B73C2BCA1
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 19:05:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 156A72133D
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 19:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559934324;
	bh=TxSMtx6lLGs98uGXIiVyUk0DVMENnYc/2yJw23Hmcd8=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=HkLkjTR5y81dbqsJyb9aOyh/P5+MFG0Dn/HOOSplZ+lqUQmozky+5oEw6Kx+JGmhi
	 ErxgAInByF+E3McXdgj0ulws7h86kkoYQzIsHsvOvHzAi0PyrkTLypZDK3EHP/rhzZ
	 aFPO79kgA939X2UqHtuYeIOEcAsWJfGpt7LtXSkI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbfFGTFX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jun 2019 15:05:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:32914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729235AbfFGTFX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Jun 2019 15:05:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D276520868;
        Fri,  7 Jun 2019 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559934322;
        bh=TxSMtx6lLGs98uGXIiVyUk0DVMENnYc/2yJw23Hmcd8=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=DO3KFOM6eAnUf9YpBWbM86cXXPo/lHeb4x74qBQ43Qyrc9+tJCGSgMhZZVs3VaBfv
         HmLWGzcJ50XbgMn9cGFyKSReHWy2/oC6smGjWIczLbtn0cz+ko5Kf2eopNN/cOkwan
         G9nYHPrtmjpO2Sy9lwJmh2kHarxQCIQcE1FwL7Lo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <057720844e78e615e46de34a73b16ffaf7dbfc10.1558686047.git.leonard.crestez@nxp.com>
References: <057720844e78e615e46de34a73b16ffaf7dbfc10.1558686047.git.leonard.crestez@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: Add clk_parent entry in debugfs
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 12:05:22 -0700
Message-Id: <20190607190522.D276520868@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-05-24 01:25:25)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index aa51756fd4d6..94a93b07dd37 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3009,10 +3009,21 @@ static int possible_parents_show(struct seq_file =
*s, void *data)
> =20
>         return 0;
>  }
>  DEFINE_SHOW_ATTRIBUTE(possible_parents);
> =20
> +static int current_parent_show(struct seq_file *s, void *data)
> +{
> +       struct clk_core *core =3D s->private;
> +
> +       if (core->parent)
> +               seq_printf(s, "%s\n", core->parent->name);
> +
> +       return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(current_parent);

Looks OK.

> +
>  static int clk_duty_cycle_show(struct seq_file *s, void *data)
>  {
>         struct clk_core *core =3D s->private;
>         struct clk_duty *duty =3D &core->duty;
> =20
> @@ -3040,10 +3051,11 @@ static void clk_debug_create_one(struct clk_core =
*core, struct dentry *pdentry)
>         debugfs_create_u32("clk_enable_count", 0444, root, &core->enable_=
count);
>         debugfs_create_u32("clk_protect_count", 0444, root, &core->protec=
t_count);
>         debugfs_create_u32("clk_notifier_count", 0444, root, &core->notif=
ier_count);
>         debugfs_create_file("clk_duty_cycle", 0444, root, core,
>                             &clk_duty_cycle_fops);
> +       debugfs_create_file("clk_parent", 0444, root, core, &current_pare=
nt_fops);

Shouldn't we skip creation of this file if core->num_parents =3D=3D 0? So
put this under the if condition below?

> =20
>         if (core->num_parents > 1)
>                 debugfs_create_file("clk_possible_parents", 0444, root, c=
ore,
>                                     &possible_parents_fops);
> =20
