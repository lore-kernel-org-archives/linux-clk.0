Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2C7C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 31 May 2022 22:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348501AbiEaWpY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 May 2022 18:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346421AbiEaWpX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 May 2022 18:45:23 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE224EDE6
        for <linux-clk@vger.kernel.org>; Tue, 31 May 2022 15:45:22 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso4298614pjl.3
        for <linux-clk@vger.kernel.org>; Tue, 31 May 2022 15:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=soARJzRFwOfhwTqrBSydFb3eTupZIjHh8aanzENDqGo=;
        b=DaKQfesYBWgMZS7l6hauTnBkeXrAsQpWA/SrcfUqCE0Jk4qdRiF75ZMTR83iBzuuYb
         fZRaI6d6CGmjdZvTf1XfnpxRg6+9uxbyuYj8W212jJKJwO0H5Q8JCZsEUXaTgbnncO8e
         68/DQDnpbAPHgVI4YRXeZEkkotc9NHonbRnCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=soARJzRFwOfhwTqrBSydFb3eTupZIjHh8aanzENDqGo=;
        b=gXnJsiCJilHKDywpd86/z08yeJFIVTTkaX6erzQNXGqa8pvy9vO0lBiAaMOmztjZ5e
         NQ7DCImTYLsvtJ9MgCnhlSnei15+Tu/ekuR/JOdP0MLk/yXrz1eIt/kF2bTxHXgKiphK
         yDXTYcXsuZV8f4MU1HqlHKbcc16leVjOiWkLGoFASNqo1NeasSQL5FrdvZ+qfvESIXVI
         +3JRLR46ogKjPgSgx7BuFsGyiqxmodkRo/090uRDQP4a4Tjs/2FCBpYRwEizUG6K/kY0
         jeNl1lHCNed0R2jKDV6NnD8vBY6zQrkv1VZ1+4V94ws91WZCt27IxPM/Cmzu8amiMdWK
         YS7g==
X-Gm-Message-State: AOAM532nxmVqawCu2rKoN+DOztCVWUe++tiVYRJff5Lu4zt6EcOnly8B
        dFf8SxAz3J9DS6iV/FzgJaNHxAPtsbVBiQ==
X-Google-Smtp-Source: ABdhPJyTCi9SCIMWA8MxQeCs0arVYqIWniU4YSwlTCDLay/lcWhIyE3cl9uw5pVBbFSzBMIbvLLvjg==
X-Received: by 2002:a17:902:f70a:b0:153:88c7:774 with SMTP id h10-20020a170902f70a00b0015388c70774mr62719133plo.166.1654037121967;
        Tue, 31 May 2022 15:45:21 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e69e:f483:e751:7c7c])
        by smtp.gmail.com with UTF8SMTPSA id 19-20020a170902e9d300b0015e8d4eb1b6sm87043plk.0.2022.05.31.15.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 15:45:21 -0700 (PDT)
Date:   Tue, 31 May 2022 15:45:20 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Taniya Das <quic_tdas@quicinc.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?utf-8?B?wqA=?= <mturquette@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add resets for LPASS audio
 clock controller for SC7280
Message-ID: <YpaagHNk38FLWLVO@google.com>
References: <20220526042601.32064-1-quic_tdas@quicinc.com>
 <20220526042601.32064-2-quic_tdas@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220526042601.32064-2-quic_tdas@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 26, 2022 at 09:55:59AM +0530, Taniya Das wrote:
> Add support for LPASS audio clock gating for RX/TX/SWA core bus clocks
> for SC7280. Update reg property min/max items in YAML schema.
> 
> Fixes: 57405b795504 ("dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280").

git show 57405b795504
fatal: ambiguous argument '57405b795504': unknown revision or path not in the working tree.

I suppose you mean:

4185b27b3bef dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
