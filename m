Return-Path: <SRS0=APof=QO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D25EC282C2
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 07:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A9A7218FE
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 07:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fkNP5IcF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbfBGHtl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Feb 2019 02:49:41 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37916 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfBGHtk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Feb 2019 02:49:40 -0500
Received: by mail-wr1-f67.google.com with SMTP id v13so10390572wrw.5
        for <linux-clk@vger.kernel.org>; Wed, 06 Feb 2019 23:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0pfKzUpDQVqES+Uvo3kyq8TjX3Vj3ewKdOYxlQKxmek=;
        b=fkNP5IcFMh5Yf+vx6olYNVzD9h4zlL3ZAjC0g8DJZ58qQtYgsTaMz/W9o3pNi5W1Jq
         o+/IOANKHh3J8gQtUIUwAWTFLds1dJHsUCtQm5GcBGGqudgOR7oGWxEhy3RU0YOG3q/0
         qrDOuhxDB6plYQdp4zOOB8/RsihRKc6DnXv0c+Ki5qs5G9ihT79atDNFOYLECI8tEps3
         HpZnMJRu32hhgv/ulX7qqqDqbAZfDvdLQLcQwnW1jLkNWvZaQ2dJZxCm1RLZvxjaSuN8
         ujgO3D2ORO8FrFSq00i9zwKf4rlvX32YZ/1vg/jK/llmPoD3F2nS22Q8S53nj8uSQIjO
         Lruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0pfKzUpDQVqES+Uvo3kyq8TjX3Vj3ewKdOYxlQKxmek=;
        b=ge/IStedcDT7ZbBcC2f88XeXzLIC5k7UHf1NMTFBBzJSUHjLmwJlqNojy/3ro8vLow
         RBVe8Eys9NRWMsVdxJ5PYrfk7JlvG3yNpo2uCdMX/wgChvxMdd7juh7NA1SGZR3cWdEX
         ibWY4/WsT1KbL0oohY0T4n0V9EWcRptjBwn3MFNmgsmfEjgn8kMDvPc5wPwk9LDEzzEU
         VvCKSElFENcB44Va0rM+lnQf7YVFosi7K4XvNZB+9JybYiG7N33AclHqqnjexQ4r1fik
         Bu3Ok4/Gj6NrwxzuUaJHg2iT+XxPenx2gHmQV3Aqe1BmJfo2o3JPSXY1Y2kCMnq48AAG
         nWcg==
X-Gm-Message-State: AHQUAuax/n5WzjiVuXPZlcTJBVgQIl+VDPaD9gdWcNXZg0zN96kDNHE1
        JaLx9kEl/ipdL+wHkvhY/HXy5A==
X-Google-Smtp-Source: AHgI3IYLofiwCB9Z3bbRXBIVvTpkpgo3yqZ7H9uQPj9Z82X5aQSqYkkaQZaEEY2p+S684JomsZ7H8A==
X-Received: by 2002:adf:ba94:: with SMTP id p20mr10972778wrg.62.1549525778785;
        Wed, 06 Feb 2019 23:49:38 -0800 (PST)
Received: from dell ([2.27.35.171])
        by smtp.gmail.com with ESMTPSA id w13sm15744154wmf.5.2019.02.06.23.49.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Feb 2019 23:49:38 -0800 (PST)
Date:   Thu, 7 Feb 2019 07:49:36 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/6] mfd: lochnagar: Add initial binding documentation
Message-ID: <20190207074936.GB4672@dell>
References: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 30 Jan 2019, Charles Keepax wrote:

> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v6:
>  - Correct regulator bindings to match already merged regulator code
> 
> Thanks,
> Charles
> 
>  .../devicetree/bindings/mfd/cirrus,lochnagar.txt   |  68 +++++++++++
>  include/dt-bindings/clk/lochnagar.h                |  26 ++++
>  include/dt-bindings/pinctrl/lochnagar.h            | 132 +++++++++++++++++++++
>  3 files changed, 226 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
>  create mode 100644 include/dt-bindings/clk/lochnagar.h
>  create mode 100644 include/dt-bindings/pinctrl/lochnagar.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
