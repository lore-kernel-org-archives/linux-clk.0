Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B1EC64EC4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 19:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjCFTgI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 14:36:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjCFTgE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 14:36:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E7272B17;
        Mon,  6 Mar 2023 11:36:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9729DB810F5;
        Mon,  6 Mar 2023 19:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EFDC433D2;
        Mon,  6 Mar 2023 19:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678131358;
        bh=RBcizbc7RoVhJcp3jao7zJH9o7oiz1b3acXdvsLc7ag=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=INZ7wj7kxWlY8YnV5gGEXloVCVxhYGdkeMUR68pCIdzN0n1OkuvMLCXol+9wQLGQw
         +5TsSjxTzPJwTqLXh2JZhabJMGvAsxRQUk+fbki7M/iLE3WnQc1siaREHe8j5CPa7t
         UEB357WEz74SizrzHs/oRfXBMQ4mowquINIt4c5tvKNrjtOnFsDpx/BKE+SDL0eu8r
         18boMKz0A/Bud7w4rLFWLvbSStAZlhRcBSgpA5d0ZjDaFjyNm+V4aq9k6UlgxzqlcY
         5mVdrBDZfNxSdqS1uCnuVYGwwBPRR7Pj6Ox+Tb3FtnxukXYgIuf9QE/JiOV91Ul3Lk
         9Mmy9B5DO3jcA==
Message-ID: <e04a406045121aa31762cacc02b2300d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230303022912.2171177-1-konrad.dybcio@linaro.org>
References: <20230303022912.2171177-1-konrad.dybcio@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm6375: Update the .pwrsts for usb gdsc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org
Date:   Mon, 06 Mar 2023 11:35:55 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Konrad Dybcio (2023-03-02 18:29:11)
> The USB controller on sm6375 doesn't retain its state when the system
> goes into low power state and the GDSCs are turned off.
>=20
> This can be observed by the USB connection not coming back alive after
> putting the device into suspend, essentially breaking USB.
>=20
> Fix this by updating the .pwrsts for the USB GDSCs so they only
> transition to retention state in low power.

Is this a temporary fix? Is that why there isn't a Fixes tag? If it's a
workaround then please add a TODO comment indicating the USB driver
doesn't work properly.
