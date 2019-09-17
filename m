Return-Path: <SRS0=xl4E=XM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A16C4CECD
	for <linux-clk@archiver.kernel.org>; Tue, 17 Sep 2019 16:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C87842067B
	for <linux-clk@archiver.kernel.org>; Tue, 17 Sep 2019 16:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YA0FtVOq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730574AbfIQQgi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Sep 2019 12:36:38 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44096 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbfIQQgi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Sep 2019 12:36:38 -0400
Received: by mail-pf1-f195.google.com with SMTP id q21so2461737pfn.11
        for <linux-clk@vger.kernel.org>; Tue, 17 Sep 2019 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6oL27CCsiCgWC+s9QdRYX453QCLZxLS2++aHbtnJhwo=;
        b=YA0FtVOqhPZ+x3BfaIoVZIEZexqC9TyNKApW9YBx6UryG5ITeV5G/PcVyovxlcN+mC
         os44E6Ij+VtAx8kdLvm5CDW3dSDIYirj+oo2lcs2vH01UDW4bGLLNb9WTGyjObDvjKoj
         fBuR+TQerwfgIFxcGZl8M9n99ztxdoJWyHTr3aKJskQWgCTjdqc3CzWAMMCPIWWV27uk
         r6QlYUhCtyjRpnvTXR0DG8uzBazHmw40E5sw5yAMAHs41eotxnNZMhM36rvMkaTMxCjz
         4Q5hfisagPglftlQNRwob/iecOFYUAkervhL5SGw2H57K6310ejYzOFpMM61c3xeiltY
         gc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6oL27CCsiCgWC+s9QdRYX453QCLZxLS2++aHbtnJhwo=;
        b=AsvjC/Ys+4UtP6CNAoyXfzT1jFFh5+u+UysQIA9m8TVZs8HB1MmJx2aazaTQjRnaa7
         aWgdFpKHCHt5SVQWlxeKvbmglSpJrMpWm2wxS9KvpK0YQaNMWlFVsOZWaOI8Vt2C7qD+
         VavOTCM1Cj7sAQu8Gla51P/AB7JD4iHtNFIYbJzsEAalaih/B8hYwXMiQf0FaNaDQ618
         4iid3NQ4neR39yyIgPWbbqp5MWNNWbMgnmpUumbMqiLlJj3K9oul1BlKT2URsyNFkMJp
         QLdoF0/cZe8ezAsl+0S/lNsMst3ibYGpG6ERwXifq69MWCzlrq2QOrJl/xjIpUHL4i/f
         CWhA==
X-Gm-Message-State: APjAAAVVUEqHHhRDUJ3EyUGUg7s6XQls/QbEaIxUnilhCyc6Eeif/9ka
        HflWr7NqXNVxqDZHWncfCtlEi1uf+Q==
X-Google-Smtp-Source: APXvYqylABHbwwGnTpG+yB/f0dYMRAjI9T2OAHarx7EJA+9sLbutDPD4P64xC24J0U/cyFBf2nmCMw==
X-Received: by 2002:a17:90a:fa0c:: with SMTP id cm12mr5692720pjb.137.1568738197253;
        Tue, 17 Sep 2019 09:36:37 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:111:7ed:2c13:36f7:e70f:4a47])
        by smtp.gmail.com with ESMTPSA id w6sm8080461pfw.84.2019.09.17.09.36.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 09:36:36 -0700 (PDT)
Date:   Tue, 17 Sep 2019 22:06:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     afaerber@suse.de, robh+dt@kernel.org, ulf.hansson@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/7] clk: actions: Fix factor clk struct member access
Message-ID: <20190917163628.GA2615@Mani-XPS-13-9360>
References: <20190916154546.24982-1-manivannan.sadhasivam@linaro.org>
 <20190916154546.24982-2-manivannan.sadhasivam@linaro.org>
 <20190917163419.4C4DD20665@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917163419.4C4DD20665@mail.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 17, 2019 at 09:34:18AM -0700, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2019-09-16 08:45:40)
> > Since the helper "owl_factor_helper_round_rate" is shared between factor
> > and composite clocks, using the factor clk specific helper function
> > like "hw_to_owl_factor" to access its members will create issues when
> > called from composite clk specific code. Hence, pass the "factor_hw"
> > struct pointer directly instead of fetching it using factor clk specific
> > helpers.
> > 
> > This issue has been observed when a composite clock like "sd0_clk" tried
> > to call "owl_factor_helper_round_rate" resulting in pointer dereferencing
> > error.
> > 
> > While we are at it, let's rename the "clk_val_best" function to
> > "owl_clk_val_best" since this is an owl SoCs specific helper.
> > 
> > Fixes: 4bb78fc9744a ("clk: actions: Add factor clock support")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> 
> I can apply this to clk-next?

Yes, please :-) Rest can go through Ulf's tree.

Thanks,
Mani

> 
