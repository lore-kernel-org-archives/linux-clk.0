Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022AEC636CC
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:23:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbjBCGX5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:23:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjBCGX4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:23:56 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DDF4ED33
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:23:55 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id i188so4353514vsi.8
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=87XVyWNqDZs7OnynGfVzLfoOyWepgm8p9Mf1bGJRDhA=;
        b=R+yrD6SZeW3NvQBjviyOyHYp6ou3qyz5Ef+Q1DOKtEcnv5KLX2fJ8IYoW2fAiLuwvn
         M8HpKfYkv6EDwINyv1bjkZVZrUvV6BvZ+S20c8cqG7VvhYupNPsggSIZWCsRApY9lkCi
         ijuc4soU+v7kDYz8Q5eQSBHNJw0OTeMtcIRRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87XVyWNqDZs7OnynGfVzLfoOyWepgm8p9Mf1bGJRDhA=;
        b=l+t17Sa1/zek1/7VSnZJg4juBnZ5nfCGO20HW6KUq7q4XvtKZU/aDPzv5mOqutdU3Y
         Mk5dtJXha6Ht37SH5vrdbqZdds9ut1ccyK2/LPOr5v8Y4EbpDyihVoR8XkO1i+thMdB5
         PPXY7272vsB4fzBjtMsbLQoyYjdhPs1y+GWVRH2o3a6hdUiCPO43lZgZWh0OsA65IXJR
         NKg1NOhLCvOEYb5rh4O5gAThTooML07HHz2nCP5gNmGDpG0fwZrqro3+Kn2VH9rglqAy
         PE1GKeBBHEYFLDFaN/HBItNo+CgaDzF691W7NGpZQquergMnIbfXbrpWgUYo0ZEJIK86
         pCOg==
X-Gm-Message-State: AO0yUKWzd0rBNUnW2xSyLQPmPK0FWI6w61gzBKiHf9mt6I/0tQ+QHqZt
        y2ELH/x9u/FsJUOKrpWh53j4600C2Q7OxAgiXBAdvw==
X-Google-Smtp-Source: AK7set8tKApF3KpW1F9+oUsByrETerJjqd7LwwHR/1bzmqGkRDHXiULZXnQLIlhRK3pyp8ur/uPZ2RsN4nlsQmw4Zls=
X-Received: by 2002:a05:6102:23f2:b0:3ed:89c7:4bd2 with SMTP id
 p18-20020a05610223f200b003ed89c74bd2mr1649078vsc.26.1675405434514; Thu, 02
 Feb 2023 22:23:54 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 14:23:43 +0800
Message-ID: <CAGXv+5F-4Tyf1Yn7BYYMkPVyRQffEpx709F6+T65M1J+LfUPvg@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] MediaTek MT8188 clock support
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 19, 2023 at 8:49 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Base on tag: next-20230119, linux-next/master

There are some recent changes to the MediaTek clk driver library
that makes this series incompatible. Could you rebase onto next-202302xx
and send a new version?

Thanks
