Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Shawn Lin <shawn.lin@rock-chips.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1525942205-111855-1-git-send-email-shawn.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>
References: <1525942205-111855-1-git-send-email-shawn.lin@rock-chips.com>
Message-ID: <152645814090.210890.10037636681887493249@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: add clock panic dump in tree-view
Date: Wed, 16 May 2018 01:09:00 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Shawn Lin (2018-05-10 01:50:05)
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 3487be7..7bbdb6f 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -519,6 +519,9 @@
>                         debug and development, but should not be needed o=
n a
>                         platform with proper driver support.  For more
>                         information, see Documentation/clk.txt.
> +       clk_panic_dump
> +                       [CLK]
> +                       Dump the whole clock tree-view upon panic.

Typically when the system panics it's because something has gone wrong.
When a clk has gone wrong, typically the system hangs or crashes hard
and printing out panic info just doesn't happen.

I'm not sure why clks are so special here that we need to dump the
information about the clk tree at the point of a panic. Is this more of
a debug patch to dump out clk tree info by calling panic() in certain
places near where you get odd system hangs?

>  =

>         clock=3D          [BUGS=3DX86-32, HW] gettimeofday clocksource ov=
erride.
>                         [Deprecated]
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9ae92aa..adb5537 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2802,6 +2802,73 @@ static inline void clk_debug_unregister(struct clk=
_core *core)
>  }
>  #endif
>  =

> +static bool clk_pdump_enable;
> +static int __init clk_pdump_setup(char *__unused)
> +{
> +       clk_pdump_enable  =3D true;
> +       return 1;
> +}
> +__setup("clk_panic_dump", clk_pdump_setup);
> +
> +static void clk_pdump_show_one(struct clk_core *c, int level)
> +{
> +       if (!c)
> +               return;
> +
> +       pr_err("%*s%-*s %11d %12d %11lu %10lu %-3d\n",
> +               level * 3 + 1, "", 30 - level * 3, c->name,
> +               c->enable_count, c->prepare_count, clk_core_get_rate(c),
> +               clk_core_get_accuracy(c), clk_core_get_phase(c));
> +}
> +
> +static void clk_pdump_show_subtree(struct clk_core *c, int level)
> +{
> +       struct clk_core *child;
> +
> +       if (!c)
> +               return;
> +
> +       clk_pdump_show_one(c, level);
> +
> +       hlist_for_each_entry(child, &c->children, child_node)
> +               clk_pdump_show_subtree(child, level + 1);
> +}
> +
> +static int clk_panic_dump(struct notifier_block *this, unsigned long ev,
> +                         void *ptr)
> +{
> +       struct clk_core *c;
> +
> +       if (!clk_pdump_enable)
> +               return 0;

Why register the notifier in late init if the commandline doesn't have
the parameter set?

> +
> +       pr_err("clock panic dump:\n");
> +       pr_err("   clock                         enable_cnt  prepare_cnt =
       rate   accuracy   phase\n");
> +       pr_err("---------------------------------------------------------=
-------------------------------\n");
> +
> +       clk_prepare_lock();

Why are we taking locks in the panic path?

> +
> +       hlist_for_each_entry(c, &clk_root_list, child_node)
> +               clk_pdump_show_subtree(c, 0);
> +       hlist_for_each_entry(c, &clk_orphan_list, child_node)
> +               clk_pdump_show_subtree(c, 0);
> +
> +       clk_prepare_unlock();
> +
> +       return 0;
> +}
> +
> +static struct notifier_block clk_pdump_block =3D {
> +       .notifier_call =3D clk_panic_dump,
> +};
> +
> +static int clk_register_pdump(void)
> +{
> +       atomic_notifier_chain_register(&panic_notifier_list, &clk_pdump_b=
lock);
> +       return 0;
> +}
> +late_initcall_sync(clk_register_pdump);

Why sync?
