Return-Path: <SRS0=LMZy=WR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B5EC3A5A1
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 07:56:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CACF9233A1
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 07:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="r4qTCJNK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfHUH4Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Aug 2019 03:56:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45132 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfHUH4Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Aug 2019 03:56:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id l1so1210824lji.12
        for <linux-clk@vger.kernel.org>; Wed, 21 Aug 2019 00:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QOA27fQvmt0ItpWVuER8Cd/2ccQ264UvV5OBM8TClfA=;
        b=r4qTCJNK5SJ8ogQ4WghaMDrAuodPTaNyFs7N2SEfsWO/khHUCoesuERqXfXhBfYQre
         BZhSDXDue9g8DqYmEQmgzJrqG0toR/vo6n3qqMg+v0Nfmf1+LEusn9bfeAkSAi/JWlCh
         D7dlKbNfUNJHct1B5cq9EKFO5qPTk1j4vsDUQIz4LmdlBrZiyxkESssVjfdZmlSL10+U
         8RNqPqaHiRExoljUbJDthvobAspkeISAe1+PTSNJKl+SZZpwF49JQ5uB1Cj7st7tDVb7
         nCJWGi2eK25KX46F+acDZZkzHQEzEUmFLwNXV2+Lz2F1fKWjbsNTztybhtF0FLzI9Wf6
         4fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QOA27fQvmt0ItpWVuER8Cd/2ccQ264UvV5OBM8TClfA=;
        b=QtD8J6Uh2UW8sdGAy/FbNMny9DLYs/r0wRjaADVk8SVOrYzOEbk9v1zSUJC4C70Lf5
         9TB9CI6FgsewVZMGVObAL3wwS+Clc2GL6ngkrgeTQ6FVP672ZeFWmFQKnoPOppKEcZ6w
         u2Gmv5JMoIyu9Zjk6erU7LnrXeHycGDcG/UJYaeAbaio2qiQCsbFv/x8UEAbzJZzhhRu
         0H2U1W94uBVH2BgWQykSbHufwr5g/D0heYZoQjld7GO3qd2YSv3UJlwv4pgsbpKIio0Q
         6o7ZvyKrIBXOnF2JPTpnd7DRBPs0Fs+jwOck7+IBRdp+0ZhYM2CPUOguol7a4N0Y5O0G
         WOkQ==
X-Gm-Message-State: APjAAAXNTgmgN30K0seEnIA9jnYIGIHQ+6cOIhCeYIL3ey36OF9fLLEe
        lt8WEeShBBXzG4OwTs89sYBrTKWrjHo=
X-Google-Smtp-Source: APXvYqxyRNa53b5Cigx2MTrXUcy4HqDnc2hTJX1bT9880ZE78ku7EN1Dk8F5EZafozo6IQNHWVXYsA==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr18453513lja.140.1566374182107;
        Wed, 21 Aug 2019 00:56:22 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id h3sm1829962ljb.8.2019.08.21.00.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 00:56:21 -0700 (PDT)
Date:   Wed, 21 Aug 2019 09:56:20 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: emev2: Rename bindings documentation
 file
Message-ID: <20190821075620.GB28351@bigcity.dyn.berto.se>
References: <20190819135630.18462-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190819135630.18462-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

Thanks for your work.

On 2019-08-19 15:56:30 +0200, Simon Horman wrote:
> Rename the device tree clock bindings for Renesas EMMA Mobile EV2
> from emev2-clock.txt to emev2-renesas,emev2-smu.txt.

Should this not be renesas,emev2-smu.txt to align with the compatible 
string?

> 
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> ---
>  .../bindings/clock/{emev2-clock.txt => emev2-renesas,emev2-smu.txt}       | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{emev2-clock.txt => emev2-renesas,emev2-smu.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/clock/emev2-clock.txt b/Documentation/devicetree/bindings/clock/emev2-renesas,emev2-smu.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/clock/emev2-clock.txt
> rename to Documentation/devicetree/bindings/clock/emev2-renesas,emev2-smu.txt
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas Söderlund
