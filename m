Return-Path: <SRS0=KYfG=ZE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676F9C17441
	for <linux-clk@archiver.kernel.org>; Tue, 12 Nov 2019 17:20:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B7C620679
	for <linux-clk@archiver.kernel.org>; Tue, 12 Nov 2019 17:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ofkdojRw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfKLRU0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Nov 2019 12:20:26 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55795 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLRUY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Nov 2019 12:20:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so4091337wmb.5
        for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2019 09:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=F9Mi7+/IyXkSUZB/fTNJuaXmyudI2hLv+NhDB5xxcQw=;
        b=ofkdojRwVgmhNvnCD+2JDgQT0KlK5MBV3Sul2Zn31ERD+BYM+PAXwVySBsJDATt2EO
         1sRudy8e9QEsOEj8Zlf/XsDUe52amWr1KBn9SfYRcTP735H727LCNtvI9NrDP1Da2IeA
         uPdil0WXQHUV90rkK8vK/gt6ConlUrBnhH6mr+6e1TTPpsuRSF1ajrAauWUxfKaqAtm8
         xfuOvOpPedqwNWe/JB+uevGYyrgwUHXwtjLyNRsLhTwQTSOBmJBZv0Ku5aLfEXe52zNd
         4MYaQ5XfMpNe2tslllZ6kxVJ0iLsHkF6RQMOXlaEWGJvw4ySss2DR6bs87yAoXhkhvkW
         dyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=F9Mi7+/IyXkSUZB/fTNJuaXmyudI2hLv+NhDB5xxcQw=;
        b=Z+o52Zuqu4mpjy3R2gfzU3U8acu3uLipw76P0aIBAsairc2RnE55p/30fNAKrGF7IE
         nLXnzVKKkmo1N7QUfttnNZ5Ta7fpfSJ/wGTg0v3i8b84j2MIlMZRTzgx455/CTZSLYBf
         Yc1l7w6g1XwTgWhK6jor9YpQnUB9uebvP4Hz2Z626Gz5mGYUJnWdus4tQJvHhCB7smyJ
         iWr6DDO/vWcutq0mKxB3gFqNXEa0D07qEwU5tJbCzHMsx5jOvWxB9DAm4cy/xMPIcVwB
         M9+buaV3rVW7zbdSFBPBVmiWOpV31TQxtYAsktlzyTPKs0lsmkpCOtSPLxaUxq3JsyUj
         gzOw==
X-Gm-Message-State: APjAAAWsqeJ1kErSZvxNv2QcX5nu9raUc313hZvokT2x+SGkQzh5IHe1
        ZCZyqqhcWaxM78v3MaOJaiMqHQ==
X-Google-Smtp-Source: APXvYqzR2tT3ef66DmAq2qnSk2dUDm/RUEfrwxO4e9F/cIoV/ljD0W55pomXTkbTaTNVd0DASTw0oA==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr4515631wmj.61.1573579221902;
        Tue, 12 Nov 2019 09:20:21 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d18sm18576621wrm.85.2019.11.12.09.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 09:20:21 -0800 (PST)
References: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com> <20191027162328.1177402-3-martin.blumenstingl@googlemail.com> <20191108221652.32FA2206C3@mail.kernel.org>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        khilman@baylibre.com, linux-amlogic@lists.infradead.org,
        narmstrong@baylibre.com
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
In-reply-to: <20191108221652.32FA2206C3@mail.kernel.org>
Date:   Tue, 12 Nov 2019 18:20:20 +0100
Message-ID: <1jd0dxf1uz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


>> +static const struct of_device_id meson8_ddr_clkc_match_table[] = {
>> +       { .compatible = "amlogic,meson8-ddr-clkc" },
>> +       { .compatible = "amlogic,meson8b-ddr-clkc" },
>> +       { /* sentinel */ },
>
> Super nitpick, drop the comma above so that nothing can follow this.

I don't think it is worth reposting the series Martin.
If it is ok with you, I'll just apply it with Stephen comments

In the future, I would prefer if you could separate the series for clock
(intended for Neil and myself) and the DT one (intended for Kevin)

Thx

>
>> +};
>> +
>> +static struct platform_driver meson8_ddr_clkc_driver = {
>> +       .probe          = meson8_ddr_clkc_probe,
>> +       .driver         = {
>> +               .name   = "meson8-ddr-clkc",
>> +               .of_match_table = meson8_ddr_clkc_match_table,
>> +       },
>> +};
>> +
>> +builtin_platform_driver(meson8_ddr_clkc_driver);
>> -- 
>> 2.23.0
>> 

