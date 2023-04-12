Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B685C77B73
	for <linux-clk@archiver.kernel.org>; Wed, 12 Apr 2023 15:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbjDLP0f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Apr 2023 11:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbjDLP0c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2023 11:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565A0127
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681313141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qYKh8FdFO1QSNtMcyFw/EOs8sZAgGQFCkTPMptXscZI=;
        b=LCT6qXQen4l3PCm5oF41Fo3TR6zlUWCO6LdSt0XDiFvsoHy9ZTMlC7i7sVJGtlm29DNzqI
        AJlPDxMfiQAIPl+awXOxCz3jvDcnzdHULqDjMbLLKhUXDLvllhyzXPhALxnndBxGK2tjvf
        1tm5ODM61BIZSIdE8OtjFhGePK5uqV8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-_zRTNEMxNpW8YYYAixzByA-1; Wed, 12 Apr 2023 11:25:40 -0400
X-MC-Unique: _zRTNEMxNpW8YYYAixzByA-1
Received: by mail-yb1-f198.google.com with SMTP id b124-20020a253482000000b00b8f1b9d74ecso6574233yba.18
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 08:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681313139;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYKh8FdFO1QSNtMcyFw/EOs8sZAgGQFCkTPMptXscZI=;
        b=2RKTnsDWwA9ktzTMB1LFoImrYFeOwa0llzqHc8lpD4fntmyt5X8hIJ3jMs7cfag7S2
         /mfzKGjVgijc0bUDb4sCsq00MA/gLvnKuoIz3ujpfKp8QoTZaeNlqT9+WEdqP1Sx3V3z
         yy5zQYMzq1yw3BNcED/20fKHYVELbQVD/bfjP582XeEghnE9PWhVVj2vGu7FycUi5V4k
         AILVTkj1GHD31fsxQi30EISpy9edYXIGHd51vhtoSeT+39QoySvN1clT2sMwYqMI9FRf
         +T7IivgP10fepsko3ZCo/96hh56OcWtUoNwpiXhN0N8QNxStSjk7yqRT6qwcclGdhp/4
         DwPQ==
X-Gm-Message-State: AAQBX9eBlOu3Jt3tOnTSQeGy9m3SbM9N/qL+r8N1rAOPF+18+L1JMIxL
        oYhPo8jaMC+rl1QXSBJ5PLaD28wnb7SzV+l2PjpTCIG+7GVO/uGAhrbA6sCeLKSFhj20YJ+CZlJ
        ersxhI6EOgwAZl++eSj15bV+524Cd
X-Received: by 2002:a0d:e543:0:b0:536:eace:3a77 with SMTP id o64-20020a0de543000000b00536eace3a77mr5537545ywe.40.1681313139014;
        Wed, 12 Apr 2023 08:25:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQJ4oa7t3dVS8AqwS5Qn+O71awkukNvK/6B1mDWaGqRW2D1r9R25FsfDQKlgi+zts06ET0Cg==
X-Received: by 2002:a0d:e543:0:b0:536:eace:3a77 with SMTP id o64-20020a0de543000000b00536eace3a77mr5537524ywe.40.1681313138788;
        Wed, 12 Apr 2023 08:25:38 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id q63-20020a81b242000000b0054c0c9e4043sm4252004ywh.95.2023.04.12.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 08:25:38 -0700 (PDT)
Date:   Wed, 12 Apr 2023 11:25:36 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        echanude@redhat.com, ncai@quicinc.com, jsuraj@qti.qualcomm.com,
        hisunil@quicinc.com
Subject: Re: [PATCH v4 0/3] Add EMAC3 support for sa8540p-ride
 (devicetree/clk bits)
Message-ID: <ZDbNcDGIbJrm/x6L@x1>
References: <20230411202009.460650-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411202009.460650-1-ahalaney@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 11, 2023 at 03:20:06PM -0500, Andrew Halaney wrote:
> This is a forward port / upstream refactor of code delivered
> downstream by Qualcomm over at [0] to enable the DWMAC5 based
> implementation called EMAC3 on the sa8540p-ride dev board.
> 
> From what I can tell with the board schematic in hand,
> as well as the code delivered, the main changes needed are:
> 
>     1. A new address space layout for dwmac5/EMAC3 MTL/DMA regs
>     2. A new programming sequence required for the EMAC3 base platforms
> 
> This series addresses the devicetree and clock changes to support this
> hardware bringup.
> 
> As requested[1], it has been split up by compile deps / maintainer tree.
> The associated v4 of the netdev specific changes can be found at [2].
> Together, they result in the ethernet controller working for
> both controllers on this platform.

Looks good to me!

Tested-by: Brian Masney <bmasney@redhat.com>

