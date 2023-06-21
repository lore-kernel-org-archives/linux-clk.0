Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D48BEB64D7
	for <linux-clk@archiver.kernel.org>; Wed, 21 Jun 2023 10:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbjFUKrp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Jun 2023 06:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbjFUKrV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jun 2023 06:47:21 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36BF272E;
        Wed, 21 Jun 2023 03:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687344352; x=1718880352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P32W9AfKeVxcvQoVXSO2hVKT1bX+1GIInDGt+g7kzUA=;
  b=Tik79gtRICZJ/e6yWuGptEes4Uf6Ys1haKc4XzL+KzNx62sLPB5mzmaj
   zWa566YoI71TDWmdh+qJYJADnYDYg1Mh8m4azTwAXnkw6ykQy90nrDeq8
   oO7KTtxmj/2dF8Y5ov7Yd2u/Ux50qQhYMsvU11pYENdHpuurXHoWIwctz
   HkJyHrT0LvH8zWqobpaFyLxbl1MYFYiObFEcvCLT1FCF/51z7qDvaDYYU
   j2QZoAemndju9vMhn8Tdttj+mEPHsscSjPHG/tmsoSdPS5rgcP43NltIT
   kLgsr92dV6l8yBB/WV6I92zYst2VvOuBgM6e5zhm2sqhXcuORqIEIWbi4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="359004744"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="359004744"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 03:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858926048"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="858926048"
Received: from unknown (HELO localhost.localdomain) ([10.226.216.116])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2023 03:45:48 -0700
From:   wen.ping.teh@intel.com
To:     krzysztof.kozlowski@linaro.org
Cc:     adrian.ho.yin.ng@intel.com, andrew@lunn.ch, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dinguyen@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        netdev@vger.kernel.org, niravkumar.l.rabara@intel.com,
        p.zabel@pengutronix.de, richardcochran@gmail.com,
        robh+dt@kernel.org, sboyd@kernel.org, wen.ping.teh@intel.com
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add Intel Agilex5 clocks and resets
Date:   Wed, 21 Jun 2023 18:45:25 +0800
Message-Id: <20230621104525.2522714-1-wen.ping.teh@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ed6f9ab8-9c4e-ec9f-efb7-81974d75f074@linaro.org>
References: <ed6f9ab8-9c4e-ec9f-efb7-81974d75f074@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

>From: Krzysztof Kozlowski @ 2023-06-20 11:06 UTC (permalink / raw)
>>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: intel,agilex5-clkmgr
>>>
>>>
>>> Why "clkmgr", not "clk"? You did not call it Clock manager anywhere in
>>> the description or title.
>>>
>> 
>> The register in Agilex5 handling the clock is named clock_mgr.
>> Previous IntelSocFPGA, Agilex and Stratix10, are also named clkmgr.
>
>So use it in description.

Noted. Will update the description in V2.

>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  # Clock controller node:
>>>> +  - |
>>>> +    clkmgr: clock-controller@10d10000 {
>>>> +      compatible = "intel,agilex5-clkmgr";
>>>> +      reg = <0x10d10000 0x1000>;
>>>> +      #clock-cells = <1>;
>>>> +    };
>>>> +...
>>>> diff --git a/include/dt-bindings/clock/agilex5-clock.h b/include/dt-bindings/clock/agilex5-clock.h
>>>> new file mode 100644
>>>> index 000000000000..4505b352cd83
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/clock/agilex5-clock.h
>>>
>>> Filename the same as binding. Missing vendor prefix, entirely different
>>> device name.
>>>
>> 
>> Will change filename to intel,agilex5-clock.h in V2.
>
>Read the comment - same as binding. You did not call binding that way...
>unless you rename the binding.

Just to confirm, the binding name you are referring to is "intel,agilex5-clkmgr"?
I will change the filename to intel,agilex5-clkmgr.h in V2.

Best Regards,
Wen Ping

