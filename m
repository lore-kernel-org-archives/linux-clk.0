Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6FAC76196
	for <linux-clk@archiver.kernel.org>; Tue, 11 Apr 2023 19:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjDKTbP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Apr 2023 15:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjDKTbL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Apr 2023 15:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7650194
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 12:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681241424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XSiYd4vLNxCRpyGc8Q8nbzOyNKeYH8lsn9NGk8/RzXo=;
        b=PGzTBsXjHa7ajoLzmDIt0wk8FNdsrK0e1iX7K6RfCwhrTC6o3pOugl45eXGEran/vEA2J5
        p0Pkz772U3n9PFE28Z9TzaFOBZVrlAJ4+tbDXvsu/xfTJN+Ub1EVS4IaGyuD9DeMHOg+WU
        wV9Gdo0jQPa3S1xUZ8Sbh9ISzGpQ4R4=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-2qOSgJlZMuyuGDVa25XIlg-1; Tue, 11 Apr 2023 15:30:23 -0400
X-MC-Unique: 2qOSgJlZMuyuGDVa25XIlg-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-54f54781eeeso45606257b3.7
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 12:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681241422;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSiYd4vLNxCRpyGc8Q8nbzOyNKeYH8lsn9NGk8/RzXo=;
        b=OIVdBp7aul4bnawWe5iCBpvyRLLou3BIXKrS5cp+q0qz4dBWNqBr/jZwfCa5qPXHoY
         WKfVwfq0uEE+m7aEkahjrTyN8TLAryh8v8z3mO+kNstAG7JoTja9HX8AriqpQ5QRgpvX
         Rn5y0CNShavPhaRuNsA59os9WstpySUNx2lxnTVezr2ET21LL/+9ELmYG+wwe5+F5UMu
         yc/X7lelZYpPzpi/FcuZd9A3ofMKZ9dwGk8awntABdSBNFkmmjq/nlRYtfvOoktGdffo
         b64wV0vn6IZM0CBPRoNhYci9H65NABfVft/TZWMrXsaR5uqM804mYv4QxMtUBCywa51c
         CkeQ==
X-Gm-Message-State: AAQBX9dbcPTtf8dd3JlIMtsG1/HrNxE1PVCxmNdM5ocEnb/uGfbAUq9L
        awJ8YmY69WThIT6BCKlnM9HqqwuojXFiqUOgn7hrDAjmPnqjnMGgcrNClkgQqNdMWS2HF49woyr
        n0aqjm+TUq3NPoD/MoWBqb+h4iTBA
X-Received: by 2002:a0d:e214:0:b0:54f:32a:a26 with SMTP id l20-20020a0de214000000b0054f032a0a26mr3140018ywe.5.1681241421953;
        Tue, 11 Apr 2023 12:30:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZsC9iBX9a7B2k91coESrz+mo0Z//dKyhd31vgb3jSIzRwJ96yVRUdmYIaoWCJH5Q3fS8sEXA==
X-Received: by 2002:a0d:e214:0:b0:54f:32a:a26 with SMTP id l20-20020a0de214000000b0054f032a0a26mr3139998ywe.5.1681241421597;
        Tue, 11 Apr 2023 12:30:21 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id 23-20020a810717000000b0054f6f2d291dsm693839ywh.34.2023.04.11.12.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 12:30:20 -0700 (PDT)
Date:   Tue, 11 Apr 2023 15:30:19 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: add debug message showing which unused clocks are
 disabled on boot
Message-ID: <ZDW1S7OLRjHzNCB0@x1>
References: <20221117105829.256717-1-bmasney@redhat.com>
 <27ded6a4ebd67cef0d4b472a2aea442e.sboyd@kernel.org>
 <ZCWXMXdaLdBb9KzL@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCWXMXdaLdBb9KzL@x1>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Mar 30, 2023 at 10:05:37AM -0400, Brian Masney wrote:
> On Wed, Mar 29, 2023 at 02:49:50PM -0700, Stephen Boyd wrote:
> > Quoting Brian Masney (2022-11-17 02:58:29)
> > > The clk framework on bootup will automatically disable all unused clocks
> > > on bootup unless the clk_ignore_unused kernel parameter is present.
> > > Let's add a basic debugging log statement here that shows which clocks
> > > are disabled. There is already tracepoint present here as well, but
> > > there's nothing like a simple, good ol' fashioned printk for simplicity.
> > > 
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > ---
> > 
> > I'd like to see a documentation update instead that covers how to enable
> > the tracepoint on the kernel commandline and have it print to the serial
> > console.
> 
> Sure, I can do that. I see there's a section 'Disabling clock gating of
> unused clocks' in Documentation/driver-api/clk.rst where I think this
> would be appropriate.

Just to close out this thread, I submitted a patch to the docs tree.

https://lore.kernel.org/lkml/20230411192153.289688-1-bmasney@redhat.com/T/#u

Brian

