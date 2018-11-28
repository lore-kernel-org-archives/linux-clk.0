Return-Path: <SRS0=nz6M=OH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B50BC43441
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 00:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53F482082F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 00:54:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBCs0n7Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53F482082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbeK1Lx7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Nov 2018 06:53:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:49176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbeK1Lx7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Nov 2018 06:53:59 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F30D2082F;
        Wed, 28 Nov 2018 00:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543366457;
        bh=CAUbcwqrQg6E6zU1ASieDtmWw1mGl0zVf3VlUnob9Tk=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=HBCs0n7Q/DfZ/d1mcjKGs2Y7lCOlujx7PtHaGVN+M5Lixc93+fFqzaYyBLc6VcyOT
         M8UBR61NyWpG0P5xWPqvZdHoMM/6AX6FBTQCqTXtSkIwOJR4LpLq0I1hMC/aFeO/g/
         0PTIVE3tw3yh58JNsQjARQ7hbNVtlABWXxkfzUr8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jordan Crouse <jcrouse@codeaurora.org>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181126172032.11567-2-jcrouse@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <20181126172032.11567-1-jcrouse@codeaurora.org>
 <20181126172032.11567-2-jcrouse@codeaurora.org>
Message-ID: <154336645634.88331.4345415167269404612@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 1/2] clk: qcom: gdsc: Don't override existing gdsc pd functions
Date:   Tue, 27 Nov 2018 16:54:16 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jordan Crouse (2018-11-26 09:20:31)
> In extreme cases an individual gdsc may wish to override the
> power domain enable or disable callback functions for their own
> purposes. Only set the generic gdsc callback if the function pointers
> are not already set.
> =

> Acked-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---

Applied to clk-next

