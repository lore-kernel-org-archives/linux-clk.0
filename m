Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4E5C00528
	for <linux-clk@archiver.kernel.org>; Thu,  3 Aug 2023 11:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234709AbjHCLTd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Aug 2023 07:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234729AbjHCLTc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 07:19:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203BF127;
        Thu,  3 Aug 2023 04:19:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A802B61D4E;
        Thu,  3 Aug 2023 11:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD08C433C8;
        Thu,  3 Aug 2023 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691061566;
        bh=yhIowr8i6QfVKk14MdHInqF6hYvcJbNXDLSBxgbwMPI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OK7A0R11P2eqw35fQJAUdM9vmjmVDDtwXB6LIqNr+C/RjCYCrDpVcjcmjkMDCwUWl
         xZ7F17QdwQ8oq8Bum8dp6fbjHDpAv8RnnxboF/7DTP/1s7TcffeBMp8Ajk/ZYsc4n9
         qYkA6rog4VSbwIBORLT0ILQE9OG9LCLvu0MUAazV3hpF4UU5cyzX/qBhBkUEMKrcI1
         AVpudaoYitA+TwumW2e7NRR8vDxlOtcVD87oFRFNAiNkxOP2hGcN8y8HQR+9pmGny7
         EO8PAlvLwiMjiVmZnCkQQnqlzDhaVX4dwhW1LU43/Cti+iiZNZC2ilwF5kmBU96Tam
         Ztwa6rfBsJy+w==
Message-ID: <38b2779b-4cb8-3caf-f980-aa656277a7de@kernel.org>
Date:   Thu, 3 Aug 2023 13:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 3/4] dt-bindings: clock: rk3588: export PCLK_VO1GRF clk
 id
To:     Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
        sboyd@kernel.org, kever.yang@rock-chips.com, heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, huangtao@rock-chips.com
References: <20230802072038.29996-1-zhangqing@rock-chips.com>
 <20230802072038.29996-4-zhangqing@rock-chips.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230802072038.29996-4-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/08/2023 09:20, Elaine Zhang wrote:
> add PCLK_VO1GRF clk id.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---

v3 and still no improvements:

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.


Best regards,
Krzysztof

