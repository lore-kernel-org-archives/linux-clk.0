Return-Path: <SRS0=HIww=U3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A26C4321A
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 17:57:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85D0D2083B
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 17:57:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QidYQZ1e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfF1R56 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jun 2019 13:57:58 -0400
Received: from mail-pl1-f171.google.com ([209.85.214.171]:38102 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbfF1R56 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jun 2019 13:57:58 -0400
Received: by mail-pl1-f171.google.com with SMTP id 9so2874382ple.5
        for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2019 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=JXDx5Of53xKpwKzie292LEzpOCIt7HdxAp/TZojOC98=;
        b=QidYQZ1e5tVfpSNlbzJAwZ1PSEo4dbT1h4HX6qlUhaYy/0WDP2DbYNFPTucwsPtXtJ
         P5Da3q4BSmLlg7YBmA0owHM1bUPrEb7BS8gzdHoNIWge3t/+SscDfMMBa3vx9swwjY5n
         LFvDrn5pgiwG3LzawIGsvptYLxKuORQdAVK4jqhJjDPscsuEl0XBsIcIhtmOUiqLnY31
         rl5J0Is/8LGOWfkwroXrx5lrTEZnf+8x1H9rCHGrYrmt0cwF3/5ZHvKqdnUE5x9l17cs
         65Qi5bpDUOP3xQ2tieEt795doUy4MrobU1fhvRK9NMQeo5arbU4RPh5V9yXTVNhCQ2rL
         ovHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=JXDx5Of53xKpwKzie292LEzpOCIt7HdxAp/TZojOC98=;
        b=NTmU67Td1xpFowmHyxnLJfJ1w9eNvi0p6yS0/LaHt9pGB77Y/A3BAP10YOxErdljki
         xylUvhT+LizYK1EUNpWk45Lqvusw69HOAF10nW0/kVq54be7IaodZk5Z20Ak4xcHFIG+
         4G5AAoUHxCUXpzyQeIhpk21TEena/qbHPc5T3KLykiH0D2WqVbM60y2g6+FdkU6tXEiF
         NrMLPHeuNGb35Gpz9ZJEehZH7m26KVL6z/MXYRnYPWZjphXionVD37boN7RL43Q8xf8F
         jsF3qaUABh0LGjLRkbzV+DkEpUhlP2TUBDJQCpf4VHhxxxa+FQvZtTRumgSXC2Wf05Xd
         hn2A==
X-Gm-Message-State: APjAAAULWh7y0NTk/Ywdp5p5z1N3X5rvPysHbFGxUmPvbqeq8t1zv5Cl
        ol5tnza0dTcZAPttWy6PvgQF/g==
X-Google-Smtp-Source: APXvYqxBvlNYSLn6PRoeEXRuFeavrw3x9z3+yywP5RFfiMDYAfvzlGijWI2kL3fNFlbko9TEHruOVA==
X-Received: by 2002:a17:902:3341:: with SMTP id a59mr12892929plc.186.1561744677360;
        Fri, 28 Jun 2019 10:57:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id c26sm2814912pfr.172.2019.06.28.10.57.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 10:57:56 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC/RFT v2 05/14] soc: amlogic: meson-clk-measure: protect measure with a mutex
In-Reply-To: <20190626090632.7540-6-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com> <20190626090632.7540-6-narmstrong@baylibre.com>
Date:   Fri, 28 Jun 2019 10:57:56 -0700
Message-ID: <7hsgrtr3rv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> In order to protect clock measuring when multiple process asks for
> a mesure, protect the main measure function with mutexes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
