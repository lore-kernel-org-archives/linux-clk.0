Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D890CD6E56
	for <linux-clk@archiver.kernel.org>; Wed, 11 Oct 2023 10:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjJKKGS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Oct 2023 06:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjJKKGR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 06:06:17 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45BFA7
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 03:06:14 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32d81864e3fso760071f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697018773; x=1697623573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fub0OLah+ZMrfmMWsVbsLKTM47lsXgX5eYB01m9XKeg=;
        b=lNcMUYxSa29cIYJBrzq/qq9ttz3a931rjwd1IbHtGxgKOfE1jzieGw8fRmQU3jImwN
         uh9yHYhOhrgHkd87r8bzxPeWKXdys5+w592YKb+ZEAZMUvix3szbkrntlv6LKkhRgh5j
         0BKCcwi9BQKEFAtTy7LxduhVBjNtHs/AeKM+HLK0jQUsI/tTzj+ZXRaxsx+7xNmafhCi
         SBcmABTzi8qb3hxQj9j9YSRzd3ssRwVuL8IbZ+FJWrer6Ia4QDCfgybNvGqeDF6Bee3g
         RE/nM0+kWU1EqgKwaUG2G1tEs+4nG1uTQ6lL7683k2ONPKxJQvMMJb6oIqzpNhKz74MV
         yCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697018773; x=1697623573;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fub0OLah+ZMrfmMWsVbsLKTM47lsXgX5eYB01m9XKeg=;
        b=FxIG6pR86trDyhPc0ndBqxLP4fDKpse+sry4lMY6Y0vz4gCsWr+8ECt7G54z3s4keM
         jmJvCnpG6xJO06FKEsUqxctZT5pFLv0beYkGuyH16Yt/SZs36NSt06HOh3c3Oe5RPcy4
         SlDsG9cWthVbLokoieRMFMBO0H2MKDEx7KWzwUDm1n0yn/OdmaxXY9o8H0vrJH6xJU05
         P9ALKt1L9DZsgGw8cfrpqy+AC3dD5ptJxP7f1glatIideVf7i+ibDc8Zluq1Qh3+fC42
         XAaohNBZytX+Y7oS2+QXkL+USKVhHWHzwa+K8KBsXe4DnCpsJGqTBCDzRt8XlEvxZTXC
         5sAg==
X-Gm-Message-State: AOJu0YyZJ66XOHibzYnu6dsgq27y5syjbPR3b34TgyWHWrfj2kkRXy28
        0xGD5yNbepvMErosSwFdZxLl5WEJRUPi2nQPa8euKA==
X-Google-Smtp-Source: AGHT+IGt3zAFGhPUYx7XidslsZDz+pqj1w2FqJtNDcptwK+tW2l0dBINQjidP+IuFvFen9VS1DII3Q==
X-Received: by 2002:a5d:67c9:0:b0:321:5211:8e20 with SMTP id n9-20020a5d67c9000000b0032152118e20mr17369654wrw.59.1697018773010;
        Wed, 11 Oct 2023 03:06:13 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b00323293bd023sm15155625wro.6.2023.10.11.03.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:06:12 -0700 (PDT)
Message-ID: <abf17440-bddf-4289-a951-bb3fd3951be1@linaro.org>
Date:   Wed, 11 Oct 2023 11:06:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To:     quic_luoj@quicinc.com
Cc:     agross@kernel.org, andersson@kernel.org, catalin.marinas@arm.com,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        p.zabel@pengutronix.de, quic_srichara@quicinc.com,
        robh+dt@kernel.org, sboyd@kernel.org, will@kernel.org
References: <20230923112105.18102-4-quic_luoj@quicinc.com>
Subject: Re: [PATCH v9 3/4] clk: qcom: common: commonize qcom_cc_really_probe
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230923112105.18102-4-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Lenovo x13s
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
