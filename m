Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1B3C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244951AbhLOQn3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:43:29 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:40663 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbhLOQn2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:43:28 -0500
Received: by mail-ot1-f53.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so25625552otj.7;
        Wed, 15 Dec 2021 08:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CNXsHLu+Gq71Y75lX9jVBGOmw/DgDu1JjCJ+Q0vaHsk=;
        b=6ecVCnZIt3NqwOV/EqWf02w6doiK+Rq1gp5Zi6RruuDYWyi8lvhCqiBodczVVpFl+1
         avCoD+5UhgAhZEkLKk+ixG+ge1Le4Hjm9uHNCFhbrMhKb2p/BV0YZYecJyHjZaTHEVAh
         mxVFLYOMewWM6IpAB+gc/h5/Mc4zhSYRQeCWD0m1sI9M12aTRbsBpq0ULfYBtr/Ier1Y
         hI3SsQ2rBBwSyCM55ZdUEM/kww+X9NoIGyOf1oTUpwKc4+/virxm03nTKKVvyIIkPZ2B
         j0kx3Ocdxo2y+sfVCUgwbhtU1OpvUX4HJZ0EmbY/yiQe2Q7cNW1w5+QyfGArfaX2pP7i
         hySQ==
X-Gm-Message-State: AOAM532o0E6q2nOkB8R6vcEMjJ90uNw7tmXRwQP5fu477oXvC5jZqp99
        c/1sSyrJfhzE/m1Y9z4eyQ==
X-Google-Smtp-Source: ABdhPJyiEZp5Q71GMOSK1C2jg9dTbx2jpXrRU/9if9iPhjgRzrw/iye3NbG+IFlWU4Q7zshMxC4QjQ==
X-Received: by 2002:a05:6830:1ad2:: with SMTP id r18mr9148485otc.308.1639586607714;
        Wed, 15 Dec 2021 08:43:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g17sm439185oiy.14.2021.12.15.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:43:27 -0800 (PST)
Received: (nullmailer pid 1448377 invoked by uid 1000);
        Wed, 15 Dec 2021 16:43:26 -0000
Date:   Wed, 15 Dec 2021 10:43:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jens Renner <renner@efe-gmbh.de>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        s.hauer@pengutronix.de, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        sebastian.hesselbarth@gmail.com
Subject: Re: [PATCH v2 1/2] clk: si5351: Add DT property for phase offset
Message-ID: <YbobLnc9Uc39dPJO@robh.at.kernel.org>
References: <20211208154440.72087-1-renner@efe-gmbh.de>
 <20211208154535.72286-1-renner@efe-gmbh.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208154535.72286-1-renner@efe-gmbh.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 08 Dec 2021 16:45:35 +0100, Jens Renner wrote:
> Add optional output clock DT property "silabs,clock-phase" to configure
> the phase offset in degrees with respect to other clock outputs.
> Add missing description for related optional output clock DT property
> "clock-frequency".
> 
> Signed-off-by: Jens Renner <renner@efe-gmbh.de>
> ---
> Changes in v2:
>   - Use vendor-specific DT property silabs,clock-phase
> 
>  .../devicetree/bindings/clock/silabs,si5351.txt        | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
