Return-Path: <SRS0=kEw8=AB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501EAC433E0
	for <linux-clk@archiver.kernel.org>; Sat, 20 Jun 2020 00:24:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BCFF229C6
	for <linux-clk@archiver.kernel.org>; Sat, 20 Jun 2020 00:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592612688;
	bh=t6FiEKUyQwwPmP21ewU3QT+MeqZ3cGmyKJrOHQivwoY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=QIsRcHI3tYMgsXWVNj4hRJUb+T5+nE6FDbUfxq7AiYUPjRqf4yp8xKOyvifJbhmaW
	 Qh1bQIMxQWcMVaoHRgnb3Z4phqSXCOe2KTNQbE6PIXwN/u8lX0A0VeJzrxqFoVEwL3
	 RxjR4sQabeZ8YYY8ObUnbTOQsnXbISUgNP5v95Hw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730800AbgFTAYr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Jun 2020 20:24:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:44318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730293AbgFTAYr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jun 2020 20:24:47 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F98B229C6;
        Sat, 20 Jun 2020 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592612687;
        bh=t6FiEKUyQwwPmP21ewU3QT+MeqZ3cGmyKJrOHQivwoY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=x2czNN8QuiCSlc8V7PNgapezEQIp97fTj0oiZDHp3wLql0XEWB/NXwcZhEhQZxryP
         od/jyddHjtotZquv6Ld1mKAIadygRgia/cwSsW1Mogo5iPjWm3YiuUoYxC+1dmxfJI
         yeFEyGYpAL+bsVMNa1Xx+NW67jXIinXLJCipKBWo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591266927-24976-4-git-send-email-loic.poulain@linaro.org>
References: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org> <1591266927-24976-4-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Ilia Lin <ilialin@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org
Date:   Fri, 19 Jun 2020 17:24:46 -0700
Message-ID: <159261268661.62212.1093885194954752163@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Loic Poulain (2020-06-04 03:35:26)
> +
> +examples:
> +  # Example for msm8996
> +  - |
> +    kryocc: clock-controller@6400000 {
> +        compatible =3D "qcom,msm8996-apcc";
> +        reg =3D <0x6400000 0x90000>;
> +        #clock-cells =3D <1>;
> +  };

The spacing looks off here. Is it supposed to be spaces?

> +...
