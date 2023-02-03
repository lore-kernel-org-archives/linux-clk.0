Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB39C6379F
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:47:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbjBCGrE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:47:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbjBCGqj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:46:39 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16AF8C437
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:45:39 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id 6so2111779vko.7
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DXxrQE0DVwanxphrseUxAjJiqhp6uGNf7pcWwsgpWEg=;
        b=nWROuR0pj1Pl1TSRysKSwzECG02ERncxdz5Du78MZoQovrXI7EnpmAXBHYV5IJbpU4
         NMvgfqCm5s1STqR13XA1OTJIeUbSOpfB4XZ06Pv9JsGb8y1l23NZr2iCmtEjTorgnC+Z
         2JY5IQuTGFbBtjM9mVNKXtzsroj8K8xFseTYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXxrQE0DVwanxphrseUxAjJiqhp6uGNf7pcWwsgpWEg=;
        b=e7z7vbnZQrlTVQGUvpektflS+K2Ibd/7M3WM4vEhZqgHpDoMf4pxEMxVl9mBAaYxdP
         52WEtGKo23v6Z4BJIFU0R0kJ6qTffsZF0cIsRJtDQ2rIP4BV8mrvp1oJmBgq09NFJ8AJ
         9nl25VXIInJVofpIBmhs82+Y5kGVPP7fcMqKmvTIYjACNO/zzngF+caXo+PEGzaNcFh+
         0IMdx2k2y/ROv1GlWtTHlGgSZQjk3TWVbZDpJaJU6DprZ9WTQmeSVXxeXRCxqO4i1Ndg
         fx60VDv+HOKCRNgjuRGcgYVKHyeRwyUW1akXdoOktJTnmUDc2oqANVf4jthTWtZ2Wn9I
         lWFQ==
X-Gm-Message-State: AO0yUKUykupPCkbzSqI0JwsOJQVSw1milWsxRoxKg3ngg1EauhzZezuc
        yek8tN8Vmd7EYGAsE/BoHKt1HziY7n9MBBXh+6W+wA==
X-Google-Smtp-Source: AK7set9N7s5GDlQRAmXm5uyJjoUg5jz6AF6KZ8lCLWBstusXFXE/r5U/501lgDv8HqpdHYNuecgcaP+dbJ30rnvNNUU=
X-Received: by 2002:a05:6122:131:b0:3e8:8f:f3a7 with SMTP id
 a17-20020a056122013100b003e8008ff3a7mr1316397vko.30.1675406738947; Thu, 02
 Feb 2023 22:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-5-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-5-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 14:45:28 +0800
Message-ID: <CAGXv+5GBG2Ehkth8atwueajdkdEGzb3UK5w8H4G98uRVd7U+Vw@mail.gmail.com>
Subject: Re: [PATCH v5 04/19] clk: mediatek: Add MT8188 peripheral clock support
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

On Thu, Jan 19, 2023 at 8:51 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 peripheral clock controller which provides clock
> gate control for ethernet/flashif/pcie/ssusb.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
