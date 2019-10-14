Return-Path: <SRS0=L9C4=YH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BA6C4CECE
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 14:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08D97222BD
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 14:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qq0dACQa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732864AbfJNOq3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Oct 2019 10:46:29 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37710 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732708AbfJNOq3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Oct 2019 10:46:29 -0400
Received: by mail-pl1-f193.google.com with SMTP id u20so8129289plq.4
        for <linux-clk@vger.kernel.org>; Mon, 14 Oct 2019 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Wwkp/o/TiWYKqra6/GbJ8zgmOghxSCR6LMZILbN3AA=;
        b=Qq0dACQaYNnCu7w+uH1q+EXCWhrXZyYx63Ucp9eQ3kdJr7sZiRBBHuY2+z3Z5QsgZg
         5+mv9yf4faaNnydUHWvdHrKOzLzgTLkF84l8AJOsgPuw2vlXPxhNy7EEEXpu9T2aBQD4
         VPgSMXX1H96agXRdv7DYYmYgaIaWqfeRRKo30bJvZ/95X7ncj3YzjrPZ3wAgATaIlDKP
         1w7mfR2l5lSq+jNmMZ4GWj/0k7OFml0qq4+orA/4i0/IMLqJRo83iMebCeg2g9JihrdC
         AW5vSRtIcD2aACwhC+D03rlxE33OBEfHaBfhSsKWhx9PVskRgov+Z+r6UfbHGu0TUOBf
         0Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Wwkp/o/TiWYKqra6/GbJ8zgmOghxSCR6LMZILbN3AA=;
        b=IgEwgeS3HgRr2ZRw5Nv7Ebub+EIVh69rD06QgTTe50/avMKH5YW5RJG3m2EH/C9JU6
         aIWB6GvIUev22CayG685FQ5Js7BqQyqZPVb5HBNhMOKPRqU+7jOl7WuX+rexys/3nR4l
         stRkd4Y4h1q0NpX0qEKb+mLu8Q2YkCY7No6rC3R+VSxIE8/zIfB0AzzZNP4E8aZYjfz0
         JuvCdAPmXBRNt+/tu2/AJ6AxejcRteBwLhhBi1qBVZQcehQpM5GnJ3cASYTNccaLLqXf
         wuTPUuzG9oUMlJYMvxHL8Pi7EKTeDtXSegRbqEedRFWyuW7XxIrGbeL2ZzqCWnYhnBNC
         p4wg==
X-Gm-Message-State: APjAAAV+K3V9W77cQsP7O1UtZBVJcO9PL02v7xuKlMtQLSITSmOFwEyq
        o8Cb7GRMy4HBbKQ8VKtSMGVd
X-Google-Smtp-Source: APXvYqwhz1BoUwO6T+uzR5BRZcg5sa7AjCGGCeVyBJ/eYxnWT37A9NIdF8NVa4rvrqjOx7h6M/y/AA==
X-Received: by 2002:a17:902:bcc8:: with SMTP id o8mr30767347pls.256.1571064387153;
        Mon, 14 Oct 2019 07:46:27 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id p190sm22003538pfb.160.2019.10.14.07.46.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:46:26 -0700 (PDT)
Date:   Mon, 14 Oct 2019 20:16:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 7/7] arm64: configs: Enable Actions Semi platform in
 defconfig
Message-ID: <20191014144620.GC8583@mani>
References: <20190916154546.24982-1-manivannan.sadhasivam@linaro.org>
 <20190916154546.24982-8-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916154546.24982-8-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Sep 16, 2019 at 09:15:46PM +0530, Manivannan Sadhasivam wrote:
> Since the Actions Semi platform can now boot a distro, enable it in
> ARM64 defconfig.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied for v5.5.

Thanks,
Mani

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 0e58ef02880c..8e27777d6687 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -29,6 +29,7 @@ CONFIG_BLK_DEV_INITRD=y
>  CONFIG_KALLSYMS_ALL=y
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_PROFILING=y
> +CONFIG_ARCH_ACTIONS=y
>  CONFIG_ARCH_AGILEX=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_ALPINE=y
> -- 
> 2.17.1
> 
