Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A05EB64DD
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 08:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjFSIuR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 04:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbjFSIty (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 04:49:54 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1175C172C
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 01:48:43 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-311183ef595so2891420f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687164522; x=1689756522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGTEAJDFiZ4dQ8L7EwttIx6gajukmPL0eVmPz17NAsQ=;
        b=j7+7i9s/PdRvCYKPgAkFd0Sei40Oxz9g3kgWojJl4eUHbUuYJz3+TcsRi+mgqqkvpK
         onO4rPWddMXSOXYpjxoYaT+V4AJP4U/GiNCxjfXiQ3OnUAG/uYoFNXdaLeJPPRHlcAY6
         t72qH8qR6xbxu5MnjJpePPptw86Rxw6D9KbIK4wIha8XQFbKqjPRAMg/iEFJDun8leNr
         2/RLhfETqUmozvIL6HYpIMtx1H1lBVNgalvm/rI4LQdPyiHV6Xbpgc5i9mSWxlfBEE2x
         LpFDKf42nWb6nr1W/ir2fUdkrhxAfObXB2F/1H7KI/Ga2Sd9jPIV/Wdqx/pLBYnyKxHg
         MdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687164522; x=1689756522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGTEAJDFiZ4dQ8L7EwttIx6gajukmPL0eVmPz17NAsQ=;
        b=kd8/jFEMWcNLmo5hrauxn3w4DhgKN4ZvduM2tHlMNv+49ZvhDarx91zGDDmolwy3t9
         hcXiZPfNAOAu+GJMpPAWa6M9XuG7HyUblg7iI1VsVckYHcaG2MnMGClbGUbxAvmq0MN3
         sajLlIHIyP4EAblJq+TP2je1mfYWzmRkUG5uj5vidXWUenLTNd+Io4E9t7h637HrQWq7
         tNsBN2FERm0SDN7rsYVRwCwWjqC1PGeVQplRoNN8ROqgioFTwNFo6sHRSxxU1m4wVVBj
         3KW0blMWKK+hcbz6nm4oaXTqgaAvJloLnkaOyJZccLJJa0nBvn1tjRu/BCxF8+BfJrsC
         ZT8g==
X-Gm-Message-State: AC+VfDyzrMgy8xuRIjQN7lqqQ1fuHArQg4IC1rm8suRF0l5y6EICj4o8
        FTHtG+P5InHzojwKg6R2LS2hR5vLAWOCW9lrgFg=
X-Google-Smtp-Source: ACHHUZ7cUpvHpXNrD9bnFgMGdhq4SzVWigiC9NX8/PCD8Z+Q6jkCriK2VH8fxKKsQYNODM9VD9CCFQ==
X-Received: by 2002:a5d:6a4b:0:b0:311:1b27:74a6 with SMTP id t11-20020a5d6a4b000000b003111b2774a6mr6370222wrw.28.1687164522248;
        Mon, 19 Jun 2023 01:48:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q3-20020adff503000000b0030fa3567541sm27705657wro.48.2023.06.19.01.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 01:48:40 -0700 (PDT)
Date:   Mon, 19 Jun 2023 11:48:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Fei Shao <fshao@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: Fix memory leak in devm_clk_notifier_register()
Message-ID: <35f6212e-69f8-432f-a5c8-99ed5c844f11@moroto.mountain>
References: <20230619112253.v2.1.I13f060c10549ef181603e921291bdea95f83033c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619112253.v2.1.I13f060c10549ef181603e921291bdea95f83033c@changeid>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 19, 2023 at 11:22:53AM +0800, Fei Shao wrote:
> devm_clk_notifier_register() allocates a devres resource for clk
> notifier but didn't register that to the device, so the notifier didn't
> get unregistered on device detach and the allocated resource was leaked.
> 
> Fix the issue by registering the resource through devres_add().
> 
> Fixes: 6d30d50d037d ("clk: add devm variant of clk_notifier_register")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

How did you find this bug?

I can think of some ways to find this bug with static analysis.

KTODO: static analysis:  look at unused parameters

Both GCC and Clang have a warning for unused parameters.  I think the
last time I looked at GCC it had a lot of false positives for functions
which were called as pointers but hopefully that has been fixed now?
Smatch does not have a check for this.  If someone were to write it,
I would probably the check under the --pedantic flag so it would be
turned off by default.

regards,
dan carpenter

