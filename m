Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B439C433B4
	for <linux-clk@archiver.kernel.org>; Fri,  7 May 2021 04:12:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38DC9613DD
	for <linux-clk@archiver.kernel.org>; Fri,  7 May 2021 04:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhEGENv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 May 2021 00:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhEGENt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 May 2021 00:13:49 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2809C061574;
        Thu,  6 May 2021 21:12:11 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id i5so1500366pgm.0;
        Thu, 06 May 2021 21:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jKXpROrWgWlEivORY7EFO4NOPoNT5M4YLfO6F2RXJjo=;
        b=ct+wyDVScCMqc5kOU8ZJHAfh5SK1xtulVqhn7aHoBqPPul1olYjuQc/okk/8uDBdDG
         Z38tAh7l5WaeTzOhv7dszXlg0HlCahyyHAl+ab1+eiR7Y0+blLtn2QRDz+QU/f0bqZxG
         WTOQ3FxeO0RHsnYSWsvf1nQhvYrl2WRxhXng3Y3A6xkRszhw6Q1/CS0d1b5HJcJXV2OQ
         TgRtpDYd/RtS5ve2CHMW9AWijlBK0JBnhaTXMtMFgVZxwLNXK/ZJEt6ws1+F779lnuyP
         sQXFWVGpahJMKrOjrxnoSxDX8ndHrgfsC7jV+db+pB5SnoEN2+OzvCxPZTWtk4BpfpJP
         IWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jKXpROrWgWlEivORY7EFO4NOPoNT5M4YLfO6F2RXJjo=;
        b=lod+U8c5QlNUfaKHJVEAHTRqtTNz1KO/GiUxepcSfhqa0J67KdQ0vZt6afJ8Uf4TXJ
         mZ+LjWJiBsyj4VKsHrFcrhFY9pwJWViX1PIhj8OtPdeqrUY4ETouDRorBNxRSAaS/s12
         gQkDu9c4HZde0hU38QaJgAsGFCi87U2Mp8MDo4fuJ0wThcLVL8ScdN/+7YEPy5ChC5rw
         ShCAFDy1rM3lttbLj4GyTSPfKD//YQbZ3hAW0Y+kvlRk+ANARglcq4GBD+Lz0sgYP6Ty
         KPp1NKf46CqIiH9hHJDxbcssvrG8+MOGnYrp/ORmxML9t5oCDPlyC9CwV5TT3CzQZjTf
         FaNw==
X-Gm-Message-State: AOAM531p5tPRPO0w8Cl889kLaD/XI+xV8Lowh4LX1BzI1Ewvr6fyDbEs
        +nFzFGYZxL8pwLTm+hCzwUxWbCJXrkA=
X-Google-Smtp-Source: ABdhPJwvgVmBkIXySyhZdYbkznw7Nlpr4QkhgClxJh0I4NKBcQEVsEL0xeKhDW3COENp8K46nH3R6g==
X-Received: by 2002:a63:34c:: with SMTP id 73mr7730683pgd.431.1620360731234;
        Thu, 06 May 2021 21:12:11 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x133sm3633477pfc.19.2021.05.06.21.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 21:12:10 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Maxime Ripard <maxime@cerno.tech>,
        =?iso-8859-1?q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3] dt-bindings: clock: brcm,iproc-clocks: convert to the json-schema
Date:   Thu,  6 May 2021 21:12:01 -0700
Message-Id: <20210507041201.1356429-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424202341.30347-1-zajec5@gmail.com>
References: <20210421165633.13299-1-zajec5@gmail.com> <20210424202341.30347-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 24 Apr 2021 22:23:41 +0200, Rafał Miłecki <zajec5@gmail.com> wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to devicetree/next, thanks!
--
Florian
