Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2643C7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 02:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbjFLCZw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 11 Jun 2023 22:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbjFLCZv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 11 Jun 2023 22:25:51 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2C4E47
        for <linux-clk@vger.kernel.org>; Sun, 11 Jun 2023 19:25:45 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30fb7be435dso661248f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 11 Jun 2023 19:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686536744; x=1689128744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZKG0ffrkcy1xii/drViWf4QWyfzui60KGk55lhMEuw=;
        b=AYXs+BNS/C3jqjKVjMdVPoFBYjntnN4UTZ+btsasdNT1GNiuLtA7tJKG3Qcj5UCSOd
         u6+vaNskESi7SG1rL0LF0yiLoSpTj4VSn0dxFw2VX4ZgJBe8Tx7iTEC0JquXZZesQ9j6
         nbVkduqTVANFu3t8PHaAN+RUsWnMWEMlzF2OcnY9gW+RXkqOhEFLKqKCwusxFq2UlO6O
         z5TAc2031fIgsLnPMBbT4V46ODxRXQKYAca1/WEdiTb98qzX3t/mvsuQUCyoIflOBcjS
         A2hN2RWCAF8xeMExRmeHINcOjVWzGZ4vhTeA9zT6lmB4dS6W8mQE5JUKc7Yny/ZF+n5Y
         YerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686536744; x=1689128744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZKG0ffrkcy1xii/drViWf4QWyfzui60KGk55lhMEuw=;
        b=GJUA4Wdg4aRuvyWHiRLp71umW+KaXiCGyYs6Dkur4CJPMkKUoOuc4+3JuEahavz1eh
         2EGZRMUlkwvExMZDNJK+7ogmnD+u+MAL2J3MPDgzlt+OCy9mdOi+RobctLqCVJuqC/By
         J8hEma8nBfOE0oan1gWynsakU5MTBhbjuVhocmsxbqmmUnjKALY5J3pW3mhVZp+huelp
         GIBh5wpCo8VvvUry6tvJntIhZ2wQsjqUkKFVBV+jnZgH5RVlwO7qxrew3z1pelExA/6T
         +GkeEFhKONoWcyhz8VIbcvUMCJXcp9+H2LMQZ6s7ZxgM8QtGISiDyzZS/jUjYInVX+wl
         tv1A==
X-Gm-Message-State: AC+VfDwZ+59leb9RBpTcSyZ+7imHysvs+i4KI74uYcbmAx1Pim6lDPnl
        8DHFBtsyrYVfvHB69QZjswjsaw==
X-Google-Smtp-Source: ACHHUZ7Mo0TD6O9mkw5mKyecmLn6CRnZGtRiAqjqHg5t5KHVLq7hJN0qZ1A4oqj02qkAEndI2fWRZQ==
X-Received: by 2002:a05:6000:191:b0:30a:ceb3:26bd with SMTP id p17-20020a056000019100b0030aceb326bdmr2854711wrx.56.1686536744219;
        Sun, 11 Jun 2023 19:25:44 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d4349000000b003079c402762sm10934057wrr.19.2023.06.11.19.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jun 2023 19:25:43 -0700 (PDT)
Message-ID: <09ccfa54-5ada-8dff-03a2-b2ffb07a58c1@linaro.org>
Date:   Mon, 12 Jun 2023 03:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V4 0/4] Add camera clock controller support for SM8550
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230609115058.9059-1-quic_jkona@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230609115058.9059-1-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/06/2023 12:50, Jagadeesh Kona wrote:
> Add bindings, driver and devicetree node for camera clock controller on
> SM8550.

This is very confusing.

Your cover letter doesn't detail any changes and your individual patches 
all say "no changes since v3", "no changes since v2"

If this is a RESEND then mark it as a RESEND.

Good practice is to for example add a note that says

"I looked at updating the yaml for the camcc but opted to do this in 
another series" or "opted not to do this at this time" or "it doesn't 
make sense because of X"

https://lore.kernel.org/linux-arm-msm/546876ba-970d-5cd5-648e-723698ca74fd@linaro.org/

Could you perhaps RESEND this V4 with a log that explains what has 
changed from one version to the next.

If nothing has changed then don't bump the version prefix with RESEND..

Second thought even replying to your cover email with the changelog 
would do.....

---
bod
