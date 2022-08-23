Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770F7C32774
	for <linux-clk@archiver.kernel.org>; Tue, 23 Aug 2022 07:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240995AbiHWH0h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Aug 2022 03:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240048AbiHWH0X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Aug 2022 03:26:23 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF5462AB1
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 00:26:22 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l21so12696882ljj.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=J8u6XOZ3+5OnWV7Suub07jp0shX2a4U6qT+9ErWtKF8=;
        b=rdiAI00J4m73YNSjc72UGiqtKoXAQu6Yr/rrpWO2d/NmA8N3/OVbQKAJGlNRvPZSgs
         zEUWfUoX6uYAPAIUWydf/YGyzuW7oEbDFlDUQG5g+cZ9sFsjuDhbafJJHQjQho7IQBjG
         EcmYhL6p9ixjHE1NXHoU49fmuq+hXqI09eoVJ5qDw/ojjM7ZBEETWci2y0xo8iAS1G5+
         iBZRpilSP4wxjYPRqh77mWtQlK9iA2ujsYvICpiyuUT/On2FO3vc26n8qxR5UwNAmK6K
         Jaz7WS/rCUBNPEnau0phXbWDJYxjJyBXSn4QFwDCNV18iLTSkN/2cVuJS8jzbQOhKfby
         0Rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=J8u6XOZ3+5OnWV7Suub07jp0shX2a4U6qT+9ErWtKF8=;
        b=HwO3diJYB1B+ysIPLxuP5kKkWEbTfMskpwMqa/zY02WXlmeLQMl5qmZr+YNPBaqHRn
         Ad2paIQ6A6ABScD9RyiP/BWu3HpKf7VAGBEhnInGW3/99r6/pkn6eq3ZfxNaQ6hxuQgZ
         68WJtECa1zkT1quH2gSTX3FRe+pxSmk0aceAf0OeI6TwvdCO5PfbwqAxsgMGiacmTrDI
         1ZHMy5N3aBOfLxJ2es8e5pMdlW3wSQxTppmN5ErnMeiRUwZWHyuEpVIhRJm+Q1v1Sj1c
         qO43d18CUdIGh9VtOwWZghuxWDiQZKBySq4e3VTo24gaLVI6+TvepxLlQTle+j3h+kuA
         gctQ==
X-Gm-Message-State: ACgBeo1vug4sazza6KBvB9bpaYgzevrRO4cnGbVhy8BMoCGdAuc0qixZ
        YIu+ssOVoZ/Jr4Ev/4c+R99fIA==
X-Google-Smtp-Source: AA6agR4ZZMX/TIi9KSCwYaiXNNouo3uMLZC2yG375OWN8koaYIlump3d0dtq6WBYXtoVvZD+/f1nSA==
X-Received: by 2002:a05:651c:a08:b0:25f:dc16:2161 with SMTP id k8-20020a05651c0a0800b0025fdc162161mr6967570ljq.165.1661239580417;
        Tue, 23 Aug 2022 00:26:20 -0700 (PDT)
Received: from krzk-bin.. (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id i24-20020a196d18000000b0047f8e9826a1sm2357410lfc.31.2022.08.23.00.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 00:26:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     cgel.zte@gmail.com, s.nawrocki@samsung.com
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        chi.minghao@zte.com.cn, Krzysztof Kozlowski <krzk@kernel.org>,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com,
        linux-clk@vger.kernel.org, tomasz.figa@gmail.com
Subject: Re: [PATCH V2] clk/samsung: Use of_device_get_match_data()
Date:   Tue, 23 Aug 2022 10:26:13 +0300
Message-Id: <166123956379.357728.9628049310036670425.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307033546.2075097-1-chi.minghao@zte.com.cn>
References: <20220307033546.2075097-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 7 Mar 2022 03:35:46 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> 
> Use of_device_get_match_data() to simplify the code.
> 
> v1->v2:
>   Add a judgment for returning variant to NULL
> 
> [...]

Applied, thanks!

[1/1] clk/samsung: Use of_device_get_match_data()
      https://git.kernel.org/krzk/linux/c/777aaf3d1daf793461269b49c063aca1cee06a44

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
