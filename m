Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A99CC43334
	for <linux-clk@archiver.kernel.org>; Tue, 19 Jul 2022 21:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbiGSVaI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Jul 2022 17:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234436AbiGSVaH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jul 2022 17:30:07 -0400
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E1710F9
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 14:30:05 -0700 (PDT)
Received: from [77.244.183.192] (port=64336 helo=[192.168.178.42])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <luca@lucaceresoli.net>)
        id 1oDun4-00086h-Mf;
        Tue, 19 Jul 2022 23:30:02 +0200
Message-ID: <50a62898-35bf-88c4-975e-f1a263fea6c3@lucaceresoli.net>
Date:   Tue, 19 Jul 2022 23:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] clk: vc5: Use regmap_{set,clear}_bits() where
 appropriate
Content-Language: it-IT
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
References: <20220719094637.844946-1-lars@metafoo.de>
 <20220719094637.844946-2-lars@metafoo.de>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220719094637.844946-2-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Lars-Peter,

On 19/07/22 11:46, Lars-Peter Clausen wrote:
> regmap_set_bits() and regmap_clear_bits() are variations of
> regmap_update_bits() that can be used if all bits of the mask have to be
> set to either 1 or 0 respectively.
> 
> Update the versaclk driver to use regmap_set_bits() and regmap_clear_bits()
> where appropriate. This results in slightly more compact code and also
> makes the intention of the code clearer which can help with review.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Nice cleanup.

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
