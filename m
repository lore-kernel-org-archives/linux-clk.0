Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:32923 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdLGXaR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Dec 2017 18:30:17 -0500
Received: by mail-wm0-f43.google.com with SMTP id g130so2545206wme.0
        for <linux-clk@vger.kernel.org>; Thu, 07 Dec 2017 15:30:16 -0800 (PST)
Subject: Re: [PATCH] clk: qcom: gcc-msm8996: always enable aggre0_noc gdsc
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20171207141618.4694-1-srinivas.kandagatla@linaro.org>
 <20171207225439.GB4283@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <49ce1ed5-145a-e039-2954-d04fa548e7e3@linaro.org>
Date: Thu, 7 Dec 2017 23:30:04 +0000
MIME-Version: 1.0
In-Reply-To: <20171207225439.GB4283@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 07/12/17 22:54, Stephen Boyd wrote:
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = VOTABLE,
>> +	.flags = VOTABLE | ALWAYS_ON,
> I dont think this flag has been added yet. Probably this needs to
> be folded into the other series?
I agree, I will wait for Rajendras patches to land in or I can request 
Rajendra to fold this into his series.




thanks,
srini
