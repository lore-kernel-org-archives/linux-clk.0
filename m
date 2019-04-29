Return-Path: <SRS0=OnHn=S7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8741C43219
	for <linux-clk@archiver.kernel.org>; Mon, 29 Apr 2019 21:56:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A58E215EA
	for <linux-clk@archiver.kernel.org>; Mon, 29 Apr 2019 21:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556574968;
	bh=swLtMrZr20XVhdFl0U/z6uMSVJ3JOizZXanRZ3eu35E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hkX9XzOiwCix3/UD2s44QEdBIzMTCoHNCec19ubb5I3NJ3lohNt99KoeYqMKpUoEJ
	 zUXDazYebvw8rcGFsMiXYjgFJyX+ADBjwJ1xb9l8tQ6TaEcc3Tv9lfO3g3i1IULkAq
	 no8/NV0l2Wx6rmvfCdau2V1KhAiHus+PzCBE3ktc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbfD2V4I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Apr 2019 17:56:08 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42180 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729354AbfD2V4I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Apr 2019 17:56:08 -0400
Received: by mail-ot1-f66.google.com with SMTP id f23so10077594otl.9;
        Mon, 29 Apr 2019 14:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XKKc9ollR30BM+UMQFGxVUGGakv+jF5G/U4ZeXs5rlc=;
        b=MYjY11ic+iVhYUp1evZzOeugbfNnqqCW7wnsJU/lXYK53Zxqsv/tdtPX/JfTLp6JUL
         C33D7f4PrekMXvwm/tMQUOTfdPEdIrdsCQIYAeD8xDM1JdmoF3PZytfT+SBqtifaxTkN
         T8JM3IHNrpwXIDgWGNQfHwlPE3DbJ+IpwllKMYmhdg8zezBB0p6BZYoIe7TJOlQrp91Q
         94t28As2G5ok2so9+Dvb1yvEa26m1KoxBvqaRI6xb4n80POMqEWFHerM84cl1lXFIDMi
         AXiPRWwcZoltEfSRVawxty7nFKMBEqk2pS2wy6eSRNoo8/6NZAuzN5auEAEwzfrYlt7X
         BehQ==
X-Gm-Message-State: APjAAAWQ3OOl59Mn16jTu2Cv18UTu7c3LxlrFaXvlp1/sbxybfdq3vkn
        OaJJM1Ts+CyctHPEnAXDMg==
X-Google-Smtp-Source: APXvYqzK/n0xnr2NtW6J8yi6iVGCkxrIoI8i5h+bCP8q1y8hHozDoEl3n9V76GdRqsoIvZvOgkhxdA==
X-Received: by 2002:a9d:4048:: with SMTP id o8mr5634815oti.119.1556574966959;
        Mon, 29 Apr 2019 14:56:06 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b51sm15959317otc.8.2019.04.29.14.56.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 14:56:06 -0700 (PDT)
Date:   Mon, 29 Apr 2019 16:56:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
Message-ID: <20190429215605.GA3078@bogus>
References: <20190412080855.387-1-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190412080855.387-1-josephl@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 12, 2019 at 04:08:55PM +0800, Joseph Lo wrote:
> Add the binding document for the external memory controller (EMC) which
> communicates with external LPDDR4 devices. It includes the bindings of
> the EMC node and the EMC table of different rates.
> 
> To support high rates for LPDDR4, the EMC table must be trained before
> it can be used for runtime clock switching. It has been done by firmware
> and merged the training data to the table that the kernel can share the
> result. So the bindings are used for both kernel and firmware.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> This patch splits from the original patch set that supports EMC scaling
> with binding document and drivers. Because the binding would be shared
> by both firmware and kernel. We want to settle this first. Then we can
> fix the kernel and firmware to support the same.
> 
> Changes in v2:
> * only use "tegra210" string in compatible string and remove the legacy
>   "tegra21" string.
> * clock-frequency -> fix the unit from kilohertz to hertz
> * add "interrupts" property
> * s/nvidia,emc-min-mv/nvidia,emc-min-millivolt/
> * s/nvidia,gk20a-min-mv/nvidia,gk20a-min-millivolt/
> * s/nvidia,source/clock-names/
> * fix lots of properties that use underline to hyphen
> * s/nvidia,emc-clock-latency-change/nvidia,emc-clock-latency-microsecond/
> * add more information in the property descriptions
> ---
>  .../nvidia,tegra210-emc.txt                   | 614 ++++++++++++++++++
>  1 file changed, 614 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> new file mode 100644
> index 000000000000..318239c3c295
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> @@ -0,0 +1,614 @@
> +NVIDIA Tegra210 SoC EMC (external memory controller)
> +====================================================
> +
> +Required properties :
> +- compatible : should be "nvidia,tegra210-emc".
> +- reg : physical base address and length of the controller's registers.
> +- clocks : phandles of the possible source clocks
> +- clock-names : names of the possible source clocks
> +- interrupts : Should contain the EMC general interrupt
> +- #address-cells : should be 1
> +- #size-cells : should be 0
> +- nvidia,memory-controller : phandle of the memory controller.
> +- nvidia,use-ram-code : boolean, indicates whether we should use RAM_CODE in
> +		        the register to find matching emc-table nodes
> +
> +The node should contain a "emc-table" subnode for each supported RAM type
> +(see field RAM_CODE in register APB_MISC_PP_STRAPPING_OPT_A), with its unit
> +address being its RAM_CODE.
> +
> +Required properties for "emc-tables" nodes :
> +- nvidia,ram-code : Should contain the value of RAM_CODE this timing set is
> +		    used for.
> +
> +Each "emc-tables" node should contain a "emc-table" subnode for every supported
> +EMC clock rate. The "emc-table" subnodes should have the clock rate in hertz as
> +their unit address.
> +
> +Required properties for "emc-table" nodes :
> +- compatible :  "nvidia,tegra210-emc-table"
> +- nvidia,revision : revision of the parameter set used for this node. All
> +                    nodes in the same "emc-table" should have the same revision
> +- nvidia,dvfs-version : string for the DVFS version of this table
> +- clock-frequency : frequency in hertz
> +- clock-names : name of clock source to be used for this rate
> +- nvidia,emc-min-millivolt : minimum voltage in millivolt for this rate
> +- nvidia,gk20a-min-millivolt : minimum GPU voltage in millivolt for this rate
> +- nvidia,src-sel-reg : value of EMC CAR register to be used for this rate
> +- nvidia,needs-training : 1 if needs training at boot, 0 otherwise
> +- nvidia,trained : 1 if initial training has been done by firmware, 0 otherwise
> +- nvidia,periodic-training : 1 if needs periodic training, 0 otherwise
> +- nvidia,trained-dram-clktree-c0d0u0 : training data word
> +- nvidia,trained-dram-clktree-c0d0u1 : training data word
> +- nvidia,trained-dram-clktree-c0d1u0 : training data word
> +- nvidia,trained-dram-clktree-c0d1u1 : training data word
> +- nvidia,trained-dram-clktree-c1d0u0 : training data word
> +- nvidia,trained-dram-clktree-c1d0u1 : training data word
> +- nvidia,trained-dram-clktree-c1d1u0 : training data word
> +- nvidia,trained-dram-clktree-c1d1u1 : training data word
> +- nvidia,current-dram-clktree-c0d0u0 : training data word
> +- nvidia,current-dram-clktree-c0d0u1 : training data word
> +- nvidia,current-dram-clktree-c0d1u0 : training data word
> +- nvidia,current-dram-clktree-c0d1u1 : training data word
> +- nvidia,current-dram-clktree-c1d0u0 : training data word
> +- nvidia,current-dram-clktree-c1d0u1 : training data word
> +- nvidia,current-dram-clktree-c1d1u0 : training data word
> +- nvidia,current-dram-clktree-c1d1u1 : training data word
> +- nvidia,run-clocks : training data for clock timing of oscillator clock
> +- nvidia,tree-margin : training data for clock timing
> +- nvidia,burst-regs-num : number of values in nvidia,emc-registers
> +- nvidia,burst-regs-per-ch-num : number of values in
> +				 nvidia,emc-burst-regs-per-ch
> +- nvidia,trim-regs-num : number of values in nvidia,emc-trim-regs
> +- nvidia,trim-regs-per-ch-num : number of values in nvidia,emc-trim-regs-per-ch
> +- nvidia,burst-mc-regs-num : number of values in nvidia,emc-burst-mc-regs
> +- nvidia,la-scale-regs-num : number of values in nvidia,emc-la-scale-regs
> +- nvidia,vref-regs-num : number of values in nvidia,emc-vref-regs
> +- nvidia,training-mod-regs-num : number of values in nvidia,training-mod-regs
> +- nvidia,dram-timing-regs-num : number of values in nvidia,emc-dram-timing-regs
> +- nvidia,min-mrs-wait : number of EMC clock count to wait for MRS command
> +- nvidia,emc-mrw : value of the EMC_MRW register
> +- nvidia,emc-mrw2 : value of the EMC_MRW2 register
> +- nvidia,emc-mrw3 : value of the EMC_MRW3 register
> +- nvidia,emc-mrw4 : value of the EMC_MRW4 register
> +- nvidia,emc-mrw9 : value of the EMC_MRW4 register
> +- nvidia,emc-mrs : value of the EMC_MRS register
> +- nvidia,emc-emrs : value of the EMC_EMRS register
> +- nvidia,emc-emrs2 : value of the EMC_EMRS2 register
> +- nvidia,emc-auto-cal-config : value of the EMC_AUTO_CAL_CONFIG register
> +- nvidia,emc-auto-cal-config2 : value of the EMC_AUTO_CAL_CONFIG2 register
> +- nvidia,emc-auto-cal-config3 : value of the EMC_AUTO_CAL_CONFIG3 register
> +- nvidia,emc-auto-cal-config4 : value of the EMC_AUTO_CAL_CONFIG4 register
> +- nvidia,emc-auto-cal-config5 : value of the EMC_AUTO_CAL_CONFIG5 register
> +- nvidia,emc-auto-cal-config6 : value of the EMC_AUTO_CAL_CONFIG6 register
> +- nvidia,emc-auto-cal-config7 : value of the EMC_AUTO_CAL_CONFIG7 register
> +- nvidia,emc-auto-cal-config8 : value of the EMC_AUTO_CAL_CONFIG8 register
> +- nvidia,emc-cfg-2 : value of the EMC_CFG_2 register
> +- nvidia,emc-sel-dpd-ctrl : value of the EMC_SEL_DPD_CTRL register
> +- nvidia,emc-fdpd-ctrl-cmd-no-ramp : value of the EMC_FDPD_CTRL_CMD_NO_RAMP
> +				     register
> +- nvidia,dll-clk-src : value of the CLK_RST_CONTROLLER_CLK_SOURCE_EMC_DLL
> +		       register
> +- nvidia,clk-out-enb-x-0-clk-enb-emc-dll : 1 for enable EMC_DLL in the
> +					   CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET,
> +					   or 0 for clear in the
> +					   CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR
> +- nvidia,emc-clock-latency-microsecond : clock latency value in micro seconds
> +- nvidia,ptfv : a 12 word array of control data for periodic training
> +- nvidia,emc-registers :
> +- nvidia,emc-shadow-regs-ca-train :
> +- nvidia,emc-shadow-regs-quse-train :
> +- nvidia,emc-shadow-regs-rdwr-train :
> +  a 221 word array of the following registers (See TRM 18.10.2 for register
> +  descriptions)

I think this dumping of register values should not be in DT. I think the 
result here will be a lot of duplication of data. How many of the 
registers' values vary between 2 frequencies, for example? 

We have bindings already for DDR that use timing values (see 
bindings/lpddr2/lpddr2.txt). There's one for LPDDR3 being added. This 
data is similar to the SPD data which is used in DIMMs. If SPD data is 
enough information for any DIMM to work on any PC, then that should be 
sufficient for embedded uses too.

Rob
