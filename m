Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A741C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 17 May 2022 16:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351173AbiEQQq4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 May 2022 12:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbiEQQqy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 12:46:54 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909E04EA1D
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 09:46:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w14so1876923lfl.13
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 09:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=vA9MGHALbB+9Q0y2UR7t42fhnR0UrTgvfqZrIveu9Cc=;
        b=EzHX8ExAL8o58vKiK6bTJ43XQZFYb6q0hkTBQTBcf7ktUCuIbVOz0oA9oYHfbrssCf
         8UG5ExsXHxRAIn7KPjfdsn5+oOflZfxxnjMC4hs25Tf07x5CkCMlStLq8mo5KkFHsMuz
         68nPVJN5oejQ90/naxoCgjKWODstSdzvy7tOgo1nlECkLCXMaiY1B1JCKufRsFyhWIMo
         6Dvi2MPLe8wdkTGiZfSdJcSGdN+R32OnkNxwYU59fMuALFo6teNrQpzXka8LLARqJ/Ik
         XbjD2OqFLQaj45CYavxHRXnzbbQUu4jP/wW9CvyqGtazsXts0S2VMn1uTTP7nkepvmQV
         tgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vA9MGHALbB+9Q0y2UR7t42fhnR0UrTgvfqZrIveu9Cc=;
        b=cJHMvRrlIFmAR4oYHlPQtuVv31nnLBdeAOH/Mk44oqAX6p4q3VOLpiHbTn2ZdBriGH
         jLV0Jpwma432akyDZWetnjye+vpm3JgpULrScSKKeAPcSlyycvqOYminaGNWdfqVmfUD
         poUyAQ4Ukzhs++lQ2xbsWDNqc7xrNq/oLDnP5D1emhi/iE+9nN/KYc9DfYXwSNytOxLR
         WHRu9GMO4nFYjn0Yyn/EYHp9a0+VTstD9QXucoSdFVJvNvcTfVq2XhrZZsMqG0QfElBr
         CnHQ8tGI5nV6l7UivIQRi9bpp/nbLWNC7I7EOfXHEgjms0umxZqy/u9y7lnMQ/UXIyRC
         B6nQ==
X-Gm-Message-State: AOAM532ji6+og9eA5oyXVnfEWKGgeP4gTSjUF9NOwP3tJSJJPwD8fGyu
        9+Qc8OEp4c3aWBVzpAiLKmNkWw==
X-Google-Smtp-Source: ABdhPJwVr5ZpgKS7rdjqmUnTL/3jYg8wNCfJlf1QbuGXld3L872UyhJjEwyTp9pewtHINjQcj0GP1g==
X-Received: by 2002:ac2:5b1e:0:b0:472:2c9f:5891 with SMTP id v30-20020ac25b1e000000b004722c9f5891mr17227499lfn.534.1652806010956;
        Tue, 17 May 2022 09:46:50 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h14-20020ac25d6e000000b00477a8c6b08dsm7331lft.100.2022.05.17.09.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 09:46:50 -0700 (PDT)
Message-ID: <2f73874b-430a-48d2-4739-b06eebed1ea8@linaro.org>
Date:   Tue, 17 May 2022 18:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/8] clk: qcom: alpha-pll: correct kerneldoc
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/05/2022 12:35, Krzysztof Kozlowski wrote:
> Correct kerneldoc warning:
> 
>   drivers/clk/qcom/clk-alpha-pll.c:1450:
>     warning: expecting prototype for clk_lucid_pll_configure(). Prototype was for clk_trion_pll_configure() instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Any comments on entire set?

They are on the lists for more than two weeks and it's getting late to
apply it before merge window.


Best regards,
Krzysztof
