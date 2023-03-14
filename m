Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFDAC6FD1D
	for <linux-clk@archiver.kernel.org>; Tue, 14 Mar 2023 13:56:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbjCNNz7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Mar 2023 09:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjCNNzl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Mar 2023 09:55:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166231D907
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678801995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=27KQYZgjkZx3cO9u5MRtjq+WwG0d0GtPOCjo6zjWpFI=;
        b=c6lhnQrz648sEL3L/d9qHl4MvPYuoYmHpbnulT/qDgA7Bb39hyMT1tiq/GrRXNyJjqHQO/
        pmFy5H+INiOvXHr3J9gD5GPQhUxNFpnlOOPkc85ULl1kFJkxui9SfZTK0vwH0qTeN7e41/
        XtUei5ZbqZpZAj/POsYybSREc8gvlic=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-FkyKSu5zM2OdG8bpuKZa7A-1; Tue, 14 Mar 2023 09:53:13 -0400
X-MC-Unique: FkyKSu5zM2OdG8bpuKZa7A-1
Received: by mail-ot1-f69.google.com with SMTP id o8-20020a9d5c08000000b00693d403480aso7501399otk.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 06:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678801993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27KQYZgjkZx3cO9u5MRtjq+WwG0d0GtPOCjo6zjWpFI=;
        b=j6ITeY7A67mOrBDW7HXP70pEmgA/9bP4luXr4ovaPB7ru22+lMoAkJYfupQ+XwURAq
         YP8Ip69gXiX+MZbo84JeYP63c9nU51kFUjxoPK+wwxpz9M49cSdPQhhd1qqyNXAGzqpy
         f04R12SjzTcRcPhmuDfxuzPD0KRXD4wYfKDg9TuWyPv1idTQZ1P5zS+Qc/u60RnPM/qn
         CEzWmu8SUe9TlAGJOnJCym/kECXYKuyo4Nlvmw1etngwWr8nfD9Qmxjx3fi2FkABI4rJ
         JlKFSR2XyzEFUZJDKIRVubRExN92sg23tYZLafhTREUEk5bmrQ99+78UYhI2wShKz/k5
         jTTw==
X-Gm-Message-State: AO0yUKU/bBNCHekONc9B1sLjtd5L4Mq3USUVFlUJ1AnxUJUfQ05fJNX4
        yfSjSw88kdM8BxPxcgqRXeTYFhsQ0KjI7yUgy1giQjX6jn/YFX+XdKYZozM+Gsg/3CuXxHchu4t
        3SIwjP9OzbxBDbI0TA2QO
X-Received: by 2002:a05:6870:40c5:b0:177:9f48:6282 with SMTP id l5-20020a05687040c500b001779f486282mr5967646oal.53.1678801992955;
        Tue, 14 Mar 2023 06:53:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set865OV+J0WHIBTC/561ECQlv4RbYP6x5QMO3SK6tB+6M0mPsz58Rsx3evTgj9Holgi7Z6/nvg==
X-Received: by 2002:a05:6870:40c5:b0:177:9f48:6282 with SMTP id l5-20020a05687040c500b001779f486282mr5967618oal.53.1678801992726;
        Tue, 14 Mar 2023 06:53:12 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id an36-20020a056871b1a400b00177c314a358sm1088290oac.22.2023.03.14.06.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 06:53:12 -0700 (PDT)
Date:   Tue, 14 Mar 2023 08:53:09 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Stephen Boyd <sboyd@kernel.org>, andersson@kernel.org
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
        richardcochran@gmail.com, linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com
Subject: Re: [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
Message-ID: <20230314135309.o7y2ofzdvpowu53j@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-6-ahalaney@redhat.com>
 <e5cb46e8874b12dbe438be12ee0cf949.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5cb46e8874b12dbe438be12ee0cf949.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Bjorn,

On Mon, Mar 13, 2023 at 03:57:27PM -0700, Stephen Boyd wrote:
> Quoting Andrew Halaney (2023-03-13 09:56:14)
> > Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> I'm not sure if Bjorn Andersson is planning on modifying this file too,
> so please confirm it can go through netdev tree.
> 

Can you please help respond to Stephen's comment above? I admittedly
don't have much experience sending patch series that span across
multiple subsystems, so if there's something I should be doing
differently (to indicate who takes what patches, etc) in submission
please do not hesitate to be overly verbose in instructing me!

Thanks,
Andrew

