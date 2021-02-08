Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F87C433E9
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B087864E28
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbhBHSKK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 13:10:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:49430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235434AbhBHSGU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 13:06:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1864764D92;
        Mon,  8 Feb 2021 18:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807427;
        bh=5t8LE5B5cl9x35acYxIG26h7fCdi/mBXYgEGAmf26/c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VpgU+z1YUVoCtHSeNAi/lp9I0iO360kDYfJup87+3GNujuosIBIFtwTBTpO6WPYVd
         BprJMfhjLVyqmpCOakqDEap1gW0tPFK3qkFcuC49tCIQ7aSx5iKBmdObE5XeZctzxn
         Js5xEQi929DPHMPiivUnIdzRUPl9l/MPardqPKFbLFyjpbsU01x5LufdX4MFFbfV+q
         Qyp3nb62DvO5QY6DBavtV0aYYmK/PHreyAU1pirLXDc3UJI8qNyAmeu3ZwTF6jL0V+
         3KZsKNHB6hfnW35JI+oqCZFT9Ck4Y6jBDW7CH2w/CQJ0WLLVzdlM8nkm3lOjBhSTjw
         y/sNDzKn2NmHw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126043155.1847823-2-bjorn.andersson@linaro.org>
References: <20210126043155.1847823-1-bjorn.andersson@linaro.org> <20210126043155.1847823-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc: Add global clock controller driver for SC8180x
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Mon, 08 Feb 2021 10:03:45 -0800
Message-ID: <161280742583.76967.8198565022240408313@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2021-01-25 20:31:55)
> Add clocks, resets and some of the GDSC provided by the global clock
> controller found in the Qualcomm SC8180x platform.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
