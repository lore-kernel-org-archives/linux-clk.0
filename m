Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEAAC433F5
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 16:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiJCQkH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 12:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiJCQjh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 12:39:37 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD067D84;
        Mon,  3 Oct 2022 09:39:36 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id u68so1626406oie.10;
        Mon, 03 Oct 2022 09:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rCkVgFFm81c7XCEOFqwSIFr8KWJouyjzQpmxMv51+P0=;
        b=yu6EoevO7HioKE1ZGVlcISPMReHkhyWq5jQuY/wdl7of3lWymzhkK0qYN2gIFyZ/oZ
         guUKb8jWXabh+DJvcw59+Od4NmTsFp9SH3/uLXMizNaa1XnYBq7dQS1OoK0XmiW7VeJ2
         dOeY1WejfcHaXW7EFRnrLj/QBapG5uxIn/2JOt98kH0KMwI0YfZcbUlhk12P6e7OBLZu
         7WDgzZOGhbnBeZc0fQDnkbDNw2Y4wuoSZAQylaSJ+Vy/C5EupOYZ4ltzWxENZmPthDUu
         9jp6CfWI+AMPjOtIDD4/oPSpejcQWYqP3SB4SC3BKxbKsR4HIvMvLhhteQoTH8CaGANI
         FkUA==
X-Gm-Message-State: ACrzQf25d6hW6sarTzli9SazCYkg7AaXFnJGd0kIzjVbmtqWx3PANdJL
        Is8abbfFCugOi5ZuIoNvdQ==
X-Google-Smtp-Source: AMsMyM5g62exClojpTpSmD9HqfcpJlqbBa2KyN+2JGz3TWulMtbWRZ3rBot/gwNKUtjp4G3ki+kjdg==
X-Received: by 2002:aca:1c13:0:b0:350:ce21:a022 with SMTP id c19-20020aca1c13000000b00350ce21a022mr4604235oic.172.1664815176043;
        Mon, 03 Oct 2022 09:39:36 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fp18-20020a056870659200b00132741e966asm872725oab.51.2022.10.03.09.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:39:35 -0700 (PDT)
Received: (nullmailer pid 2423452 invoked by uid 1000);
        Mon, 03 Oct 2022 16:39:34 -0000
Date:   Mon, 3 Oct 2022 11:39:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-rockchip@lists.infradead.org,
        Elaine Zhang <zhangqing@rock-chips.com>,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com
Subject: Re: [PATCHv2 1/9] dt-bindings: clock: add rk3588 clock definitions
Message-ID: <166481517368.2423396.8795946691890924874.robh@kernel.org>
References: <20220930153857.299396-1-sebastian.reichel@collabora.com>
 <20220930153857.299396-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930153857.299396-2-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 30 Sep 2022 17:38:49 +0200, Sebastian Reichel wrote:
> Add clock ID defines for rk3588.
> 
> Compared to the downstream bindings written by Elaine, this uses
> continous gapless clock IDs starting at 0. Thus all numbers are
> different between downstream and upstream, but I kept exactly the
> same names.
> 
> Co-Developed-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../dt-bindings/clock/rockchip,rk3588-cru.h   | 766 ++++++++++++++++++
>  1 file changed, 766 insertions(+)
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3588-cru.h
> 

Acked-by: Rob Herring <robh@kernel.org>
