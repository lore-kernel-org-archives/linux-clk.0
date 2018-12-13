Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963FFC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 19:38:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EA432086D
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 19:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544729896;
	bh=dbOVe1NDpfO+kSyNBi1KvyxcrFxn+fBtcdgZEjID1L4=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=dEg+kUK9/uZRy7gs5GsfYYqy7MQF5HLObZx8lvnTY+6YTwxkFZnUPOKl0CpWJ6eFa
	 3eYSwLvLC6/Ml7NJKWKG5ACqgawdv9/esdvR4//CU1qJwwg+vtW8EShXgY0xr0OMyo
	 ueislkhx4BKs9hIiWcjTwQkbBwT5Ox/sOf5y5BCo=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA432086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbeLMTiL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 14:38:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:57004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727707AbeLMTiK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 14:38:10 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 252D12086D;
        Thu, 13 Dec 2018 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544729890;
        bh=dbOVe1NDpfO+kSyNBi1KvyxcrFxn+fBtcdgZEjID1L4=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=qNIGdV3z5hWANsDOOG8Mf5YV3Z4RXoTEqmSNhvcWv6dR5s7A8A7X6hurMPEBYQUdy
         668AEJIPg0DhhL5WfMvr+NfYsISLmU5GbvXW1BocA4wpCPOU2tXWfSVvxIUWfRE3El
         IuLCArCf+wKe9ONrCj6EwHfXSkKrP2omYPfPZ09I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544720949-18404-1-git-send-email-jhugo@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: Drop unused 8998 clock
To:     Jeffrey Hugo <jhugo@codeaurora.org>, andy.gross@linaro.org,
        david.brown@linaro.org, mturquette@baylibre.com
References: <1544720949-18404-1-git-send-email-jhugo@codeaurora.org>
Message-ID: <154472988944.19322.6557891989616167911@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        marc.w.gonzalez@free.fr, Jeffrey Hugo <jhugo@codeaurora.org>
Date:   Thu, 13 Dec 2018 11:38:09 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeffrey Hugo (2018-12-13 09:09:09)
> gcc_lpass_trig_clk is not used downstream, therefore there is no reason to
> expect it to be needed for clients.  Let's remove it because messing with
> the clock has been observed to cause Linux hangs when the qdss_clk is
> initialized by rpmcc.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>=20
> v2:
> -corrected commit text per Marc
> -added Marc's reviewed-by

Please slow down. There isn't any need to resend for such things.

