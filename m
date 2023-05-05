Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB18C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 12:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjEEMc0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 08:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbjEEMcZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 08:32:25 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16F01A105
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 05:32:23 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-95369921f8eso276556166b.0
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683289942; x=1685881942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5omqk/hpCJeATo0rNTnZV84JSlja//TXerFzgl7Kd4=;
        b=jvwIIPuBxo9RVg2kci2vS6w4S3wac7x/LYTWBMWIET5UDNGLeUG/RonGSskaclwp9I
         T3yLGRcVLgpaYR64TKOQOSDE2f4Xt366YXPTRSArfStsJD7GSkRPB4ibITEg/dKSn/8w
         iJXWecyta8xnNRvQprvjq+KzRzh5OWMvZfXmzUmElundzjM/duf8uArl7c114JdGxGCM
         K/7KXSazXmoFRvJtjzeV+KXy2QOeSTD3HPS0Msa/UGtpAdGefqYAIFMy33sRlQI6tOOe
         lsMfGDsQ5mArJkyVK3cAH6/2woy3VZ++RAa5c63P+0VeX27uIoDFvnUOD/KyhZ+iFP9h
         0o2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683289942; x=1685881942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5omqk/hpCJeATo0rNTnZV84JSlja//TXerFzgl7Kd4=;
        b=Rf5KSfizKpsunX2rgYR05Kk7ZnssX2yoMroUc0dwR/tlolYTLXeXKa90QqnaCrFAIh
         7oQwivOnd7LJGE3UyrEqgsTETEznsMznFWrrDA7FXXaQ3b0MdEpwhmZd3s/Yozf61eom
         Yf2uNlKKVMqyXEv29VgWoGC2k/EtJicml8ffG4kCU6AaJLkQ0gaeeoOhwyu5kD/RdQEG
         iss6euUo8R4WQKgEtFwD55gcsEiLyRVH+XH2ZFwlf06e6N6OfipQUm7vHXrtkaA6F7kr
         uO1w+c8agyipc+zzWSwJ7lL1IiZykscRP6SvBtLW+42bFig6AMmM1WTiuz8W2v65ASrO
         8Ehg==
X-Gm-Message-State: AC+VfDw9p6J0ZH/iGYNxwFqhaK4+Un6aD5UheLviQo/HRzTqo1nY3okU
        twIrHkBx9g2vUJUj9bqDP3+O/Q==
X-Google-Smtp-Source: ACHHUZ4+6P359EPLf/Xig5/oQyDJN8Le9JY0QT5lpJA262gEFJ+jWYEY1pr79v2B+E4zLxTFMf1ziA==
X-Received: by 2002:a17:906:9b8a:b0:931:df8d:113 with SMTP id dd10-20020a1709069b8a00b00931df8d0113mr1272957ejc.26.1683289942345;
        Fri, 05 May 2023 05:32:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7db83000000b0050c04bcc3b2sm1737285edt.64.2023.05.05.05.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 05:32:21 -0700 (PDT)
Message-ID: <14ec49cf-c232-7dee-8dc2-8bc7d40f1716@linaro.org>
Date:   Fri, 5 May 2023 14:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] clk: mediatek: reset: add infra_ao reset support for
 MT8188
Content-Language: en-US
To:     Runyang Chen <runyang.chen@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>
References: <20230505120108.26603-1-runyang.chen@mediatek.com>
 <20230505120108.26603-3-runyang.chen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505120108.26603-3-runyang.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/05/2023 14:01, Runyang Chen wrote:
> The infra_ao reset is needed for MT8188.
> - Add mtk_clk_rst_desc for MT8188.
> - Add register reset controller function for MT8188 infra_ao.
> - Add infra_ao_idx_map for MT8188.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>

Same problem.

Best regards,
Krzysztof

