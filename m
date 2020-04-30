Return-Path: <SRS0=t0pr=6O=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFD8C8300A
	for <linux-clk@archiver.kernel.org>; Thu, 30 Apr 2020 12:24:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25F3C2078D
	for <linux-clk@archiver.kernel.org>; Thu, 30 Apr 2020 12:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xd8BJWpE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgD3MYo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Apr 2020 08:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726500AbgD3MYo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Apr 2020 08:24:44 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC1EC035494
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2020 05:24:44 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k1so6657804wrx.4
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2020 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version;
        bh=0SsmCVXRnkXXPF3iwxgzfLk25Cg8yBecJWm6wm0A4gk=;
        b=xd8BJWpEAmPWknlFQI1p20/J4G6PE8GikQxXOWevEiuthufqNhA3cFrOo8YgIj2iJ2
         qF37zkSLPXCHKVtOIJr8D1csGe9h4K6aS56hvzBBoD5cElmh64URHRrJr64sBKtVW8/u
         jqZozKJR67XNrH5P8D4JUPrEsjBGvI/qbMNjxxjux+W+urdy/FSPpl8EChcqxbmyfi7V
         31a/X1bA8gH5Akql+mAQx0IBXql9YUBsNrGXwXf9Vru3c5O8pWD9eHHucsEGOqkN8KwV
         kzADn2HNkLXSlmkZDlmaOZs1hGfGKV9I8K1ydamIMlMo1ioXvVWKfkTKMX4tjWarVGWF
         yItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version;
        bh=0SsmCVXRnkXXPF3iwxgzfLk25Cg8yBecJWm6wm0A4gk=;
        b=YA9joI5ze32CsUucqO/lysmVOpZnkiTQAdwvD99TbXmuXplFMhq6wBYfUlyxkOwdo5
         aWaWP+CSjVFaxM1DgetkD+QL6ZTFU0Wxdhd9qV6DJXFFOfrABKUCNZ551LybUfluYUPH
         RZ7L1EDiXZIQJ410IS2g1njRM+KjtqZJ4wnCNMQ4SI4gV/1ApoqjMPlqA9uZwg0MYwmU
         jq55wBcFHw8bGHt6avnAow2wnfJ5xAUwkP+/+BRuwxRg99oHy/vMdXnSoxEhEp41km9h
         zj21o2NaVUbfynjo9diRN/pF3aYJyoSMH9ZzSsFzzAcuxEUyeWDncO7Wm7nXNYK1pJe1
         mGVA==
X-Gm-Message-State: AGi0PuaOrhzfJL0qaryL8yosPRLNcPtz/fCtCsAxL5EY6jIWZeSM93FS
        MlUjElaMqFnDjhAnAal0hPyQ7g==
X-Google-Smtp-Source: APiQypJ5tpe4MZNXWxAc97GLCd8uPMJ/9ymBE2FrP7SAVu2s8iWKNUQSodKMKtfL4llzvGmNRkzVWw==
X-Received: by 2002:adf:fe87:: with SMTP id l7mr3863095wrr.360.1588249482859;
        Thu, 30 Apr 2020 05:24:42 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id k6sm12640874wma.19.2020.04.30.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 05:24:42 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        ulf.hansson@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: clk: clk_register is deprecated
Date:   Thu, 30 Apr 2020 14:24:41 +0200
Message-ID: <1jftcli2k6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

We have a question regarding drivers which register clocks in CCF and
later need to use these clocks.

So far, these drivers had been using clk_register() to get a 'struct
clk*' they could later use with the linux/clk.h API.

Now that this clk_register() is deprecated in favor of
clk_hw_register(), how are these driver supposed to get the per-user
"struct clk*" they need ?

In this mmc thread [0] Martin proposed to go through a provider. I think
it is overkill, especially for a device which will not provide its clocks
to any other device.

They other way available is "hw->clk". I suspect it is not recommended
to do so, is it ?

If not, what would be the recommended way to get the "struct clk*" from
a newly registered "struct clk_hw *" ? Should we add something new to
clk-provider.h API ?

Cheers
Jerome

[0]: https://lore.kernel.org/linux-amlogic/20200428210229.703309-3-martin.blumenstingl@googlemail.com
