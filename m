Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:27432
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S966285AbcKJUzT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Nov 2016 15:55:19 -0500
Date: Thu, 10 Nov 2016 21:55:16 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: question about clk_get_parent
Message-ID: <alpine.DEB.2.20.1611102149500.1970@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

As far as I can see in the various definitions of clk_get_parent, they all
return either NULL or a value stored in a structure field.  But the
documentation with the prototype in includ/linux/clk.h says that it
returns a valid IS_ERR() condition containing errno.  Are ERR_PTR values
stored in the structure fields?

thanks,
julia
