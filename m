Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B730C61D97
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 22:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236201AbjAYWZP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 17:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjAYWZO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 17:25:14 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98637CA3B;
        Wed, 25 Jan 2023 14:25:12 -0800 (PST)
Message-ID: <4c531c68-b74f-2f90-e8f6-98a4b0316cd4@ansari.sh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1674685510;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R90IOuy0iSwNHOL4lLloLfwx6viTyQ4Kc8W05QGyzLw=;
        b=Vsw+7KxhRetIF7RueAZ7dDX0RaGBV5oqgELHFnoEpgMrjfBDtYgxuAMT6m+8juBnpZM/G4
        i70kvo1i59Y5PLxcmk59vTpITQC4m4xyBgg8s5mDhNFdy168UBuR1VVBl9fGnl6z7HlQpO
        Me9s+ihX0XTO1HmHQsUZh+43WYYiPmM=
Date:   Wed, 25 Jan 2023 22:25:08 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/3] clk: qcom: smd: Add XO RPM clocks for
 MSM8226/MSM8974
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20230121192540.9177-1-rayyan@ansari.sh>
 <20230121192540.9177-2-rayyan@ansari.sh>
 <06d53a3fa48080d902476b71308e69bd.sboyd@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Rayyan Ansari <rayyan@ansari.sh>
In-Reply-To: <06d53a3fa48080d902476b71308e69bd.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/01/2023 20:58, Stephen Boyd wrote:
> Quoting Rayyan Ansari (2023-01-21 11:25:38)
>> Add the XO and XO_A clocks to the MSM8974 clock list, which is also
>> used on MSM8226.
> 
> Why was this missing for so long? Does this break suspend? Why are you
> adding it now?

I am adding it because of a recommendation from a maintainer on an older 
patch version.
See 
https://lore.kernel.org/linux-arm-msm/20230119023337.h6a7f56lizhv4tcy@builder.lan/#t
