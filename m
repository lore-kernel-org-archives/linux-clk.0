Return-Path: <SRS0=s2jw=3Y=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558A7C3524A
	for <linux-clk@archiver.kernel.org>; Tue,  4 Feb 2020 07:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CB8520730
	for <linux-clk@archiver.kernel.org>; Tue,  4 Feb 2020 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580799790;
	bh=r1DIJ0nR9t2jr4/MBb3D0AtnXzKmpFyin9VRj88jaN4=;
	h=In-Reply-To:References:From:To:Subject:Cc:Date:List-ID:From;
	b=IMTlCZfbPcnpXTeixoufdSU6doZ6Y6KJgxWWb/1U1ZIVqs83ReGBGDge8PeGPn13F
	 oWruuxzICUxmgroyKR7SqDVFevH0Xl50uQ+TxIjYVLYhJR+pqqAos8hhvuDG3ovr76
	 lTPX2300CjiEFUJ0rLHWsSZN7eK1mtd456mj+9no=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgBDHDJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Feb 2020 02:03:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:53360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgBDHDJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Feb 2020 02:03:09 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0663D20674;
        Tue,  4 Feb 2020 07:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580799789;
        bh=r1DIJ0nR9t2jr4/MBb3D0AtnXzKmpFyin9VRj88jaN4=;
        h=In-Reply-To:References:From:To:Subject:Cc:Date:From;
        b=LHhl94bXNFA9ZQSB/N2xhTDdRFAbMTFK+RQdgA6pL5O4jO8RqAmbo81sZ6aIobrIq
         WLqfTmAQpSk3kszljgN8qazjLBgBPRILmUlrD68EX+T944ys2pWErqz7fo+HV4qjNr
         /21Ekv+2j5keeMX1agQ/aXdNREtwDg/2vyHrYbNc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200204054922.xdahdazjnql4alb7@kili.mountain>
References: <20200204054922.xdahdazjnql4alb7@kili.mountain>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>, wen.he_1@nxp.com
Subject: Re: [bug report] clk: ls1028a: Add clock driver for Display output interface
Cc:     linux-clk@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 23:03:08 -0800
Message-Id: <20200204070309.0663D20674@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2020-02-03 21:49:22)
> Hello Wen He,
>=20
> This is a semi-automatic email about new static checker warnings.
>=20
> The patch d37010a3c162: "clk: ls1028a: Add clock driver for Display=20
> output interface" from Dec 13, 2019, leads to the following Smatch=20
> complaint:

Thanks. I think
https://lkml.kernel.org/r/20200203223736.99645-1-colin.king@canonical.com
will fix this.

