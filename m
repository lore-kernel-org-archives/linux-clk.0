Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485B5C7EE43
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 12:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbjFHMwL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 08:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbjFHMwK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 08:52:10 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7651198C
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 05:52:08 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f61530506aso5149765e9.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 05:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686228727; x=1688820727;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=z6n0c0xP9FN5uGAILD9NjsAV9epj4Frj8P4gs3bw0Po=;
        b=GRS3xh1u23fBnqStOSk4PdDpquoPz+HN1q7QL6hIN3TZyj6awfu02IPYJrI7zsgdAQ
         EATgx08BDJ8VyCXqa1n5UKIxuwoA/hk9HYgdOuVYelqUBu5RLAbPu7oHmwnZbdVaDRpV
         K4tGHvNhez6lPhs0LxfILc4G3yH/lf0QdmfQa8WN7iKW3CAyZzv/PKPqhAXjkiCJScdg
         OlYQD1Snzf9GM2kSa166IcHBol7WdCclNEX6bqpr17VZz+EP8SkaUOCLzEWNhC+Gsfl0
         MLsVQgP2wgM1NVFAqQgoKuUL3o/jRz80W0YjwTkZNPBb7pTRSW1Ga53QfsQqVz8bOGcE
         d5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228727; x=1688820727;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6n0c0xP9FN5uGAILD9NjsAV9epj4Frj8P4gs3bw0Po=;
        b=Bo59Xn/Qo+HUvrtojYDBdMBPwrL4GDBLjQecfVg2kebSgEGJUgFF4SQ39UXLFqq7uT
         y1VVPBeNG7updSL3mljFG2QYa2jZetAhZDHhGRrtuyuTY21BfOJlLMO2Ntn5ETVM1dn9
         lG7+xZEgJ1am6YC3/WMYkQruuQuzoUKv7vlRT2ljaX2/0nuM40ghYraJPCN7swqoQ0PG
         Yqki2UOuzidGLBFItNuNj8DWVt8b1u0ejeZJERDNewfO+1qwVK7WPM0EsGXuiW8pPuQl
         POBt0U2U+O/g0U1JDLPspRaEFZVP0YgWDzR9RgGAyn45Ra611bWSdgJNexWlcrUAQpgH
         omFA==
X-Gm-Message-State: AC+VfDxVyieLkPTKR0yUHFlo8TX606pnkcorwG5m3o4ss/hKdDiTKrQJ
        bTF/UM9ezcQ+duyOcIYnlpxAfG65V65q7DWaS6M=
X-Google-Smtp-Source: ACHHUZ6GT7PI8+BTn8MUBlyokSGpVd7fQSsMLvRin9z+sPl2yp+uzZlmskfMCJ88JLPXSfFUwzkpAw==
X-Received: by 2002:a05:600c:3645:b0:3f6:692:5607 with SMTP id y5-20020a05600c364500b003f606925607mr1396359wmq.40.1686228727165;
        Thu, 08 Jun 2023 05:52:07 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c021000b003f7f1b3aff1sm4925691wmi.26.2023.06.08.05.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:52:06 -0700 (PDT)
References: <20230517070215.28463-1-yu.tu@amlogic.com>
 <20230517070215.28463-4-yu.tu@amlogic.com>
 <1j5y804q7u.fsf@starbuckisacylon.baylibre.com>
 <73acf297-3f60-1ce1-2f05-af048aa37199@amlogic.com>
 <1jttvi9vnq.fsf@starbuckisacylon.baylibre.com>
 <20230608113244.jvf7w4flwjy5soud@CAB-WSD-L081021>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        kelvin.zhang@amlogic.com, qi.duan@amlogic.com
Subject: Re: [PATCH V9 3/4] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Date:   Thu, 08 Jun 2023 14:46:54 +0200
In-reply-to: <20230608113244.jvf7w4flwjy5soud@CAB-WSD-L081021>
Message-ID: <1jh6ri9kwb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 08 Jun 2023 at 14:32, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>> 
>> Neil is currently dealing with the dt-bindings, please
>> * Adjust your patchset accordingly
>> * Wait for his v2 to land, you'll need it.
>> 
>
> I saw Neil patch series with merging 'private' and 'public' clock
> bindings parts. Should I send the same patchset for a1 clocks after v6.5
> landed?
>

I think Neil's patchset is already dealing with the a1.

We'll see if it can be part of this cycle PR. I don't want to rush
anything and rc6 is coming this monday. It may have to wait for the next cycle.
