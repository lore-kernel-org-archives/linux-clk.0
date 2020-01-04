Return-Path: <SRS0=Dvha=2Z=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE88C00523
	for <linux-clk@archiver.kernel.org>; Sat,  4 Jan 2020 00:33:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7C3D24649
	for <linux-clk@archiver.kernel.org>; Sat,  4 Jan 2020 00:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578098006;
	bh=FQqg43T3dIl5K3GpIr4UK2OLyRhw2uPyJMsl/Gvw8wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KzQx6jR5MdyUJ6mlPGZ1IgRol4xEvdEP2CrGl0Ukavm5FXEUOX/i2ZLCgAig7VAVt
	 lMqC8AUa74x6mtlELk1PYkSZEiGinlOZjJl1Coki5+5KA1H/utkTGUdKGCZWMssGTX
	 JXqBR76rwJ6HWsTlM80gNA/C6KLKBNFBIirLkKI4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgADAdY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:33:24 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:38264 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgADAdW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jan 2020 19:33:22 -0500
Received: by mail-il1-f194.google.com with SMTP id f5so38013422ilq.5
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2020 16:33:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k8CKT1is0EUxteWZfaLzNNpxRWfsUWmMNgxluVtAzcQ=;
        b=l0Oktzb1V1tqNNxBpu5vw2HgtuIybmzGSGmVzzGLgonz4maSxeN8zgbwJxKuKaiXyV
         6DCNj4t1ogS8CuKTgc0caJtAeZoDlfKaeQmyNWP/es9q2zX7Uw6SqqsGrPTDrovm/rWJ
         Wsfz0j/svO9XLlff5ntQYvQ0+vZlfI4/dLGLGlQaYZYycHqKuRZu+iN6+r6vWf0g0Ati
         n/KrGyOgU0xhFXjxQJzzMbVSuy7Zb7OTxW6+1YjwnaN5zZlpkPfa2QS2cSL7GQbS7OyD
         HJDtfZo0LNYhseb2N9VwFbifF1hy8hQlJQCyExlYeJbsVe7rF0La//hE0+YG/zPGGqM6
         73sA==
X-Gm-Message-State: APjAAAWuWDkwYUEGT2ycKDv2i84mxr3mfhIy2UYoaBlGwbeLXZAk6aMf
        yQnLDyiNgtOauheLWkF0nroL8qg=
X-Google-Smtp-Source: APXvYqwIgTqZQ06BFFdoNxyeSu4HOJCnQR7MhtVP/FsvyM6u1U1VwL/yEj30GAPZGSjVtYZepZGbKQ==
X-Received: by 2002:a92:d1c9:: with SMTP id u9mr61673677ilg.115.1578098002043;
        Fri, 03 Jan 2020 16:33:22 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id r10sm15144556iot.28.2020.01.03.16.33.19
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:33:20 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219ec
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:33:18 -0700
Date:   Fri, 3 Jan 2020 17:33:18 -0700
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Add YAML schemas for the QCOM
 GPUCC clock bindings
Message-ID: <20200104003318.GA5129@bogus>
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
 <1577428714-17766-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577428714-17766-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 27 Dec 2019 12:08:29 +0530, Taniya Das wrote:
> The GPUCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.txt       | 24 --------
>  .../devicetree/bindings/clock/qcom,gpucc.yaml      | 71 ++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
