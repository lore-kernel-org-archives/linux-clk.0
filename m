Return-Path: <SRS0=wHDT=W5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8367DC3A5A7
	for <linux-clk@archiver.kernel.org>; Mon,  2 Sep 2019 13:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5103D21881
	for <linux-clk@archiver.kernel.org>; Mon,  2 Sep 2019 13:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567431525;
	bh=Whcs8mlKmTqfZxOhgtYZCcxn/vWlYEtkR6WkX+mAmQg=;
	h=Date:From:Subject:References:In-Reply-To:CC:To:List-ID:From;
	b=JIz2TRn+SPND3X3pGFVT16sekrNzDNMVIEGiTRlyBchk32tz6Gm6YW1YtiLTyF7BV
	 NZRJNAag8cp+G3pE1X7PJ2mKXT8KilgBdh6kELoiehK/6Q48O6COWE5NT1Jzw4jsQ8
	 RO1WyFgx/Xd2fqp2TvQz89P+mKJv+lSAaE6XJ++E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730829AbfIBNip (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Sep 2019 09:38:45 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51881 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730662AbfIBNio (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Sep 2019 09:38:44 -0400
Received: by mail-wm1-f66.google.com with SMTP id k1so14644994wmi.1;
        Mon, 02 Sep 2019 06:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=0A2NGMWOy3zEuz3VxC/asQLJTnz9aoB2esNpQEgqd1g=;
        b=ujRAtidc97z7NergjRki6rSUAt6MIYwYCWaOjmN+fQfgv1WPYXORXma59zbTEqLXOI
         qlOxIhmHkFa8t8pUwadG2JS4hsaYbmCqvxvSyiKoLisd7k0BQVEkCTZf9sKGkq4tSqY0
         UPSJEDUB3U+zj7psO0bhPCnckAvXqkG+x0ZvuFMcSk05qHGfZiCR+2soz5ontBZsVlne
         QIZwxzgRyBmebZVYl9kzLj9Qs7oKUwDGGv2qSsjAiXZQ4Ub2+9FOhCsaC82yZmTQ13Wz
         DpooEpLUCROjVphGjZigW2mfFT+2RxZ9j+2EhqWWFVs1Y3Y2J5GXf7WiWT1EtWApKsoP
         WsKw==
X-Gm-Message-State: APjAAAWC9wIwxtvXacSKjrBLpK1lW+ob4L1Ry/2B/AcZNZI3GQpgP6r9
        uj/R45p89sAVVyKF6BUFwg==
X-Google-Smtp-Source: APXvYqyryTjFEoAjRiTRD/cveMVvJ62e6tv3eGdxZSToRxqfmTU0cEJbrtDlZV7N6If8HbCiP6JxUw==
X-Received: by 2002:a7b:cc02:: with SMTP id f2mr34634993wmh.92.1567431522631;
        Mon, 02 Sep 2019 06:38:42 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id n2sm9271557wro.52.2019.09.02.06.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:38:41 -0700 (PDT)
Message-ID: <5d6d1b61.1c69fb81.735c8.535d@mx.google.com>
Date:   Mon, 02 Sep 2019 14:38:41 +0100
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: add pericfg for MT8183
References: <1566980533-28282-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1566980533-28282-1-git-send-email-chunfeng.yun@mediatek.com>
Content-Type: text/plain
CC:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Erin Lo <erin.lo@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 28 Aug 2019 16:22:12 +0800, Chunfeng Yun wrote:
> This patch adds binding of pericfg for MT8183.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,pericfg.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

