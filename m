Return-Path: <SRS0=JWDe=X6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2E8C32792
	for <linux-clk@archiver.kernel.org>; Sat,  5 Oct 2019 04:27:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29F1120862
	for <linux-clk@archiver.kernel.org>; Sat,  5 Oct 2019 04:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVuYV+9J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfJEE1a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Oct 2019 00:27:30 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41985 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfJEE1a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Oct 2019 00:27:30 -0400
Received: by mail-pl1-f196.google.com with SMTP id e5so4064223pls.9
        for <linux-clk@vger.kernel.org>; Fri, 04 Oct 2019 21:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lg58HAHY4pPo3EF07hH6j9uSPPM6NKr+O9ZhOhiR1Sc=;
        b=SVuYV+9Jx7yaGbD3ZALLujnHJtVENFBC5r9F3okLQBJtsEydssKGEFw1h5T0j5zTxX
         OtIuW0uShIie6dDJ34udvfZnQsabT1iZKdn/XlqI0njTl1CojbnQKQXJ8gV/iTjzyOLe
         Clp7f/aGCX4x4lBogG6sU3cIsijT9Xb8y5Os5l0obpLDlunsuhFiQhzkga46mFQP2E7C
         JFL6O/o8q2bsau/ptWg5X6QdQtlV9RpeGkDWzqIP735lOFM/JAsrfcudAqDBRUMcf9uS
         Ct0KOj8m/4HWTNR+yRgqkGA3Ny541MdQItXdjOvfBlY5u+aZC5LnkXgf8VSRyHsOlG21
         /FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lg58HAHY4pPo3EF07hH6j9uSPPM6NKr+O9ZhOhiR1Sc=;
        b=PthBfxnhfdjND/fGGa55rtC4CwXzUVoYHSTTbmJJIcYF+2Ie0oZTCoEWcWkCHhugxK
         xjoCbSSZlLPferYfrkCGRC/qnoaXFQ4xPhl6cP3zNwl1TEEbFzZgDpkZPXOLketxKsxC
         RlzfVluic8sUy3a0N8Lr5LtdDhc3QLl9C3Fa1JjWbVzer37PwHeJ8A9cb6mrejWBYLdL
         hoQLE6u624HEkuN5YgaGrOeKixP4tV/c9eVcc4rVU0Do8yvgSZ0VUwrJ1J7++5FdWpS5
         51cdiZ00rRHtZ7/Qk/v+GjND9ruL19l1rHjXkiEaI3FyMdzLa7Pt3gruBBOFgS1xHO2B
         nS2g==
X-Gm-Message-State: APjAAAU53rfK98net/yPOuHWJHouWZni/P1h7Y4Zeb1KWdD3sH1qBn/c
        /MmkxABQYtBc2dBdCoEokva0Hg==
X-Google-Smtp-Source: APXvYqwMl1iPfwc8TZczlbHrZtDKgg6pILpq54WPvhm9S+t+4oc3TPuvql6AEedE7WbaVO5OJabs8w==
X-Received: by 2002:a17:902:8d8e:: with SMTP id v14mr18641562plo.287.1570249649824;
        Fri, 04 Oct 2019 21:27:29 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l72sm7992929pjb.7.2019.10.04.21.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:27:29 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:27:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: power: Add missing rpmpd smd
 performance level
Message-ID: <20191005042726.GC6390@tuxbook-pro>
References: <20190921101207.65042-1-kholk11@gmail.com>
 <20190921101207.65042-5-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190921101207.65042-5-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 21 Sep 03:12 PDT 2019, kholk11@gmail.com wrote:

> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> 
> The RPM_SMD_LEVEL_TURBO_HIGH is used by MSM8956/8976 and APQ variants:
> add the definition.
> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>

Applied

Thanks,
Bjorn

> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 93e36d011527..30a0aee0df57 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -68,6 +68,7 @@
>  #define RPM_SMD_LEVEL_NOM_PLUS        320
>  #define RPM_SMD_LEVEL_TURBO           384
>  #define RPM_SMD_LEVEL_TURBO_NO_CPR    416
> +#define RPM_SMD_LEVEL_TURBO_HIGH      448
>  #define RPM_SMD_LEVEL_BINNING         512
>  
>  #endif
> -- 
> 2.21.0
> 
