Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0E4C4360F
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 10:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4A5620883
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 10:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnak6I+O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfDBKXF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 06:23:05 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42136 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbfDBKXF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Apr 2019 06:23:05 -0400
Received: by mail-lf1-f65.google.com with SMTP id b7so8554337lfg.9;
        Tue, 02 Apr 2019 03:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lfoxEKmtTnq5FttnYAzZdHJfEMaauhJI5hDd7L+zSrY=;
        b=mnak6I+O8JqGxafUUbdykJdBtpuYErXK6UXeN0MlkZ+LRVr467O2ju+2/AFUt5ojfI
         VmCtYX5r7WB8n5ofQlyTQMlK6QN0NMVW/o5n/ryuk/4RgfetVsc/cWJXKhj9e4VFUUtz
         oEUDMyQO+OZAgpR6O8A7DQoPsFl1jYkRX57TWF8PuWdtf38d1d3PkMefTY60h2z5VT0i
         Cx4NyMa4aqBy3aYqksstcA1uSKd8W4kdt9kpHyOXh2yGILghGS33gqqedObSAfhy4ZcJ
         ushdrly3nVOGBtUVu48xLUpTzwllX05/SaqyzT9/pLqTuf3W2apAAqjHSj3bSxhnosP4
         6ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lfoxEKmtTnq5FttnYAzZdHJfEMaauhJI5hDd7L+zSrY=;
        b=UL3JRkWU+AhqQYyxn2coOPcLATLkLhFxUQFU56e6Eb9S0y6ruZP2wmQ+4MIFxiwEtm
         K8A84i/Ky/pRxtRjall4EF9uZODPEz01qRtXxfCq617AcIFQmX9qZ7K+SMBzzevNgpM0
         H0Nxj3mIQkYKTjP8ztgIBC5Gb/DPcgSkwo7Uv/INAiOKzVLoJg6OprIoT7b+WUa+trXb
         HgwxaFTpIYsI9zmjTFXOpvBVKu9eH4/Y/1NdFKyBHE23B5JgUv/1oAPgLjcqDJOnd+1S
         0Hr1pQ3QJI1Kmj5T3NyMKNwymDlWOz8aLnB1qspiwB560DB19piBKUR9UkwNKMAV3qHk
         SvTA==
X-Gm-Message-State: APjAAAWmONckqoQus+FDv9qbS3A9MLhaPXyzblfNjRTPC/FiJ/880heU
        7eSNOQAh6JUVemdKYOhO1Nk=
X-Google-Smtp-Source: APXvYqwSt1jAf7KBvo0uV7nUPE6yuscfnoJgiVKWGYyW909Iv7iNQhcmLuTWePl7es7QNtaCRCFZ6A==
X-Received: by 2002:a19:48c8:: with SMTP id v191mr1975209lfa.53.1554200582246;
        Tue, 02 Apr 2019 03:23:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id z18sm2393731lfi.57.2019.04.02.03.23.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Apr 2019 03:23:01 -0700 (PDT)
Subject: Re: [PATCH 1/8] dt-bindings: memory: tegra: Add Tegra210 EMC bindings
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-2-josephl@nvidia.com>
 <dab337a7-195c-d03f-8b3a-bccf08b23d70@gmail.com>
 <d77f1605-a499-81af-bb14-aeaa0e083cff@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4aab770b-044a-80b6-00c9-52ba591228f2@gmail.com>
Date:   Tue, 2 Apr 2019 13:21:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d77f1605-a499-81af-bb14-aeaa0e083cff@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

02.04.2019 5:26, Joseph Lo пишет:
> On 4/1/19 8:12 PM, Dmitry Osipenko wrote:
>> 25.03.2019 10:45, Joseph Lo пишет:
>>> Add the binding document for the external memory controller (EMC) which
>>> communicates with external LPDDR4 devices. It includes the bindings of
>>> the EMC node and the EMC table of different rates.
>>>
>>> To support high rates for LPDDR4, the EMC table must be trained before
>>> it can be used for runtime clock switching. It has been done by firmware
>>> and merged to the table that Linux kernel uses. For backward
>>> compatibility with the devices that had been launched on the market, like
>>> Shield and Jetson platforms, the bindings in the EMC table should remain
>>> the same. So the firmware can recognize them and merge the trained EMC
>>> table for the kernel.
>>>
>>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>>
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> ---
>>>   .../nvidia,tegra210-emc.txt                   | 605 ++++++++++++++++++
>>>   1 file changed, 605 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>> new file mode 100644
>>> index 000000000000..1f6b6df6d37b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>> @@ -0,0 +1,605 @@
>>> +NVIDIA Tegra210 SoC EMC (external memory controller)
>>> +====================================================
> snip
>>> +- nvidia,emc-training-mod-regs :
>>> +- nvidia,emc-save-restore-mod-regs :
>>> +    deprecated, keep for for backward compatibility
>>
>> This is a new binding, so.. backward compatibility with what? Some old version of downstream bootloader? Do you really need it?
>>
> Yes, backward compatibility for the firmware that helps to do the initial DDR4 training before we can use that. Although the kernel doesn't use that for EMC scaling, the firmware still uses these bindings and updates them.
> 
>>> +- nvidia,emc-burst-mc-regs : values for the following registers
>>> +                 (See TRM 18.10.1 for register descriptions)
>>> +    MC_EMEM_ARB_CFG
>>> +    MC_EMEM_ARB_OUTSTANDING_REQ
>>> +    MC_EMEM_ARB_REFPB_HP_CTRL
>>> +    MC_EMEM_ARB_REFPB_BANK_CTRL
>>> +    MC_EMEM_ARB_TIMING_RCD
>>> +    MC_EMEM_ARB_TIMING_RP
>>> +    MC_EMEM_ARB_TIMING_RC
>>> +    MC_EMEM_ARB_TIMING_RAS
>>> +    MC_EMEM_ARB_TIMING_FAW
>>> +    MC_EMEM_ARB_TIMING_RRD
>>> +    MC_EMEM_ARB_TIMING_RAP2PRE
>>> +    MC_EMEM_ARB_TIMING_WAP2PRE
>>> +    MC_EMEM_ARB_TIMING_R2R
>>> +    MC_EMEM_ARB_TIMING_W2W
>>> +    MC_EMEM_ARB_TIMING_R2W
>>> +    MC_EMEM_ARB_TIMING_CCDMW
>>> +    MC_EMEM_ARB_TIMING_W2R
>>> +    MC_EMEM_ARB_TIMING_RFCPB
>>> +    MC_EMEM_ARB_DA_TURNS
>>> +    MC_EMEM_ARB_DA_COVERS
>>> +    MC_EMEM_ARB_MISC0
>>> +    MC_EMEM_ARB_MISC1
>>> +    MC_EMEM_ARB_MISC2
>>> +    MC_EMEM_ARB_RING1_THROTTLE
>>> +    MC_EMEM_ARB_DHYST_CTRL
>>> +    MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0
>>> +    MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1
>>> +    MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2
>>> +    MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3
>>> +    MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4
>>> +    MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5
>>> +    MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6
>>> +    MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7
>>> +- nvidia,emc-la-scale-regs : values for the following registers
>>> +                 (See TRM 18.10.1 for register descriptions)
>>> +    MC_MLL_MPCORER_PTSA_RATE
>>> +    MC_FTOP_PTSA_RATE
>>> +    MC_PTSA_GRANT_DECREMENT
>>> +    MC_LATENCY_ALLOWANCE_XUSB_0
>>> +    MC_LATENCY_ALLOWANCE_XUSB_1
>>> +    MC_LATENCY_ALLOWANCE_TSEC_0
>>> +    MC_LATENCY_ALLOWANCE_SDMMCA_0
>>> +    MC_LATENCY_ALLOWANCE_SDMMCAA_0
>>> +    MC_LATENCY_ALLOWANCE_SDMMC_0
>>> +    MC_LATENCY_ALLOWANCE_SDMMCAB_0
>>> +    MC_LATENCY_ALLOWANCE_PPCS_0
>>> +    MC_LATENCY_ALLOWANCE_PPCS_1
>>> +    MC_LATENCY_ALLOWANCE_MPCORE_0
>>> +    MC_LATENCY_ALLOWANCE_HC_0
>>> +    MC_LATENCY_ALLOWANCE_HC_1
>>> +    MC_LATENCY_ALLOWANCE_AVPC_0
>>> +    MC_LATENCY_ALLOWANCE_GPU_0
>>> +    MC_LATENCY_ALLOWANCE_GPU2_0
>>> +    MC_LATENCY_ALLOWANCE_NVENC_0
>>> +    MC_LATENCY_ALLOWANCE_NVDEC_0
>>> +    MC_LATENCY_ALLOWANCE_VIC_0
>>> +    MC_LATENCY_ALLOWANCE_VI2_0
>>> +    MC_LATENCY_ALLOWANCE_ISP2_0
>>> +    MC_LATENCY_ALLOWANCE_ISP2_1
>>
>> Shouldn't this be a part of a "Memory Controller" binding like it is done for T124?
>>
> 
> The Tegra SoCs before Tegra132 only supports DDR3 or DDR2. The EMC table doesn't include the settings of latency allowance registers. For the DDR4 support on Tegra210, we will dynamically scale these latency allowance registers as well to support faster clock rate. So the arbitration can be adapted according to the rate switching.
> 
> And the EMC scaling sequence for DDR3 and DDR4 is quite different. So the EMC scaling sequence for Tegra124 cannot be used for Tegra210. Same as the EMC table bindings.

This is not true, the MC configuration part is exactly the same for all of the Tegra's, see T124 driver and the tegra_mc_write_emem_configuration() which writes MC registers defined per-SoC and T210 could easily include the LA registers. But I now see that you mentioned in the cover letter that you're not going to change the binding and want upstream to accept the downstream binding as-is, in this case it's fine to mix EMC with MC. Ultimately it will be nicer if the bootloader firmware could be updated to conform with upstream to have all of the bindings consistent across all of SoC generations, AFAIK that's what other vendors are doing.
