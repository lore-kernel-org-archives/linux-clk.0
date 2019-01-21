Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA04C2F3D5
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7B7A20861
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548081223;
	bh=Wk46AtKXQRBLP8yNKhPYkl3w0kkYt51mwRhEbilqRJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DgIZSdKeSvf4HfyRL5p1y+7ADckdthCtvZF4VxP5sZ4MWk6fUk5kJW4c0rE8yxsEZ
	 6fMtYTL0HJu98S3lcuMMjtHRkh6r887I6ZF63aLKdVZRi28Vi694ejTwheZNHlqp61
	 9RFmkRvPr6v52ZOTm+nJDaXdO6FcECVfJTFjxpcQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbfAUOdn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:33:43 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44391 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729046AbfAUOdn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 09:33:43 -0500
Received: by mail-ot1-f65.google.com with SMTP id f18so20649201otl.11;
        Mon, 21 Jan 2019 06:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lzdgug9cY+cpzKZe5dNk4ASSmMX+tfqPGBkLUHknq7s=;
        b=bOH0RuchkKierfv/QS7KklB02O0lY8vvgpp/5qLgpzVEaUyolXd9i84F1QXHjHxLE/
         qcXEoZfCLVFh9IeWvrHL7bLdpWdMKWacZ1qeelbIPTljQ/kMFkWncxekNayFiGLLsLlK
         U/PuRWQEd91e2WaVGD9bUS1vsbf4D3j+iWQrwE0zTGJFGIIfFqUElb7npn3aFEkcjqtq
         xS9FGZFR3ujFBU3DXB27hZfaJXSgyPHXK8lNDhtdPFCRrkUi3GOMVB79sk5HktIQkFov
         cSr+XFIrdkk2cmn7hIowfCAZe8ze5KGh0kqKqRJVdJ5bxAdOHUh+dEc9klMj7a/ddYms
         wvew==
X-Gm-Message-State: AJcUukdA/FKqbPU0huIP64F9gDhtlBD4G8d3T3hKFXzdFcQGgRjERWUF
        Zj50N0y+iAu1INaFbtzCAQ==
X-Google-Smtp-Source: ALg8bN6pisCjwfwDivCiO1iK0FdLHZfLmK8wYsKBYCLwsGdNGcq17OuK++pR6mdoEUG2Av/nnQwz3g==
X-Received: by 2002:a9d:886:: with SMTP id 6mr20633122otf.256.1548081222236;
        Mon, 21 Jan 2019 06:33:42 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y2sm5425694oto.49.2019.01.21.06.33.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 06:33:41 -0800 (PST)
Date:   Mon, 21 Jan 2019 08:33:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     lee.jones@linaro.org, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/6] clk: lochnagar: Add initial binding documentation
Message-ID: <20190121143341.GA10768@bogus>
References: <20190117145858.26659-1-ckeepax@opensource.cirrus.com>
 <20190117145858.26659-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190117145858.26659-2-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 17 Jan 2019 14:58:54 +0000, Charles Keepax wrote:
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
> Changes since v5:
>  - Add missing 8m fixed clock
> 
> Thanks,
> Charles
> 
>  .../devicetree/bindings/clock/cirrus,lochnagar.txt | 93 ++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
