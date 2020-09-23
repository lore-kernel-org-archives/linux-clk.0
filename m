Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33A5C4363D
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 01:31:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0F8C238D7
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 01:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600824673;
	bh=nDxz3e0KkZ+N6Qje7oce0l80Hn8YHj8L3R4OY+pWveQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=mZLvCAzXx6AYGUH6qXsdlGCMnrlGOnwLYpnjlrShsKJHllt7JazQfjpFBREYHN5qA
	 fKbGloWnmK9is7ZDjm/vTjnuNDTXzePflIM5s+S7VkPDWovLkXqIi6UAXoele4tu5O
	 ToSDxIh5LyRbRtUj1L9HJpsoqze0wunCInYMpADU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgIWBbN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 21:31:13 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:45090 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgIWBbM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Sep 2020 21:31:12 -0400
Received: by mail-il1-f193.google.com with SMTP id h2so19240454ilo.12;
        Tue, 22 Sep 2020 18:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tv66K9/1GwChFMOL9H+ReDrw3yHm6Xrj/b9POnLRMWk=;
        b=QDbd/Kvg43UELGjobpNf4W3rQRu2hzEbl2VWhgiVs5z6STswJ90eb8Ml/C7WQvaZyE
         oap7ExRpAovCCB/yxTjsT8ykTNjX/LGJGLyoFc6GlrwbSBDd4Asu4eXR9maIFPV+nCXO
         8tLzH+pWG6TAqRy3vJss/m9gbi6C+gAuav6xaUO99GxXYGc/vn2cz/aaOMy6Ic2SjXme
         /yS1s1JFgENlgizDW74qYgfx9Vnycn4haUzCGaYoyixxL3RJEJF9R1TIFZaY1KWQtJVd
         KjHMAcYFcPaBqv2hVF0py2CmGOrobpKWZqFDMK3BwLBXxAT7xc7HdxwOrXuy3uV98/MZ
         j6kQ==
X-Gm-Message-State: AOAM532J5D2oycgDLASTOUhp5anZAFQNWOiBbuuIwdpA8/d/DMkpIPg/
        sqobH6v/4S5EnpSWVNjoCw==
X-Google-Smtp-Source: ABdhPJznf0joDq/+4rusUaWg9pREPYnskIi0ja+Q0v6qwylDJWmE+LZNhJeA9vXJERaYvqHxRdYGLA==
X-Received: by 2002:a92:8e42:: with SMTP id k2mr6881150ilh.175.1600824672137;
        Tue, 22 Sep 2020 18:31:12 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m8sm8136478ioq.11.2020.09.22.18.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 18:31:11 -0700 (PDT)
Received: (nullmailer pid 3660842 invoked by uid 1000);
        Wed, 23 Sep 2020 01:31:10 -0000
Date:   Tue, 22 Sep 2020 19:31:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clk: axg-clkc: add Video Clocks
Message-ID: <20200923013110.GA3660801@bogus>
References: <20200915124553.8056-1-narmstrong@baylibre.com>
 <20200915124553.8056-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915124553.8056-2-narmstrong@baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 15 Sep 2020 14:45:50 +0200, Neil Armstrong wrote:
> Add clock IDs for the video clocks.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/clock/axg-clkc.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
