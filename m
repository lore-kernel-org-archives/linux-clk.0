Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180529160804.1982-1-gregkh@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
Message-ID: <152790643550.225090.7686614109247734629@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/5] clk: no need to check return value of debugfs_create
 functions
Date: Fri, 01 Jun 2018 19:27:15 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Greg Kroah-Hartman (2018-05-29 09:08:00)
> -
> -       d =3D debugfs_create_u32("clk_protect_count", 0444, core->dentry,
> -                              &core->protect_count);
> -       if (!d)
> -               goto err_out;
> -
> -       d =3D debugfs_create_u32("clk_notifier_count", 0444, core->dentry,
> -                              &core->notifier_count);
> -       if (!d)
> -               goto err_out;
> +       if (!core || !pdentry)
> +               return;
>  =

> -       if (core->num_parents > 1) {
> -               d =3D debugfs_create_file("clk_possible_parents", 0444,
> -                               core->dentry, core, &possible_parents_fop=
s);
> -               if (!d)
> -                       goto err_out;
> -       }
> +       root =3D debugfs_create_dir(core->name, pdentry);
> +       core->dentry =3D root;
>  =

> -       if (core->ops->debug_init) {
> -               ret =3D core->ops->debug_init(core->hw, core->dentry);

This returns an int. We should go fix all the ops to return void now
because nobody should care. I can pile that patch on top.

Anyway, applied to clk-next.
