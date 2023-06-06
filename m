Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09572C7EE2E
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jun 2023 07:40:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234792AbjFFHj7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Jun 2023 03:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbjFFHj4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jun 2023 03:39:56 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D072106;
        Tue,  6 Jun 2023 00:39:55 -0700 (PDT)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6255C6602242;
        Tue,  6 Jun 2023 08:39:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686037194;
        bh=AyLGC1kOoL6K0cSmbrR1fdDN+OihSXHNH7vj0pD3n1U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=h58UPlb6KYpmLMV5A0ofTOXvFjiRuWAwgeIgz3fLUQwLflrDZ+eIUrI4La1g3WuCN
         beAEFScwk03oLO3bft2kb+a9ivOkoEQab3SuMjoaLIwY+D65q/lhp9oq4jdeQiGFNP
         dfqc20gg0Cg5GkAnNUTeoP5qoeoGo7kS75HJUGVo3Y+uPyCC4pcWHtGvblufMNZu2W
         K7B/GvRfRb45SjzZ2/B44ERPckJOyxAE4h4emHximPGoE5QM+GTRQs52w4DhHuQITr
         jQw7HkfrZlCcVA5bBJEfUT/iNXx8DAvA4qOy3lh44xhqyQdNxokZEB+G0VPYuQXUQM
         pltKyA1dFBtKg==
Message-ID: <4250d8d0-2e51-d76c-d1d8-b3829ce838ce@collabora.com>
Date:   Tue, 6 Jun 2023 09:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 5/6] clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-6-nfraprado@collabora.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230605162030.274395-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 05/06/23 18:20, Nícolas F. R. A. Prado ha scritto:
> Add the CLK_VDEC_ACTIVE clock to the vdec clock driver. This clock is
> enabled by the VPU once it starts decoding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Since this is hw managed, it's a good idea to add CLK_IGNORE_UNUSED to this
clock's flags to avoid potential lockups at boot. Please add that flag.

Cheers,
Angelo

