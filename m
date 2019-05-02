Return-Path: <SRS0=2SAN=TC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C018C43219
	for <linux-clk@archiver.kernel.org>; Thu,  2 May 2019 11:20:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0350A2085A
	for <linux-clk@archiver.kernel.org>; Thu,  2 May 2019 11:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ST2RxbPD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfEBLU3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 May 2019 07:20:29 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35562 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfEBLU3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 May 2019 07:20:29 -0400
Received: by mail-lf1-f66.google.com with SMTP id j20so1598664lfh.2
        for <linux-clk@vger.kernel.org>; Thu, 02 May 2019 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9w9Z65D8Al+rQt4IhuBYgF3NEdsrDJEO15e5EvdPx1Q=;
        b=ST2RxbPDem/0s1E6e6o+eH7BQoN0i9FyoiLbsm1QgTHhVOG7axMK0P/dNSfV6uMMF7
         24sOljXk+jVnqTnrkhtS8sxc5xTKHd/bXyHcljdO8SLWGSN8r9jqs1ly4Ubi8zSdR/Ps
         pW6T8+eLdvJOmT9jXyCrGQq1P5GFhVMNZi/abXhDfNWxuYmDTGaw2FaEsftV+ERWnEh8
         lgkbHxrz6ckap8xrinV2x/fnhE+VEG6uMveu4Gqy+YnAan1nNrEd312fyyNV3DUQocVB
         uNtFFSLOkZcLEJ2gRbJR2ziZW01l4mP9AqlPDtlXZoVuiVEps30uo+lSxK/FsslP7wE0
         yW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9w9Z65D8Al+rQt4IhuBYgF3NEdsrDJEO15e5EvdPx1Q=;
        b=KrM+lvEAN46NFjznTVIUM0+u/oLmAP08cw75HcPQVT02mqK+78rpXlTcyEw1bkwB5P
         H5V/YCCqGafDQdAhgB4uCU2ezSyN1ZMOaCtkHWZ3lFaRYl7T3BEkeUIwEFZ6Rd8aYa3N
         MUPXWyGtuGc58iRjCfHksfu63I+lMOfEvbhxrS3WP/e9jPPstH2AWB5JLNL3IuXoA7cq
         EEktxU0IiE4bxFCczPKGnxPASQitKsIr7rGYxcwuABePY34s6tSTqJvRoZ4wtDwfAs2c
         t6///V1t8oKMZ9Go1uDcCUcvBk8hlvmFEdhJkEvd28Wr4rVcctEeTUZqsNBEYcYSEI9n
         eWQQ==
X-Gm-Message-State: APjAAAWt9qVTQLTrBuKmsG7ep4MhkoM7DnNOkEA4lIz8eoHRfOviqPeS
        5Ybw1LxRegDUgpKQfWDGyVw0HA==
X-Google-Smtp-Source: APXvYqyiDUlriBY3d6ZKyElKw8/pnToW8dKBtOt1/kBIHh2tVhRI5jsGWhAW8/gMWh3m5zSp9kXESw==
X-Received: by 2002:ac2:5686:: with SMTP id 6mr1712827lfr.34.1556796027822;
        Thu, 02 May 2019 04:20:27 -0700 (PDT)
Received: from centauri (h-158-174-22-72.NA.cust.bahnhof.se. [158.174.22.72])
        by smtp.gmail.com with ESMTPSA id e14sm10279221ljk.45.2019.05.02.04.20.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 02 May 2019 04:20:26 -0700 (PDT)
Date:   Thu, 2 May 2019 13:20:24 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: gcc-qcs404: Add PCIe resets
Message-ID: <20190502112024.GA18333@centauri>
References: <20190502002138.10646-1-bjorn.andersson@linaro.org>
 <ecc6a7fb-14a8-3314-d376-433c9f98b692@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecc6a7fb-14a8-3314-d376-433c9f98b692@free.fr>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 02, 2019 at 12:53:33PM +0200, Marc Gonzalez wrote:
> On 02/05/2019 02:21, Bjorn Andersson wrote:
> 
> > diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> > index 454b3f43f538..5959399fed2e 100644
> > --- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
> > +++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> > @@ -166,5 +166,12 @@
> >  #define GCC_PCIEPHY_0_PHY_BCR				12
> >  #define GCC_EMAC_BCR					13
> >  #define GCC_CDSP_RESTART				14
> > +#define GCC_PCIE_0_AXI_MASTER_STICKY_ARES		14
> 
> Seems weird that there would be two names for the same entry at index 14?

Changes since v2:
- Rebased patch

The proper tag in the subject should have been [PATCH v2].

This is most likely an issue caused by the rebase.


Kind regards,
Niklas
