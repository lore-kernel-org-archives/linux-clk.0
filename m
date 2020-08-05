Return-Path: <SRS0=GcY6=BP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562BCC433DF
	for <linux-clk@archiver.kernel.org>; Wed,  5 Aug 2020 20:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DAB222B42
	for <linux-clk@archiver.kernel.org>; Wed,  5 Aug 2020 20:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2q5APab"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbgHEUP6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Aug 2020 16:15:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56808 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726400AbgHEQUE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Aug 2020 12:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596644402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QVpgCBuAAnsCtvrERYgdCRjC/scatHyJclE27/3mCkw=;
        b=U2q5APabxjsEKq4IeTyjVbVa1zfiROltSQvSgmQQczhoWDuzbCspTluLh+za2kp/sZu6Pm
        vp04LkpXuKJ8zTAzZI/gQIffdFZqq8SlIq0THL0HbRqOdcKYxZh3xH5mWeKzrTc1piSirk
        jWnLrh6YZ5H3a1kq949/pMVNfIRqeN8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-oYdQAOeqOM276btKPoUxmg-1; Wed, 05 Aug 2020 12:02:13 -0400
X-MC-Unique: oYdQAOeqOM276btKPoUxmg-1
Received: by mail-qt1-f198.google.com with SMTP id g10so15132309qtr.19
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2020 09:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QVpgCBuAAnsCtvrERYgdCRjC/scatHyJclE27/3mCkw=;
        b=N0j2hNR3j20FyPggD/eBydjxK0F6dSk4pPHubdnZZuMC8uP5bRUej2StrwdybWVlSB
         QriEpjLWTq1XygdjTZbj9UmnDm7Kquovnt1Qd5LlYByPVBjLTND93xoVkamrr6cvbVxe
         qGtWP5SIdJm7wnXszODs5+okP3+kR8tMjVFlmKa1X8nZZMh3wNm9UjGhA+Bt7KF7UKoU
         FH2LRsmxeeNcXfXuRxMcGCT5AIaF7LBsYg6mVs5BYsCuuTqu8hiXcniDFLHbV43hNzPt
         ZC76A9jqxLiRq3Tm9ns9EevM6+TesUVNUUFd/2zvm4mngnCOLnSGU7fkparMArH34bmt
         rmuQ==
X-Gm-Message-State: AOAM530mvwJekRJdEram1R8Ed3potMR//AXyPxgwLVPOp9qmBGSPaQXr
        eV8XUEoMYTyxr23Q8GnmA/JEVzCN3m3AbdenvyuuSaq7huSukjxRTyyP4RPNiFPqGmcjTUsTSgP
        PLgG7T09H6SKihe9oxYLC
X-Received: by 2002:ad4:554f:: with SMTP id v15mr4340219qvy.30.1596643333039;
        Wed, 05 Aug 2020 09:02:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCEt6SOCQIQNlgWFc2fSlY6oagtplzPU3BVLGyxoUjfFLo9zIHh0cZuAl1swq7IdMfrOOlkw==
X-Received: by 2002:ad4:554f:: with SMTP id v15mr4340183qvy.30.1596643332734;
        Wed, 05 Aug 2020 09:02:12 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id d46sm2548270qtk.37.2020.08.05.09.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 09:02:12 -0700 (PDT)
Subject: Re: [PATCH 5/6] include: fpga: adi-axi-common.h: add definitions for
 supported FPGAs
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-clk@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mdf@kernel.org,
        Mircea Caprioru <mircea.caprioru@analog.com>
References: <20200804110658.40911-1-alexandru.ardelean@analog.com>
 <20200804110658.40911-6-alexandru.ardelean@analog.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <f69c3dc7-be50-9685-b70f-8af2f7093646@redhat.com>
Date:   Wed, 5 Aug 2020 09:02:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200804110658.40911-6-alexandru.ardelean@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 8/4/20 4:06 AM, Alexandru Ardelean wrote:
> From: Mircea Caprioru <mircea.caprioru@analog.com>
>
> All (newer) FPGA IP cores supported by Analog Devices, store information in
> the synthesized designs. This information describes various parameters,
> including the family of boards on which this is deployed, speed-grade, and
> so on.
>
> Currently, some of these definitions are deployed mostly on Xilinx boards,
> but they have been considered also for FPGA boards from other vendors.
>
> The register definitions are described at this link:
>   https://wiki.analog.com/resources/fpga/docs/hdl/regmap
> (the 'Base (common to all cores)' section).
>
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  include/linux/fpga/adi-axi-common.h | 37 +++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/include/linux/fpga/adi-axi-common.h b/include/linux/fpga/adi-axi-common.h
> index 141ac3f251e6..7cca2d62cc45 100644
> --- a/include/linux/fpga/adi-axi-common.h
> +++ b/include/linux/fpga/adi-axi-common.h
> @@ -13,6 +13,9 @@
>  
>  #define ADI_AXI_REG_VERSION			0x0000
>  
> +#define ADI_AXI_REG_FPGA_INFO			0x001C
> +#define ADI_AXI_REG_FPGA_VOLTAGE		0x0140
> +
>  #define ADI_AXI_PCORE_VER(major, minor, patch)	\
>  	(((major) << 16) | ((minor) << 8) | (patch))
>  
> @@ -20,4 +23,38 @@
>  #define ADI_AXI_PCORE_VER_MINOR(version)	(((version) >> 8) & 0xff)
>  #define ADI_AXI_PCORE_VER_PATCH(version)	((version) & 0xff)
>  
> +#define ADI_AXI_INFO_FPGA_VOLTAGE(val)		((val) & 0xffff)
> +
> +#define ADI_AXI_INFO_FPGA_TECH(info)		(((info) >> 24) & 0xff)
> +#define ADI_AXI_INFO_FPGA_FAMILY(info)		(((info) >> 16) & 0xff)
> +#define ADI_AXI_INFO_FPGA_SPEED_GRADE(info)	(((info) >> 8) & 0xff)
> +
> +enum adi_axi_fgpa_technology {

enum types are defined but not used.  It would be better to convert all of these to #defines.

These are only the Xilinx values. Need to add the Intel values from

https://github.com/analogdevicesinc/hdl/blob/master/library/scripts/adi_intel_device_info_enc.tcl

The #define names need to include XILINX or INTEL.

Tom

> +	ADI_AXI_FPGA_TECH_UNKNOWN = 0,
> +	ADI_AXI_FPGA_TECH_SERIES7,
> +	ADI_AXI_FPGA_TECH_ULTRASCALE,
> +	ADI_AXI_FPGA_TECH_ULTRASCALE_PLUS,
> +};
> +
> +enum adi_axi_fpga_family {
> +	ADI_AXI_FPGA_FAMILY_UNKNOWN = 0,
> +	ADI_AXI_FPGA_FAMILY_ARTIX,
> +	ADI_AXI_FPGA_FAMILY_KINTEX,
> +	ADI_AXI_FPGA_FAMILY_VIRTEX,
> +	ADI_AXI_FPGA_FAMILY_ZYNQ,
> +};
> +
> +enum adi_axi_fpga_speed_grade {
> +	ADI_AXI_FPGA_SPEED_UNKNOWN	= 0,
> +	ADI_AXI_FPGA_SPEED_1		= 10,
> +	ADI_AXI_FPGA_SPEED_1L		= 11,
> +	ADI_AXI_FPGA_SPEED_1H		= 12,
> +	ADI_AXI_FPGA_SPEED_1HV		= 13,
> +	ADI_AXI_FPGA_SPEED_1LV		= 14,
> +	ADI_AXI_FPGA_SPEED_2		= 20,
> +	ADI_AXI_FPGA_SPEED_2L		= 21,
> +	ADI_AXI_FPGA_SPEED_2LV		= 22,
> +	ADI_AXI_FPGA_SPEED_3		= 30,
> +};
> +
>  #endif /* ADI_AXI_COMMON_H_ */

