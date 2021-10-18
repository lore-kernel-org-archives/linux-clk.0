Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255CBC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 19:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C1E761283
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 19:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbhJRTIu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Oct 2021 15:08:50 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:40823 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhJRTIu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Oct 2021 15:08:50 -0400
Received: by mail-oi1-f172.google.com with SMTP id n63so1152159oif.7;
        Mon, 18 Oct 2021 12:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oIh0xpgiG266/gXR6mMj7c9evBjxIPCaLMPpwMBLEWY=;
        b=oJs0d2+jyiokyzgOAwmUJcfwVCcKQRBj0EG2rvNYFHBCssilLcNDxbXsgX7WiMUUXu
         IqzhZ+TZS9jQxb2nLvJGOuIgBWaV8OwdlSKikySZMZbeK4Y6T2UAwlcnnR5pRRJqaszz
         IOIsJT31iU6YXH5DNiJUPNgnMmkh0/gbZJrhlRRRuuIvUHCENgzOLkUd2G+5fBbCZ72r
         rWfQbyZ/EFeXpO4byoUzFvvsqkUvzY0H/e7VfV0ul01c6CTBArv8PWLBNkq3KGvR8fxV
         1mVgWiU4oKWdJ3IJan/lsy/fnFZfKXkprKPy0SPF2fHC5yuwmvjMtxUotfw/4K/bMQ/J
         EWVg==
X-Gm-Message-State: AOAM533FhUrNGkY6b4Iw7neMzvrDzrm/1swSobrOCxrHYzWAIGH/MtPI
        SuqBG5dJFCazFB29pKDa8A==
X-Google-Smtp-Source: ABdhPJzywCSYfPhInzrsQ58BRDvbrLpnCA/CCVskK/W/u/BaCrPiBMeKIxXM8YU0pOEuc5UGSXL9YQ==
X-Received: by 2002:a05:6808:1487:: with SMTP id e7mr603627oiw.126.1634583998502;
        Mon, 18 Oct 2021 12:06:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i42sm3174975ota.43.2021.10.18.12.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 12:06:37 -0700 (PDT)
Received: (nullmailer pid 2768434 invoked by uid 1000);
        Mon, 18 Oct 2021 19:06:37 -0000
Date:   Mon, 18 Oct 2021 14:06:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: uniphier: Add NX1 clock
 binding
Message-ID: <YW3FvRtjcngTDkkL@robh.at.kernel.org>
References: <1634000035-3114-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1634000035-3114-3-git-send-email-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634000035-3114-3-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 12 Oct 2021 09:53:52 +0900, Kunihiko Hayashi wrote:
> Update clock binding document for UniPhier NX1 SoC.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  Documentation/devicetree/bindings/clock/socionext,uniphier-clock.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
