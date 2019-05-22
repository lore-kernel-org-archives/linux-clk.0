Return-Path: <SRS0=a4ME=TW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE82C072B5
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 02:08:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10616217D7
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 02:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONJRToR0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbfEVCIh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 May 2019 22:08:37 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45202 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbfEVCIh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 22:08:37 -0400
Received: by mail-oi1-f195.google.com with SMTP id w144so386202oie.12
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 19:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j9oGlqVZ7a7UoMA0CZ2Nroq/tcaCiGqxcLR++VFFSBA=;
        b=ONJRToR0Ufufr8MLkh4tEc7UKOyBGQXKr5+9qFh5lLqj1C7LoV/NLE/y9SNENZHxgm
         zbSIfKqhJ+Q3mRZo+ST9ZdoIL2S2H8VvKGC8DKpXMJh6gIiEMpdPPFN2dS2ysL3rajq3
         WsKuhvy9PmcISqXiM+zx5O5IivZnYcbe9ShGqzDfqyqIbe7pKwjGnZRtxBynjS0CylsG
         jSQ7+UDbiEDkqigZDr+LkN0ZsQLi2jqb3LW4GC8zW0v0ORwInRF+s5YZ6G/PXkYxsDp3
         gtE88kJJvDUouBCEhsKv+JsWcopAKwkJ6k+mMwzTO1llAM1cYqcKHHenjvlaLoZtEkCd
         b7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j9oGlqVZ7a7UoMA0CZ2Nroq/tcaCiGqxcLR++VFFSBA=;
        b=Ln2R+1lq6jfUsOD9z8TDtcER/I2KdEK1XGkYxqd1OBDoosq9rLz5I6QIoIXo7y6rrk
         lwh9cTwxTWau/Z2xWj7UrRoUp4H9Zto4fUmrUZHkXT4z2/5Wv7ldZ/erHNP1pPK8k1AX
         DAl9x2lbmWewFOrOY7+qdrqNJNlIamvzRPsgOt9R/7rpZjd3pU4vkjfowzflikHmJhW/
         iteUoRBfk6TK9L/CQBpLd90ypmf3EYTd1sEKYUKU+sTsgI0yxLItyS0K8+RJ5eBwTR+G
         uVH8W6gXf3dJPX80Msx8PqqW8sljPb4clu8GWJ78I7euHy7RBX5GaVwKLgHdp/We7Sm/
         p5Pw==
X-Gm-Message-State: APjAAAUIG2Psq4pbcIHoLJd6Ku87+Yu36pgmWUkD6Ar3w28NVo/7clBB
        mXB2wbE5yiTgiFbwJ14PX180EaNIF+iH470j5jvEIA==
X-Google-Smtp-Source: APXvYqwevZjKWRQpJEtZtfRxHARVBhn6u48gct7wqXcFYUQvsCQFi2eDnxwLrcQ4Z7dE2SPqMFu4WsuDt0XJ41JUQwM=
X-Received: by 2002:aca:d8c5:: with SMTP id p188mr5568115oig.6.1558490916817;
 Tue, 21 May 2019 19:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190522011504.19342-1-zhang.chunyan@linaro.org> <20190522011504.19342-3-zhang.chunyan@linaro.org>
In-Reply-To: <20190522011504.19342-3-zhang.chunyan@linaro.org>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Wed, 22 May 2019 10:08:25 +0800
Message-ID: <CAMz4kuJOoQVp4xPi+Y4fVqCThVUypv+NEOi+kdvWGoz0c30fEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: sprd: Check error only for devm_regmap_init_mmio()
To:     Chunyan Zhang <zhang.chunyan@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 May 2019 at 09:15, Chunyan Zhang <zhang.chunyan@linaro.org> wrote:
>
> The function devm_regmap_init_mmio() wouldn't return NULL pointer for
> now, so only need to ensure the return value is not an error code.
>
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>

Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  drivers/clk/sprd/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> index 9ce690999eaa..a5bdca1de5d0 100644
> --- a/drivers/clk/sprd/common.c
> +++ b/drivers/clk/sprd/common.c
> @@ -58,7 +58,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>
>                 regmap = devm_regmap_init_mmio(&pdev->dev, base,
>                                                &sprdclk_regmap_config);
> -               if (IS_ERR_OR_NULL(regmap)) {
> +               if (IS_ERR(regmap)) {
>                         pr_err("failed to init regmap\n");
>                         return PTR_ERR(regmap);
>                 }
> --
> 2.17.1
>


-- 
Baolin Wang
Best Regards
