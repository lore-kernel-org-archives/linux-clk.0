Return-Path: <SRS0=WJwD=RZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EC1C43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Mar 2019 23:53:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DDBE2175B
	for <linux-clk@archiver.kernel.org>; Fri, 22 Mar 2019 23:53:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LRIgFl2E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfCVXxg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Mar 2019 19:53:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43166 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbfCVXxg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Mar 2019 19:53:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id l11so2520848pgq.10
        for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2019 16:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=8MeyfL9P+TzBFKo4h9VhMDlScje41WZzffHv3i9eBuE=;
        b=LRIgFl2Ez/ojrJM1byKWK8Ct2jtgAqzce4cbuXE/NFDtflo64JFlbS54p8RcSX73X5
         2IyPpsaCZxI89O61w0K0joj53H7Aw/wfscd/+V4ZKouOjUyN7+GbiRrSXU8g/yvVgXlT
         kkB6cj6QfzuQDFMJJUHzVrtUJ/Zo1oVzluk85FCKnhg0YzvRi+6oGlPLgPt2Z5ePpyYv
         nFa5f6At8V5sS36qvzLMnkPNi9XyEX+mb60kB6L8DYH7FH5RK0kH7pqpxAfF0AQa8zFZ
         izLrVsdH8naqP7kA/K+TOn83ny2hMYqnChlmnnUCJeTPuYvz+HJ3YAsMiQg31UVxgW9c
         t3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=8MeyfL9P+TzBFKo4h9VhMDlScje41WZzffHv3i9eBuE=;
        b=GgPygln5z4HbjPVEQnl1i0iL6Zozx7Lrk4PZfTu8uoo9mXT9k39vlAJoKrqRg1aW9B
         PF8kyDJaPLyL3WkmulCEb6tnzk/aDnzYZ4vQS6PKBe2rpGnXvI02tgd+kOCjcoTwS7tx
         h59N683KwxmMY9i28p6mAMWtKvCZrXMzb23Ta4cVHsX+gyKwC6dBGTBCcLy41COo8Vgq
         HZ10XLCCwnoXUooobOROxH4fHaJxeF/oVO/WmYzVET6ByB5npLAycxGkuT6r2NrVV05Y
         bIF/aUJYRKcr4unA08qZT/d1v6W1cyNMqTKFsbaXFUQLMuS9/Zg7aofvGb0LsRD6CzH3
         1qzw==
X-Gm-Message-State: APjAAAWteHLJRcEcV6B7XVE4tl1OHg4yaCuzI4bix1EPG3ObDRYbfukw
        lRjaqDIpKaKoZFoJnoo2Zz9khg==
X-Google-Smtp-Source: APXvYqwYT2gMrQkqM3vM84OkzVg5sj2ee78VHyGr7eQxU3ba0PNNCfKtK5/keBYa4Q6ob+lGqV9Kww==
X-Received: by 2002:a65:4384:: with SMTP id m4mr11431713pgp.375.1553298815248;
        Fri, 22 Mar 2019 16:53:35 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:314c:c810:897b:a1d4])
        by smtp.googlemail.com with ESMTPSA id n82sm16887304pfi.63.2019.03.22.16.53.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2019 16:53:34 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson8b: drop the "ABP" clock definition
In-Reply-To: <b7d2edf1-da66-a09f-5f29-28f37ce3f06b@baylibre.com>
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com> <20190319214123.27219-2-martin.blumenstingl@googlemail.com> <b7d2edf1-da66-a09f-5f29-28f37ce3f06b@baylibre.com>
Date:   Fri, 22 Mar 2019 16:53:33 -0700
Message-ID: <7hmulmzcsi.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 19/03/2019 22:41, Martin Blumenstingl wrote:
>> Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post
>> dividers") added a new clock ID "CLKID_ABP" which contains a typo. This
>> was fixed by adding a new (typo-free) #define CLKID_APB in
>> commit 40d08f774c17ad ("dt-bindings: clock: meson8b: add APB clock
>> definition").
>> Now that the new #define is used by the driver we can remove the old
>> one (because the old one is not used anywhere).
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  include/dt-bindings/clock/meson8b-clkc.h | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
>> index 8067077a62ca..cd11628f50f8 100644
>> --- a/include/dt-bindings/clock/meson8b-clkc.h
>> +++ b/include/dt-bindings/clock/meson8b-clkc.h
>> @@ -103,7 +103,6 @@
>>  #define CLKID_MPLL1		94
>>  #define CLKID_MPLL2		95
>>  #define CLKID_NAND_CLK		112
>> -#define CLKID_ABP		124
>>  #define CLKID_APB		124
>>  #define CLKID_PERIPH		126
>>  #define CLKID_AXI		128
>> 
>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil / Jerome, I'm assuming you will queue this via the clk-meson tree?

Kevin
