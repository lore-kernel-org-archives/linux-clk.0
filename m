Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9D7C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 22:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B991121780
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 22:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="fLcUBSmq";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="erRqk2vm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B991121780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbeKNIiO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 03:38:14 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:46398 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbeKNIiN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Nov 2018 03:38:13 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4A9FE6074C; Tue, 13 Nov 2018 22:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542148676;
        bh=3iPQZJuwU5ZCDcsIS6ZTbcOiJK0aAH0/Vm4pfiRgX0g=;
        h=To:Cc:From:Subject:Date:From;
        b=fLcUBSmqkmmqmlPweiHNI3giYvnge/ZKtUP7NEIVxZod9RBk6iB3OmnkWTmYvxkXi
         L3MA/qScuy0at+a2KZFvzSVN8KVUScOx+8SqrBXdZZ91/3nrhMrjlID9J5YcK8oBIL
         Q6y0rVDx5HzjFvvbXMjTrtUh6+ZWyDpuV3dH90RQ=
Received: from [10.226.60.81] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5AD4960312;
        Tue, 13 Nov 2018 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542148675;
        bh=3iPQZJuwU5ZCDcsIS6ZTbcOiJK0aAH0/Vm4pfiRgX0g=;
        h=To:Cc:From:Subject:Date:From;
        b=erRqk2vmSWiKjjpRPBSozLBRiLd1Sz3Qti4naqXGsqyjsqtlJI0o2gUJupqtV/Pst
         weR6xHOtVXdZ96/d/L7BLAp1y2apMiaYhDuQ9vHji1Z0TbDrMQ9CiXEQrTk9i0O1RF
         ZQMa3huawmE4MYby8AlJTQk6v+Os8T36XCNoA3oE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5AD4960312
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
To:     jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Does clk_core_round_rate_nolock() really do the right thing?
Message-ID: <c9984aa1-4c87-d97d-eec8-4adbe9bb243e@codeaurora.org>
Date:   Tue, 13 Nov 2018 15:37:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

"clk: rework calls to round and determine rate callbacks" [1] added 
clk_core_round_rate_nolock().

I question that it does the right thing in a specific scenario.

Lets assume we have a clock that is currently running at 5Mhz, but we 
want to have it run at 400Khz, and the clock supports both rates. 
Perhaps the clock is for a hardware block, where in to switch 
operational modes, the clock frequency is expected to run at the lower 
frequency.

The driver may call clk_set_rate() to do so, resulting in the following 
call flow (based on 4.20-rc2)-

clk_set_rate()
clk_core_set_rate_nolock()
clk_core_req_round_rate_nolock()
clk_core_round_rate_nolock()

In clk_core_round_rate_nolock(), lets assume the conditionals do not 
apply (clk core cannot round, and set rate parent flag isn't set).  In 
that case, the requested rate is modified by this line -

req->rate = core->rate;

This transforms the request from 400Khz to 5Mhz (the current clock rate).

What will then end up happening is we return from 
clk_core_round_rate_nolock(), through clk_core_req_round_rate_nolock() 
back to clk_core_set_rate_nolock() where we check to see if the rate 
returned from the "rounding" is the same as the current clock rate (5Mhz 
== 5Mhz).  Thus we conclude there is nothing to be done, and we return 
success back up to the caller having not actually touched the clock or 
set the requested rate.

On the face of it, this seems incorrect to me, although I am a neophyte 
to the clock framework.  Is this really the expected behavior, to leave 
the clock at the current rate even though the requested rate is 
different?  If so, why?


[1] - 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0f6cc2b8e94da5400528c0ba7fd910392ec598a2

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
