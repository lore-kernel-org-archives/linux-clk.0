Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D736C49EA6
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 21:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C90E613B7
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 21:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhFXVgO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jun 2021 17:36:14 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:43706 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhFXVgN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jun 2021 17:36:13 -0400
Received: by mail-io1-f43.google.com with SMTP id k16so10037994ios.10;
        Thu, 24 Jun 2021 14:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CcolHmV+A3vjz1+53DqCoiq9IMwj46wy61et/vhg6pY=;
        b=ZAqiueXjgLRX13M/AUa8gXcXRF1RBrWWwAmZrayYFzZxsZQ2Suh1Ic+Hoz2z6Zv9Fi
         M6B2ZdtfvquYm1j6zJJ0BphIB6jjbQVB1j79yB8iy4mZVfrU94F0kxcfL80vnLVwgfIs
         ZYnoZGCUjvv2WneRnW/CTxariB0wNOZawZM2yFN+d32DDBjxACTYh1v3rQ5pzBlL2iKN
         OJjxrSuHgNqXoUbeI7kD1lrXRdy054EkP3ZZy5exGHxtdN3lgKPghVNnDi0fA55iuBTO
         jZHJFQKfgpaD9/DfdLyA1UhEK2IUAnqCl84XtPs3LCu8JscXphB4C+3CJa6JoDiwAyRO
         ee9w==
X-Gm-Message-State: AOAM530w8TF58HY3CLfxmLcAqSVlVu9+UGdJo2wVqappXm2YYB8Tbhhc
        FWluW+cBNQLUKkE7iznUYA==
X-Google-Smtp-Source: ABdhPJw9/4FJDiDsT9sieSnmZ0wZSc6oA7B9xp6tVoFjU9t+ea/pC597FWOzIvdxCHKqPn/MSGnYnQ==
X-Received: by 2002:a02:a99e:: with SMTP id q30mr6459649jam.69.1624570432679;
        Thu, 24 Jun 2021 14:33:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q8sm2125659iot.30.2021.06.24.14.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:33:52 -0700 (PDT)
Received: (nullmailer pid 2023922 invoked by uid 1000);
        Thu, 24 Jun 2021 21:33:47 -0000
Date:   Thu, 24 Jun 2021 15:33:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     robh+dt@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        devicetree@vger.kernel.org, sboyd@kernel.org
Subject: Re: [PATCH v3 4/9] dt-bindings: clock: cs2000-cp: document
 cirrus,clock-skip flag
Message-ID: <20210624213347.GA2023874@robh.at.kernel.org>
References: <20210617190912.262809-1-daniel@zonque.org>
 <20210617190912.262809-5-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617190912.262809-5-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 17 Jun 2021 21:09:07 +0200, Daniel Mack wrote:
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
