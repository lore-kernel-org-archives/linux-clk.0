Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933A2C76196
	for <linux-clk@archiver.kernel.org>; Mon,  3 Apr 2023 20:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233487AbjDCUnE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Apr 2023 16:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233486AbjDCUm7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Apr 2023 16:42:59 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD38D1717
        for <linux-clk@vger.kernel.org>; Mon,  3 Apr 2023 13:42:51 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v1so30674384wrv.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Apr 2023 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680554570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsXZOUmTIvuqTGRRSXLCxsQtjq6NOtSPfGUe7/3UZ4U=;
        b=SCjfQ0wynXd/hEqjm5VLa5dKgx5CYR3zFbfTC4wZpXBq/eli5xIqtZU2jwQgBKIMIW
         gQNGtYoN1cSl9NermspKi5hw2mOaIu9xO7knhugSTLEK39qiB3BZXJcoGqFO5zJCMzJy
         DQa8nXgOPl5XdyyvqWcP3mSmGwwm89v+slTQAv6Exx7UU+zFSYFXHwiUgL6eHFyugVdd
         Tp2yEmAddamwWhkukNXg/sN4vjpcdtImzR+ADRIlZzXLfP+OrQyvMuDcKMccpndiPR4c
         xHkBBBmBymipKMnm+DSlOK9gaOFdwoaPMJe2u6tKuhdjQskn8ye3iywT7odBXgp6TWOY
         F+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsXZOUmTIvuqTGRRSXLCxsQtjq6NOtSPfGUe7/3UZ4U=;
        b=jfD6fLWjNuVpIsXfaQhxrlzAF8S47F9WRW6DFr2l/WBSfPdoA36Nnl2QTw+wXD0KcN
         nG0+p1KEQqBzDAKKjCskIyt4tRzwzTWwkimPtYgeJMSfeRS1WwGxJPnnu3TmHi7RzURb
         SOaHbsX1df7Ijg/A1PGDYkqCWlPFiweIqm/OwD1h8W1oNrrx0kPULak5JJOn2IF3k5Vf
         B4eZyf9CP3MiIW+hWtUjYX7KLv78B3uSsL+tal3eR1hdQfo1mE1ZURmCAA0IeJOnzMus
         0UfGT3vXr5hOUUZw60lwbtb1UUf4GwnAu0a+tlKBFdF7yqbzaqcQ+ll01aa1dKnN3RKm
         x2zA==
X-Gm-Message-State: AAQBX9c25uA/PMMJfAV/YumMGIPVpXyjOoXrpx4waq78r3CMhiU66nY7
        bv5oOmQJaq5OOSWujhcF4yLb0w==
X-Google-Smtp-Source: AKy350bRnMTIJx7ByEQuSeqfOccO7KEea5y8X9Kxm2W+PX0m4hanzgsekcPwBv/6NsA1PGEqYV1XVQ==
X-Received: by 2002:adf:decb:0:b0:2d2:471f:cf6e with SMTP id i11-20020adfdecb000000b002d2471fcf6emr27653446wrn.5.1680554570109;
        Mon, 03 Apr 2023 13:42:50 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id y16-20020adfe6d0000000b002df7c38dc3esm10564165wrm.87.2023.04.03.13.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 13:42:43 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     sboyd@kernel.org, abelvesa@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, shawnguo@kernel.org, mturquette@baylibre.com,
        kernel@pengutronix.de, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: drop duplicated macro
Date:   Mon,  3 Apr 2023 23:41:53 +0300
Message-Id: <168055445901.2178600.3873641347083873753.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403082728.3199849-1-peng.fan@oss.nxp.com>
References: <20230403082728.3199849-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 3 Apr 2023 16:27:28 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Drop duplicated macro definition
> 
> 

Applied, thanks!

[1/1] clk: imx: drop duplicated macro
      commit: 79ef82c55a37b9c3605602c4909db84481c9fb2f

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
