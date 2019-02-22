Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C143C43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 18:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D2382075C
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 18:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550858450;
	bh=/3+hlxfQmTh7Je/tXAhe6DQ9UGqu35MSOMDr2VIkAQA=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=DEDZNna15seLy8EG9J0TI42g1AUfvcW1/US/OWxDj8JGVjfA/abrUaAYjjTWIVZxn
	 W1+YytFU4yPSp4ACxM6m7NmgOqBiQ8SgijkXJIektHM7Br5F/j+9lDQTn0tT+z8LjE
	 ktZotG/OzYbCax8lvaCsCYD+XiuRM9TvOlqP4BEQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfBVSAu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 13:00:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:41444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbfBVSAt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 13:00:49 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3553F2070D;
        Fri, 22 Feb 2019 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550858449;
        bh=/3+hlxfQmTh7Je/tXAhe6DQ9UGqu35MSOMDr2VIkAQA=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=zcclzWQYCwWU9EF7JCAySJC530Z5qHmM9kG1nVeSGpI+ln9IvRU2kgYZ+IGNET0AP
         rkkFKG/m+wvrCvPJuk5RjIMn+Kh9pFKptIjbVgqe9928QqAieBQGgqObj7Lm8aUS6l
         skz4qPPSnQ/41fnpP2/QUx+lojC9IAJUEacpBbYg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: qoriq: Improve an error message
Message-ID: <155085844841.77512.11794519377167979747@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190218091906.GA7712@kadam>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190218091906.GA7712@kadam>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Yuantian Tang <andy.tang@nxp.com>
Cc:     linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Fri, 22 Feb 2019 10:00:48 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2019-02-18 01:19:06)
> We intended to print "ret" but there is a copy and paste bug from the
> previous error message.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-next

