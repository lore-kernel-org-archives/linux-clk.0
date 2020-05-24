Return-Path: <SRS0=Bykf=7G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27151C433DF
	for <linux-clk@archiver.kernel.org>; Sun, 24 May 2020 09:48:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03E3D207D8
	for <linux-clk@archiver.kernel.org>; Sun, 24 May 2020 09:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Nb3SnwJg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgEXJsp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 24 May 2020 05:48:45 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:37243 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728869AbgEXJsp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 24 May 2020 05:48:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590313724; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rWUNIe9B+jeAbe/7iaGK9kGruHhpswyMUl0f/hO15NI=; b=Nb3SnwJgRb7VZbb5EJhHv6iB+rvmvMkm4I9cz2/iZkplsc1jqAiPdK3s9yjUik94bDdmlID9
 4hjiQUqQInhY5fZow1XnPV4TLJOlo3EvMiUhXy6eGVRYhxSesLkXOwWjUPhR0uRE8bZFBfVF
 ztIecfuIGy1esojC/BqR7j6bbhE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5eca42fb4c3faf51e2db7292 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 24 May 2020 09:48:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 120E1C433C9; Sun, 24 May 2020 09:48:43 +0000 (UTC)
Received: from [192.168.0.104] (unknown [49.207.133.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A2D27C433C6;
        Sun, 24 May 2020 09:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2D27C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V4 5/8] clk: qcom: Add ipq apss clock controller
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
 <1588573224-3038-6-git-send-email-sivaprak@codeaurora.org>
 <20200512201233.GI2165@builder.lan>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <81779b92-c30a-5d4c-cce2-b444a718ee42@codeaurora.org>
Date:   Sun, 24 May 2020 15:18:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512201233.GI2165@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 5/13/2020 1:42 AM, Bjorn Andersson wrote:
> On Sun 03 May 23:20 PDT 2020, Sivaprakash Murugesan wrote:
>
>> The CPU on Qualcomm ipq platform is clocked primarily by a aplha PLL
>> and xo which are connected to a mux and enable block.
>>
>> Add support for the mux and enable block which feeds the CPU on ipq
>> based devices.
>>
> As with the A53 binding, I don't believe that this driver will support
> all past, present and future IPQ APSSs. Please make it more specific.

ok. Let me make the changes to be specific for ipq6018 devices.

> Regards,
> Bjorn
>
