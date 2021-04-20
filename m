Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A56C433B4
	for <linux-clk@archiver.kernel.org>; Tue, 20 Apr 2021 16:25:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 805B2613D0
	for <linux-clk@archiver.kernel.org>; Tue, 20 Apr 2021 16:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhDTQ0L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:26:11 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:33590 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbhDTQ0K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Apr 2021 12:26:10 -0400
Received: by mail-oi1-f179.google.com with SMTP id u80so5931427oia.0;
        Tue, 20 Apr 2021 09:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EeQe7vEnG67KPQg0lR868BaS1pRsahDJ52u7yGoOIf0=;
        b=qVYxxDM9ateQaPsauwG7N0YOCBtzOKfVOD99hius6idegfl67hfhZeFkb1FHIFAEQJ
         ywUyJEGTBxZj4+P3EYiINqX/Ngp6rJEMFwgNfBXh5Zi+FL5HuHv1+UW3gzQTpyhET/xT
         mc6RGPMVGuL2xBkUbk5h8F6v7mVuXunbY6WeraaX+t19kh73zJ62MoThILde1BevoBD5
         9IBIbeAkyrrWC7sEwhTO/20vvIyr3lbkqFfybNXKGydyrUo03qrnr+NW0SNMp2ydd1MM
         b0MpECcU6TVjTce7bC/Kf+iUQiLariVnxjq633vFnEqIIm0rAyvJDoISIkSLnyo6NEMS
         V3jw==
X-Gm-Message-State: AOAM533EmbIqhWQ0u8GgJ18Lu/T5kpZD0834UtzLKvg6xqjb6w9T1Fm2
        diHNLXKyI8R4LldWBpBrlw==
X-Google-Smtp-Source: ABdhPJzgfvYhhWypZWv9BkoR9/L6J6emx80gLwedJVtCyNP8ChA2qYniQsFYhvhuNKb6Hk8HsxUiDg==
X-Received: by 2002:aca:ed12:: with SMTP id l18mr3777648oih.24.1618935939098;
        Tue, 20 Apr 2021 09:25:39 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m5sm480849ots.13.2021.04.20.09.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:25:38 -0700 (PDT)
Received: (nullmailer pid 3432350 invoked by uid 1000);
        Tue, 20 Apr 2021 16:25:37 -0000
Date:   Tue, 20 Apr 2021 11:25:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     gabriel.fernandez@foss.st.com
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, marex@denx.de,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        devicetree@vger.kernel.org,
        Etienne Carriere <etienne.carriere@st.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/11] dt-bindings: clock: stm32mp1 new compatible for
 secure rcc
Message-ID: <20210420162537.GA3432298@robh.at.kernel.org>
References: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
 <20210419093852.14978-11-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419093852.14978-11-gabriel.fernandez@foss.st.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 19 Apr 2021 11:38:51 +0200, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Introduce new compatible string "st,stm32mp1-rcc-secure" for
> stm32mp1 clock driver when the device is configured with RCC
> security support hardened.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml          | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
