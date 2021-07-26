Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33285C4338F
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jul 2021 22:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C35560F41
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jul 2021 22:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbhGZVjQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jul 2021 17:39:16 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:44712 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhGZVjP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jul 2021 17:39:15 -0400
Received: by mail-io1-f46.google.com with SMTP id l18so13736752ioh.11;
        Mon, 26 Jul 2021 15:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xHPXLi03WXVUchYBC65c2GZ92HMs6rkpL60DkI++LCM=;
        b=gwZU2cbKjRRIuTrmlGTE3qfOWICfBlhL+Z1YoyfxQRbEaDF54qnb/FYByjSt8uM4wR
         ty6UulDDRby4nNGED9Se6/4co2aa4AlxFhGeEWMI7pCd9xXJTYdL0QnTpQyY0ugRK9cq
         nl2K+csIGyYJy50F6Fg/aFHH+RLsFYFA4kAM8OFf1Pd1IP5MC6pbxc48N8AwoaCDesqa
         yeeWgQW0ixHL8ayRk4C7beamat/SdFWBLXW/6ADpv33evCt9471iT43AN0FnpavtJQRC
         XsRmyvBZG04LVqUagdjtkhLfX30HT64wssOQWrQqn83NtzQ/0/RpVnvMzSnBtSKAXYxZ
         QlPw==
X-Gm-Message-State: AOAM531FNjV5yi1rXY/SsyGA6lapnIihRxp2o5Mo75Qs7+05yAHrrdyW
        r2lGQWyfLGd+q4nj9HAgzw==
X-Google-Smtp-Source: ABdhPJyg2wm+J/BH2hZvskVsNWRhAlwbNLgTheBTn+ws1Tsv1t0002srSD4JrIAjAvxq8g6P/Kto+w==
X-Received: by 2002:a02:6d5d:: with SMTP id e29mr18537654jaf.44.1627337982658;
        Mon, 26 Jul 2021 15:19:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l4sm538462ilh.41.2021.07.26.15.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:19:42 -0700 (PDT)
Received: (nullmailer pid 974037 invoked by uid 1000);
        Mon, 26 Jul 2021 22:19:39 -0000
Date:   Mon, 26 Jul 2021 16:19:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, rick.tyliu@ingenic.com,
        aric.pzqi@ingenic.com, paul@crapouillou.net,
        sernia.zhou@foxmail.com, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, sihui.liu@ingenic.com, sboyd@kernel.org,
        devicetree@vger.kernel.org, dongsheng.qiu@ingenic.com,
        jun.jiang@ingenic.com
Subject: Re: [PATCH v7 09/11] dt-bindings: clock: Add X2000 clock bindings.
Message-ID: <20210726221939.GA973955@robh.at.kernel.org>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627119286-125821-10-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1627119286-125821-10-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 24 Jul 2021 17:34:44 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add the clock bindings for the X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v5:
>     New patch.
> 
>     v5->v6:
>     No change.
> 
>     v6->v7:
>     Change to dual license.
> 
>  include/dt-bindings/clock/x2000-cgu.h | 89 +++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 include/dt-bindings/clock/x2000-cgu.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
