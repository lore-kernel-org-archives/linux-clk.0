Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11DFC04FE0
	for <linux-clk@archiver.kernel.org>; Mon, 14 Aug 2023 10:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235904AbjHNKMB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Aug 2023 06:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236304AbjHNKLn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2023 06:11:43 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FD919A4
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:11:00 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe4ad22e36so38221525e9.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007859; x=1692612659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nb7ZlCUQfDJARbtOUt/biUfmJL7GIxKwjMBKR0qftWo=;
        b=DyIvt7Nx2tZKhMH0O3e+GOQBNk1EuYEB13JI5sUaJPqOj5E06Amto/Dw51fdGjeSKU
         GZaJTA5JEn+4l1xBpb2rEtkKGn6q34hdJy/JzNLNCqdeHe5c6H61qWF+IO71AtLnrTPu
         u3w0zMor+/ZnPt+I4uDb/xcAiUSUL119pNYSHG/HaOgDDoLJWDT6xQkPs+GvTqJx32pD
         luW2L5bq69bfVRNQZWCSophfu1XenyqQRq2EZ9mGj0DUGMtxwBp5feGVf94peRQKvP+e
         pdbH0G/Qq/vwq0hirShL8sIKqFY06fH/OptdQKX9DwCr39YHrIe1g9cqvY1U5Kytm8aZ
         if8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007859; x=1692612659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nb7ZlCUQfDJARbtOUt/biUfmJL7GIxKwjMBKR0qftWo=;
        b=JjqPs3aRThx5FxDB/Gql2r4B5JK2OD0XpO4RexndNX9zsVJTaJQj6bo+kbmf93x4uk
         pR8VSTrMNIIum0yZfDqrKyyiSSx/l32Nx11qwDUCKKH9PWSAkj6415N/a6h2ALVr93TL
         grnWuCY6gJvhWlh8UkKbRXt7qXMMZXhS35ooULyM404bghsSEgb++eGweFOWKDqTILSW
         6k9j1Fk+wE5sRBMUNP4uZmxPIbH7qNE6abeZ1wn4xbx//weRW3iy4Quq4CuPq3ZT337L
         M2b/jeBhMbUT0o+sB+Vh36jrHg0c9m4iCp/K+6YYiBuTcVXtGaF+AX2r4JSYMe8SeGCo
         6OZw==
X-Gm-Message-State: AOJu0YzrYhXfu2D00+7Yvd9sky1DW5w1srmP0/T3fI8ew3ZOc5UC6W0C
        ExUFz40O+V2K2uUvXYG4kUfPKg==
X-Google-Smtp-Source: AGHT+IFy89Mv0DhFk9eX+/djm2ymoeplyfteQc9mWueaCQHifiQjTckSV6qNHnCJHLd0SgAfYA3LTg==
X-Received: by 2002:a7b:cd19:0:b0:3fe:9a6:f44 with SMTP id f25-20020a7bcd19000000b003fe09a60f44mr7475061wmj.32.1692007858922;
        Mon, 14 Aug 2023 03:10:58 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.92])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b003fbaade0735sm16750396wmd.19.2023.08.14.03.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:10:58 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        rasmus.villemoes@prevas.dk, adrian.alonso@nxp.com,
        aford173@gmail.com, a.fatoum@pengutronix.de,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-clk@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH v2 1/2] clk: imx: pll14xx: align pdiv with reference manual
Date:   Mon, 14 Aug 2023 13:10:01 +0300
Message-Id: <169200755849.527063.13119807931380198015.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807084744.1184791-1-m.felsch@pengutronix.de>
References: <20230807084744.1184791-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 07 Aug 2023 10:47:43 +0200, Marco Felsch wrote:
> The PLL14xx hardware can be found on i.MX8M{M,N,P} SoCs and always come
> with a 6-bit pre-divider. Neither the reference manuals nor the
> datasheets of these SoCs do mention any restrictions. Furthermore the
> current code doesn't respect the restrictions from the comment too.
> 
> Therefore drop the restriction and align the max pre-divider (pdiv)
> value to 63 to get more accurate frequencies.
> 
> [...]

Applied, thanks!

[1/2] clk: imx: pll14xx: align pdiv with reference manual
      commit: 37cfd5e457cbdcd030f378127ff2d62776f641e7
[2/2] clk: imx: pll14xx: dynamically configure PLL for 393216000/361267200Hz
      commit: 72d00e560d10665e6139c9431956a87ded6e9880

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
