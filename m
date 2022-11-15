Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5C5C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 15 Nov 2022 13:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbiKONEx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbiKONEw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2022 08:04:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7EBAE48
        for <linux-clk@vger.kernel.org>; Tue, 15 Nov 2022 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668517428;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pwFTRSjvBq3e+IXuQuSlNARebSjDFofjy3AIZnLKcDs=;
        b=DI+U5LtGZm3xOiD2I4bTT8BmbqY9OGzGS2tcBxmtwFVDeiRPMPRCrN7Q4BxyD7bnRDN+N+
        shCbyCxqvQqqunvWUD2xIIZfAnJr12DexEVr6tVc6Yr3Fn7v58PLQ6lmPdBfByLELZaGiv
        HV41aH8+gPZb1iD5ZAD/MMAD5bGdfjk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-mSY67lroPyOllCUCsdz4rA-1; Tue, 15 Nov 2022 08:03:47 -0500
X-MC-Unique: mSY67lroPyOllCUCsdz4rA-1
Received: by mail-qt1-f197.google.com with SMTP id ew11-20020a05622a514b00b003a524196d31so10102979qtb.2
        for <linux-clk@vger.kernel.org>; Tue, 15 Nov 2022 05:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwFTRSjvBq3e+IXuQuSlNARebSjDFofjy3AIZnLKcDs=;
        b=TSP9ofjn90B1uAYgjit8SE1Fc1DYU3XRm1I6Z3CrvKU56Gjg0UmG7pE+Q/PZ7ayN4g
         xSRFfPIs8KvJujv4VGiq50ADsd+vPf+jA9ybsX8SsSSlkQNmsGMZhCAFtPz0OC9h0Vi6
         v97nxxKtdjXpY7b75RIw2fp9SYA66pIT48iJRL8N91CjIIbVHq7LsJmuGEZq636eIzvl
         /SNCdlIpwIN0bVZvZlGUGhERiHI//jGbh4JGB/Qxb/QguJTk68k6XnGqXQjLqqGDpFTM
         e8FG2Y/iEAA8p+jq4JZ0fLVZoyZHjscMygoLphBaOwOaEdSH34wkTojlwckXcE0yO8Tl
         xI+w==
X-Gm-Message-State: ANoB5pkl/VVV3/MKWY/15aQ54QkDYkoVICKrY9CY43lGXZSOusY3Dp8Z
        S35sKw/K0iKv+TxXUdkmvn9vn3gOwMqSAkhEvKk60o1dY95EwzY9Bnvxph2AdkIfTeoIl1Yh0qj
        8nixhBRZW5KtDivkC3MCu
X-Received: by 2002:ac8:4415:0:b0:3a5:2556:42ed with SMTP id j21-20020ac84415000000b003a5255642edmr16135251qtn.422.1668517426808;
        Tue, 15 Nov 2022 05:03:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6g4wONIalNVue6tn6WP7hXmPOBZBfpwYnNOhI3Rflggb5LyweprHhYoAyHIk52G5OdRUrCgA==
X-Received: by 2002:ac8:4415:0:b0:3a5:2556:42ed with SMTP id j21-20020ac84415000000b003a5255642edmr16135238qtn.422.1668517426562;
        Tue, 15 Nov 2022 05:03:46 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id o26-20020ac8699a000000b003a50b9f099esm7112858qtq.12.2022.11.15.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:03:46 -0800 (PST)
Date:   Tue, 15 Nov 2022 08:03:45 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Shazad Hussain <quic_shazhuss@quicinc.com>, andersson@kernel.org,
        sboyd@kernel.org, agross@kernel.org, mturquette@baylibre.com,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-sc8280xp: add cxo as parent for three
 ufs ref clks
Message-ID: <Y3OOMXZBvew9eg9T@x1>
References: <20221115102217.6381-1-quic_shazhuss@quicinc.com>
 <Y3OLDj6xzOVjvEdV@x1>
 <Y3ONkOhcdK+gt46g@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3ONkOhcdK+gt46g@hovoldconsulting.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 15, 2022 at 02:01:04PM +0100, Johan Hovold wrote:
> > Put this Link beneath the --- since Bjorn will add one that's specific
> > to your patch when he adds it to his tree.
> 
> I think it's ok to keep that Link if it was intended as a reference to
> the discussions leading up to this patch. There can be more than one
> Link tag, and this one is more in line with how Linus thinks they should
> be used than the ones added by tooling such as b4 when applying.

OK, good to know. Thank you!

Brian

