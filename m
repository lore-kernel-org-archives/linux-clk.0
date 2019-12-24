Return-Path: <SRS0=7p6v=2O=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBE8C2D0C0
	for <linux-clk@archiver.kernel.org>; Tue, 24 Dec 2019 02:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 377B72070E
	for <linux-clk@archiver.kernel.org>; Tue, 24 Dec 2019 02:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577155109;
	bh=Rc7VpY/blbkrY/RUuyP4kOKL/1VU61T5SYqkyK5KTtA=;
	h=In-Reply-To:References:Cc:From:To:Subject:Date:List-ID:From;
	b=hdH23JKqyqJZYfNS9a33tgVD87IcNpvLfXUhoklYN2KaZ/UulWfaI7Ywj787PMJwQ
	 EO8Tm5BrlDLqdXYP+35+7jf3bZ8V41gN4XTlsv0PE6bV+Rcez1IkZu6vZx8dTolRKC
	 EtE2BNXqIIBXmpKHEJ74P/nBNihroSdMQx3wpDAk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfLXCi2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Dec 2019 21:38:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:53264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbfLXCi2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 23 Dec 2019 21:38:28 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9A312070E;
        Tue, 24 Dec 2019 02:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577155108;
        bh=Rc7VpY/blbkrY/RUuyP4kOKL/1VU61T5SYqkyK5KTtA=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=t5j7ruEA7u9iEpWYDxdGymfz37wm6J3DeGAQmVjqKTzJpFCtwcRXNMwsAyXJW/NjP
         NstG58noDZdiZ6/Pa6YEji3kcFdwX/eGjD0AuJxzhGRmWEdyaFH7HgsIh0SyAkeM2v
         Bbfki63F9bpyqU18DPwEZYUdj1rk7vTFCnonyRwg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573812245-23827-3-git-send-email-tdas@codeaurora.org>
References: <1573812245-23827-1-git-send-email-tdas@codeaurora.org> <1573812245-23827-3-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: clock: Introduce QCOM Display clock bindings
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:38:27 -0800
Message-Id: <20191224023827.D9A312070E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2019-11-15 02:04:04)
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SC7180 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

