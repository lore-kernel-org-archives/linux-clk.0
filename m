Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A46C54EBE
	for <linux-clk@archiver.kernel.org>; Tue, 10 Jan 2023 12:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjAJMHv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Jan 2023 07:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238395AbjAJMHR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Jan 2023 07:07:17 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 428177D1DB;
        Tue, 10 Jan 2023 04:04:53 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4EF6885174;
        Tue, 10 Jan 2023 13:04:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673352289;
        bh=GdfW5CH0CsyN53ig8HwnJ2J8cDJnf+O6LMd9n5ChT/8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=HC+xrJ0IaOSk5PQogxOtGSOvls+MhYoOj1ZdMKG4MhqtCAXDp8lAQhugrOXS0WxjT
         s6rT0bS7Lq2b1azqTxZHCa6u1O9aqyptXMOdUJXXfbJLTUOwMfPx9/s5pkcUNAKSnK
         /+F9UyO5OUlwfluXV1X5e/bLbxubzn9I6ZDDBaW/yZFfFPN3QoOutTMekzg1mnWOcu
         K1EdLV66zuxrsug1+f9NtIDV1a3/ObntN/cjl0qtkyAaAoYPCHOD54hy/0mgeRTJe7
         Re32Em+/nDtwI039bGuhysaQzVQdhJXYLUHYQwvtOGlNvI9JhTlV+CfGaoWd7JbYqi
         bbSFLY5Mj9oXQ==
Message-ID: <8b02e34a-b538-fbac-61f9-30a242541498@denx.de>
Date:   Tue, 10 Jan 2023 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/4] clk: rs9: Check for vendor/device ID
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/10/23 11:00, Alexander Stein wrote:
> This is in preparation to support additional devices which have different
> IDs as well as a slightly different register layout.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Marek Vasut <marex@denx.de>
