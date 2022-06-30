Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14113C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 17:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236202AbiF3RM3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 13:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235269AbiF3RMW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 13:12:22 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403A333880
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 10:12:21 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id r82so117435oig.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y6DkU6unvFq/epfz0T61FMvsr3c8FnoPOdbOM2kIYTM=;
        b=DJd5lnw20Em6KF++SAOBDORtfraTfBV4IERCyfIRJYJP1xrQx/lueDRvDMTe7RkrLD
         cfbeaFCWF7wFbN6QqVi9Xd7JWKeAlbvOiKMasiHfH9IZjSYgRfIxkUR/jG4U8xAJcJgR
         jpjltNE5Pi1gQt7Q+ls53U6ohlbXFxGVLL5VM7lF4XjY6OZhxeFL/yvjlivTlbLwmF0v
         i/3Vl/laIl26jQWi7eD/CnO+YsjVvhJoxMn0hjqo3VwaDzJgqb08ai9YM7q0RjLc62Gj
         3VwarAOReV2NoQgYVxCilzZp5GV8iRdkVihrDUAEJqmEEoBEeZtxTXvag2clKroC/eX3
         BRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y6DkU6unvFq/epfz0T61FMvsr3c8FnoPOdbOM2kIYTM=;
        b=F/H9k7LAiNdhKetYps/HbVG3/VN1fM2qF1pHdktrHKhq2bomT83w9DJ90+qRnT60hG
         CCU7ROig8rs3X3qnEsV9196jaIzlXdik/DCfab5VvEr413LQYnkebel9ts5Q6CZIihci
         The9uxOsPz4kIbPwYB72ZOWD6pXm1zU9yt7qWgO8dbpfrO3KVxYLn1ZMLiNsPN+OpANl
         HE+UNuIMQMrCwEzjUrOHm+diXeWmuRj9+zci8wvXESFKbBSeX2nwiivG62z4HjsyilWP
         33ddQZnyjU0GkltL6MRGmiyJ0kmy2d4J7S5qidmV6J8MZLg2Oh6k8EtZi3n7LoboHM8k
         2HYQ==
X-Gm-Message-State: AJIora/Tsooxexzf6bV4I9/xvJF6jXK0d2PcoGX5TpNcHwSv4C2rhmzE
        tWSNk+pJ2ETwwDlF4anYLbLEf/97tXKpuA==
X-Google-Smtp-Source: AGRyM1vYV/1SLXnnhRjMlNdBGcQm2Z5iYiXBH0NyUJBWczzuTWGpf7kSSRTOVOSf9682pD+uViAOtw==
X-Received: by 2002:a05:6808:1486:b0:335:b75d:6c1c with SMTP id e6-20020a056808148600b00335b75d6c1cmr5100164oiw.263.1656609140545;
        Thu, 30 Jun 2022 10:12:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 65-20020a4a1a44000000b0035eb4e5a6bbsm11341066oof.17.2022.06.30.10.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:12:19 -0700 (PDT)
Date:   Thu, 30 Jun 2022 12:12:17 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 7/7] clk: qcom: add camera clock controller driver for
 SM8450 SoC
Message-ID: <Yr3ZcclsaBJP55Bs@builder.lan>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081831.2554107-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081831.2554107-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 30 Jun 03:18 CDT 2022, Vladimir Zapolskiy wrote:

> Add  camera clock controller driver found on QCOM SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
