Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C0AC433DB
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 15:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C45361991
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 15:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhC0P1y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 27 Mar 2021 11:27:54 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:40693 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbhC0P1c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 27 Mar 2021 11:27:32 -0400
Received: by mail-ot1-f44.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so8072326otb.7;
        Sat, 27 Mar 2021 08:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o3iL5Uh8L3JW9RCzn2xTF7rAD9/9/A4+KEeFmhq18Es=;
        b=d6iHxAkUQob9pjLSitNX10t2qRh/9p/xabw7eSKeizUV7eJpJJ6t7VPsvsW3B46isk
         +f8cUO46N/CxWUqgSwsE/BFSjupT3KcvpJEA3hehBL9FigAaOa8OwNBfENSH3yvADzfe
         GpK/EDLgVlwx1Tagm0YO0sd2jFwQsg+l7YuoqHT8VxfAMGx6IwGEEWcecFrHSdgZ/Q9n
         JIYMnZP8Ij6xi1yOE7N6cMJyt9qxI5EeKVYai8lsupQDpnSuaRM7A8HhEE5joheii7rW
         R6np7qa4pTrqbdr9QXE1W8WHohyqlwBR9fgtXrnoBsBwqrD4ZgztwR6pWUyN4btK25fo
         Xg5Q==
X-Gm-Message-State: AOAM531EqaZSbV8W/u+5srNkthV6V8C3Rk0vq0CH0EV+FSKEXXwmsMlx
        eUXeFg2/mpb4lUelU8u92g==
X-Google-Smtp-Source: ABdhPJzk0zNXkXaFqa3ltQOWUs4OXktCMHpbJe1ebsmEYxX0J/atfI4TPHcGcEJ7Q6ULSZiEcBv4Rw==
X-Received: by 2002:a9d:469:: with SMTP id 96mr16025663otc.302.1616858851784;
        Sat, 27 Mar 2021 08:27:31 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.102.185])
        by smtp.gmail.com with ESMTPSA id i4sm2411175oik.21.2021.03.27.08.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 08:27:30 -0700 (PDT)
Received: (nullmailer pid 149143 invoked by uid 1000);
        Sat, 27 Mar 2021 15:27:27 -0000
Date:   Sat, 27 Mar 2021 09:27:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, mike.looijmans@topic.nl, sboyd@kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: clock: clk-si5341: Add new attributes
Message-ID: <20210327152727.GA149056@robh.at.kernel.org>
References: <20210325192643.2190069-1-robert.hancock@calian.com>
 <20210325192643.2190069-2-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325192643.2190069-2-robert.hancock@calian.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 25 Mar 2021 13:26:35 -0600, Robert Hancock wrote:
> Add new silabs,xaxb-ext-clk and silabs,iovdd-33 properties.
> 
> Changed vdd-supply on top-level node to optional since it is not actually
> used by the driver.
> 
> Removed vdd-supply from output sub-nodes, as it was not supported by the
> driver and it is not easily possible to support this in that location with
> the kernel regulator infrastructure. Changed to have vddoX-supply
> attributes for each output on the top-level device node.
> 
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>  .../devicetree/bindings/clock/silabs,si5341.txt  | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
