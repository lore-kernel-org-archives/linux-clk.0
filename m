Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9A6C0650F
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 670D1218BA
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565277619;
	bh=EQnjkpppgKILHmLr+fRsUzCN0MnNhBmjmtEPnIrTHHQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=xhfMJ/bXL3Mc2fbUDNjXV1EaYdRtCQO/BV+jCwP8XOBEw/gfdch4LvMZofxurrKES
	 6dTtVaT6dCyRGUKW4jDIz5GjNlpC0CVjTle+iFUZWO7XKK2Kf8oFJtjqRTj/644ypj
	 zwyQPYvlrpBDFHGNwmDmxmnP3KmtD74IM3u3uZPg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390037AbfHHPUT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 11:20:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:47822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390021AbfHHPUS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 11:20:18 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D044B218BA;
        Thu,  8 Aug 2019 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565277617;
        bh=EQnjkpppgKILHmLr+fRsUzCN0MnNhBmjmtEPnIrTHHQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YC41VXeynHPI34GsfNdlru4v+ea7SdLqBy1nCLuFo56CP1clEc11gvqLyL7igelUf
         q5MyRvPvAEWVDtFvijMohjEASW39dL37ypF4EWVHqo/tP9VV8pzhxzG7Vfi2GTlook
         02QCrSisJDq3g8AmygsiVLoWYz5SSHF2IWs7dsbk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726092332.25202-4-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <20190726092332.25202-4-govinds@codeaurora.org>
Subject: Re: [PATCH v5 3/7] clk: qcom: define probe by index API as common API
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 08:20:17 -0700
Message-Id: <20190808152017.D044B218BA@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2019-07-26 02:23:28)
> Extend the probe by index API in common code to be used
> by other qcom clock controller.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---

Applied to clk-next

