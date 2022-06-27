Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A01CCA47E
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 20:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241027AbiF0UEc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 16:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241032AbiF0UEF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 16:04:05 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96121CFC1
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:04:01 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id y10-20020a9d634a000000b006167f7ce0c5so8204553otk.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uvASVoyRie75/d1IF4UsXjOW/g7ubfd1N2Ai2wysIBE=;
        b=EbZil76lM8Fm2VjbtaHTxvOA00cxzifKm1oZjLzIFEv2akxaz9esTJjR42hcS51f7+
         zPkAhUGWhAk25O0p4dVVFZWr6lL4TazbF1LrOhE4arBZ6hLuWfpEI8FW1oTfSzlfvfvT
         k4RdfRi0h72QCLWe9ZuoX5I+FuWTJxvSjg4BpDD1TXBqyUhdzwgpr+P+tNL77vBu8mmS
         +wtIXSuB+pZfLXsKLocee2bjbfmgYvIYa/Y0TMG8+k7Sfsx18E6frUPZM/YCnqgqIVBp
         taHMsJINYuj5ubCehNEiUGwABho6D8fxjhY7baeQeWhbyKE9zGP7Oeu8c5lCAqYJnfJ9
         mH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uvASVoyRie75/d1IF4UsXjOW/g7ubfd1N2Ai2wysIBE=;
        b=jcVr8X7abZn5wfXcxmxtZmZ5TH/FfphAXrAxKqBP0GVjHUsHocHguclEzKoua7q4tP
         PeUS6F6HteuUQwuTDBAbxILoKeBpwLmaw+QJL0476A16atxFJe3y0sJR6pb1He8fTs2O
         fqZbIHEkUHUjjEX+V+yYNuwEIllsOCQuCOOr1IJLLHvn4/X0qmV8VpkVuSI9EXDueChH
         UNGGHFu+k2LPY02d7x1w7Ig6NyzQ2qSBy4OZZBZnbO/6ZtiAVAguryJ6CuEckUv1jlGp
         9WaG9DDLpZ/ZyIV4wResvhJ68ZNJxmRVx8rpToLiTSAz8OdVWwFtbhdhQ0dZVk+wSJyr
         sonQ==
X-Gm-Message-State: AJIora/V2YAP44D/weUdKrfmmTXrfDjsN4p6++ut0KreQvT96MLMPyhH
        ldwBRcA7NcttKf45mwIjcak8iA==
X-Google-Smtp-Source: AGRyM1vNfa4uNlhLhaBfPbvHsqv9w7cLT6aLSw5MOWMbc2TO++Fi76SspE6gydwCB06yeKIjPHpGeQ==
X-Received: by 2002:a05:6830:2aa3:b0:616:c90e:ef46 with SMTP id s35-20020a0568302aa300b00616c90eef46mr3964323otu.287.1656360241139;
        Mon, 27 Jun 2022 13:04:01 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:04:00 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Robert Foss <robert.foss@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: (subset) [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
Date:   Mon, 27 Jun 2022 15:03:11 -0500
Message-Id: <165636016349.3080661.9546157097583799715.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
References: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 18 May 2022 13:35:54 +0300, Vladimir Zapolskiy wrote:
> Access to I/O of SM8250 camera clock controller IP depends on enabled
> GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the latter
> one is inited on subsys level, so, to satisfy the dependency, it would
> make sense to deprive the init level of camcc-sm8250 driver.
> 
> If both drivers are compiled as built-in, there is a change that a board
> won't boot up due to a race, which happens on the same init level.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
      commit: c4f40351901a10cd662ac2c081396d8fb04f584d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
