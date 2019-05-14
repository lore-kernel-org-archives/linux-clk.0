Return-Path: <SRS0=Uhbp=TO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B26DC04AB4
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 16:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A0E320863
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 16:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhVvJi4w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbfENQaZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 May 2019 12:30:25 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:41422 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfENQaY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 May 2019 12:30:24 -0400
Received: by mail-pl1-f182.google.com with SMTP id f12so6499170plt.8;
        Tue, 14 May 2019 09:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uuKK3mR4hA4i4JCsj/Kq1PVxAZau9p6kEToMkCt9NZw=;
        b=EhVvJi4w4BR9xTrJYoWqIAnnSL0+LEY2TwBngqnUTL/PB/ILUwCJeJvNdEm47x5YaD
         ZiseRKdoLAugTw4slONhk7T2X0hWBgsx76/Gv6FkXr0LOyi1dPFIvopdxcQAsihpQlpg
         8yuaw+qFWThLNJXs8PA/Il+0MbEbmF4Dfh6cdLQxjlhDoufXerapcHFIwa9atf7ZsS2L
         aVpWUKg+ubH3ijsSlgce29rXcgIFxh2ECcLYotPERprKx7V0OYGdUth7M0XqdxbLPTzF
         kYUKbumo9mlG4O0kHO8s3+mNCKlnJLkKpqjuwhH4gx91JNXqQRxR0qhW3OzzQZVPixut
         eBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uuKK3mR4hA4i4JCsj/Kq1PVxAZau9p6kEToMkCt9NZw=;
        b=rB/U4M18YBet34ievJpa4Cp2WGSD/mlhex/V1wUb6xrg7FwS7gSnYTahtcjto5eorb
         tNqqF07M/91d9UdRbGfde8InWOIvzOGn2yResWULr1VB5Es3vwUKaqXAGZCmwGDzR2LJ
         SAVA9vKXhuOAcpZF4Sd/HkbIfS1wCh31puOAmuXEAU/VH/7//IRwC7RV13ZoBP2cGs4A
         TiiOcAGCSm7dKThHCJwAklavwvDFv3ZfDP0zb5v/MwEpBA8bacHNtMq8QQZixyY0fqFC
         HGzIdE7ZfB6E+RuaEol1gUKycnpMyFXoL8Wu0/CL+UrUouaWfDq5DXdOg0LQQu7wRp9c
         hvlg==
X-Gm-Message-State: APjAAAURD2Tfa7H++Rrb6VFzfV/mBj+hu0Qb50zkA/iwV9kcXjaKn/+o
        +W2Qpy23eVxlrCxpC5UOsfM=
X-Google-Smtp-Source: APXvYqzs4fyGjlRgOBs0Nb+TzxRJgwCiX8zcvwkB82bJdY463a07ZRC+FtrklJEZ2aIb3N3SD+2jCw==
X-Received: by 2002:a17:902:2983:: with SMTP id h3mr12641147plb.267.1557851424198;
        Tue, 14 May 2019 09:30:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id b144sm23348864pfb.68.2019.05.14.09.30.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:30:23 -0700 (PDT)
Subject: Re: [PATCH V3 3/8] clk: tegra: Export functions for EMC clock scaling
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-4-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <502f213b-2101-9d56-54c9-8be48f1be5b8@gmail.com>
Date:   Tue, 14 May 2019 19:29:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510084719.18902-4-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10.05.2019 11:47, Joseph Lo пишет:
> Export functions to allow accessing the CAR register required by EMC
> clock scaling. These functions will be used to access the CAR register
> as part of the scaling sequence.

> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
> 	t57478018; bh=emd3R6nSFwL5B+aWA2W+bJqcZ1Jhvwnayz1wGOPSA4M=;
> 	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
> 	 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
> 	 Content-Transfer-Encoding:Content-Type;
> 	b=fW7ddx6p6BuGNLGA6jAL5AxsojqeQcOg9fZBqbA1Ze45XU3gt7tiL88s8g7gTftA+
> 	 NdruKRXPLS0r4iOgKqEUf3bmoBP0Kf+l0PQcJu55U5v55XnP6cuKrQw2cmbDaw/g2Z
> 	 a6DZrAIbUZzi3P3b764ZDmUlRD1sHAWWswZwG3kHwBP0TDOXNjAEVcp7NPm868VOvv
> 	 aJrdb6VblknwjNkE6OV7ktGB1ODge5YSAePDLNAplZBw+BFnogtESwvf0cFcYVbxCG
> 	 COh/UNKdlJuOM95IgbZiom9I8NiwuS07bA2WzudSgnMKbhNI6VlFgDu5A6JaPt3Irv
> 	 N4nuUT4+Ln3Fg=
> 

What's that?

-- 
Dmitry
