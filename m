Return-Path: <SRS0=E1Is=IU=linuxfoundation.org=gregkh@kernel.org>
Date: Sat, 2 Jun 2018 08:54:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: no need to check return value of debugfs_create
 functions
Message-ID: <20180602065430.GA32552@kroah.com>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
 <152790643550.225090.7686614109247734629@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <152790643550.225090.7686614109247734629@swboyd.mtv.corp.google.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 01, 2018 at 07:27:15PM -0700, Stephen Boyd wrote:
> Quoting Greg Kroah-Hartman (2018-05-29 09:08:00)
> > -
> > -       d = debugfs_create_u32("clk_protect_count", 0444, core->dentry,
> > -                              &core->protect_count);
> > -       if (!d)
> > -               goto err_out;
> > -
> > -       d = debugfs_create_u32("clk_notifier_count", 0444, core->dentry,
> > -                              &core->notifier_count);
> > -       if (!d)
> > -               goto err_out;
> > +       if (!core || !pdentry)
> > +               return;
> >  
> > -       if (core->num_parents > 1) {
> > -               d = debugfs_create_file("clk_possible_parents", 0444,
> > -                               core->dentry, core, &possible_parents_fops);
> > -               if (!d)
> > -                       goto err_out;
> > -       }
> > +       root = debugfs_create_dir(core->name, pdentry);
> > +       core->dentry = root;
> >  
> > -       if (core->ops->debug_init) {
> > -               ret = core->ops->debug_init(core->hw, core->dentry);
> 
> This returns an int. We should go fix all the ops to return void now
> because nobody should care. I can pile that patch on top.

Thanks, I didn't think to do that.

> Anyway, applied to clk-next.

Wonderful, thanks for applying all of these.

greg k-h
