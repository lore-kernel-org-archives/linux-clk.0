Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF2AC5CFFE
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 22:32:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03FD22082F
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 22:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544481152;
	bh=1Mw6txsgWf+iz0h+TZHgSWzPd1umHhGsjp5+r1eRTaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=m/1lSSagiLbgw98uYwcXWffWMQic0fsGoxS5wBIHPAFhDTkTWy80Bb5Qi20hkm/WW
	 LNE970LoAeiiZm8opcT8VjeC4TjtRKNwa+ixbgVCVeWesp6utH/X8uQcjJq8dqKRGE
	 yz9yLjVZPUSLBZk1hdewgDiZTrfB70mIFcACl0K0=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03FD22082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbeLJWcb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 17:32:31 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40770 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbeLJWcb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 17:32:31 -0500
Received: by mail-ot1-f67.google.com with SMTP id s5so12079394oth.7;
        Mon, 10 Dec 2018 14:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/yT4TfvBRoHPFKLMKr5oX9ITaA83M6IceDCe0vhMQsg=;
        b=srFnaeiRxjdwJ/M/0s17ZNoWUTdK+kwE1ByDoh5p8oYvdwbO6YM3aXHRX2LC9j015c
         dNxzdMLJDVMfJXnhkKB3KBgFRgszUi/Q9k7fwc4F8QaSYns0jzE360bNq1+JfpGhJ4gM
         jhtr+LNpx+TgcPZpAGzG1Qq2mEKUtfavM3CGixAuknx0bYLP1FDEcHdHxHnSB4qrMMHB
         IC72P+GgYuMMOzxag/oY/TySRiJB577sk0e5bgb2j8vjTxYkSwJ+XRq6VT/LthlIVcMM
         AqdoaFxfzilzxmW/m80quRcBk8NDVt953D3kBDyRM6kHpSVc/IrpOYOx5JGhcGooBSq8
         Iyew==
X-Gm-Message-State: AA+aEWYlJyabfl3K6zApSSHbTh7/PpXyZgZ4bu8Vt1ubiCrh8JFC1WJW
        ZzJp1xP19hM/0cfmfUfL4A==
X-Google-Smtp-Source: AFSGD/WDlDKeFb6dKusA+1mFMeSkGrqaIzknCIMYSd6YIxT2rPAPFYsFYw3bWwpoj5HaRTatTkKG1w==
X-Received: by 2002:a9d:6d81:: with SMTP id x1mr9073731otp.17.1544481150619;
        Mon, 10 Dec 2018 14:32:30 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b128sm6533497oif.7.2018.12.10.14.32.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Dec 2018 14:32:30 -0800 (PST)
Date:   Mon, 10 Dec 2018 16:32:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc:     k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: clk: exynos5433: document imem clock
Message-ID: <20181210223229.GA15986@bogus>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
 <CGME20181204165317eucas1p10bef0207ee57a9420911410ed2a22453@eucas1p1.samsung.com>
 <20181204165248.17572-4-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204165248.17572-4-k.konieczny@partner.samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue,  4 Dec 2018 17:52:46 +0100, Kamil Konieczny wrote:
> Document DT bindings for imem clock of the Samsung Exynos5433 SSS (Security
> SubSystem) and SlimSSS IPs.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
