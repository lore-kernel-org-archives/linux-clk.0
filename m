Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC21C4332B
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 18:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 941DC225AA
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 18:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgLUSzL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 13:55:11 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:44505 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgLUSzK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 13:55:10 -0500
Received: by mail-oi1-f179.google.com with SMTP id d189so12243966oig.11;
        Mon, 21 Dec 2020 10:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VxUDcWHEtVg+ff7we8+iFRq064frk9Mq/obRG6B8LUs=;
        b=NRxukXkLJm/lLIc45Sed9QueFmqqiztTGcwL4uwLyXi75KKIXApkTFAt7oHwNl7QyR
         +JEtfPLaWxcmsZk7D6lLMKsb/xbOmjGkoZ45t02ljnOPdNNXWwPCzPB6yX2ArnPCA6GY
         AY6KrqRYetfB+EVIUpuLjEvyQXrwJiUBcxdP+23cpVjO7v1gsoOIOQohVnXi48Q0x950
         vAC1a1yHkHTlXtzS5XLdImABgkt75wYfOc1TkrteSC9oTQQ6oedezlgfnppod6KHkN5m
         HW2E5LkAwsJtCBPt9MLDm1AddlnCWS3Zj4zQP4uis3nZ/N+sfMEL/hr+tYYz23UAe0eo
         fGhA==
X-Gm-Message-State: AOAM532zXzLB1lqIU1MMzQ/BIalV0GuoFSDNXDxQQrUZ4wmauRMxOiB4
        1GUJ9/deSkBTiW8cie8DpuNIk6lPVQ==
X-Google-Smtp-Source: ABdhPJzwNvQJNxTDOqP+ioypfUuKRetmU4VcIdw2HS9cwjxOBbluxuuW7/120JXxAPspilV+Ro6O4A==
X-Received: by 2002:aca:f58c:: with SMTP id t134mr1725213oih.68.1608576869587;
        Mon, 21 Dec 2020 10:54:29 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w138sm3733401oie.44.2020.12.21.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 10:54:28 -0800 (PST)
Received: (nullmailer pid 355917 invoked by uid 1000);
        Mon, 21 Dec 2020 18:54:25 -0000
Date:   Mon, 21 Dec 2020 11:54:25 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de, vkoul@kernel.org,
        linux-kernel@vger.kernel.org, dan.j.williams@intel.com,
        mturquette@baylibre.com
Subject: Re: [PATCH v7 1/4] dt-bindings: Document the hi3559a clock bindings
Message-ID: <20201221185425.GA355861@robh.at.kernel.org>
References: <20201215110947.41268-1-gengdongjiu@huawei.com>
 <20201215110947.41268-2-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215110947.41268-2-gengdongjiu@huawei.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 15 Dec 2020 11:09:44 +0000, Dongjiu Geng wrote:
> Add DT bindings documentation for hi3559a SoC clock.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  .../clock/hisilicon,hi3559av100-clock.yaml    |  59 +++++++
>  include/dt-bindings/clock/hi3559av100-clock.h | 165 ++++++++++++++++++
>  2 files changed, 224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/hisilicon,hi3559av100-clock.yaml
>  create mode 100644 include/dt-bindings/clock/hi3559av100-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
