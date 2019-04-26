Return-Path: <SRS0=YBHQ=S4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51213C43218
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 02:49:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33CDE20878
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 02:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556246966;
	bh=Vhcmw0bu20yKmvfVL0NUI35uqk7WmNJhkV+o1g9tGIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kxV5PSvcVpAyLXZF1QM3UX757Zu+GXVWv734/nALML/9kpDrMNS+WMJwy5vYrcde2
	 zWV+VniB+AgNcHMLMW+1nZz1ReLgMzR63zgekLMwqQOSU/NgJPKvTfuC5axD0m+8Jn
	 k5cm3viqWg54IDlzX1xFkNc8ld1elHbfwO9DDyQ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729478AbfDZCtZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 22:49:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:56206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728983AbfDZCtZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 22:49:25 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9EF82084F;
        Fri, 26 Apr 2019 02:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556246965;
        bh=Vhcmw0bu20yKmvfVL0NUI35uqk7WmNJhkV+o1g9tGIs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JBq4sRBDG15t5VWT6yHO30ZwIvrslelCWxLSN1xWo+h2Ufgk8zvJu9EtwAd/gxgVj
         48BZx2EVsJMPe2RAv3XKxYZB7YNVFYaH0ecXDI/A/avytJIbGWCYsEG/e6GywKZszB
         Zukp1TKbmp23M1QtAPcttZhOmPe+AlEa250VMRV4=
Date:   Fri, 26 Apr 2019 10:49:00 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: Re: [GIT PULL 1/3] i.MX common clock changes for 5.2
Message-ID: <20190426024858.GA7980@dragon>
References: <20190422062314.1354-1-shawnguo@kernel.org>
 <155620706990.15276.27062523051743240@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155620706990.15276.27062523051743240@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 25, 2019 at 08:44:29AM -0700, Stephen Boyd wrote:
> Quoting Shawn Guo (2019-04-21 23:23:12)
> > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> > 
> >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-5.2
> > 
> > for you to fetch changes up to 48a15bb42df85d30e13281642a12fd27221668fa:
> > 
> >   clk: imx: Remove unused imx_get_clk_hw_fixed (2019-03-26 16:49:49 +0800)
> > 
> > ----------------------------------------------------------------
> 
> Pulled into clk-next, but next time please merge your branches together
> and send one pull request. Unless the code you're sending is for wildly
> different imx clk drivers I expect to see one PR or one PR and a
> followup PR later on.

Stephen,

Just make sure I understand your request correctly - it's good enough
for me to use just one single branch to collect all i.MX clock patches,
or multiple branches are better and I just need to merge them into one
(and one PR) before sending to you?

Shawn
