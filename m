Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D18C04FF3
	for <linux-clk@archiver.kernel.org>; Mon, 24 May 2021 09:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 608C261076
	for <linux-clk@archiver.kernel.org>; Mon, 24 May 2021 09:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhEXJkD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 May 2021 05:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhEXJkC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 May 2021 05:40:02 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48554C061756
        for <linux-clk@vger.kernel.org>; Mon, 24 May 2021 02:38:34 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id p7so24102391wru.10
        for <linux-clk@vger.kernel.org>; Mon, 24 May 2021 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=zHFH7Plck20fV+guAcmidVBsnyZcvavYbuQkUm8U9zI=;
        b=mKRuK76nF+Y6y2U20Pv7Z/CyAKe4Rjy6qHBLniv2W4ZJVtoJEb3rF7qXJ06S7BVrbI
         7yEDNW1NxJLWVjdCqs1qD81bibm3OL4Ld/+xIk8qTUVfW656t/hh9TpKOOfdxOr58CUC
         zM4zEliSMrKeI3r45bC5ieA3Na0ljCUpPYLwepxCk1OzV4w8zSuTyWkGDlT12n/wzzyQ
         OSUUTvyXM49Dk1MexccKaV/8WBZY8siAUtl0D3XiI83+aa0B60FBTd5BVamKgXzjedp6
         eXSeRU3ppcqq1HGxUAPuVSeogXVjng0NtDVzpaaSW0rkG52TcyIJ2HPsIqvrCee6OBVq
         63eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=zHFH7Plck20fV+guAcmidVBsnyZcvavYbuQkUm8U9zI=;
        b=nwURHGfajZB43d9CI3Wn6RjXHfIWJlb8r+4CF5lxbCyurhVuUmOzsqYATizqoEiYNL
         L8+p8VPceVEBFJtoKu8HnMMy/iNSjSjGQ2GNyXCLf2kjBG9DySDpZ00Q4DVWeq/paqCF
         TYTOKWPqP+W1x5qsfE2Bsbm6cc46xwIRigMv+9WctH6WHfL0GqjjDePs0nMxkaai8C/m
         un4z2msuWAZrifv8DZj0FIId7s56m3ZaJu4Uq/lXOP9tU9qA0hkWuaTgZ/6dtvP6Pxvl
         wG5ul0lo8PcF/5av0blTInFtChsEle7vIIqX8FJK/qbdkR9m78u+tTmKIjsZlu4QvbXo
         UpGg==
X-Gm-Message-State: AOAM531rwPXBgM6SSS5+qN+p3QeuBWGc1j+55/eLw3c33+gGAO4Jo+sf
        A1p+VczccOIkOJIVyBFsruTPGA==
X-Google-Smtp-Source: ABdhPJwK/tWaJpBRU28y1BG55+5omYls82OT5wCKeAK/at6GNOVMWYAiaT1XZMuaZi9erT7XOfvH5w==
X-Received: by 2002:a05:6000:1c2:: with SMTP id t2mr20755996wrx.424.1621849112854;
        Mon, 24 May 2021 02:38:32 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id i15sm11445544wru.17.2021.05.24.02.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:38:32 -0700 (PDT)
References: <20210429090325.60970-1-jbrunet@baylibre.com>
 <df839588-1ff2-2d7f-4364-2b0d8942d6ef@baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
In-reply-to: <df839588-1ff2-2d7f-4364-2b0d8942d6ef@baylibre.com>
Message-ID: <1jv978bhew.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 24 May 2021 11:38:31 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 20 May 2021 at 16:02, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 29/04/2021 11:03, Jerome Brunet wrote:
> Sorry for bothering with the DSI stuff, I'll fix this when we are ready to upstream DSI support for G12A.
>
> I had this patch for a while in my integration branches, so:
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>
>
> Neil

Applied
