Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23B2C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233276AbjBUD50 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:57:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbjBUD5Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:57:25 -0500
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A314323117
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:57:18 -0800 (PST)
Received: by mail-vk1-xa2d.google.com with SMTP id g35so2035398vkd.6
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=abwOXxZAy2IWA1v+hcnlmlYBnF3pC1N5e091p0+kqCY=;
        b=EYsbi0WbjzmeajfB7FkE1Sjn42SiG07kszNQeO4bmzmFEM3nEblatl6GYqTtXZrNeM
         bGN+diyzDKyYVX7EBpeM8lWiVi+dOB1tlZgN6uuGW5FwTN8nabv/nGbnH9xBGZxzq3Lv
         H7hOty45Ro/kRV081gCkzdrR+rBqxUA+gBDiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abwOXxZAy2IWA1v+hcnlmlYBnF3pC1N5e091p0+kqCY=;
        b=KL13v8cawwcosK0jQcC19nzZBuj8UXoLM6B9pmSoJlNz0zfsjan64jQBKyzXKa3l7z
         bTB9vqsrAP8QqiSxYcJALAGqiR9HQAGvtZAMLLkTqxe7BAPnweiGzOhuAUL3bVQWktL9
         qLEhxxH/ASb7FAXO+CCOtEDYUqcKQ5ZbVSLtW93gMlSSR+KRjIR107gVrC9R6IINesu4
         GkOp3uXQ39XGSmr6xcplX9qnHBgoEGDYphi5ePFJC6QwWWd85G3JNRNwdI8qayK1cB/o
         RywIt+WyPCRIaTJjtyKHiomuwkaiPzRYbDOo54qc5Ed29g6xX4JdmJe757z5Y69YwfWW
         NGLQ==
X-Gm-Message-State: AO0yUKXsW3ZEMFNuldS/vom2EysPKVy3Ka2lOhbBIQOQSmlqbeSDLuUt
        PpNMHpPLt/732/ZM1Zf7xiXJGirOoCRCsvKb57zYpA==
X-Google-Smtp-Source: AK7set85+8uGYvX/31NEkS0PijJj9uGf3ECBO7SgPA+DVMmlvxh5qtMlrAAK6g4OzKVTncAREBChRQihS9f3vpZC++0=
X-Received: by 2002:a1f:a3c8:0:b0:40b:9:82fd with SMTP id m191-20020a1fa3c8000000b0040b000982fdmr814221vke.18.1676951837787;
 Mon, 20 Feb 2023 19:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-52-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-52-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:57:06 +0800
Message-ID: <CAGXv+5HjKuNLYtieHO4T1MXN7Uovz4oALqcP1DVAowY=h2c0Lg@mail.gmail.com>
Subject: Re: [PATCH v3 51/55] clk: mediatek: mt8135: Properly use
 CLK_IS_CRITICAL flag
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
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of calling clk_prepare_enable() for clocks that shall stay
> enabled, use the CLK_IS_CRITICAL flag, which purpose is exactly that.
>
> Fixes: a8aede794843 ("clk: mediatek: Add basic clocks for Mediatek MT8135.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
