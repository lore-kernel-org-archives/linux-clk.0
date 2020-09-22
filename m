Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C8EC2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 22:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43199221F0
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 22:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600815427;
	bh=xgeAHAZs3lMoI0ftd/hGqPKfUcnUzsduh+AuSCi7o30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=M+LCl94SV7DfoNTJGskpMw3upZIjfb+WEKuxgvaNk997w+945prAOKQajRS8E1f2S
	 oNTy9qFeNpfsNRCF6/bplPRTHDGyqYccpAlN0A2X3PSbt+0rHK14mSPT0qKrXBfUQn
	 DoYxJD/WdtL/Q7E/BpPyjlDeoJPqycL96bJudE+o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgIVW5D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 18:57:03 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:32935 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgIVW5D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Sep 2020 18:57:03 -0400
Received: by mail-io1-f66.google.com with SMTP id r25so21607072ioj.0;
        Tue, 22 Sep 2020 15:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U82xGCK5C0dJ3J8d63akJcbnNmqScyL7u8gUHKm9eeU=;
        b=p0zSJ4umro0oWOe8Qo/SyANi4VOiYDimjN8m4pv1v+n1iLUOTLtLgRFSC3Yi6gWzyc
         ZtT4G41haCdCBpw83ZP90GKQ3suMjeXu/JuIUiyfb6fJy7huObjoe8PlA8Ml1idiBoS5
         NUTHQGsy3Gjk5svgcP7uqdNF8uKlhteiZnoGHJUwD5Jbf8RhxfU1o90llOKhaSBkSwg4
         d3U+Q+zvWqDqq6IFL/6wDE0R3oEYSBaXnGaEK35zNAFqGaiWkLx8Uax4TiZsJo1Kxxxr
         we/9JVtodzNisA3kklLYJNXI0yMES5dBupzWLpvL3cO136QAF9ozfoomP8OA0mX88VGS
         iiYQ==
X-Gm-Message-State: AOAM531uT0xr1iygJUZmeiQ8OF4AkfGfJV7emW5zIQcexkRoZnsqbi5w
        wNtTL3jHmoEYHWzY7r4Idg==
X-Google-Smtp-Source: ABdhPJwNbQBBKGkWXrzcLuwF0gkoHVWg7lsdOqxSyXRi/PJrFCnKjELGUFbL2o8F36LKr13lqoVyaA==
X-Received: by 2002:a5e:9247:: with SMTP id z7mr5139723iop.71.1600815422631;
        Tue, 22 Sep 2020 15:57:02 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p17sm1575274ilq.84.2020.09.22.15.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:57:01 -0700 (PDT)
Received: (nullmailer pid 3419036 invoked by uid 1000);
        Tue, 22 Sep 2020 22:57:01 -0000
Date:   Tue, 22 Sep 2020 16:57:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: sdm845-dispcc: same name for
 dp_phy clocks as sc7180
Message-ID: <20200922225701.GA3419002@bogus>
References: <20200911153412.21672-1-jonathan@marek.ca>
 <20200911153412.21672-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911153412.21672-2-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 11 Sep 2020 11:34:01 -0400, Jonathan Marek wrote:
> This makes it easier to combine dt bindings for sdm845/sc7180 dispcc.
> 
> Note: nothing upstream provides these clocks and the sdm845 dispcc driver
> hasn't switched to using .fw_name for these clocks (these properties are
> ignored), so changing this shouldn't be a problem.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../devicetree/bindings/clock/qcom,sdm845-dispcc.yaml     | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
