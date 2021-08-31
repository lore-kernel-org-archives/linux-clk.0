Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C854C4320A
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 20:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57CED6103A
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 20:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240039AbhHaUh0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Aug 2021 16:37:26 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:44766 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhHaUhZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Aug 2021 16:37:25 -0400
Received: by mail-ot1-f43.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so704975otg.11;
        Tue, 31 Aug 2021 13:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4+9TeaKBoTOXXdmMAVich+4shVxSQS6v4GcuKsv5djM=;
        b=ZSF+qW3F+7qVghi8NDqPyg01VdFYdYEKX9lvZaLuCNvQizoIfg9sNbAakpUBMuQkI7
         xo31aKo0NeJSNG9V6RaIl7htdhlpj3eYKTBzVJWSCwp5TsAMgJQYPNrUcnX1+3hT4LIf
         qXkNUwHEzUWpNSSX2VxOA9xwrUH6KZYbwRrbUG+sO1jErLGEdpnye8kYJKGQnI/2MYC4
         QZkqhthD4AZsRaWk1Iq3fx2XbAoPhU5IhkAslNPXDTK6DMZeSFi8LtKAKJ/8exlvquPO
         cTExpDalk3PGRyyKhx0DpwwmVAG+l9MFeeYZ+P9na+jp1XGzl8Hzmq4HGHAWFMJzW/ti
         b3Fw==
X-Gm-Message-State: AOAM531ZnmAqUGik7qypRkNUKMH8mKyOUU1FRj0vrEYhyJIQLVWr9hJf
        IP42+ePteJPLyVVqxpDhlA==
X-Google-Smtp-Source: ABdhPJxIYKmm4n8zIhPufgRMwPFYQuCV09y5foVpJJ2sZlgABhsRwkWHeChQ4CqE+9TSkOekJORKYA==
X-Received: by 2002:a9d:70cc:: with SMTP id w12mr24628421otj.306.1630442189636;
        Tue, 31 Aug 2021 13:36:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o126sm3226330oig.21.2021.08.31.13.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 13:36:29 -0700 (PDT)
Received: (nullmailer pid 607759 invoked by uid 1000);
        Tue, 31 Aug 2021 20:36:28 -0000
Date:   Tue, 31 Aug 2021 15:36:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@kernel.org, kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v4 3/9] dt-bindings: clock: cs2000-cp: document
 cirrus,clock-skip flag
Message-ID: <YS6SzMKwf7VJIVJa@robh.at.kernel.org>
References: <20210827115420.3052019-1-daniel@zonque.org>
 <20210827115420.3052019-4-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827115420.3052019-4-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 27 Aug 2021 13:54:14 +0200, Daniel Mack wrote:
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
