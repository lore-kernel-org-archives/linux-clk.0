Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B1AC433E1
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 01:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE6A761999
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 01:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhC0BxI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 21:53:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17854 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230142AbhC0Bwz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Mar 2021 21:52:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616809975; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=w3B05Lcc00i+kMRUOl0eohJ8ozsXKgERZwHmZcxTDzI=; b=SpGRML/9jO6q76oZ15quQG6S4t6sVHKO0CiGSm3kKR3SHRhmo1H4WETmyMP/1cIdE2iAy5sn
 JQfdvFHnU+bCkFErcau3VWU4fnrY8AS57318JR/FOZTrXD/S51IKoXY8I0EyAjH+27LYe7sg
 aprG5zoDME39bDT8blkXXcMHZlQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 605e8ff2c39407c327eae6e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 27 Mar 2021 01:52:50
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1CB7C433C6; Sat, 27 Mar 2021 01:52:49 +0000 (UTC)
Received: from [192.168.0.101] (unknown [49.204.180.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BF7AAC433CA;
        Sat, 27 Mar 2021 01:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF7AAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH] clk: qcom: camcc: Update the clock ops for the SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1616140054-5141-1-git-send-email-tdas@codeaurora.org>
 <161648457933.3012082.10324281519544090271@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <1d1b9ab5-9344-fb33-8edd-bcb2024a7b24@codeaurora.org>
Date:   Sat, 27 Mar 2021 07:22:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161648457933.3012082.10324281519544090271@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Thanks Stephen for the review.

On 3/23/2021 12:59 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2021-03-19 00:47:34)
>> Update the RCGs to use shared ops to park the RCGs at XO.
> 
> s/Update/fix/?
> 
> Can you also elaborate more on why we need to park the RCGs here for all
> these different clks? Is the camera driver supposed to not touch these
> and let the firmware take over? Is there zero coordination between the
> kernel and the firmware?
> 

Updated the patch with details.

>>
>> Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller driver for SC7180")
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
