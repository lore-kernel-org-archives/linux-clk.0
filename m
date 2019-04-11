Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA840C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 14:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93CF42083E
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554993645;
	bh=Dd9HOGHBvvXpzM/JRWZwH2XtopWuH21ZF7knrpqj7lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wB17YPggoJvEaUcrt/+hNuK4cnfhAlMkt1CWpku/vxCdnxamG+5nn99XvcbUqW+wv
	 UpN1oIf0o5n2bTtx1IdE9ZraYntvfYOTk86gOjlZblE1CG7ObnjWm5dCaQU3W3WAO6
	 09azbAUGvPw4Qo3zjGUqm3oJvMSL0lGtDfCBx9zA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfDKOkp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 10:40:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:39946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbfDKOkp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 10:40:45 -0400
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5635D206BA;
        Thu, 11 Apr 2019 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554993644;
        bh=Dd9HOGHBvvXpzM/JRWZwH2XtopWuH21ZF7knrpqj7lE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gm3ID+U3n0meBPrqN4zD68qmjwYIT3lc4/OgdkOG2Zf6eq/zgf6lKBTaEz4lva9Am
         LIA7D8snF8CxTdXVumzjva+gEi2SHPFXlp2qiNTxVKKHddHHZJ0fk7JDlQ//pxB7f7
         kd6LT1uOndDf6z32rwSI/huWEmz6gChENcQ4wM+o=
Date:   Thu, 11 Apr 2019 10:40:43 -0400
From:   Sasha Levin <sashal@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     stable@vger.kernel.org, jbrunet@baylibre.com, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH stable 5.0] Revert "clk: meson: clean-up clock
 registration"
Message-ID: <20190411144043.GL11568@sasha-vm>
References: <20190411101132.5513-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190411101132.5513-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 11, 2019 at 12:11:32PM +0200, Neil Armstrong wrote:
>This reverts commit 9b0f430450cf230e736bc40f95bf34fbdb99cead.
>
>This patch was not initially a fix and is dependent on other
>changes which are not fixes eithers.
>
>With this change, multiple Amlogic based boards fails to boot,
>as reported by kernelci.

I've queued this and the 4.19 one, thanks and sorry for the breakage.

--
Thanks,
Sasha
