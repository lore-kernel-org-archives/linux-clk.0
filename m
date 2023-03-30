Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7820C6FD1D
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 14:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbjC3OHV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 10:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232322AbjC3OHB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 10:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF9093CA
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680185143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R4zCvOc1mMH56XgSR/h8YQ6LP3eLzSrZLD7OODqShKc=;
        b=eCPQb9f7UfUiOJRtKsnODCnIkN0rBgQADRnqQ/C6aDkaBO0LLzvehrXja/Lg263dBN+53e
        qYj0CFy38ZJHtIxZbYV7soithf4qSGd6y6LC1HLMSSY2vTvATGcXn1NcC9pkE1qzLldHRQ
        44y4lSql+JznbCS0CN2yF7UAKZ/IlNI=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-VpnIkAT_ONCaqx_PvVDgeA-1; Thu, 30 Mar 2023 10:05:42 -0400
X-MC-Unique: VpnIkAT_ONCaqx_PvVDgeA-1
Received: by mail-ot1-f70.google.com with SMTP id r17-20020a05683002f100b006a131178723so5051885ote.10
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 07:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185141;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4zCvOc1mMH56XgSR/h8YQ6LP3eLzSrZLD7OODqShKc=;
        b=qhfSGbK3VoqoNZkSA0U3cG23q4mj8BhFUTcyT9tO3QLDPfZa+FSa0uWOShF34ZCRb3
         /xiIkJ7RgbkgPhi/MVHtyha9UjUY3pdDsRZf9dCsMqM2AF20CeLL/5gzyt6oEXtA+xSv
         l6vgnJcpotXt7KMEbe/EqXvPKS3Xhtl1NukKulx39W1yRGpX0gG6mCC4v6ReEfNwC3s5
         7EpFiPQEG36CuevW4EIVzdhOfX+5CJmPq4euq+6SG+6WLD8ajMcBpgEB/8iY5Q346MKj
         zTfw98NR/vlvRGTO+JMBC/rld/OSgF0QyzsR4GZAcmAOtwareUvuodtzbHLGBBf+cxam
         QBBg==
X-Gm-Message-State: AO0yUKW2zyOthac8bw8E1Nc1aTeM3uIhnwBxEo/yKPzSXtwnqNOVPjGz
        VCLN4MuqnPZHwNopw9fGooeZ6R8JXBUnPNJyigEimCUZfLXd91TlnXvNkDvdSTR12TBjCAwbFv8
        SpSkYaO3jWj8Rlb7OGkeW
X-Received: by 2002:a9d:73c2:0:b0:68f:2134:9a3a with SMTP id m2-20020a9d73c2000000b0068f21349a3amr13731354otk.30.1680185141707;
        Thu, 30 Mar 2023 07:05:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set/zNPcgN/WnTgj0au7XovwmrXUXk9Y34tj4Bl9Gf9AZeZXE4KpUqaqWU4dfJz20w/H+BfTr3A==
X-Received: by 2002:a9d:73c2:0:b0:68f:2134:9a3a with SMTP id m2-20020a9d73c2000000b0068f21349a3amr13731343otk.30.1680185141411;
        Thu, 30 Mar 2023 07:05:41 -0700 (PDT)
Received: from x1 ([2600:381:4303:f0c4:d889:8469:3106:3568])
        by smtp.gmail.com with ESMTPSA id a20-20020a9d74d4000000b006a11998d20esm7092278otl.45.2023.03.30.07.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:05:40 -0700 (PDT)
Date:   Thu, 30 Mar 2023 10:05:37 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: add debug message showing which unused clocks are
 disabled on boot
Message-ID: <ZCWXMXdaLdBb9KzL@x1>
References: <20221117105829.256717-1-bmasney@redhat.com>
 <27ded6a4ebd67cef0d4b472a2aea442e.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27ded6a4ebd67cef0d4b472a2aea442e.sboyd@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 29, 2023 at 02:49:50PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2022-11-17 02:58:29)
> > The clk framework on bootup will automatically disable all unused clocks
> > on bootup unless the clk_ignore_unused kernel parameter is present.
> > Let's add a basic debugging log statement here that shows which clocks
> > are disabled. There is already tracepoint present here as well, but
> > there's nothing like a simple, good ol' fashioned printk for simplicity.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> 
> I'd like to see a documentation update instead that covers how to enable
> the tracepoint on the kernel commandline and have it print to the serial
> console.

Sure, I can do that. I see there's a section 'Disabling clock gating of
unused clocks' in Documentation/driver-api/clk.rst where I think this
would be appropriate.

Brian

