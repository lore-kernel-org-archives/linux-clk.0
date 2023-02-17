Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A88BC05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:32:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjBQEcA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjBQEb6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:31:58 -0500
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47561498A5
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:31:56 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id 12so46022vkj.13
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4SdDgKb/8CZXVcKHrb27WnrCNDKmHhMmCt+ahSI3BnQ=;
        b=FMljJubHsaElsWtwyMPXulZVx0IzoKTmNdVRohhh7riEQHGrlvGIBoR3sB0Mu/nIFm
         A9y0Ki7HGc48I3sBUHZ7bLd3wMFIGTw11+I2NmLAGHq7AJq7ueVSGe9M7K2Ju1j/JfXX
         l09jZwu6wpq959VEoDXibwYYLzczlamKVQ+g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SdDgKb/8CZXVcKHrb27WnrCNDKmHhMmCt+ahSI3BnQ=;
        b=YyAtHaXvUA7M8ah6WvLKYVdS2NrT8w7AYWW42XqP92Hcviv+QavfEdNE0YWGMEk3Ma
         bdfo85j8SibeNl0rETjQpJRPcQu66NjbWz53txnR2RU8w+WRzv+sbzzXvH7OljEmXIAU
         8P6VhVbL9SgWJjt0SZm0ehGKjvJu9CSAFt3W3tNKFORR+fBlz0NiiJm/LMm8Q+amZuzS
         WoLGQU+YeM8ci3naWyBLroATDLdhvIWLbvdqaF8xRYIxXoeQvV88c0VGRIJV7fNvBBQ2
         dnhhVkvK6VVOgi1hzEzN56Zw3CqJMT1ujgQEb9PHhFH0E2IgY6+5Ltfiez5TBZ4ldeUI
         n7Nw==
X-Gm-Message-State: AO0yUKXu+MLE/09lKV2Vr3kBw6rKrut/QZME6Ska/fv50UJvfbKvn5R6
        CtTayVmaQm8qqsn/btLwCxzkYQJ4FlWcFJkwcFMNZQ==
X-Google-Smtp-Source: AK7set/LyxXRr+sumZROeJO4s16ExGKjzu7tn66ff/AESIRiG79BXtzTjOtZ6FIsoLoMABtdoYQCkZ3lJRoMNXtGZkk=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr1327876vke.2.1676608315967; Thu, 16 Feb
 2023 20:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-39-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:31:44 +0800
Message-ID: <CAGXv+5GVzk6ZXfhgCRkK7HbjQq0K6geFjw7Fhno02cdNtKCF1Q@mail.gmail.com>
Subject: Re: [PATCH v2 38/47] clk: mediatek: Allow building MT8192
 non-critical clocks as modules
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Allow building non boot critical clocks for MT8192 SoC as modules by
> changing them to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
