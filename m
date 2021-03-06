Return-Path: <SRS0=v13c=IE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E5FC433DB
	for <linux-clk@archiver.kernel.org>; Sat,  6 Mar 2021 21:19:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCD26650CF
	for <linux-clk@archiver.kernel.org>; Sat,  6 Mar 2021 21:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhCFVTJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 6 Mar 2021 16:19:09 -0500
Received: from mail-pf1-f174.google.com ([209.85.210.174]:36936 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhCFVSk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 6 Mar 2021 16:18:40 -0500
Received: by mail-pf1-f174.google.com with SMTP id a188so4655811pfb.4;
        Sat, 06 Mar 2021 13:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bRMSNS0G8aL8UCuQkyktn5/7S2pt44DDzL/uQZBNB3M=;
        b=b8qWO8IeSbfW0q8IsBKnslK3jjYeTbLjD1z5K688FvgkbWSwYItErOSBAesXljbGiY
         UJDjPzmKntATbxsRityd6ITmY281giXqfDV7crxbAkFK1BpGhjTGxifx1awo53r+WCc+
         xLDFdEBR9JsLL5hm+j30IMlw3vZw+g5P58RltxIIWXlrJi4w7Q0vRivZWCZXlpAAFBWS
         hkCh7HzDFvIfylx7TZd0FKzRMepjHhkO+aPPoLELERvfAjqwF2c5hZbxN+ubq9nUefXq
         d4e4+vQ3G+awDMHZGuwSD2lHCq38g991T8gieWdquiqfd37YFSCQLnka3mI6vqv6idvJ
         sFQQ==
X-Gm-Message-State: AOAM533dE1WN9ZPE1dhAJHIcz+ucRsetZxzjoEt+v+RPoRJs9Glc0pE9
        9NtXsRpbVMljdj5rYNjmiw==
X-Google-Smtp-Source: ABdhPJzOiYe87bFlIa275pXseRPXE3osJxYu0jzCFw7MCcqeq84q768evU78CEiUstW31UpFajb9cw==
X-Received: by 2002:aa7:86d9:0:b029:1ef:4f40:4bba with SMTP id h25-20020aa786d90000b02901ef4f404bbamr11662745pfo.54.1615065520312;
        Sat, 06 Mar 2021 13:18:40 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id q3sm6353008pfn.14.2021.03.06.13.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 13:18:39 -0800 (PST)
Received: (nullmailer pid 1229081 invoked by uid 1000);
        Sat, 06 Mar 2021 21:18:33 -0000
Date:   Sat, 6 Mar 2021 14:18:33 -0700
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        angelogioacchino.delregno@somainline.org,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,gcc: Document MSM8976
 compatibles
Message-ID: <20210306211833.GA1229035@robh.at.kernel.org>
References: <20210225201845.109670-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225201845.109670-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 25 Feb 2021 21:18:42 +0100, Konrad Dybcio wrote:
> Document the newly added compatibles for 8976 GCC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
