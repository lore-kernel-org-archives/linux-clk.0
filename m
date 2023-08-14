Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD51EC04FE2
	for <linux-clk@archiver.kernel.org>; Mon, 14 Aug 2023 10:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236246AbjHNKMC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Aug 2023 06:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236374AbjHNKLp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2023 06:11:45 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D88171A
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:11:04 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so37792565e9.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007862; x=1692612662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaXuPYqFCt1cmjyTonXoDUuLsOvVzVy8hsMCkW5COjI=;
        b=bSZ+/4DNFkKeUladW5jBTnvjRx/qaS/6iW4dZtbTJm38E+5ad7uWL9AMgasZ3llT0I
         PDRy76FrGf8RlBnMtm3W1VFdT3kP6bXg9Q8QJkoHPYGr5r6wVLnwzSjzfGhmOZo2ayR3
         DHYgavRaCGHyr9k/1EocIc+NCGu3Ph321AxJhwY94CxyBXWNq1sM2NzVXAdhzhRuA0sT
         dxX7mXAAWctFDbbtY5gmPC1eL9SLDoTXYGE1fy6Q+S0bsIV/4LgnNTe792x02K0eFh5F
         PkuMNyiuXgYM12DveOXhOfeU9UCLiAoFVFbjq1YLgmqQsdb/3VWysQ6pd+MnAYXfDn1v
         zc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007862; x=1692612662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaXuPYqFCt1cmjyTonXoDUuLsOvVzVy8hsMCkW5COjI=;
        b=Yv6ITwxuz31YwVcwwZnTdFb4Lg5LB1Zw9N3xPS/KM0NgudDBBCXp7HBPw7qC/S7YDI
         XngEoBVWwz2UU0Zl1bGql0rVYfH0ga7wDs46wpSkfMPra4qbnMwX8/hltCfMLo2e6L4H
         5Szg2ROgeZ9SBqHINhILpWCXztEXMTKdk093cdCUn4BXDcOoYrPq54Op9YYFhXFThat7
         Z1Kywj99AKNIC3B4SZUr9BmaGBNYWaic0ghbNcHexZXKBbilrXMOBb3Ro0LwRQjXTg5y
         u4sJXKBNFzSkrQ8LEglM05dp1OjKa99HfGxvRmKSHjhkYqODfp44z0uRO0ccpyy8Un+i
         b7AA==
X-Gm-Message-State: AOJu0Yy6sDMJrOMQSAl3UIFNCyCVwMOYXWy8Phd/2iYx3YaHp/UTLfuX
        LluMoYnFOD6M7xtaTRRKVA3Kzg==
X-Google-Smtp-Source: AGHT+IGZPHA+4ZqAgm+/n/NGaG1qCgAGrKpvZpUTdFrXfR8fObUEhvPkLDdn3AhuUSwCV+8k2c4eZw==
X-Received: by 2002:a05:600c:214d:b0:3fc:62c:8275 with SMTP id v13-20020a05600c214d00b003fc062c8275mr7326938wml.35.1692007862509;
        Mon, 14 Aug 2023 03:11:02 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.92])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b003fbaade0735sm16750396wmd.19.2023.08.14.03.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:11:01 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ye Li <ye.li@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 1/2] clk: imx: pllv4: Fix SPLL2 MULT range
Date:   Mon, 14 Aug 2023 13:10:02 +0300
Message-Id: <169200755846.527063.15298642342561865531.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625123340.4067536-1-peng.fan@oss.nxp.com>
References: <20230625123340.4067536-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sun, 25 Jun 2023 20:33:39 +0800, Peng Fan (OSS) wrote:
> The SPLL2 on iMX8ULP is different with other frac PLLs, it can
> support VCO from 650Mhz to 1Ghz. According to RM, the MULT is
> using a range from 27 to 54, not some fixed values. If using
> current PLL implementation, some clock rate can't be supported.
> 
> Fix the issue by adding new type for the SPLL2 and use MULT range
> to replace MULT table
> 
> [...]

Applied, thanks!

[1/2] clk: imx: pllv4: Fix SPLL2 MULT range
      commit: 3f0cdb945471f1abd1cf4d172190e9c489c5052a
[2/2] clk: imx: imx8ulp: update SPLL2 type
      commit: 7653a59be8af043adc4c09473975a860e6055ff9

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
