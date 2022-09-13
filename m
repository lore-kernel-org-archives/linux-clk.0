Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258DDC6FA82
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 08:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiIMImS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 04:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbiIMImR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 04:42:17 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00934BC98
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 01:42:15 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id r66-20020a1c4445000000b003b494ffc00bso401098wma.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=uHI+VOCSCW3ZSm7NbyJIsIOScib0Mbu91hSQOT5LSy0=;
        b=eSoqJr59xHFMg2AJgVk4/HbOsxFWh/jZ/SJ45WAQwM8jwVBs34X3kBdtRzqWjx8Bwj
         Nt19UhRQWlv/a24OhIbAUhRLhvfCF7OnE+eFRRag7CJnmgljdYN2rs0G9yAvzNfoSpBi
         upLYcF2uSTm68WRBhmo27+El3PT4KIVimNltE3qgLw+pyRj9XwFFFZnuDFYt3rPa0IBk
         rmvKdXzhucSd1JxFVBl0qQNqt7OYrKmZfs2rVylmSL8rel+D7X3iBqep/t++g3c3ZqbZ
         WHZ9hW7uViUVY1pIm88fbiJ0EC/Fo3DPlVQbzv4HNYKjNoqPXkOWG9A8n3D1Mm2zHMP4
         9tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=uHI+VOCSCW3ZSm7NbyJIsIOScib0Mbu91hSQOT5LSy0=;
        b=WI+pOw/Bxlj96pRAiutbsLly/lDWs7UXcSzEyRouTDQQEYVjaB8c3N2Y116y8k8K/0
         D5UGiTZ291/vIBTZO2LfAkoBPRbsuvnjtbK+VIwg4bSKLaXw6ZEelTi8n2LJiz0yUNtk
         Cjkq/WJbjMD7l/y5+tQRnxBknHQSmR69Am25L9+rhaAxhJxvXKafa7AqDFxwYLOJZ3Jv
         2YljZHgYDop33UySmk9CNP4hxi2CkAzuOoiNjWiP13jGrf5purvMxyq2KubRIz57NA9I
         SK6CtzlqmQ1QLfIYS4zLfNtAHEeoBm9bSCzP3CDyIGNAoDYuY+J4nGLS9PNVXQ6+81TW
         4Kzw==
X-Gm-Message-State: ACgBeo0Kg4P5wKlLz2Omk53Jr9jBxW692y1ekMnGmDSuqeQP/2puLCuM
        Rxes92fc43VHs4fc0IEsQS3D3miT2gUHrg==
X-Google-Smtp-Source: AA6agR5eeVrU4xs/t3Q0Lg2UG9Xin+2EdtdiWEL1NX1uRclOgWPZz0YnCK8lU4TbOhwQfAarcizn3A==
X-Received: by 2002:a1c:6a09:0:b0:3b4:92fa:8b27 with SMTP id f9-20020a1c6a09000000b003b492fa8b27mr1510521wmc.115.1663058534486;
        Tue, 13 Sep 2022 01:42:14 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id bw2-20020a0560001f8200b00228c483128dsm7085049wrb.90.2022.09.13.01.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 01:42:13 -0700 (PDT)
References: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
 <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
 <09befaaf-b34a-aeda-5dd6-6bfae4b01163@amlogic.com>
 <1jo7vswmjw.fsf@starbuckisacylon.baylibre.com>
 <52b07db2-7edb-0373-c6d2-df67917f4af7@gmail.com>
User-agent: mu4e 1.8.7; emacs 28.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>, Yu Tu <yu.tu@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND] clk: meson: pll: copy retry workaround from
 vendor driver
Date:   Tue, 13 Sep 2022 10:42:00 +0200
In-reply-to: <52b07db2-7edb-0373-c6d2-df67917f4af7@gmail.com>
Message-ID: <1jleqn3btm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 06 Sep 2022 at 20:29, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> On 06.09.2022 17:21, Jerome Brunet wrote:
>> 
>> On Tue 30 Aug 2022 at 14:33, Yu Tu <yu.tu@amlogic.com> wrote:
>> 
>>> On 2022/8/29 17:54, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>> On Sun 14 Aug 2022 at 23:25, Heiner Kallweit <hkallweit1@gmail.com>
>>>> wrote:
>>>>
>>>>> On a S905X4-based system this call fails randomly.
>>>>> The vendor driver has a retry mechanism and on my system
>>>>> the second attempt is successful always.
>> 
>> Heiner, ideally commit message should not be about 'your' system
>> but describe what the system actually is. This would be more useful down
>> the road.
>> 
>> Based on Yu Tu feedback I'd propose
>> 
>> '
>> The PCIe PLL locking may be unreliable under some circumstance, such as
>> high or low temperature. If the PLL fails to lock, reset it a try again.
>> 
>> This helps on the S905X4
>> '
>> 
>> If this is OK with you, I can amend the message before applying the
>> patch, or you may resubmit. As you wish.
>> 
>
> Yes, please amend the commit message as suggested.
> Thanks for the review and follow-up.
>

Applied, Thx
