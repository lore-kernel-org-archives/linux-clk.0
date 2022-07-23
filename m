Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4ABC43334
	for <linux-clk@archiver.kernel.org>; Sat, 23 Jul 2022 15:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237617AbiGWPQi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Jul 2022 11:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237897AbiGWPQe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Jul 2022 11:16:34 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55D8B87F
        for <linux-clk@vger.kernel.org>; Sat, 23 Jul 2022 08:16:33 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id x11so5368362qts.13
        for <linux-clk@vger.kernel.org>; Sat, 23 Jul 2022 08:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1YtoaxKMgqFbgqvJGmE9UgUWogTVn2ODlS5NDKP18O4=;
        b=l70Mjul+h5Radj6oYylQbwVHGY3QUu7zaSKdRfgIGh0bM0TzCyjqOhUar6wHErd6EX
         t5Bm0eJw4hItL8gAg+3Z12HnzpdvlWWBJ+84BbqL+VxgCpMq4rLb7uA4PUPeABcOX3CN
         yiXg8uBQzgmRLG8m7/c5+XCPbIJDEBv+OkDC+peI5Gze3/5JN9ORxzhaP9/d0XInj+No
         vrjxrQuwX3nv97nExdt+/UfxJycoa69OoiQNamE7+6nTQeuunvFHMk2+D4uL4rg8NQDk
         4UxLEdNBHUsZz3K2MXZbFW3/mwWmWrs36Axtnc3iKq/0AO6xTeDxiYArdfmzwroYFE79
         MIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1YtoaxKMgqFbgqvJGmE9UgUWogTVn2ODlS5NDKP18O4=;
        b=amME+g0oIveARlv6phX2a261ET+o78w8P5A8zfkteeK96UcT8b7nQZa4GHafd5oz5k
         JY+uMDTZFOIh1+FlQ09IGeq5rI7iq1NOWQQa4ggt+FaYnRNtwGhfir4SPl+fmw7ow/Jj
         TjGnYR7CTAde+HLlLUJ7ntQNabIEwvzeboMHEAAvzYQHco8IpRJm8ceVF6EDIW2/mB/n
         usi8ejRKxtBmVzwI6ttTcUrSDW0uJZ0e6p7ItHAsU0iUwBcJCCd6eVaW2zuejFw3HXcr
         8LCxGRXLyGEtqeXMluMnRxkznq9Nnb4gZ2AEy3MPMaSz8lkXfMMAxVbxFjaDR6fSVNIj
         r8wg==
X-Gm-Message-State: AJIora9WeL8fH2dKs/lFlwoOBhzylrn6OvodjVd31uXfKAfkR9zPlZcU
        dtDzHny34BKtY6XZquVAIIq8VFfQuVHPF8aN0B2tyw==
X-Google-Smtp-Source: AGRyM1vf2WiEVwlCT9YnJ6xSz8XxbYlaFhc+nO7qQld2E/tiZpgFlxDUCYVy3R1USbP9Fxb0o+uxaD6jJVvwa2mVA/Q=
X-Received: by 2002:a05:622a:178a:b0:31e:f9ff:c685 with SMTP id
 s10-20020a05622a178a00b0031ef9ffc685mr4423061qtk.62.1658589393102; Sat, 23
 Jul 2022 08:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220723145558.25210-1-ansuelsmth@gmail.com> <20220723145558.25210-4-ansuelsmth@gmail.com>
In-Reply-To: <20220723145558.25210-4-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Jul 2022 18:16:22 +0300
Message-ID: <CAA8EJpq+Ovuz3zht+=2KKmXE3gB55JidAYEs8dsSNZiggmA5=g@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] clk: qcom: lcc-ipq806x: use ARRAY_SIZE for num_parents
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 23 Jul 2022 at 17:56, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Use ARRAY_SIZE for num_parents instead of raw number to prevent any
> confusion/mistake.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
