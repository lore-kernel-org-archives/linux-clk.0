Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F0EC433E0
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 17:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80F5B65235
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 17:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCHR1k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Mar 2021 12:27:40 -0500
Received: from mail-il1-f171.google.com ([209.85.166.171]:37336 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhCHR1d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Mar 2021 12:27:33 -0500
Received: by mail-il1-f171.google.com with SMTP id k2so9550228ili.4;
        Mon, 08 Mar 2021 09:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z4VzCr+NjykMx6ss3+YedQXI/QaFLF89E2u39WmSoLQ=;
        b=B2FSVECaBEGI7n2L9UaZShZD6Qsq2ssj0gj5absBN8T79Azy1AkqPD5VIHRKLHy6Fq
         Dzh7grGcWCGvTExKrZUt9EUUcNXnz3DA4Y8CnyFCVlQOdVlU8IWaSyjbbOj1YR8akFH+
         hOLOfs2yKzWUZ7Yekj0SXfoeepBZwE5Y3yoT6qh3L+7oAeGxLIRA/yMQZFnyH9q82h3U
         zZ+3ylZj63yx7HEjvy3YIZkEGOOvKX76qGFwvC5vFmUA8gFK69orH5Z7jf2RtY3mQi0H
         5KqacOZqSBllUPk5ui83yENN7kgKiIVDOFjr5BYiMMVaafa2TEBzh3fs88lyOnEoKolj
         G7Mw==
X-Gm-Message-State: AOAM5337EwfjhNTqTdKbTA4+jkpqJntlu8HiC2t9TmZYLCZ77IKtmybl
        T+Gbdlj2PTEXlOvAf0idzg==
X-Google-Smtp-Source: ABdhPJymVBviqDmcjogfw4M2rtCtsicnvt2LVjcMBx2jYkzfy4qseIoAI3ubQ28VbDMgrro+hskwag==
X-Received: by 2002:a92:194a:: with SMTP id e10mr21733466ilm.213.1615224452312;
        Mon, 08 Mar 2021 09:27:32 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k3sm6267660ioj.35.2021.03.08.09.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:27:31 -0800 (PST)
Received: (nullmailer pid 2663388 invoked by uid 1000);
        Mon, 08 Mar 2021 17:27:28 -0000
Date:   Mon, 8 Mar 2021 10:27:28 -0700
From:   Rob Herring <robh@kernel.org>
To:     Elaine Zhang <zhangqing@rock-chips.com>
Cc:     sboyd@kernel.org, kever.yang@rock-chips.com,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        linux-rockchip@lists.infradead.org, heiko@sntech.de,
        robh+dt@kernel.org, cl@rock-chips.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, finley.xiao@rock-chips.com,
        tony.xie@rock-chips.com, huangtao@rock-chips.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-binding: clock: Document rockchip, rk3568-cru
 bindings
Message-ID: <20210308172728.GA2663354@robh.at.kernel.org>
References: <20210301064749.10392-1-zhangqing@rock-chips.com>
 <20210301064749.10392-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301064749.10392-2-zhangqing@rock-chips.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 01 Mar 2021 14:47:46 +0800, Elaine Zhang wrote:
> Document the device tree bindings of the rockchip Rk3568 SoC
> clock driver in Documentation/devicetree/bindings/clock/rockchip,rk3568-cru.yaml.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3568-cru.yaml   | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3568-cru.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
