Return-Path: <SRS0=NsDS=XS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDD5C4740C
	for <linux-clk@archiver.kernel.org>; Mon, 23 Sep 2019 08:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FE5A2064A
	for <linux-clk@archiver.kernel.org>; Mon, 23 Sep 2019 08:39:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IghFe3Y9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbfIWIjA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Sep 2019 04:39:00 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39493 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729394AbfIWIi7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Sep 2019 04:38:59 -0400
Received: by mail-wr1-f67.google.com with SMTP id r3so12903239wrj.6
        for <linux-clk@vger.kernel.org>; Mon, 23 Sep 2019 01:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=nwiGQiE38HtZcmw6CWeBg4qfY5GYbo0p333nLt6wTfk=;
        b=IghFe3Y9bi1OIf+T0BVbUqifsHRXMu4xWRUWvzexMuhJ4MorveaatsE5c2GnCI+84a
         Bqx0FzIXkolcI77UhylFeOKxmtwpKe9AUMcjHExUAVS+hF6+GX11MENc6c6CKLisbkhU
         b9Ts9JV5TR8s7v3h7HczUFMlV75yIvoSso+xPxb2dWoJGiNJCOVjR0+SvNXGapK7ocsa
         HGGW4pVQf7UAT44HCNRvqfwXb1IWJyD1YzR9fLdLsLMHoEzNFWJy5uxlqyzsmbeJ7NPI
         foBJjIBuJRCnK//2IKw8qaIOokqj5JUovfoGEVLI+AkqSB2yHohlwvIpAIpd4546nJUR
         Q80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=nwiGQiE38HtZcmw6CWeBg4qfY5GYbo0p333nLt6wTfk=;
        b=mko0VPJlV4PGh0Pf+gkyF6n4O9J2L3r4Utg3jWbIG2aTk69eTOyKKiclWL2bUC5v2A
         0UVdK0InB7cDLU0yRHN7QAmQSEqcuah67qp0ZUOXZLdc4DnbVwsxgbYY5ZTpImRHoZHH
         Smbq1bFrqncfaxATVTWyOXA1J9iOr033CblhRhERTyAPaU/FNXpLT8hUgCE69DOw7MR4
         uvQI8Pu+7ewRzwURUx/5uK4lq5e0G/xbWU3beVwiWCG4Wzm/zR2R8Z2tYx3CfuWLxhuk
         A6imMhEr+kcBRIv7uUh32JcBD0Xaatgt/K66PfQjvNfzuPHpxpdyThMMQm6my8++wMRv
         8Hdg==
X-Gm-Message-State: APjAAAUeR7Gu29ffNThOWUHf+dyzzH3YZSxAszNVBQ/ROehd/k022Eje
        4Pr6RgDODSIh5l46EMrsmvdOx6c/OY072g==
X-Google-Smtp-Source: APXvYqw3ZqNhDs1DwDmXDjeQ+UCFX7R57TXtgHP+2m5w6ijcpVvYw+PpPwVSLBebaiNyvUoQipm8bA==
X-Received: by 2002:a05:6000:45:: with SMTP id k5mr20259104wrx.259.1569227937789;
        Mon, 23 Sep 2019 01:38:57 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n7sm10988940wrt.59.2019.09.23.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 01:38:57 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/1] clk: meson: gxbb: let sar_adc_clk_div set the parent clock rate
In-Reply-To: <20190921150411.767290-1-martin.blumenstingl@googlemail.com>
References: <20190921150411.767290-1-martin.blumenstingl@googlemail.com>
Date:   Mon, 23 Sep 2019 10:38:56 +0200
Message-ID: <1j4l13tnj3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 21 Sep 2019 at 17:04, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The meson-saradc driver manually sets the input clock for
> sar_adc_clk_sel. Update the GXBB clock driver (which is used on GXBB,
> GXL and GXM) so the rate settings on sar_adc_clk_div are propagated up
> to sar_adc_clk_sel which will let the common clock framework select the
> best matching parent clock if we want that.
>
> This makes sar_adc_clk_div consistent with the axg-aoclk and g12a-aoclk
> drivers, which both also specify CLK_SET_RATE_PARENT.
>
> Fixes: 33d0fcdfe0e870 ("clk: gxbb: add the SAR ADC clocks and expose them")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Looks good. I'll apply it once rc1 is tagged
Thanks
