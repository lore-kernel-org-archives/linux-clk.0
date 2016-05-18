Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from e19.ny.us.ibm.com ([129.33.205.209]:33183 "EHLO
	e19.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752072AbcERS4j (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2016 14:56:39 -0400
Received: from localhost
	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-clk@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Wed, 18 May 2016 14:56:38 -0400
Date: Wed, 18 May 2016 11:56:38 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, tony@atomide.com, mingo@kernel.org,
	rostedt@goodmis.org
Subject: Re: [PATCH omap v2 0/6] Fix OMAP uses of RCU from idle loop
Message-ID: <20160518185638.GD3528@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20160516184844.GA20144@linux.vnet.ibm.com>
 <573C7E6F.90001@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <573C7E6F.90001@roeck-us.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 18, 2016 at 07:38:39AM -0700, Guenter Roeck wrote:
> On 05/16/2016 11:48 AM, Paul E. McKenney wrote:
> >Hello!
> >
> >The following series fixes a number of uses of RCU from the idle loop.
> >These are all due to tracing, so the fix is simply to append _rcuidle
> >to the event-tracing call.
> >
> >Changes since v1: Fix commit-log subjects and add maintainers on CC.
> >
> 
> For the series, on top of mainline (which now experiences the problem fixed
> by this series):
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Applied, thank you!  And fixed the line-wrapping while I was at it.  ;-)

							Thanx, Paul

