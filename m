Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D32C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 15 Nov 2022 12:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbiKOMv2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Nov 2022 07:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232212AbiKOMvY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2022 07:51:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DD227DEF
        for <linux-clk@vger.kernel.org>; Tue, 15 Nov 2022 04:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668516626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=l9DCj0kCx4cYGdqfJpXlu7fgvdW5ocqgYyNocj0wf4U=;
        b=J2fpWOKXSN/93iGqKMgdCxnB/UkO3iqwnc5ybnySr/5zqI+sWyW86TxasjT8xvqq6trcsb
        IhGundZ2/Jzeq+FTbVK04MwbomcUZepdJDaR8rZd2lgHcpVB2kK9WS4dGoVpj69UjlpJIt
        aB/4g+IletNKfPA3f2ahx+iUKd4hdKI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-436-0DC_UfPeN0OFtAoIs79Upg-1; Tue, 15 Nov 2022 07:50:24 -0500
X-MC-Unique: 0DC_UfPeN0OFtAoIs79Upg-1
Received: by mail-qt1-f197.google.com with SMTP id z11-20020a05622a028b00b003a550fa8989so10146492qtw.12
        for <linux-clk@vger.kernel.org>; Tue, 15 Nov 2022 04:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9DCj0kCx4cYGdqfJpXlu7fgvdW5ocqgYyNocj0wf4U=;
        b=T5q1JnzwTCBg3oLsYWk+SquU0iLBuiQzJizcFU+wWmiT9k1g+gUGHZtgSWgl20SCkW
         lrdZSO0gAY8lz4lKQgmP1imXGnvqJRYgHWsQF7IiaSK8UZInowrz573TQ65ugST6+xBb
         umzuGVyvrrrK+gomyKmKmJLaHoNelUIJIoPaJRmYEve+/7pXVrs6fjIC2nBfPsJx6azk
         7hVxnEfG1eUZ4sxsblpUrNllNj6UVOL7+4tcytM6qi/ovN8MqqaxJk0l3q7IHreTLnDv
         uHCr0pv/XH/TFoMGElXX0PlUk24XJIat2gU+rb52QnaTuPcFSZ5dCUUQq5cdn3PvtrEa
         l0XA==
X-Gm-Message-State: ANoB5pnEaQ6vqwcJfji7vf8ZsjCcVb8MHG+PQ+6kMf+ZYzaxmVXNIE5W
        yo3ags4UfUfueZG+cYs6lVj3DjhtQAjBkyzY83jGYD0r9EwMT5A8PZe0RBx8Enoi7eutOvNLWzn
        Z6VOfkGKRxRKaY4CnIRFb
X-Received: by 2002:a05:622a:198a:b0:3a4:fa82:c3b8 with SMTP id u10-20020a05622a198a00b003a4fa82c3b8mr16554528qtc.261.1668516624433;
        Tue, 15 Nov 2022 04:50:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf53dlb3gmpGIvub1w7SAuwsd2MfqfG78wQcAtKtesih8S4x8a5qEDhjUdFAnArbQGs8s3g3JQ==
X-Received: by 2002:a05:622a:198a:b0:3a4:fa82:c3b8 with SMTP id u10-20020a05622a198a00b003a4fa82c3b8mr16554509qtc.261.1668516624214;
        Tue, 15 Nov 2022 04:50:24 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id f21-20020a05620a409500b006fa4a81e895sm8411248qko.67.2022.11.15.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:50:23 -0800 (PST)
Date:   Tue, 15 Nov 2022 07:50:22 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     andersson@kernel.org, johan@kernel.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-sc8280xp: add cxo as parent for three
 ufs ref clks
Message-ID: <Y3OLDj6xzOVjvEdV@x1>
References: <20221115102217.6381-1-quic_shazhuss@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115102217.6381-1-quic_shazhuss@quicinc.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 15, 2022 at 03:52:17PM +0530, Shazad Hussain wrote:
> Added parent_data as CXO for three UFS reference clocks named,
> gcc_ufs_ref_clkref_clk, gcc_ufs_card_clkref_clk and
> gcc_ufs_1_card_clkref_clk.
> 
> Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
> Link: https://lore.kernel.org/lkml/Y2Tber39cHuOSR%2FW@hovoldconsulting.com/
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>

Put this Link beneath the --- since Bjorn will add one that's specific
to your patch when he adds it to his tree.

With that change:

Reviewed-by: Brian Masney <bmasney@redhat.com>

