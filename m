Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44056 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753324AbcEROit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2016 10:38:49 -0400
Subject: Re: [PATCH omap v2 0/6] Fix OMAP uses of RCU from idle loop
To: paulmck@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20160516184844.GA20144@linux.vnet.ibm.com>
Cc: tony@atomide.com, mingo@kernel.org, rostedt@goodmis.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <573C7E6F.90001@roeck-us.net>
Date: Wed, 18 May 2016 07:38:39 -0700
MIME-Version: 1.0
In-Reply-To: <20160516184844.GA20144@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/16/2016 11:48 AM, Paul E. McKenney wrote:
> Hello!
>
> The following series fixes a number of uses of RCU from the idle loop.
> These are all due to tracing, so the fix is simply to append _rcuidle
> to the event-tracing call.
>
> Changes since v1: Fix commit-log subjects and add maintainers on CC.
>

For the series, on top of mainline (which now experiences the problem fixed
by this series):

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

