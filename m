Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A46AC77B6E
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 14:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbjDMO1n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 10:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjDMO1m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 10:27:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA2A9EE0;
        Thu, 13 Apr 2023 07:27:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75A7463E3D;
        Thu, 13 Apr 2023 14:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC1FC433EF;
        Thu, 13 Apr 2023 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681396060;
        bh=8wdYdEx9r91O6/Y+zqWVtN9/7NQdwnbsI5I2V3wou5U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=HKdAH1oIQSX/rf+efd38Zy0LXSQkzUKQPmPlQj6fMbzqck3J9v8l0zC+qw3PAHUcs
         LYuB8vSLubJl796afn3LOp4KL1FeJsKevMT1GKLXmkexoxhUutuMJP2eFvr+gy+AgV
         HDTwmYWntvvTLRpkSjEoDyF8L47e+fBhVORotL2RomyfhWMi4Ry895rgExaHSO8Ock
         Vnr5GZrIxwT5aJ+TNAIPoCP7DdVuJZT34inejpYrUCWwS7aG8A1rIE7Zact3b78H0Q
         IAaGp9UYckUE2Ur5K+WAk58ARVchlBefTqpvaLIN9f9EGrd54QV5aBG6H9BH9Bn6JH
         NQk+MiTpHIkSg==
Message-ID: <e3c2eb00-bbfd-8621-5356-d5daff6e9b55@kernel.org>
Date:   Thu, 13 Apr 2023 16:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] dt-bindings: clock: versal: Add versal-net compatible
 string
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, robh+dt@kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com
References: <20230413101134.10627-1-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230413101134.10627-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/04/2023 12:11, Shubhrajyoti Datta wrote:
> From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
> 
> Add dt-binding documentation for Versal NET platforms.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.

First version was sent correctly, so why you decided here to do it
differently?

Anyway, you did not implement comments we asked you. There is no way
this binding and your DTS works. There is no way you tested it.

Best regards,
Krzysztof

