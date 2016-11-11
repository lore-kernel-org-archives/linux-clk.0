Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:6095 "EHLO
        mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933177AbcKKHTO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Nov 2016 02:19:14 -0500
Date: Fri, 11 Nov 2016 08:19:10 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: question about clk_get_parent
In-Reply-To: <20161110235350.GC1041@n2100.armlinux.org.uk>
Message-ID: <alpine.DEB.2.20.1611110814540.2074@hadrien>
References: <alpine.DEB.2.20.1611102149500.1970@hadrien> <20161110235350.GC1041@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On Thu, 10 Nov 2016, Russell King - ARM Linux wrote:

> On Thu, Nov 10, 2016 at 09:55:16PM +0100, Julia Lawall wrote:
> > As far as I can see in the various definitions of clk_get_parent, they all
> > return either NULL or a value stored in a structure field.  But the
> > documentation with the prototype in includ/linux/clk.h says that it
> > returns a valid IS_ERR() condition containing errno.  Are ERR_PTR values
> > stored in the structure fields?
>
> The API documentation (in clk.h) is correct.  The API (from the user
> perspective) considers invalid clocks to be the set of pointers for
> which IS_ERR() is true.
>
> By implication, valid clocks are those for which IS_ERR() returns
> false.
>
> Hence, in order for clk_get_parent() to indicate an error, it has to
> return a pointer value which corresponds with IS_ERR() being true.
>
> The question over the NULL clock pointer is left to the implementation
> to decide whether it's an error or not as far as the API design goes,
> but practically everyone treats it as "there is no clock" which is
> entirely reasonable.
>
> Also, remember from the clk API design point of view, users of the
> API should never dereference the clk pointer, it is a cookie as far
> as users should be concerned. (The clk structure was not available to
> drivers in the early days.)  Only clk implementations and clk drivers
> should dereference, and these should not dereference anything but
> their own clocks.

Thanks for the explanation, but I'm not sure how to relate it to what is
in the code.  For example, in drivers/clk/clk.c, there is:

{
        struct clk *parent;

        if (!clk)
                return NULL;

        clk_prepare_lock();
        /* TODO: Create a per-user clk and change callers to call clk_put */
        parent = !clk->core->parent ? NULL : clk->core->parent->hw->clk;
        clk_prepare_unlock();

        return parent;
}

Could clk->core->parent->hw->clk return an ERR_PTR value?  Or is the point
that from the clock point of view, this definition never fails?

thanks,
julia

>
> --
> RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
> according to speedtest.net.
>
