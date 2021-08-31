Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEAAC4320A
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 20:36:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E291460F23
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 20:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240866AbhHaUho (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Aug 2021 16:37:44 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:40703 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhHaUho (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Aug 2021 16:37:44 -0400
Received: by mail-ot1-f48.google.com with SMTP id 107-20020a9d0bf4000000b0051b8be1192fso739592oth.7;
        Tue, 31 Aug 2021 13:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aqHdwF28ssn7h5rBScdWy/rsjpIPtYuz1M/d3JaSE+E=;
        b=AJPdRBKEk0U91uJYAWjtsvUzcGn1EJKGMuqCa1XWiTnEFLFQQ4ZVuEz7gDhNwlgYYG
         cx3xhqjdfyevLXwb5O5VdbQHP6IVjR1fYP1UWn/yBOqvZXnkpmw3Yd0yev0yRauBeiRa
         0G/tak3abbxy0jJ9wiSp9OwmzbsJq0/OTuArkTzedLhgWFhj8zGB2Usd2hz/MxiqmVMI
         WJuVm18gjTWQC5mAZY60Ysgn8Lb3VtPfRzm/iDOSw7OITjWqH0gPCeXhfWQRSyfQ4Mcj
         100bjFDELXCN7AP5vR5aIccGkX787bMCyKu/kt5wM7K/SqxU2uukuWrBx/1ivoYJpcab
         cqhw==
X-Gm-Message-State: AOAM531b5HIba/31Aqfhec6d+vlSavn3hJ7j6SJ9Rfpf+k5qoQPZJNwk
        dBfIhPe0TF+kU2K0SJQCEbe0+q7Sug==
X-Google-Smtp-Source: ABdhPJwqdVnfRold8woWqrk2A0cRbs/F/qP0g2Af1OjDBNPoKVvmwbYUfWLfqJALLjHOc88iyRCl+g==
X-Received: by 2002:a05:6830:349c:: with SMTP id c28mr26415207otu.35.1630442208520;
        Tue, 31 Aug 2021 13:36:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x3sm3692965ooe.32.2021.08.31.13.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 13:36:47 -0700 (PDT)
Received: (nullmailer pid 608262 invoked by uid 1000);
        Tue, 31 Aug 2021 20:36:47 -0000
Date:   Tue, 31 Aug 2021 15:36:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     devicetree@vger.kernel.org, sboyd@kernel.org,
        kuninori.morimoto.gx@renesas.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH v4 4/9] dt-bindings: clock: cs2000-cp: document
 cirrus,dynamic-mode
Message-ID: <YS6S399lXDCOjbkU@robh.at.kernel.org>
References: <20210827115420.3052019-1-daniel@zonque.org>
 <20210827115420.3052019-5-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827115420.3052019-5-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 27 Aug 2021 13:54:15 +0200, Daniel Mack wrote:
> This new flag exists to enable the dynamic mode of the hardware.
> When not given, the static mode is used.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
