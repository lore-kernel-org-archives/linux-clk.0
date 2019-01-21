Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F805C2F420
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:52:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C71EA20879
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548082328;
	bh=xWqOzVfNvgUEROGaOAbgi6Q+7SK/7R0Ywd4HQptKLzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ESuxSdw13l3I58LAHhL8TgL4PFN2oZLbqERcPQpjCGxrE832MLrYR9A9Q+mlDA89j
	 +XgGJ2K7KdkYJ43iIgM5bqBlkWCU4Eyy28KZd65g9YaOfq8B+lxE0xl0iFyBp9e1Uv
	 mEcDKRd0fWJ7aD+OOizwKAPFn7uFI3n5sOrZ8Hvg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbfAUOwI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:52:08 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36540 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729072AbfAUOwI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 09:52:08 -0500
Received: by mail-ot1-f66.google.com with SMTP id k98so20750170otk.3;
        Mon, 21 Jan 2019 06:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wGqU7pex3ozwD/XOC2UIbFsM91sSPLz7jsRdRqJDeA0=;
        b=R6B6aIk+jMdrb9bPljvbj6A0ksKQ2+6jbJ7Z/qYUFXrLy3hQqOTy454Ni/n8yRhtuE
         dhqSHvb/cYnQqaV80pLKhtUHdo9g5SjEEoUAsuBiOsBbdwdYBYrjZ5rWHY0f8z5cWibA
         /uyZ2Ul1wRwIAH1lRNqnxcOWB9X+G7oADjh7MhGVYz7xrFK6EB7ZO0uLjpcwvup+NSqu
         n5bYdI4+idZn1dO9NHJUFiy/7Od8p8moCfPbeIK41GV53l55FYaumLII3uiACWu2ZWzm
         nvetryOPOs9lRfmpyy7jTgJE4sngGJtkPABLZnXJj8bH5wQ0jJLiHwUlY1iVzNGZsUNL
         z11A==
X-Gm-Message-State: AJcUuke5E6SkPZB7b1yqx73fqCayBvXRGFtYeWeyWUkThMNHPf8/JMwH
        azv1A9H+8xj70Ra3TtphYA==
X-Google-Smtp-Source: ALg8bN7LiSwinCCFEZMXzfELszsZ4KHeZ7AK6aMBa7tt66oYo5M/sXGctqzY0UMPK144iQCn+4BZmw==
X-Received: by 2002:a9d:3a5:: with SMTP id f34mr20138393otf.208.1548082327282;
        Mon, 21 Jan 2019 06:52:07 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b14sm5399249oti.6.2019.01.21.06.52.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 06:52:06 -0800 (PST)
Date:   Mon, 21 Jan 2019 08:52:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc:     k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
Message-ID: <20190121145206.GA7197@bogus>
References: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
 <CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
 <20190118131639.17578-5-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190118131639.17578-5-k.konieczny@partner.samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 18 Jan 2019 14:16:38 +0100, Kamil Konieczny wrote:
> Add DT bindings to describe imem clocks for SSS (Security SubSystem) and
> SlimSSS in Exynos5433.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  include/dt-bindings/clock/exynos5433.h | 55 ++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
