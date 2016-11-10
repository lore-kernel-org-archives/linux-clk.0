Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 10 Nov 2016 23:53:51 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: question about clk_get_parent
Message-ID: <20161110235350.GC1041@n2100.armlinux.org.uk>
References: <alpine.DEB.2.20.1611102149500.1970@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.DEB.2.20.1611102149500.1970@hadrien>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Nov 10, 2016 at 09:55:16PM +0100, Julia Lawall wrote:
> As far as I can see in the various definitions of clk_get_parent, they all
> return either NULL or a value stored in a structure field.  But the
> documentation with the prototype in includ/linux/clk.h says that it
> returns a valid IS_ERR() condition containing errno.  Are ERR_PTR values
> stored in the structure fields?

The API documentation (in clk.h) is correct.  The API (from the user
perspective) considers invalid clocks to be the set of pointers for
which IS_ERR() is true.

By implication, valid clocks are those for which IS_ERR() returns
false.

Hence, in order for clk_get_parent() to indicate an error, it has to
return a pointer value which corresponds with IS_ERR() being true.

The question over the NULL clock pointer is left to the implementation
to decide whether it's an error or not as far as the API design goes,
but practically everyone treats it as "there is no clock" which is
entirely reasonable.

Also, remember from the clk API design point of view, users of the
API should never dereference the clk pointer, it is a cookie as far
as users should be concerned. (The clk structure was not available to
drivers in the early days.)  Only clk implementations and clk drivers
should dereference, and these should not dereference anything but
their own clocks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
