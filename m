Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7DFC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 14:04:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6C1760F56
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 14:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbhJROHB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Oct 2021 10:07:01 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34806
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235581AbhJROE5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Oct 2021 10:04:57 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E99933FFF7
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634565765;
        bh=n+gqCEKRjnF32ZwCp1GL3/Z2MQYyrJF+G4qgFNA43e0=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=o4YnGiLvyx2/v8P8oVboRzacLOU8XljM3eO36ioH4y9d4V128yD69Ajkgzdd51ntP
         IQ/4ITDVUSaGN/LgAVmaTRtwMfFxr2YjRmJjN4pBEGgy9kTWLiA0SgzDRx6uo3bM6+
         HFv7/9CzFbT1XgOPZW7nTUMStuM4F90y+ikzkzndRa1OJ1VjZKYgXw7IqcPQZSE3UX
         C6i4SeZqMHPVm0b6ZWd7AfYkxMl1cqHBEo8d/oy/n71GLzq3cZ8Gx4C0yGnLQxTZWU
         GF7rld2UYmvdDWLLRpuIjUMrnyLn6VLUa8Ngqg53Uow28CTm9q9laDfvdY4iCQVHFl
         nWD0aGc4nieKA==
Received: by mail-lf1-f72.google.com with SMTP id k18-20020a05651210d200b003fd86616d39so5143010lfg.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 07:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n+gqCEKRjnF32ZwCp1GL3/Z2MQYyrJF+G4qgFNA43e0=;
        b=IlRFSYPHB1FqDDv49kNCGlsuVwuVCirN3/mX8Og1M8IYSp2x/lWnmZsylej2WB2Atf
         IT6eCtFyuPxWen77ys0Bj6K4w/TaHAvXma2RHwr5UQ5hqJJOwAYRnxiYjRKDP5i1+Ky6
         6zP5kVLfubLyvMc+NTYRd/aXZt/jTCJH6srzEufgNTKH7dfhBHiSMfdqPSiZOcF2KkKc
         OfuHBNxw9vt2CWjxNik+YHeiQz9RTt2vetBrCzAAAA+jLrMqreRxMBkCFQROKnCEn606
         +tOnLIvVCYGhHeTlxgg3HalFXb5Cg9Jgohdt31JS6QRe/3jUocpVJSC8etOd8c6LQ7wZ
         DHhw==
X-Gm-Message-State: AOAM532a6pKgLlrUEXXEMsECVjcjU4vAxcRU48jkVUY44QsKF2rZBTj4
        im4m0fSmvw/1Vn9oSDSO5vXUhcxCMc3yUR0Lxjr12boswhKtZ+uNc+QA5elng9UsnLIzrjjuw28
        KsNl0dCM3PA7c8Lzzj4E40hxh5tD8Jgu4CHbKJQ==
X-Received: by 2002:a2e:b4b3:: with SMTP id q19mr31771861ljm.508.1634565765285;
        Mon, 18 Oct 2021 07:02:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvK1fNjhyEFS2oGW6l1ztV/o6AF6Lw+s7c27H0NgbVIkuDuZ7oTlW87vyRha/egtx0W7mJFA==
X-Received: by 2002:a2e:b4b3:: with SMTP id q19mr31771832ljm.508.1634565765137;
        Mon, 18 Oct 2021 07:02:45 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d20sm1411576lfv.117.2021.10.18.07.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 07:02:44 -0700 (PDT)
Subject: Re: [PATCH v4 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
To:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
 <YWCT+YL/9qHbF9f0@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bb1f4be0-ca2a-e327-0831-f648a2ca3ab3@canonical.com>
Date:   Mon, 18 Oct 2021 16:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWCT+YL/9qHbF9f0@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/10/2021 20:54, Mark Brown wrote:
> On Fri, Oct 08, 2021 at 01:37:12PM +0200, Krzysztof Kozlowski wrote:
> 
>> This patchset converts all devicetree bindings of Samsung S2M and S5M
>> PMIC devices from txt to dtschema.
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/s2m_s5m_dtschema
> 
> for you to fetch changes up to fab58debc137f66cf97f60c8471ff2f1e3e1b44b:
> 
>   regulator: dt-bindings: samsung,s5m8767: convert to dtschema (2021-10-08 17:24:37 +0100)
> 

Thanks Mark for the branch.

Lee, can you merge it and apply the rest (MFD)?


Best regards,
Krzysztof
