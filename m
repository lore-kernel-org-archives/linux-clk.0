Return-Path: <SRS0=EXyH=XL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5A0C4CECD
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 19:54:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8556214AF
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 19:54:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mX2Xn+XJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391070AbfIPTyN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Sep 2019 15:54:13 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38605 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391065AbfIPTyM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Sep 2019 15:54:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id h195so560753pfe.5
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 12:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=lrC/Mm8MKJYbyIapp2rG+4YTQFTYoqtqhsULa6M5KsQ=;
        b=mX2Xn+XJuSrIQX/3vRMQ3W21bf2fHZusW/23HHt9zZ96LdU0+hJ7E4PByjU+dH7zYD
         ulY6b4QpLuANuBtNDdJHkGuUh/5d49Sin3OsQ1upuF6MRYF2Zc8V4Ke3MKCoka1L3h63
         GKWf2RWu0iLRZoehcVgZgRmd/GlKHEpPnpYEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=lrC/Mm8MKJYbyIapp2rG+4YTQFTYoqtqhsULa6M5KsQ=;
        b=cgAeAVFg6bj35ucwB/WoMnO6AMqkmbBRk2/NV66SvaiL46qrUtSfXMbd7mhGdqELv4
         TeihzUjSu9ybHUzDoWho7g4SR6vpeFw9pt2r6G1hCYixcl5iJdWmpyWpUSUYbrkaNn7n
         F76y38kq+W5uavcKhNYgKNv/TVj0LEn1zlCjuLge2r2EDwZgHi0huwKU6XFUGjIf7Mny
         3qEMYX9UfeOrE5JWWWVG9itRsnGhzITQFfLHoPg0p0n/edP/Pjlzbe4jxuarXyuG4peZ
         zV2CZNYesGDgtzRo+yQUmW4BQUD/z3f3eXY24sTYlH6d04/yPQa94kaBy1Ke4zYtVt7f
         VlGA==
X-Gm-Message-State: APjAAAUM9IHmKOCuLy6UF7bsGaVvrw6NSQWVI2+2vi/8Vq/2ZoImpzSr
        R7CdAZeuUL+l9+7MEJAN5/zsIKezYdI=
X-Google-Smtp-Source: APXvYqxUk+ttSr+TjZgdfGoX+v3Z9CTe/np15NOWgn4t9uKNcWkEJTPtjJik+Fqf9hb0pS4No35+ug==
X-Received: by 2002:a62:1658:: with SMTP id 85mr56563pfw.195.1568663650915;
        Mon, 16 Sep 2019 12:54:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x9sm29605116pgp.75.2019.09.16.12.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 12:54:10 -0700 (PDT)
Message-ID: <5d7fe862.1c69fb81.8e5e3.2325@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c88947d18c65a692a8f314e4ad996d9d2a997997.1568240476.git.amit.kucheria@linaro.org>
References: <cover.1568240476.git.amit.kucheria@linaro.org> <c88947d18c65a692a8f314e4ad996d9d2a997997.1568240476.git.amit.kucheria@linaro.org>
Cc:     linux-clk@vger.kernel.org
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        ilina@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, tdas@codeaurora.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 4/5] clk: qcom: Initialise clock drivers earlier
User-Agent: alot/0.8.1
Date:   Mon, 16 Sep 2019 12:54:09 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Amit Kucheria (2019-09-11 15:32:33)
> Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> can have earlier access to cpufreq during booting.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Did you want this patch to go through clk tree?

