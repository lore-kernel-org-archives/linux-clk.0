Return-Path: <SRS0=EEPi=MY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10220C67877
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 18:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C23242064E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 18:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FU/yGFSU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C23242064E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbeJMB7k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Oct 2018 21:59:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:57392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726235AbeJMB7j (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Oct 2018 21:59:39 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AD27204EC;
        Fri, 12 Oct 2018 18:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539368752;
        bh=zTI25FfiUzTyUh+rV1m/BekKUZrUiHoqfXqJE4+WoW4=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=FU/yGFSUlrAE2kYq3cs5GR/0QBZVHgwGUu5M6pmzhbpd7Au65uflUlSgEeSawvsF7
         ZL/VvbFL1wQPE41kGrN9M9dQbvxO8rQcke4PF8NIs3FFJ1M1fGS+bqODO6POoAsW1T
         eLZCPqDVaKTDl0S+647ynzMp6fw4zNqReEhGvZro=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Michael Turquette <mturquette@baylibre.com>,
        Shawn Lin <shawn.lin@rock-chips.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <55ab3c00-fa2f-b821-e512-a741a3c339ec@rock-chips.com>
Cc:     shawn.lin@rock-chips.com, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Finley Xiao <finley.xiao@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Xing Zheng <xing.zheng@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Xiao Yao <xiaoyao@rock-chips.com>,
        Ziyuan Xu <xzy.xu@rock-chips.com>
References: <1523172498-74798-1-git-send-email-shawn.lin@rock-chips.com>
 <fab22026-32eb-04c2-6f18-d58394cafd08@rock-chips.com>
 <55ab3c00-fa2f-b821-e512-a741a3c339ec@rock-chips.com>
Message-ID: <153936875203.5275.12779962716641835916@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v3 1/2] clk: divider: Add CLK_DIVIDER_EVEN flag support
Date:   Fri, 12 Oct 2018 11:25:52 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Lin (2018-05-25 01:37:39)
> Ping.... :)
> =


This is old. Please resend and we can reconsider.

