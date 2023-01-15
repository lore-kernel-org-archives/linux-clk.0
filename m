Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A34C63797
	for <linux-clk@archiver.kernel.org>; Sun, 15 Jan 2023 14:55:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbjAOOzG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Jan 2023 09:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbjAOOzF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 15 Jan 2023 09:55:05 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03585EC4E
        for <linux-clk@vger.kernel.org>; Sun, 15 Jan 2023 06:55:04 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id kt14so3757384ejc.3
        for <linux-clk@vger.kernel.org>; Sun, 15 Jan 2023 06:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+fjIlM6OmjNxjObIgHcNr6Tk1Q29ApTtFRKcgDtpr0=;
        b=o6Mp439e1iebx7w8iXm5UdzGAQ9IXl8u1ClBegubGZO/43LRaqFtlySLJNtpNG/kAD
         st2bkpsWXbruKHFFbSmSbFhoj527wayymTpzWqKL7rMHiQOCa0QZe2lSQD1bYBbOUjcZ
         lpjllh0qT5kcjjer6hw/HR2v/MAyQTguWMgngjSoFnX+cTJMWffJS1MY/OeFQwA02+5E
         SCiFKu8uMDiB2rzbWwS+mCA+4JxDWcJWJERsIuDsuwIlD/potOhfdGYaeI9qB5eb7pN9
         da08yCo0hjpI9wbUMP4E9LRAhmhMX9ZfjcfINf8XwATPX56THh33f2HOagewvjHfS5EA
         d0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+fjIlM6OmjNxjObIgHcNr6Tk1Q29ApTtFRKcgDtpr0=;
        b=sjIlT/psuOW4c5Th8o/rGI9CPuEHpuWpD7wgmUR8a3idRfH8k74IYDLH+g+mNYTsQB
         Lo9oCXmQdqfp63Lq9ZKLXuxOG5gwNFOhIXY5d0aMY0v/htcvMUCw52EHGFr0lJINsYbY
         nxJFPyIR0WH6DN3++Nie2h5B+8zJj2//7pveUzbsBVNBXix8/PlE5PgkA6Q5olwvKV9O
         onCNSqXyWvaIs0HCpvkf4oqLgu33ecnG4vCy6juoKVxhd2rcPjaiLEtTCY2MO9+tiPIB
         dwSzlDwmfzVnaAKErl3b8CereQx1cN+CILH7Kvn+LsqG3LckH1i5WSMIpVjzntHWF7O+
         //Mg==
X-Gm-Message-State: AFqh2kr7MZAoWuZ1ocGvLVGXZY0RsTYtowwV2rZAXJuMeXzEAg01xj5L
        mdNzTbvDoezDinaZY/l4OawwWQ==
X-Google-Smtp-Source: AMrXdXvDfmWEAyTCsu4fdxTjVT8kfSfdYJIvNsWiyUM3VrMX62cXFqXprN6G1ZWDno5Gk03q5MHoFw==
X-Received: by 2002:a17:907:d50a:b0:86e:a013:c269 with SMTP id wb10-20020a170907d50a00b0086ea013c269mr4027806ejc.9.1673794502603;
        Sun, 15 Jan 2023 06:55:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id uj42-20020a170907c9aa00b0084d4e612a22sm7608059ejc.67.2023.01.15.06.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:55:02 -0800 (PST)
Message-ID: <73e99448-f984-10f0-e8de-6233487fbe37@linaro.org>
Date:   Sun, 15 Jan 2023 15:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] dt-bindings: clock: versaclock5: Document 5P49V60
 compatible string
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20230114233500.3294789-1-lars@metafoo.de>
 <20230114233500.3294789-3-lars@metafoo.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230114233500.3294789-3-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/01/2023 00:35, Lars-Peter Clausen wrote:
> The 5P49V60 clock generator is part of the same family of devices that is
> described by the versaclock5 binding documentation.
> 
> Add the compatible string of the 5P49V60 to the binding documentation.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

