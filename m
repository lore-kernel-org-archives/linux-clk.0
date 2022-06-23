Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226B7C43334
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 17:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbiFWRx7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 13:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbiFWRwq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 13:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 44E6B5675B
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 10:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656004412;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XN7oDkYMlVq4zYDVCkrX4IsfCj98UeViNtsSEBKFwUI=;
        b=hVSbk61M/VkFzA/O+JHjCifcYFXRko2b+fSz1gIWGmRgkK8zWmAxq7aFOJ2Bvjn6SreEzW
        lhAusgH7LQnZNJYWs0SIwel2u6357gsJqE2snI2NyzBJVLXSFWw+lqBYbzUo5HvRqHgJ5d
        exUWlh/PKiMrUQNQYO6jqdEZ6UtwVSw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-fhaSkHmSPUiHn1dCzc4Yxw-1; Thu, 23 Jun 2022 13:13:26 -0400
X-MC-Unique: fhaSkHmSPUiHn1dCzc4Yxw-1
Received: by mail-qk1-f199.google.com with SMTP id i16-20020a05620a249000b006aedb25493cso6299853qkn.15
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 10:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XN7oDkYMlVq4zYDVCkrX4IsfCj98UeViNtsSEBKFwUI=;
        b=kGMEbbJbkfEynwjIYMCpnX+srdOK8bKhRLyQyWzfINkB3UFW31UiarECG0TZZi/fHS
         ySpHJb5l19QZn8MU/bZSQanX/liRgDK4ERnv1Hs7UhYVMTr1pKM7Gk1ShUvYbgsHeQxh
         guQqI41l0LUUBkvzq46XwzNcy0R53K76nlB707uqPl/vrd8gcyHhLaA1BOkBeeUEeDuz
         kr4eJvHEHYGAgBe8Xq2CIZ0XFxqg0SKcHdz07pAbrHz8FBRCI3ib4tEIOYdgdk4JdjJW
         IwnKwEDkQOo3jhrXcCzUSKHxUSICeatFqqwTxE+ZELZ8bq0SE93fFe2+68EF3QHeEvgv
         tNwg==
X-Gm-Message-State: AJIora/89fgWVZtuxiYp1wLEnta6Okgec0C4o6qT0uYeKI8OBkojPNwk
        aA9UJzmybcO4YtI/z0dA/ag0E6p1I6x7DDRhab22gs3PDujWExr8J190Vfky53OaRtZRjV79gwH
        cXXdS9DWGNO+swVRnDKeF
X-Received: by 2002:a05:620a:2781:b0:6a6:db99:ea07 with SMTP id g1-20020a05620a278100b006a6db99ea07mr6962563qkp.452.1656004405728;
        Thu, 23 Jun 2022 10:13:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1te0myCUpLObJzyG3prW0evhfkUvySWYmtXu5OCZvGyWtCRXW5eKybjfnd4TWe3HrXncH8TRw==
X-Received: by 2002:a05:620a:2781:b0:6a6:db99:ea07 with SMTP id g1-20020a05620a278100b006a6db99ea07mr6962537qkp.452.1656004405426;
        Thu, 23 Jun 2022 10:13:25 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id t12-20020a05620a450c00b006a746826feesm40495qkp.120.2022.06.23.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 10:13:25 -0700 (PDT)
Date:   Thu, 23 Jun 2022 13:13:24 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        echanude@redhat.com
Subject: Re: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk
 for sa8540p
Message-ID: <YrSfNDToEZ0RhSAD@xps13>
References: <20220623142837.3140680-1-bmasney@redhat.com>
 <20220623153226.drrbx2jolrxxe7as@halaneylaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623153226.drrbx2jolrxxe7as@halaneylaptop>
User-Agent: Mutt/2.2.1 (2022-02-19)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 23, 2022 at 10:32:26AM -0500, Andrew Halaney wrote:
> I'm not knowledgable enough on the clock subsystem or have access to
> documentation to comment on correctness outside of the 5.4 MSM kernel
> you mentioned, but I think this probably deserves a Fixes: tag?

Good call!

Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")

