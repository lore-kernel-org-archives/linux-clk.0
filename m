Return-Path: <SRS0=OvdJ=CT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB65C43461
	for <linux-clk@archiver.kernel.org>; Thu, 10 Sep 2020 09:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7685020809
	for <linux-clk@archiver.kernel.org>; Thu, 10 Sep 2020 09:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S36d+wG8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgIJJtJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Sep 2020 05:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgIJJtH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Sep 2020 05:49:07 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925EEC061756
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2020 02:49:06 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w1so5656972edr.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2020 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=+nnm9BXqafE/FDvFW/KQ+vqXtpX/12/KK71uDZZ++kY=;
        b=S36d+wG8zLWz+Gzwo/f8s5vcy9F4lRF7s6PS4Zs8zXBC7Ovqjo3S1m55kIPRT4vsId
         cku3TPgQ4tcMbz1mdQtfyLQ1R0OBWAmfw4BWntl3L4r+Qo0L/qmQ3SgVAulS3aFdcOk4
         6NUbopDyxJYka77t9oHquxjsQZyJ2UhoggflvzSLGg9RbbJs1NSjp9HKE1wYsT1zI/gS
         3EDErlaQ/IcS38itNRA2VwH7JAjXw8sFXxTqgR4NSD9qzhBbad8JIFvmeX3FqpDNx9Xj
         ok8qLq1drBHoVbBmkIdg8sU1iNMY3XFgeshKrMkJc8UNZlcVfCVIRTUiIentDXYdIZyW
         e14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=+nnm9BXqafE/FDvFW/KQ+vqXtpX/12/KK71uDZZ++kY=;
        b=JLfqU5+zviYr+02C867D0+ZfQtxY8EfpaZ1e2OPtp4BGVTh6VM7g3rK1b8gVeAmUEC
         wEVC8ETozQ0wxOj1opPQye7Dxvd/YlFxZzc2i2L65GU/i/LCYh0uzesTlylPP7P5JYzI
         mG5py4SIVuLjJA8sWVqOa0iwkymZwASpaiTuTUEKUqpLSnUatjVeipQWdV7EaHToio5H
         Ie6NHXvNXGES92a1uf3U8v88C3fLIvoBhgulpCuxQrLBb5B6UGyOUYaZ2TB5NRQNSqrK
         H6xOVLpQWxWHv72PbbQe5wanXLMNxAsNV/fYKYJU8amt1oMX2ahXTZ4UJ/EQE4jkOEks
         /KFA==
X-Gm-Message-State: AOAM533GAfBQFHyPXvXq8a7OPJ13prEkaqtZgsF13uwliesMRGmJ7+rx
        cc+L3ZJw9RScqYnqNAimhvgRLg==
X-Google-Smtp-Source: ABdhPJw201OWJh7qykUkjB31eTxWyErlzB+x7CVYxeqsXmzk8Hk4kfsUruIZR9aOu2UOPtXuvCvyHg==
X-Received: by 2002:aa7:d296:: with SMTP id w22mr8428632edq.327.1599731345283;
        Thu, 10 Sep 2020 02:49:05 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id i17sm5944547ejy.79.2020.09.10.02.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 02:49:04 -0700 (PDT)
References: <20200828154735.435374-1-jbrunet@baylibre.com> <159972433977.2295844.12910258806178190962@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: make shipped controller configurable
In-reply-to: <159972433977.2295844.12910258806178190962@swboyd.mtv.corp.google.com>
Date:   Thu, 10 Sep 2020 11:49:03 +0200
Message-ID: <1jzh5y9d2o.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 10 Sep 2020 at 09:52, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-08-28 08:47:35)
>> Add the necessary so bits so unnecessary amlogic clock controllers can be
>
> s/so//

Fixed and applied

>
>> compiled out. This allows to save a few kB when necessary.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Thx

>> ---
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

