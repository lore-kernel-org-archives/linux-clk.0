Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD96C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 14:52:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A19260698
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 14:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238893AbhIPOxx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Sep 2021 10:53:53 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:41801 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhIPOxv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Sep 2021 10:53:51 -0400
Received: by mail-il1-f182.google.com with SMTP id d11so2966529ilc.8;
        Thu, 16 Sep 2021 07:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0270jj8hnvtU6Z8Tv4sd6F6VhusCWGFru+o41CqU4dY=;
        b=o80zXQa9nIN7SmpAANPH79CrxeYfABSEvLoiu71M9/i9CDkqxf58ewXFTY9MuahkeZ
         D4La5B0tEwW9Jwsb94lkCYjArF5kvI0mwVyrEHfwCquHoKD4Gf4GJ4YVVtr1ulylQKMv
         XeCBx+cfqH2bLK95GeqfykulgXWB3ZzFKRnEgS0bo1f1X1E9Vz155l30KL5nKkgdqFOe
         1NoyLBNxqdtSPwabpNrf8aRreQWhTHJr1xp37LnmtMoMm/mzDgldQvUuOVnrZeVyO8cv
         g0MxMfxo//eqzQjySbEe2QYBc6/xx0PofRyd2SMnP4Y1R3GymukIwoTnZYkyklagMW2E
         1W0g==
X-Gm-Message-State: AOAM5309GtHWSVucBZTSDxMm1D5OzuzAAKMJ8wF1FUzXNDObjH4twD70
        DI81zaNr24AzjCwCzFbh9KTp/L7r1Q==
X-Google-Smtp-Source: ABdhPJyhvUDPfLSQOfqzy/j95As8UgMQaFnCqJEywtA9Ni9W2l1qewwlfPBHZo0IFSPe2ybOjx+Azw==
X-Received: by 2002:a92:7f08:: with SMTP id a8mr4112867ild.125.1631803950945;
        Thu, 16 Sep 2021 07:52:30 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net. [96.84.70.89])
        by smtp.gmail.com with ESMTPSA id e15sm1822474ilu.29.2021.09.16.07.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 07:52:30 -0700 (PDT)
Received: (nullmailer pid 1340114 invoked by uid 1000);
        Thu, 16 Sep 2021 14:52:29 -0000
Date:   Thu, 16 Sep 2021 09:52:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        git@xilinx.com, shubhrajyoti.datta@gmail.com,
        gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v13 1/5] dt-bindings: add documentation of xilinx
 clocking wizard
Message-ID: <YUNaLWfcTEYpGwJx@robh.at.kernel.org>
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
 <5abe09974e95f127784b9eb5b8764e099e4a1b2d.1631623906.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5abe09974e95f127784b9eb5b8764e099e4a1b2d.1631623906.git.shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 14 Sep 2021 18:27:41 +0530, Shubhrajyoti Datta wrote:
> Add the devicetree binding for the xilinx clocking wizard.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  .../bindings/clock/xlnx,clocking-wizard.yaml  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
