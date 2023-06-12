Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AA5C7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 09:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234765AbjFLJsb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234769AbjFLJrn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 05:47:43 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9147A5E3
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:32 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-973bf581759so731800366b.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686562382; x=1689154382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wsfv8tU8typbArcFFZ3RmodVuhSCsV+o3+M2ATwIwoQ=;
        b=TUVRaQrj978yj3MbisxqkjQ+TD0JBBm+EutSEaAHeOCuts1Q0j2OuxULpIx2+Bsi15
         ltrB5Na0agI4WZIIGzJAK7rc6fkrTgH3/y+DbfbT7KocetCj2XbBDy8QAae/kCI03fcV
         qqb5R0jk/XnngPe6DCxaj7C2MBSVu7X4Sf2Lbyc3+h624qAUhkiURnZDcXbFrOMcI8Go
         OVnmbrHSlbfViKCQXu3P8DpOOaekybyyjRU7ezTIAYuQczHEHfthZeWLR0Nld+mrVTxZ
         +9dWL+Vn5v8E4pBCcKXcmRdNfkln8Dycfdu6ib76K8yO27yfeZVCqD1kFtV+CUf5pmqW
         wOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686562382; x=1689154382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wsfv8tU8typbArcFFZ3RmodVuhSCsV+o3+M2ATwIwoQ=;
        b=E0bxgnhzsrZUlugC/QCFSjk0T/GiODP61lF8+mMMAS0D5fJXpRqQyAhmHc1QdoCrp5
         vFMP6yAj05PyLW1c2aB61lFgVBFZa40EuE7qKHmNMqK9CpgO06SS9ty+lpLmqq/xaiLx
         OMkhjy4Xj00qOiVRaimi2Y04v49rK++NeOxkqgPj58mUByBia6Wo4TR9vSyOpTsskbUw
         RL/7HL+oclhoGmwSdXXAuqZGHlkf92IelJEzaRDRSJIz13I6+52u8QWOakCCPsH4jpM6
         de4KG9Y6VPqMBCdlmAvWOag6ENu6e/M3CrMoph0lh9plFVTApfCFOCZwDad3oHLLZT5x
         SZUw==
X-Gm-Message-State: AC+VfDwwE4R0uw15UCYJnJuX2oSch5hmTYwSsPaPklhYkC9tk2XC2gZj
        ZuyU3fgQH7TYXTchBKaEcmejKMRdr3YmDxLS91k=
X-Google-Smtp-Source: ACHHUZ4FRCeN8jvFzEJ3tb+8GoTw8KH3QdvMi+2BF4JcQt89B9Ozs9bBPixR/raWCid1tZtHQT9T4Q==
X-Received: by 2002:a17:906:4796:b0:973:fd02:a41f with SMTP id cw22-20020a170906479600b00973fd02a41fmr10476799ejc.40.1686562382087;
        Mon, 12 Jun 2023 02:33:02 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id gj13-20020a170906e10d00b00965a56f82absm4908151ejb.212.2023.06.12.02.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:33:01 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     linux-clk@vger.kernel.org, Adam Ford <aford173@gmail.com>
Cc:     aford@beaconembedded.com, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: composite-8m: Add imx8m_divider_determine_rate
Date:   Mon, 12 Jun 2023 12:32:35 +0300
Message-Id: <168656228135.662397.14806433100721864469.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506195325.876871-1-aford173@gmail.com>
References: <20230506195325.876871-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat, 06 May 2023 14:53:25 -0500, Adam Ford wrote:
> Currently, certain clocks are derrived as a divider from their
> parent clock.  For some clocks, even when CLK_SET_RATE_PARENT
> is set, the parent clock is not properly set which can lead
> to some relatively inaccurate clock values.
> 
> Unlike imx/clk-composite-93 and imx/clk-divider-gate, it
> cannot rely on calling a standard determine_rate function,
> because the 8m composite clocks have a pre-divider and
> post-divider. Because of this, a custom determine_rate
> function is necessary to determine the maximum clock
> division which is equivalent to pre-divider * the
> post-divider.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: composite-8m: Add imx8m_divider_determine_rate
      commit: 8208181fe536bba3b411508f81c4426fc9c71d9a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
