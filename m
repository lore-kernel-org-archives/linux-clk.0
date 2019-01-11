Return-Path: <SRS0=xK8l=PT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27F4C43387
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 18:39:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 995802183F
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 18:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547231981;
	bh=zy/4Xf8vAr2bXuqsk/n5XjloFup8gRzrGsx4K7gwSZQ=;
	h=Subject:In-Reply-To:References:Cc:To:From:Date:List-ID:From;
	b=sEOnPqwbEsUetpBdAuErRFTwxICer6ISxH8sXjBRzymUekI5GW/RWo1G4hiTzMndI
	 vUSdxGBEPzYnOBlF6iEFmG7q+i6jgCqZRBm/4PwVWvPQKA/C1lmEZqVoGZNBGyPqKp
	 P4zQ5qtvjFYymK4MGJikfAdlBgLhuUCqu+RPI/a0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730111AbfAKSjl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jan 2019 13:39:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:51728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727570AbfAKSjl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 11 Jan 2019 13:39:41 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 632EB20872;
        Fri, 11 Jan 2019 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547231980;
        bh=zy/4Xf8vAr2bXuqsk/n5XjloFup8gRzrGsx4K7gwSZQ=;
        h=Subject:In-Reply-To:References:Cc:To:From:Date:From;
        b=KVsk6HPcfZbMI2Zqj1fpWaZtJ98McJ0CKgKPsShbYOa7P/5JA6owjrVM1dpl2qpxY
         uU/gpEVl9Kt5GUjPULhDKi6M3n3aSbXIqFcjvJPCiecL3HALzEWzoQCw2Hisi94s6+
         Jqv9ijc0tHlBuUOoDYy1Kuq1EGQQxwL0z6xwxmYg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] clk: qcom: Select QCOM_GDSC with MSM_GCC_8998
User-Agent: alot/0.8
In-Reply-To: <b0970d61-5658-5a00-0f5e-158f31aa2460@free.fr>
References: <b0970d61-5658-5a00-0f5e-158f31aa2460@free.fr>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>
Message-ID: <154723197959.169631.17963620164218644002@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Fri, 11 Jan 2019 10:39:39 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marc Gonzalez (2019-01-11 05:37:43)
> If QCOM_GDSC is disabled, gdsc_register() returns -ENOSYS, which causes
> gcc_msm8998_probe() to fail. Select QCOM_GDSC to solve the problem.
>=20
> gcc-msm8998: probe of 100000.clock-controller failed with error -38
>=20
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---

Applied to clk-fixes + added a Fixes tag.

