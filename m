Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD4CC4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 09:30:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C74BF20855
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 09:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQsfTC1h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732260AbfDDJao (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 05:30:44 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45294 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732514AbfDDJam (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 05:30:42 -0400
Received: by mail-lj1-f194.google.com with SMTP id y6so1421511ljd.12;
        Thu, 04 Apr 2019 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8NNLJi045b3pBVLneT+xr6DUXUmaWTf4rVzpG/sxtGE=;
        b=NQsfTC1hHIW3YhQ8dArUzR5kRDWUfKGP0nIfV4oh5psrkW8KHvQFUranPExXAbaFly
         cVR8uQbxuZhC8aVe7F8AyqtOFN8IcKFW38UdA+vMw2VPCMVyW/5u5q8j75M+TBJAWXl3
         xJ9xKM4cDlO4e7wlUp7dZNpmyRwmwaZ4b15RwmL4MxPzGaK4gt4KWLn+pUSaYA7DU3gf
         GPrDX5XA3NmWTpwhrG2TDyvNB3s1JqYnsQ3GI7+rsPAzx9BMnCwi8mlYow+Ird4g3ijW
         N8E4Um7EDiJawObmaTKoHGusM7BoAEoykSZeKvtD+uEHTwC84fB9jt6P88Ar8ixTUyqT
         hDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8NNLJi045b3pBVLneT+xr6DUXUmaWTf4rVzpG/sxtGE=;
        b=ArJ0wKIbDuVr95Pc0NwSd/BBaIts8/G/iPp9n/nl9ORPM0OI4asE1++kP1QMue3AoK
         lt6Cs+vLgq8bzWdq3umLhunmkMOE5OHRhCuiK708NnTpAzy765RM72rTNaVV4nzLraXi
         2WE04XdtXCdDUNYObIfUET94vp53CUV3UfDWVVBoQl3sXEUjSYoVsajCrOj3e+9bEe9k
         RbukmKhRvw4oBlrHBptNAi7aA3BHmvbK2kDOUyBSBSP8/Engfhu/hx55JRkHpncTXvWZ
         YReZAHQQdAuyr4rm2qjZn8l6L2ACHa7j0LqCmKVB0UqlhHErzOZ2yBVxG2/6aj6Ot5o3
         en0A==
X-Gm-Message-State: APjAAAWeDFsHWO0x2Mc6pZ2uTlWxxUIGctjwcvSDbv/PqW5IFaa1Enqn
        WNg+MWtjj1Hlcik0uzGi+wqJ90yd
X-Google-Smtp-Source: APXvYqzRwvpCPtmkkSsCQItAhErItFPfkq+cJn5IAgWuT33bhMTLmZz81RcS1JeOh1g2CXx6kF+gZw==
X-Received: by 2002:a2e:7007:: with SMTP id l7mr2734832ljc.101.1554370239504;
        Thu, 04 Apr 2019 02:30:39 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id z17sm899853lja.26.2019.04.04.02.30.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 02:30:38 -0700 (PDT)
Subject: Re: [PATCH 1/8] dt-bindings: memory: tegra: Add Tegra210 EMC bindings
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-2-josephl@nvidia.com>
 <6bd34a19-26e0-6bdd-ce89-4a30d35e9823@gmail.com>
Message-ID: <8118ea70-df97-8050-ae12-b2cd4843960b@gmail.com>
Date:   Thu, 4 Apr 2019 12:30:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6bd34a19-26e0-6bdd-ce89-4a30d35e9823@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

04.04.2019 12:17, Dmitry Osipenko пишет:
> 25.03.2019 10:45, Joseph Lo пишет:
>> Add the binding document for the external memory controller (EMC) which
>> communicates with external LPDDR4 devices. It includes the bindings of
>> the EMC node and the EMC table of different rates.
>>
>> To support high rates for LPDDR4, the EMC table must be trained before
>> it can be used for runtime clock switching. It has been done by firmware
>> and merged to the table that Linux kernel uses. For backward
>> compatibility with the devices that had been launched on the market, like
>> Shield and Jetson platforms, the bindings in the EMC table should remain
>> the same. So the firmware can recognize them and merge the trained EMC
>> table for the kernel.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>  .../nvidia,tegra210-emc.txt                   | 605 ++++++++++++++++++
>>  1 file changed, 605 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>> new file mode 100644
>> index 000000000000..1f6b6df6d37b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>> @@ -0,0 +1,605 @@
>> +NVIDIA Tegra210 SoC EMC (external memory controller)
>> +====================================================
>> +
>> +Required properties :
>> +- compatible : should be "nvidia,tegra21-emc", "nvidia,tegra210-emc".
>> +- reg : physical base address and length of the controller's registers.
>> +- clocks : phandles of the possible source clocks
>> +- clock-names : names of the possible source clocks
>> +- #address-cells : should be 1
>> +- #size-cells : should be 0
>> +- nvidia,memory-controller : phandle of the memory controller.
>> +- nvidia,use-ram-code : boolean, indicates whether we should use RAM_CODE in
>> +		        the register to find matching emc-table nodes
>> +
> 
> The "interrupts" property is missing. You could use the CLK handshake event to wait for the clock rate change completion instead of polling the register if you didn't rely on the downstream binding, see T20 driver for the example. BTW, I'm wondering if you're going to push other downstream bindings to upstream.. apparently EMC won't be the only binding that that could diverge from the upstream and then it's not obvious whether the locked-down variant of T210 is supportable by upstream at all.
> 

One solution could be to use a multi-stage bootloader, where the last stage is an opensource part that will take the downstream binding and convert it into a proper one.
