Return-Path: <SRS0=ECv2=VT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB96C7618F
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 18:18:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDF7521911
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 18:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563819536;
	bh=6C5dGEobXMSKV8tz6m+2abiJaqMcaLi1DcLsmHBkFGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jM7IyuXBMUxd3Qpk6P3m39RVEEgHAjWBtUN4VVJp0s5JmpNyDOLkDkaP24yVM0t1R
	 vIrV3J56RF4HKUWnOOMBwOZsIeEU6zgPX0oeInHZBeDZuFXqSnzSZcWKqUGW+MjYKY
	 gG9iNa4aViPUNai7phhjNFNm/1FPPCCvBkWO/G3o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731390AbfGVSS4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Jul 2019 14:18:56 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41660 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731348AbfGVSS4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jul 2019 14:18:56 -0400
Received: by mail-io1-f68.google.com with SMTP id j5so71888691ioj.8;
        Mon, 22 Jul 2019 11:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T7NzbS2nL56kalhnNVVgdYFnu9U3Dl9RYxZh7Mbi6hM=;
        b=sb2Fg/vKmI2F46ZBZDGrNobXFnFFk2f9GTm5X6V5LJ9zNlCnktU0m75pvO5eXZrMyF
         8qiepo/kLtx004xpZ/6fS2b4avFPewjuknmS76JJK2lr6XyqGDk5mnIDzxZ+3t2lqFQb
         ioTr5NW4TSPL7mv7mz9JPaRP6XVBiZMjZwbK5yQ43744HNH+KpTQWxo+tREyWQXx/Aol
         5jvxlsqnrNdMFNQFvJ9uo8YAVFiziGqDQFR/0pMaIfY4+ozyV0HP4k6DRsy9abaLiJtm
         CjCQrtlZ2qCCr+lwBVQTH47ohSqd8l0ZFYe5DjDd2fS5aXtj4WZkr2bK19Zgu5FweIYR
         U0nQ==
X-Gm-Message-State: APjAAAXWm0IvAkipoWx/9auEA9jvljgoOQfLYcyqCDDUoyYAdtNGr86q
        45TnDijyu6l4EUMjWZFcAcq5sAk=
X-Google-Smtp-Source: APXvYqwJQQXT17VYnFNbmLLO5iX/opWbVmhvphEgH73legWZInESOvoFS5PEZ2Uy1PvqAhZOjRJoSg==
X-Received: by 2002:a6b:fb02:: with SMTP id h2mr41364611iog.289.1563819535375;
        Mon, 22 Jul 2019 11:18:55 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id z26sm40121424ioi.85.2019.07.22.11.18.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 11:18:54 -0700 (PDT)
Date:   Mon, 22 Jul 2019 12:18:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Phil Reid <preid@electromag.com.au>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, preid@electromag.com.au,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: cdce925: Add regulator
 documentation
Message-ID: <20190722181854.GA24510@bogus>
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
 <1561691950-42154-2-git-send-email-preid@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561691950-42154-2-git-send-email-preid@electromag.com.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 28 Jun 2019 11:19:09 +0800, Phil Reid wrote:
> The cdce925 has two separate supply pins. Document the bindings
> for them.
> 
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>  Documentation/devicetree/bindings/clock/ti,cdce925.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
