Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234BFC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 29 Nov 2022 07:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiK2HEI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Nov 2022 02:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiK2HEG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Nov 2022 02:04:06 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06955391F7
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 23:04:06 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id v3so12193641pgh.4
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 23:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqRqQmGINSYGe8Tx8ZinpbocEq98MVy/i6usceXG4j8=;
        b=JSLdTBUPXDgRtxyyrDBCUDbk3s47tFa3OK+WR8XhC+F6h3iSS/C3APkQ1gSE9DyF4B
         TW67GOeJHogxlwm0P3tKgnQp01XZN/tMHLZrIpV85ti88TJ5YF71IhqEjuP2rRTdcJmu
         V/eF39QuBmYVD43qLvte1gQi9CWVfE84weNvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqRqQmGINSYGe8Tx8ZinpbocEq98MVy/i6usceXG4j8=;
        b=nXEn5PBfNHapS1mw0r4vPiuAoyAojKnSiL6YApqS+CPH/ngyp/L4hYV7SaJ8Bl9m98
         +k0QdJEy87VXTccez3HvRo8w5SxiiK05Di2TqOLriHt0i7I/SIDkq/AuXGV6h2gdyaKL
         Dx4EGwlm1a2DjPhIGDSgMbzH33iXxMhLnzc6emdGfwJ5ygfwT+odph0VeVvDBObZQc8J
         w//PKHUJdCkGX5K0c8tVvjJrY+uWvzwCFb6WbNLh+cWqNjCO2nPVL0fVdWCHSS2H53OQ
         FVdF0k5JehQCeN/X/DFz+cQEaWNFjKgDqm8ibkS6Eez/DvIyPkUGeX9tpjnU/cHwbyGU
         KmwQ==
X-Gm-Message-State: ANoB5plDX0dWXbDoLuA5wTiYqWIjF+O5J4Q55rNzJbjtpwRBA1WJIbQx
        PrpuJHu9Bi99JCFpRDDTmf/koQ==
X-Google-Smtp-Source: AA0mqf7ZhgrsG/6bRNpLxQD514hH+WiNV31/P7bdJvOlpHSDLUkiQtF8yvjzS2TPYcCbWyNig7EIYg==
X-Received: by 2002:a63:cd44:0:b0:478:1391:fc43 with SMTP id a4-20020a63cd44000000b004781391fc43mr8581291pgj.431.1669705445763;
        Mon, 28 Nov 2022 23:04:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ac4a:f96:259:b58a])
        by smtp.gmail.com with ESMTPSA id y69-20020a62ce48000000b0056d3b8f530csm9140261pfg.34.2022.11.28.23.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 23:04:05 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     daniel@makrotopia.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     angelogioacchino.delregno@collabora.com, sam.shih@mediatek.com,
        Miles Chen <miles.chen@mediatek.com>
In-Reply-To: <5e55012567da74870e1fb2edc2dc513b5821e523.1666801017.git.daniel@makrotopia.org>
References: <9bde77be-f4ec-11e7-e645-7c4465bcf6db@collabora.com> <5e55012567da74870e1fb2edc2dc513b5821e523.1666801017.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2] clk: mediatek: fix dependency of MT7986 ADC clocks
Message-Id: <166970544357.607733.13538698332065182238.b4-ty@chromium.org>
Date:   Tue, 29 Nov 2022 15:04:03 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 26 Oct 2022 17:18:07 +0100, Daniel Golle wrote:
> It seems like CLK_INFRA_ADC_FRC_CK always need to be enabled for
> CLK_INFRA_ADC_26M_CK to work. Instead of adding this dependency to the
> mtk-thermal and mt6577_auxadc drivers, add dependency to the clock
> driver clk-mt7986-infracfg.c.
> 
> 

Applied, thanks!

[1/1] clk: mediatek: fix dependency of MT7986 ADC clocks
      commit: a46315295489933209e902638cd287aeb5f982ab

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>
