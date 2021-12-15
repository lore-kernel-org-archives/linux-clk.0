Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E54C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 22:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbhLOW2a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 17:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbhLOW2J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 17:28:09 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF29C061395
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:28:02 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 7so33666205oip.12
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNJXnvSs07GTtLLZAuVX1BCNo0uRWcG5BRLFd99VBjs=;
        b=A6zQSNgY/7S9UibonlY7GfSGeBaqyjarUfTYqvUlQXaV0tlgG0NUP9PtTH+N5A/9Yt
         46hgsHRPUfipDEr5quShnJww5ZffRZjBVypstFvCDx64BUQqwoLL2foZALrOXKjUzBIv
         WzW5JooFuEZR7L/5CmxsDu4mIN0IXxtOCLPVIM77QrpIHEH68vFUEkZ1UMn03IVZ6XcH
         couRncau756a1GAs8tE9XWSEOjKEV4CThLSPisxYPvYzHOyIpKCKwexHspDI4mTO+Zww
         6L+WcPQp/uretBg1tA3ZQZXa1Y7kA0LyxsHCR0losMbsCnfCqaipbFvZUchdGSj8E4FQ
         5wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNJXnvSs07GTtLLZAuVX1BCNo0uRWcG5BRLFd99VBjs=;
        b=wiBGaOBKqoQ8DeE+ec4TJ8PopBDuVy9Ry2u4qBh/9zQLsLbgNNCWY4LaAaKPvCFpVn
         heG4aeJSm4vEVYxMqvY1e2PQWQLekhCgedWkMuiKsDb+L59Qe8NFe2DXoR5Eubljyk89
         RdVuryffxQO6kB5wBwKfNfHvz5nmUJ3iu/TBPYBnYsv6iHA0uugTUy+65nNLHXxmmw1n
         YZbO3548kMbT+oeFYnysijrHnrnds1nleGklRHL/7uaEWo2799P26k39V+vvYbr/63wS
         0TJFsjwyKvMBdJz0NJvFAYmuBVHoE2PugEKbjY2Hp9b/PzFYseTh0W7eoCC6IT17MGBu
         DFxw==
X-Gm-Message-State: AOAM5320KrtT0ykUpXbqNYE4ft42R6cZ1ZRfjHzzmAhlV7uTB+2GqImE
        UIfewpfZUZtXEhEJ+QiH1J43bg==
X-Google-Smtp-Source: ABdhPJwFXYdPBsDmuwPjYm8A5yZhkegTSZzeCJ0fMZ0B4URuSub04avPSXyXP3No3NVhP8fEqIASsg==
X-Received: by 2002:aca:1c07:: with SMTP id c7mr1861598oic.133.1639607282108;
        Wed, 15 Dec 2021 14:28:02 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:28:01 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, quic_vamslank@quicinc.com
Cc:     manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v7 1/3] dt-bindings: clock: Add SDX65 GCC clock bindings
Date:   Wed, 15 Dec 2021 16:27:34 -0600
Message-Id: <163960723735.3062250.15848772572019435761.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <e15509b2b7c9b600ab38c5269d4fac609c077b5b.1638861860.git.quic_vamslank@quicinc.com>
References: <cover.1638861860.git.quic_vamslank@quicinc.com> <e15509b2b7c9b600ab38c5269d4fac609c077b5b.1638861860.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 6 Dec 2021 23:32:49 -0800, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add device tree bindings for global clock controller on SDX65 SOCs.
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: Add SDX65 GCC clock bindings
      commit: 8f8ef3860d4403d1bf0887380f9e3376be092c40

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
