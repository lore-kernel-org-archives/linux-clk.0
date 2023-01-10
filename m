Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26083C678D8
	for <linux-clk@archiver.kernel.org>; Tue, 10 Jan 2023 12:08:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbjAJMIZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Jan 2023 07:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238381AbjAJMHt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Jan 2023 07:07:49 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1506459FB5;
        Tue, 10 Jan 2023 04:05:25 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3FA88852EB;
        Tue, 10 Jan 2023 13:04:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673352294;
        bh=M9s7vZkxmfhnBTtl68ZOjE+5+vXk4Z8M5bveo+94pDs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=x4drDz8/g09c5d9DJUCy9LZ/0D1/HVkKQKhZeynFpDGNiS8G9XBKbvWtUZFyiIuIQ
         5NMoW+pLTtTAIkcK5phIHg06D6ZXlYMYVfvvsDiTJQeN0l+Kter47Od/A0ijfd4PMa
         6Oq90hILfI7WVaaWrW5OKeGBJnMGnkV+dzSUL9stp+069j4YiDVqgs7GYmlDJ9TMNE
         dR9DmclFuv5eMqowaFyjxLgYOmu/pPOMcZGBF1hAf4OA0d5HY4XTLeCcpqoJy5wjeh
         7h2uK+auYjs/y8nTaVz8Rwlzq9tR2dNOhkd74P2/SSC0PjSlDd/fowaRhlgbsuweaf
         YYmUHiUy5oa4Q==
Message-ID: <d0ccf98e-13a7-a55f-0d55-7b5683cbccde@denx.de>
Date:   Tue, 10 Jan 2023 11:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/4] clk: rs9: Add support for 9FGV0441
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
 <20230110100003.370917-4-alexander.stein@ew.tq-group.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230110100003.370917-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/10/23 11:00, Alexander Stein wrote:
> This model is similar to 9FGV0241, but the DIFx bits start at bit 0.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Marek Vasut <marex@denx.de>
